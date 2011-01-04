unit Users;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Placemnt;

type
  TfrmUsers = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnOk: TBitBtn;
    Panel4: TPanel;
    btnCancel: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    edtLogin: TEdit;
    FormStorage: TFormStorage;
    edtPassword: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsers: TfrmUsers;
  sysdate: TDateTime;

function EnterPassword : Boolean;

implementation

uses DataModule, fg_Util, Oracle, Variants;

{$R *.DFM}

function EnterPassword : Boolean;
begin
  Result:=False;
  frmUsers:=TfrmUsers.Create(Application);
  with frmUsers do
    try
     if ShowModal=mrOk then
       Result:=True
    finally
     Free
    end
end;

procedure TfrmUsers.FormCreate(Sender: TObject);
begin
  FormStorage.IniFileName:=RegistryKey;
  FormStorage.Active:=True;
  with dm do
    begin
      Screen.Cursor:=crSQLWait;
      Application.ProcessMessages;
      if oDbAdv.Connected then
        oDbAdv.Close;
      if regMat_Dept.OpenKey(RegistryKey, True) then
        try
         try
          //osesMat_Store.LogonDatabase:=regMat_Dept.ReadString('Database');
          try
           DirReports:=regMat_Dept.ReadString('DirReports');
          except
           DirReports:='';
          end;
          if DirReports='' then
            DirReports:=ExtractFilePath(ParamStr(0))+'Reports\'
          else
            if DirReports[Length(DirReports)]<>'\' then
              DirReports:=DirReports+'\';
          try
           cHelpFile:=regMat_Dept.ReadString('HelpFile');
          except
           cHelpFile:='';
          end;
          if cHelpFile='' then
            cHelpFile:=ExtractFilePath(ParamStr(0))+'mat_store.hlp';
          //Application.HelpFile:=cHelpFile;
         except
          MessageDlg('Невозможно прочитать информацию из реестра!'#10'Программа не может быть запущена.', mtError, [mbOK], 0);
          halt;
         end;
        finally
         regMat_Dept.CloseKey;
        end
      else
        begin
          MessageDlg('Невозможно прочитать информацию из реестра!'#10'Программа не может быть запущена.', mtError, [mbOK], 0);
          halt;
        end;
    end;
end;

procedure TfrmUsers.btnOkClick(Sender: TObject);
  {var
    varPasswd     : Variant;
    isOk          : Boolean;
    strPwd        : string;
    User_Login,
    User_Password : string;
    opUsers       : TOraclePackage;
    ValueFields : array [1..2] of Variant;}
begin
  ID_USER:=1;
  dm.oDbAdv.DBName:=edtLogin.Text+':'+edtPassword.Text;
  try
   try
    dm.oDbAdv.Open;
    dm.pFIBTransaction1.Active:=True;
   except on E:Exception do
    begin
      MessageDlg('Ошибка Firebird:'+E.Message, mtError, [mbOK], 0);
      ModalResult:=mrCancel;
      Exit;
    end
   end;
   // Получить системную дату
   sysdate:=GetResSqlFIB(dm.oDbAdv,'select current_date Result from rdb$database');
  finally
   Screen.Cursor:=crDefault
  end;

  {
  isOk:=False;
  edtLogin.Text:=AnsiUpperCase(edtLogin.Text);
  // Получить пароль пользователя
  try
   varPasswd:=GetResBindSql(dm.osesMat_Store,'select password Result from SEC_MAT_USER where login=:login',
                            ['login'],[otString],[edtLogin.Text]);
  except on E:Exception do
    begin
      MessageDlg('Ошибка Oracle:'+E.Message, mtError, [mbOK], 0);
      ModalResult:=mrCancel;
      Exit
    end
  end;

  // Проверить, правильный ли пароль ввел пользователь
  if VarIsNull(varPasswd) then
    isOk:=False
  else
    begin
      strPwd:=varPasswd;
      strPwd:=AnsiUpperCase(Decrypt(strPwd,CryptStr));
      if AnsiUpperCase(edtPassword.Text)=strPwd then
        isOk:=True
    end;
  if not isOk then
    begin
      if MessageDlg('Неверный логин или пароль.'#10'Будете пробовать еще?', mtConfirmation, [mbYes, mbNo], 0)=mrNo then
        ModalResult:=mrCancel
      else
        ModalResult:=mrNone
    end
  else
    begin
      // Получить ID пользователя
      try
       ID_USER:=GetResBindSql(dm.osesMat_Store,'select id_user Result from SEC_MAT_USER where login=:login',
                              ['login'],[otString],[edtLogin.Text]);
      except on E:Exception do
        begin
          MessageDlg('Ошибка Oracle:'+E.Message, mtError, [mbOK], 0);
          ModalResult:=mrCancel;
          Exit;
        end
      end
    end;
  if isOk and (ModalResult=mrOk) then
    with dm do
      begin
        Screen.Cursor:=crSQLWait;
        try
         try
          GetBindMultField(dm.osesMat_Store,'select LOGIN_SERVER, PASSWORD_SERVER from SEC_MAT_USER where ID_USER=:id_user',
                           ['LOGIN_SERVER', 'PASSWORD_SERVER'],
                           ValueFields,
                           ['id_user'],[otInteger],[ID_USER]);
          User_Login:=ValueFields[1];
          User_Login:=AnsiUpperCase(Decrypt(User_Login,CryptStr));
          User_Password:=ValueFields[2];
          User_Password:=Decrypt(User_Password,CryptStr);
          if osesMat_Store.Connected then
            osesMat_Store.LogOff;
          osesMat_Store.LogonUsername:=User_Login;
          osesMat_Store.LogonPassword:=User_Password;
          osesMat_Store.LogOn;

          // Включить для сессии оптимизацию по стоимости FIRST_ROWS
          ExecDOASQL(osesMat_Store,'alter session set optimizer_goal=FIRST_ROWS');
          // Выставить явно пространство для сортировок
          //ExecDOASQL(osesMat_Store,'alter session set sort_area_retained_size=524288');
          //ExecDOASQL(osesMat_Store,'alter session set sort_area_size=524288');
          // Переключить текущую схему (чтобы не плодить синонимы)
          ExecDOASQL(osesMat_Store,'alter session set CURRENT_SCHEMA=MAT_STORE');
          // Получить trace (SOFT.ORA733.TRACE**)
          //ExecDOASQL(osesMat_Store,'alter session set SQL_TRACE=TRUE');

          // Записать id пользователя
          opUsers:=TOraclePackage.Create(Application);
          try
           opUsers.Session:=dm.osesMat_Store;
           opUsers.PackageName:='p_MAT_USER';
           opUsers.SetVariable('id_user',ID_USER);
          finally
           FreeAndNil(opUsers);
          end;
         except on E:Exception do
           begin
             MessageDlg('Ошибка Oracle:'+E.Message, mtError, [mbOK], 0);
             ModalResult:=mrCancel;
             Exit;
           end;
         end;
        finally
         Screen.Cursor:=crDefault;
        end;
      end;
  }
end;

end.
