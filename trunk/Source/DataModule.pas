unit DataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, Oracle, Registry
{$IFDEF DEBUG}
, OracleMonitor
{$ENDIF}
, Db, OracleData
, RxStrUtils, FIBDatabase, pFIBDatabase
;

type
  Tdm = class(TDataModule)
    osesMat_Store: TOracleSession;
    imgProject: TImageList;
    oDbAdv: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  rec_Right = record // Запись прав
                code : Longint; // Код столбца/действия
                right_read : Boolean; // Доступ на чтение
                right_write : Boolean; // Доступ на запись
                right_exec : Boolean; // Доступ на выполнение
              end;
  a_right_Role = array of rec_Right; // Массив прав одной роли

  rec_Rows = record
               Name_Form : string; // Имя формы
               Name_Query : string; // Имя dataset'а
               Phrase_Where : string; // Ограничивающая фраза
             end;
  a_rec_Rows = array of rec_Rows; // Массив ограничений ролей

  rec_Cond = record
               Name_Form : string; // Имя формы
               Name_DataSource : string; // Имя dataSource
               Name_Field : string; // Имя поля
               Condition : Byte; // Условие
               Value : string; // Значение
               code : Longint; // Код столбца/действия
               right_read : Boolean; // Доступ на чтение
               right_write : Boolean; // Доступ на запись
               right_exec : Boolean; // Доступ на выполнение
               Res_Str : string; // Что показывать при выполнении условия
             end;
  a_rec_Cond = array of rec_Cond; // Массив ограничений

const
  RegistryKey = '\software\app_Adv';
  CryptStr : LongInt = 5643;

var
  dm : Tdm;
  regMat_Dept : TRegistry;
  ID_USER : Longint;
  DirReports : string; // Каталог с отчетами
  cHelpFile : string; // Путь к hlp-файлу

  ListRoles : array of Longint; // Список ролей пользователя
  NumRoles : Word; // Кол-во ролей у пользователя
  ListRightRoles : array of a_right_Role; // Список прав доступа для всех ролей пользователя
  ListRec_Rows : array of a_rec_Rows; // Список прав доступа на строки
  ListRec_Cond : array of a_rec_Cond; // Список прав доступа на столбцы/действия по условиям

function Encrypt(const S: String; Key: Word): String;
function Decrypt(const S: String; Key: Word): String;

procedure ReadRoleUser;
// Чтение ID ролей, которые есть у пользователя

procedure ReadRightRole;
// Чтение прав доступа для всех ролей пользователя

function isRightRead(code : Longint) : Boolean;
// Есть ли у пользователя право на чтение столбца

function isRightWrite(code : Longint) : Boolean;
// Есть ли у пользователя право на изменение столбца

function isRightExec(code : Longint) : Boolean;
// Есть ли у пользователя право на выполнение действия

procedure Read_Sec_Rows;
// Чтение прав на строки пользователя

function Get_Sec_Rows(aName_Form, aName_Query : string) : string;
// Возвратить фразу where для формы/датасета

procedure Read_Sec_Cond;
// Чтение прав на столбцы/действия по условию

function isExistsSecCond(Name_Form, Name_DataSource : string) : Boolean;
// Упоминается ли DataSource этой формы в таблице ограничений прав по условию

function Get_R_Exec_Cond(Name_Form, Name_DataSource : string; code : Longint; DataSource : TDataSource) : Boolean;
// Проверить, есть ли права у роли на действие по условию

function GetRes_Str(Name_Form, Name_DataSource : string; code : Longint; Value : string; DataSource : TDataSource) : string;
// Возвратить строку, которую надо показать вместо значения столбца по условию

function fgGetCmdLineArg(const Switch: string; SwitchChars: TCharSet): string;

implementation

{$R *.DFM}

const
  Crypt1 = 32456;
  Crypt2 = 67425;

function Encrypt(const S: String; Key : Word): String;
  var
    I : byte;
begin
  SetLength(Result, Length(S));
  for I := 1 to Length(S) do
    begin
      Result[I] := char(byte(S[I]) xor (Key shr 8));
    end;
end;

function Decrypt(const S: String; Key : Word): String;
  var
    I : byte;
begin
  SetLength(Result, Length(S));
  for I := 1 to Length(S) do
    begin
      Result[I] := char(byte(S[I]) xor (Key shr 8));
    end;
end;

procedure ReadRoleUser;
// Чтение ID ролей, которые есть у пользователя
  var
    i : Word;
begin
  i:=0;
  SetLength(ListRoles,10);
  with TOracleDataSet.Create(Application) do
    try
     Session:=dm.osesMat_Store;
     Cursor:=crSQLWait;
     SQL.Text:='select id_role from sec_role_user where id_user=:id_user';
     DeclareVariable('id_user',otInteger);
     SetVariable('id_user',ID_USER);
     Open;
     while not EOF do
       begin
         if i=Length(ListRoles) then
           SetLength(ListRoles,Length(ListRoles)+10);
         ListRoles[i]:=FieldByName('id_role').AsInteger;
         Inc(i);
         Next;
       end;
     SetLength(ListRoles,i);
    finally
     Free;
    end;
  NumRoles:=i;
end;

procedure ReadRightRole;
// Чтение прав доступа для всех ролей пользователя
  var
    i, j : Word;
    ods : TOracleDataSet;
begin
  ods:=TOracleDataSet.Create(Application);
  try
   ods.Session:=dm.osesMat_Store;
   ods.Cursor:=crSQLWait;
   ods.SQL.Text:='select c.code_column_action, r.right_read, r.right_write, r.right_exec '+
                 ' from sec_r_col_act r, sec_col_act c '+
                 ' where r.id_col_act=c.id_col_act and id_role=:id_role';
   ods.DeclareVariable('id_role',otInteger);
   SetLength(ListRightRoles,NumRoles);
   for i:=0 to NumRoles-1 do
     begin
       j:=0;
       SetLength(ListRightRoles[i],10);
       ods.SetVariable('id_role',ListRoles[i]);
       ods.Open;
       while not ods.EOF do
         begin
           if j=Length(ListRightRoles[i]) then
             SetLength(ListRightRoles[i],Length(ListRightRoles[i])+10);
           ListRightRoles[i][j].code:=ods.FieldByName('code_column_action').AsInteger;
           ListRightRoles[i][j].right_read:=ods.FieldByName('right_read').AsInteger=1;
           ListRightRoles[i][j].right_write:=ods.FieldByName('right_write').AsInteger=1;
           ListRightRoles[i][j].right_exec:=ods.FieldByName('right_exec').AsInteger=1;
           Inc(j);
           ods.Next;
         end;
       SetLength(ListRightRoles[i],j);
       ods.Close;
     end;
  finally
   FreeAndNil(ods);
  end;
end;

procedure Read_Sec_Rows;
// Чтение прав на строки пользователя
  var
    i, j : Word;
    ods : TOracleDataSet;
begin
  ods:=TOracleDataSet.Create(Application);
  try
   ods.Session:=dm.osesMat_Store;
   ods.Cursor:=crSQLWait;
   ods.SQL.Text:='select name_form, name_query, phrase_where '+
                 ' from sec_r_row '+
                 ' where id_role=:id_role';
   ods.DeclareVariable('id_role',otInteger);
   SetLength(ListRec_Rows,NumRoles);
   for i:=0 to NumRoles-1 do
     begin
       j:=0;
       SetLength(ListRec_Rows[i],10);
       ods.SetVariable('id_role',ListRoles[i]);
       ods.Open;
       while not ods.EOF do
         begin
           if j=Length(ListRec_Rows[i]) then
             SetLength(ListRec_Rows[i],Length(ListRec_Rows[i])+10);
           ListRec_Rows[i][j].Name_Form:=ods.FieldByName('Name_Form').AsString;
           ListRec_Rows[i][j].Name_Query:=ods.FieldByName('Name_Query').AsString;
           ListRec_Rows[i][j].Phrase_Where:=ods.FieldByName('Phrase_Where').AsString;
           Inc(j);
           ods.Next;
         end;
       SetLength(ListRec_Rows[i],j);
       ods.Close;
     end;
  finally
   FreeAndNil(ods);
  end;
end;

procedure Read_Sec_Cond;
// Чтение прав на столбцы/действия по условию
  var
    i, j : Word;
    ods : TOracleDataSet;
begin
  ods:=TOracleDataSet.Create(Application);
  try
   ods.Session:=dm.osesMat_Store;
   ods.Cursor:=crSQLWait;
   ods.SQL.Text:='select c.code_column_action, r.name_form, r.name_datasource, r.name_field '+
                 ' , r.condition, r.value, r.right_read, r.right_write, r.right_exec, r.res_str '+
                 ' from sec_r_cond r, sec_col_act c '+
                 ' where r.id_col_act=c.id_col_act and '+
                 ' r.id_role=:id_role';
   ods.DeclareVariable('id_role',otInteger);
   SetLength(ListRec_Cond,NumRoles);
   for i:=0 to NumRoles-1 do
     begin
       j:=0;
       SetLength(ListRec_Cond[i],10);
       ods.SetVariable('id_role',ListRoles[i]);
       ods.Open;
       while not ods.EOF do
         begin
           if j=Length(ListRec_Cond[i]) then
             SetLength(ListRec_Cond[i],Length(ListRec_Cond[i])+10);
           ListRec_Cond[i][j].Name_Form:=ods.FieldByName('Name_Form').AsString;
           ListRec_Cond[i][j].Name_DataSource:=ods.FieldByName('Name_DataSource').AsString;
           ListRec_Cond[i][j].Name_Field:=ods.FieldByName('Name_Field').AsString;
           ListRec_Cond[i][j].Condition:=ods.FieldByName('condition').AsInteger;
           ListRec_Cond[i][j].Value:=ods.FieldByName('value').AsString;
           ListRec_Cond[i][j].code:=ods.FieldByName('code_column_action').AsInteger;
           ListRec_Cond[i][j].right_read:=ods.FieldByName('right_read').AsInteger=1;
           ListRec_Cond[i][j].right_write:=ods.FieldByName('right_write').AsInteger=1;
           ListRec_Cond[i][j].right_exec:=ods.FieldByName('right_exec').AsInteger=1;
           ListRec_Cond[i][j].Res_Str:=ods.FieldByName('res_str').AsString;
           Inc(j);
           ods.Next;
         end;
       SetLength(ListRec_Cond[i],j);
       ods.Close;
     end;
  finally
   FreeAndNil(ods);
  end;
end;

function Get_Sec_Rows(aName_Form, aName_Query : string) : string;
// Возвратить фразу where для формы/датасета
  var
    i, j : Word;
begin
  Result:='';
  if NumRoles=0 then
    Exit;
  for i:=0 to NumRoles-1 do
    if Length(ListRec_Rows[i])>0 then
      for j:=0 to Length(ListRec_Rows[i])-1 do
        if (ListRec_Rows[i][j].Name_Form=AnsiUpperCase(aName_Form)) and
           (ListRec_Rows[i][j].Name_Query=AnsiUpperCase(aName_Query)) then
            begin
              Result:=ListRec_Rows[i][j].Phrase_Where;
              Exit;
            end;
end;

function isRightRead(code : Longint) : Boolean;
// Есть ли у пользователя право на чтение столбца
  var
    i, j : Word;
begin
  Result:=False;
  if (NumRoles=0) or (code=0) then
    begin
      Result:=True;
      Exit;
    end;
  for i:=0 to NumRoles-1 do
    if Length(ListRightRoles[i])>0 then
      for j:=0 to Length(ListRightRoles[i])-1 do
        if ListRightRoles[i][j].code=code then
          if ListRightRoles[i][j].right_read then // Если есть разрешение, то выйти
            begin                                 // Если нет, то продолжить поиск - возможно,
              Result:=True;                       // разрешение есть у другой роли
              Exit;
            end;
end;

function isRightWrite(code : Longint) : Boolean;
// Есть ли у пользователя право на изменение столбца
  var
    i, j : Word;
begin
  Result:=False;
  if NumRoles=0 then
    Exit;
  if code=0 then
    begin
      Result:=True;
      Exit;
    end;
  for i:=0 to NumRoles-1 do
    if Length(ListRightRoles[i])>0 then
      for j:=0 to Length(ListRightRoles[i])-1 do
        if ListRightRoles[i][j].code=code then
          if ListRightRoles[i][j].right_write then // Если есть разрешение, то выйти
            begin                                  // Если нет, то продолжить поиск - возможно,
              Result:=True;                        // разрешение есть у другой роли
              Exit;
            end;
end;

function isRightExec(code : Longint) : Boolean;
// Есть ли у пользователя право на выполнение действия
  var
    i, j : Word;
begin
  Result:=False;
  if code=0 then
    begin
      Result:=True;
      Exit;
    end;
  if NumRoles=0 then
    Exit;
  for i:=0 to NumRoles-1 do
    if Length(ListRightRoles[i])>0 then
      for j:=0 to Length(ListRightRoles[i])-1 do
        if ListRightRoles[i][j].code=code then
          if ListRightRoles[i][j].right_exec then // Если есть разрешение, то выйти
            begin                                 // Если нет, то продолжить поиск - возможно,
              Result:=True;                       // разрешение есть у другой роли
              Exit;
            end;
end;

function isExistsSecCond(Name_Form, Name_DataSource : string) : Boolean;
// Упоминается ли DataSource этой формы в таблице ограничений прав по условию
  var
    i, j : Word;
begin
  Result:=False;
  if NumRoles=0 then
    Exit;
  for i:=0 to NumRoles-1 do
    if Length(ListRec_Cond[i])>0 then
      for j:=0 to Length(ListRec_Cond[i])-1 do
        if (ListRec_Cond[i][j].Name_Form=Name_Form) and
           (ListRec_Cond[i][j].Name_DataSource=Name_DataSource) then
          begin
            Result:=True;
            Exit;
          end;
end;

function Get_R_Exec_Cond(Name_Form, Name_DataSource : string; code : Longint; DataSource : TDataSource) : Boolean;
// Проверить, есть ли права у роли на действие по условию
  var
    i, j : Word;
begin
  Result:=True;
  if NumRoles=0 then
    Exit;
  for i:=0 to NumRoles-1 do
    for j:=0 to Length(ListRec_Cond[i])-1 do
      if (ListRec_Cond[i][j].Name_Form=Name_Form) and
         (ListRec_Cond[i][j].Name_DataSource=Name_DataSource) and
         (ListRec_Cond[i][j].code=code) then
        begin
          case ListRec_Cond[i][j].Condition of
            // Равно
            1 : if DataSource.DataSet.FieldByName(ListRec_Cond[i][j].Name_Field).AsString=ListRec_Cond[i][j].Value then
                  Result:=ListRec_Cond[i][j].right_exec;
            // Не равно
            2 : if DataSource.DataSet.FieldByName(ListRec_Cond[i][j].Name_Field).AsString<>ListRec_Cond[i][j].Value then
                  Result:=ListRec_Cond[i][j].right_exec;
            // 3 - like
            // 4 - not like
            // null
            5 : if DataSource.DataSet.FieldByName(ListRec_Cond[i][j].Name_Field).IsNull then
                  Result:=ListRec_Cond[i][j].right_exec;
            // not null
            6 : if not DataSource.DataSet.FieldByName(ListRec_Cond[i][j].Name_Field).IsNull then
                  Result:=ListRec_Cond[i][j].right_exec;
          end;
          Exit;
        end;
end;

function GetRes_Str(Name_Form, Name_DataSource : string; code : Longint; Value : string; DataSource : TDataSource) : string;
// Возвратить строку, которую надо показать вместо значения столбца по условию
  var
    i, j : Word;
begin
  Result:=Value;
  if NumRoles=0 then
    Exit;
  for i:=0 to NumRoles-1 do
    for j:=0 to Length(ListRec_Cond[i])-1 do
      if (ListRec_Cond[i][j].Name_Form=Name_Form) and
         (ListRec_Cond[i][j].Name_DataSource=Name_DataSource) and
         (ListRec_Cond[i][j].code=code) then
        begin
          case ListRec_Cond[i][j].Condition of
            // Равно
            1 : if DataSource.DataSet.FieldByName(ListRec_Cond[i][j].Name_Field).AsString=ListRec_Cond[i][j].Value then
                  Result:=ListRec_Cond[i][j].Res_Str;
            // Не равно
            2 : if DataSource.DataSet.FieldByName(ListRec_Cond[i][j].Name_Field).AsString<>ListRec_Cond[i][j].Value then
                  Result:=ListRec_Cond[i][j].Res_Str;
            // 3 - like
            // 4 - not like
            // null
            5 : if DataSource.DataSet.FieldByName(ListRec_Cond[i][j].Name_Field).IsNull then
                  Result:=ListRec_Cond[i][j].Res_Str;
            // not null
            6 : if not DataSource.DataSet.FieldByName(ListRec_Cond[i][j].Name_Field).IsNull then
                  Result:=ListRec_Cond[i][j].Res_Str;
          end;
          Exit;
        end;
end;

function fgGetCmdLineArg(const Switch: string; SwitchChars: TCharSet): string;
var
  I: Integer;
  S: string;
begin
  I := 1;
  while I <= ParamCount do begin
    S := ParamStr(I);
    if (S[1] in SwitchChars) and (Length(S) > 1) then
      if AnsiUpperCase(S[2])=AnsiUpperCase(Switch) then
        begin
          Result:=Copy(s,3,Length(s)-2);
          Exit
        end;
    Inc(I)
  end;
  Result := ''
end;

initialization
  regMat_Dept:=TRegistry.Create;
  regMat_Dept.RootKey:=HKEY_CURRENT_USER;
finalization
  FreeAndNil(regMat_Dept);
end.
