{***************************************************************
 *
 * Unit Name: Fg_util
 * Purpose  : ��� ��������� � �������
 * Author   :
 * History  :
 *
 ****************************************************************}

unit Fg_util;

interface

uses RxStrUtils, Controls{, Oracle, OracleData}, SysUtils, dbctrls,
     RxDBCtrl, stdctrls, RxLookup, Forms, DBGridEH, DB, Variants,
     dateUtil, Dialogs, DateUtils, FIBDatabase, pFIBDatabase,
     FIBQuery, pFIBQuery, Clipbrd;

type
  TDateArray = array of array[0..1] of TDateTime;

function fgGetCmdLineArg(const Switch: string; SwitchChars: TCharSet): string;
{������ ���������� ��������� ������}

function ReplaceChar(s : String; ch1, ch2 : Char) : String;
{������� ���� � ������ s ������� ch1 � �������� �� �� ch2}

function DelSpaces(s : string) : string;
{������� ���� � ������ ��� ��� ����� ������ ������ �������
 � �������� �� �� ���� ������}

procedure SetDisabledEdit(AOwner : TControl);
{��������� ��������� ��� ����������, �������
 ����� ����������� ��������������}

procedure SetReadOnlyEdit(AOwner:TControl);
{ ��������� ��������� ��� ����������, �������
  ����� ����������� ��������������, � ReadOnly
}

procedure UnsetReadOnlyEdit(AOwner:TControl);
// ��������� ������� � ���� �����������, �������
// ����� ����������� ��������������, �������� ReadOnly

//function GetResultSqlDOA(Session : TOracleSession; const Sql : String ) : Variant;
// ��������� SQL ������, ���������� ���� � ������ 'Result'

function GetResSqlFIB(Session : TpFIBDatabase; const v_Sql : String ) : Variant;
// ��������� SQL ������, ���������� ������ ���� ����������

{function GetResBindSql(aSession : TOracleSession; const strSql : string;
                       const aBindVar : array of string;
                       const aBindType : array of Integer;
                       const aBindValue : array of Variant) : Variant;}
// ��������� SQL ������, ���������� ���� � ������ 'Result'
// ���������� ��������� ����������

function GetResBindSqlFib(v_Session : TpFIBDatabase; const v_Sql : string;
                       const v_BindVar : array of string;
                       const v_BindValue : array of Variant) : Variant;
// ��������� SQL ������, ���������� ���� � ������ 'Result'
// ���������� ��������� ����������

//procedure ExecDOASQL(aSession : TOracleSession; const strSQL : string);
// ��������� SQL ������

{procedure ExecBindSQL(aSession : TOracleSession; const strSQL : string;
                         const aBindVar : array of string;
                         const aBindType : array of Integer;
                         const aBindValue : array of Variant);}
// ��������� SQL ������, ��������� ��������� ����������

function DeleteSubStr(s, Substr : string) : string;
// ������� ����� Substr �� ������ s
// ����� � ������ ��������� ������� � �������� - ", "

//procedure ReopenQuery(Query : TOracleDataSet; KeyField : string; RestorePos : Boolean);
// ������� � ����� ������� ������
// ���� RestorePos=True, �� ���������� ������������ �������

//procedure SortQueryGrid(Query : TOracleDataSet; var Column: TColumnEh);
// ���������� ������ ������ �� �������� �������

{function GetMultField(Session : TOracleSession; const Sql : string;
                      const aNameFields : array of string;
                      var ValueFields : array of Variant) : Boolean;}
// ��������� SQL ������, ���������� ������ ����

{function GetBindMultField(aSession : TOracleSession; const aSql : string;
                          const aNameFields : array of string;
                          var ValueFields : array of Variant;
                          const aBindVar : array of string;
                          const aBindType : array of Integer;
                          const aBindValue : array of Variant) : Boolean;}
function GetBindMultField(aSession : TpFIBDatabase; const aSql : string;
                          const aNameFields : array of string;
                          var ValueFields : array of Variant;
                          const aBindVar : array of string;
                          const aBindValue : array of Variant) : Boolean;
// ��������� SQL ������, ���������� ������ ����
// ���������� ��������� ����������

function First_Day_Prev_Month(curDate : TDateTime): TDateTime;
// ���������� ������ ���� ����������� ������

{procedure ExecOraclePackage(aSession : TOracleSession;
                            const aNameProc : string;
                            aParam : array of Variant);}
// ��������� ��������� Oracle

procedure Date_Div_on_Month(DateFirst : TDateTime; DateLast : TDateTime;
                            Order : array of byte; out DateArray: TDateArray);

function GridEhCopyToBuffer(Grid : TDBGridEh) : Longint;

implementation

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

function ReplaceChar(s : String; ch1, ch2 : Char) : String;
{������� ���� � ������ s ������� ch1 � �������� �� �� ch2}
  var
    i : Integer;
begin
  for i:=1 to Length(s) do
    if s[i]=ch1 then
      s[i]:=ch2;
  Result:=s
end;

function DelSpaces(s : string) : string;
{������� ���� � ������ ��� ��� ����� ������ ������ �������
 � �������� �� �� ���� ������}
  var
    s1 : string;
    n : byte;
begin
  n:=Pos('  ',s);
  while n<>0 do
    begin
      s1:=copy(s,1,n-1)+copy(s,n+1,Length(s)-n);
      s:=s1;
      n:=Pos('  ',s)
    end;
  Result:=s
end;

Procedure SetDisabledEdit(AOwner:TControl);
{��������� ��������� ��� ����������, �������
 ����� ����������� ��������������}
  var i : integer;
begin
  with AOwner do
    for I := 0 to ComponentCount-1 do
      If Components[i] is TDBEdit Then
        (Components[i] As TDBEdit).Enabled:=False
      Else
        If Components[i] Is TDBComboBox Then
          (Components[i] As TDBComboBox).Enabled:=False
        Else
          If Components[i] is TDBCheckBox Then
            (Components[i] As TDBCheckBox).Enabled:=False
          Else
           If Components[i] Is TDBListBox Then
             (Components[i] As TDBListBox).Enabled:=False
           Else
             If Components[i] Is TDBLookupComboBox Then
               (Components[i] As TDBLookupComboBox).Enabled:=False
             Else
               If Components[i] Is TRxDBCalcEdit Then
                 (Components[i] As TRxDBCalcEdit).Enabled:=False
               Else
                 If Components[i] Is TDBDateEdit Then
                   (Components[i] As TDBDateEdit).Enabled:=False
                 Else
                   If Components[i] is TEdit Then
                     (Components[i] As TEdit).Enabled:=False
                   Else
                     If Components[i] is TRxDbLookupCombo Then
                       (Components[i] As TRxDbLookupCombo).Enabled:=False
end;

procedure SetReadOnlyEdit(AOwner:TControl);
{ ��������� ��������� ��� ����������, �������
  ����� ����������� ��������������, � ReadOnly
}
  var
    i : integer;
begin
 with AOwner do
   for I := 0 to ComponentCount-1 do
   If Components[i]      is TDBEdit
    Then (Components[i] As TDBEdit).ReadOnly := True
   Else If Components[i] Is TDBComboBox
    Then (Components[i] As TDBComboBox).ReadOnly := True
   Else If Components[i] is TDBCheckBox
    Then (Components[i] As TDBCheckBox).ReadOnly := True
   Else If Components[i] Is TDBListBox
    Then (Components[i] As TDBListBox).ReadOnly := True
   Else If Components[i] Is TDBLookupComboBox
    Then (Components[i] As TDBLookupComboBox).ReadOnly := True
   Else If Components[i] Is TRxDBCalcEdit
    Then (Components[i] As TRxDBCalcEdit).ReadOnly := True
   Else If Components[i] Is TDBDateEdit
    Then (Components[i] As TDBDateEdit).ReadOnly := True
   Else If Components[i] is TEdit
    Then (Components[i] As TEdit).ReadOnly:=True
end;

procedure UnsetReadOnlyEdit(AOwner:TControl);
// ��������� ������� � ���� �����������, �������
// ����� ����������� ��������������, �������� ReadOnly
  var
    i : integer;
begin
  with AOwner do
    for i:=0 to ComponentCount-1 do
      if Components[i] is TDBEdit then
        (Components[i] as TDBEdit).ReadOnly:=False
      else
        if Components[i] is TDBComboBox then
          (Components[i] As TDBComboBox).ReadOnly:=False
        else
          if Components[i] is TDBCheckBox then
            (Components[i] As TDBCheckBox).ReadOnly:=False
          else
            if Components[i] is TDBListBox then
              (Components[i] As TDBListBox).ReadOnly:=False
            else
              if Components[i] is TDBLookupComboBox then
                (Components[i] As TDBLookupComboBox).ReadOnly:=False
              else
                if Components[i] is TRxDBCalcEdit then
                  (Components[i] As TRxDBCalcEdit).ReadOnly:=False
                else
                  if Components[i] is TDBDateEdit then
                    (Components[i] As TDBDateEdit).ReadOnly:=False
                  else
                    if Components[i] is TEdit then
                      (Components[i] As TEdit).ReadOnly:=False
end;

{function GetResultSqlDOA(Session : TOracleSession; const Sql : string) : Variant;
// ��������� SQL ������, ���������� ���� � ������ 'Result'
  var
    tmpQuery : TOracleQuery;
begin
  Result:=Null;
  tmpQuery:=TOracleQuery.Create(Application);
  try
   tmpQuery.Session:=Session;
   tmpQuery.SQL.Add(Sql);
   tmpQuery.Execute;
   if not tmpQuery.EOF then
     Result:=tmpQuery.Field('Result');
  finally
   FreeAndNil(tmpQuery);
  end
end;}

function GetResSqlFIB(Session : TpFIBDatabase; const v_Sql : string) : Variant;
// ��������� SQL ������, ���������� ������ ���� ����������
  var
    tmpQuery : TpFIBQuery;
begin
  Result:=Null;
  //Result:=Session.QueryValue(v_Sql,0);
  tmpQuery:=TpFIBQuery.Create(Application);
  try
   tmpQuery.Database:=Session;
   tmpQuery.Transaction:=Session.DefaultTransaction;
   tmpQuery.SQL.Text:=v_Sql;
   tmpQuery.ExecQuery;
   if not tmpQuery.EOF then
     Result:=tmpQuery.FieldByName('Result').AsVariant;
   tmpQuery.Close;
  finally
   FreeAndNil(tmpQuery);
  end;
end;

{function GetResBindSql(aSession : TOracleSession; const strSql : string;
                       const aBindVar : array of string;
                       const aBindType : array of Integer;
                       const aBindValue : array of Variant) : Variant;
// ��������� SQL ������, ���������� ���� � ������ 'Result'
// ���������� ��������� ����������
  var
    i : Integer;
begin
  Result:=Null;
  with TOracleQuery.Create(Application) do
    try
     Session:=aSession;
     SQL.Add(strSql);
     for i:=Low(aBindVar) to High(aBindVar) do
       begin
         DeclareVariable(aBindVar[i],aBindType[i]);
         SetVariable(aBindVar[i],aBindValue[i]);
       end;
     Execute;
     if not EOF then
       Result:=Field('Result');
    finally
     Free;
    end
end;}

function GetResBindSqlFib(v_Session : TpFIBDatabase; const v_Sql : string;
                       const v_BindVar : array of string;
                       const v_BindValue : array of Variant) : Variant;
// ��������� SQL ������, ���������� ���� � ������ 'Result'
// ���������� ��������� ����������
  var
    i : Integer;
begin
  Result:=Null;
  with TpFIBQuery.Create(Application) do
    try
     Database:=v_Session;
     Transaction:=v_Session.DefaultTransaction;
     SQL.Add(v_Sql);
     for i:=Low(v_BindVar) to High(v_BindVar) do
       begin
         ParamByName(v_BindVar[i]).AsVariant:=v_BindValue[i];
       end;
     ExecQuery;
     if not EOF then
       Result:=FieldByName('Result').AsVariant;
    finally
     Free;
    end
end;

{procedure ExecDOASQL(aSession : TOracleSession; const strSQL : string);
// ��������� SQL ������
begin
  with TOracleQuery.Create(Application) do
    try
     Session:=aSession;
     SQL.Add(strSQL);
     Execute
    finally
     Free
    end
end;}

{procedure ExecBindSQL(aSession : TOracleSession; const strSQL : string;
                         const aBindVar : array of string;
                         const aBindType : array of Integer;
                         const aBindValue : array of Variant);
  var
    i : Integer;
// ��������� SQL ������, ��������� ��������� ����������
begin
  with TOracleQuery.Create(Application) do
    try
     Session:=aSession;
     SQL.Add(strSQL);
     for i:=Low(aBindVar) to High(aBindVar) do
       begin
         DeclareVariable(aBindVar[i],aBindType[i]);
         SetVariable(aBindVar[i],aBindValue[i]);
       end;
     Execute;
    finally
     Free
    end
end;}

function DeleteSubStr(s, Substr : string) : string;
// ������� ����� Substr �� ������ s
// ����� � ������ ��������� ������� � �������� - ", "
  var
    n : integer;
    s1 : string;
begin
  Result:=s;
  s1:=Substr+',';
  n:=Pos(s1,s);
  if n=0 then
    begin
      s1:=', '+Substr;
      n:=Pos(s1,s);
      if n=0 then
        begin
          s1:=Substr;
          n:=Pos(s1,s);
        end
    end;
  Result:=DelSpace1(Copy(s,1,n-1)+Copy(s,n+Length(s1),Length(s)-(n+Length(s1))+1))
end;

{procedure ReopenQuery(Query : TOracleDataSet; KeyField : string; RestorePos : Boolean);
// ������� � ����� ������� ������
// ���� RestorePos=True, �� ���������� ������������ �������
  var
    id : Longint;
begin
  id:=0;
  if Query.Active then
    begin
      if RestorePos then
        id:=Query.FieldByName(KeyField).AsInteger;
      Query.Close
    end
  else
    RestorePos:=False;
  Screen.Cursor:=crSQLWait;
  try
   Query.Open;
   if RestorePos then
     Query.Locate(KeyField, id, [])
  finally
   Screen.Cursor:=crDefault
  end
end;}

{procedure SortQueryGrid(Query : TOracleDataSet; var Column: TColumnEh);
// ���������� ������ ������ �� �������� �������
  var
    Bookmark : TBookmark;
    KeyField : string;
    tmpStr   : string;
begin
  Bookmark:=nil;
  if Query.Active then
    Bookmark:=Query.GetBookmark;
  tmpStr:=Query.GetVariable('keyfield');
  KeyField:=Copy(tmpStr,3,Length(tmpStr)-2);
  if Query.GetVariable('sortfield')=KeyField then
    begin
      // �������� ���������� �� ������ ����
      Query.SetVariable('sortfield',Column.FieldName);
      Column.Title.SortMarker:=smDownEh
    end
  else
    begin
      // ���� ������ �� ��� �� �������, ������� ��� �� ����������
      if IsWordPresent(Column.FieldName,Query.GetVariable('sortfield'),[' ',',']) then
        begin
          Query.SetVariable('sortfield',DeleteSubStr(Query.GetVariable('sortfield'),Column.FieldName));
          // ���� �� �������� ������ ����� ��� ����������
          if IsEmptyStr(Query.GetVariable('sortfield'),[' ',',']) then
            Query.SetVariable('sortfield',KeyField);
          Column.Title.SortMarker:=smNoneEh
        end
      else
        begin
          // �������� ���� � ����������
          Query.SetVariable('sortfield',Query.GetVariable('sortfield')+', '+Column.FieldName);
          Column.Title.SortMarker:=smDownEh
        end
    end;

  // ������������ �������
  if Query.Active then
    begin
      Query.Close;
      Screen.Cursor:=crSQLWait;
      try
       Query.Open;
       try
        Query.GotoBookmark(Bookmark)
       except
       end
      finally
       Query.FreeBookmark(Bookmark);
       Screen.Cursor:=crDefault
      end
    end
end;}

{function GetMultField(Session : TOracleSession; const Sql : string;
                      const aNameFields : array of string;
                      var ValueFields : array of Variant) : Boolean;
// ��������� SQL ������, ���������� ������ ����
  var
    tmpQuery : TOracleQuery;
    i        : Integer;
begin
  Result:=False;
  tmpQuery:=TOracleQuery.Create(Application);
  try
   tmpQuery.Session:=Session;
   tmpQuery.SQL.Add(Sql);
   tmpQuery.Execute;
   if not tmpQuery.EOF then
     begin
       for i:=Low(aNameFields) to High(aNameFields) do
         ValueFields[i]:=tmpQuery.Field(aNameFields[i]);
       Result:=True;
     end;
  finally
   FreeAndNil(tmpQuery);
  end;
end;}

function GetBindMultField(aSession : TpFIBDatabase; const aSql : string;
                          const aNameFields : array of string;
                          var ValueFields : array of Variant;
                          const aBindVar : array of string;
                          const aBindValue : array of Variant) : Boolean;
// ��������� SQL ������, ���������� ������ ����
// ���������� ��������� ����������
  var
    i : Integer;
begin
  Result:=False;
  with TpFIBQuery.Create(Application) do
    try
     Database:=aSession;
     Transaction:=aSession.DefaultTransaction;
     SQL.Add(aSql);
     for i:=Low(aBindVar) to High(aBindVar) do
       begin
         ParamByName(aBindVar[i]).AsVariant:=aBindValue[i];
       end;
     ExecQuery;
     if not EOF then
       begin
         for i:=Low(aNameFields) to High(aNameFields) do
           ValueFields[i]:=FieldByName(aNameFields[i]).AsVariant;
         Result:=True;
       end;
    finally
     Free;
    end;
end;

function First_Day_Prev_Month(curDate : TDateTime): TDateTime;
// ���������� ������ ���� ����������� ������
var
  Year, Month, Day: Word;
begin
  DecodeDate(curDate, Year, Month, Day);
  Day:=1;
  if Month>1 then
    Dec(Month)
  else
    begin
      Dec(Year);
      Month:=12;
    end;
  Result:=EncodeDate(Year, Month, Day);
end;

{procedure ExecOraclePackage(aSession : TOracleSession; const aNameProc : string;
                            aParam : array of Variant);
begin
  with TOraclePackage.Create(Application) do
    try
     try
      Session:=aSession;
      ParameterMode:=pmNamed;
      CallProcedure(aNameProc, aParam);
      Session.Commit;
     except on E:Exception do
      begin
        MessageDlg('�������� ������ �� ����� ����������'#10'��������� Oracle!'+E.Message+'���������� � ������������', mtError, [mbOk], 0);
        exit;
      end;
     end;
    finally
     Free;
    end;
end;}

procedure Date_Div_on_Month(DateFirst : TDateTime; DateLast : TDateTime;
                            Order : array of byte; out DateArray: TDateArray);
// ����� ������ � ��������� ���� �� �������� �� �������
// ���������� ������ ��� ��������� �� ��������� (��) � �������� ���� (��) �� ��������
// � �������  ����� �� �� �� ����� ����������
// Order = 1..(��-��+1)
var
  i, j, TempLDay,
  FYear, FMonth, FDay,
  LYear, LMonth, LDay: Word;
begin
  //  DecodeDate(DateFirst, FYear, FMonth, FDay);
  DecodeDate(DateLast, LYear, LMonth, LDay);
  i:=0;
  j:=0;
  TempLDay:=LDay;
  SetLength(DateArray, High(Order)+1);
  DateLast:=DateFirst;
  while j <= High(Order) do
    begin
      DecodeDate(DateFirst, FYear, FMonth, FDay);
      DecodeDate(DateLast, LYear, LMonth, LDay);
      //    DateArray[j,0]:=EncodeDate(FYear, FMonth, 1);
      if j=High(Order) then
        LDay:=TempLDay
      else
        LDay:=DaysInMonth(DateLast);
      if Order[j] = 0 then
        begin
          DateArray[j,0]:=EncodeDate(FYear, FMonth, 1);
          DateArray[j,1]:=EncodeDate(LYear, LMonth , LDay);
          DateFirst:=IncMonth(DateFirst, 1+i);
          i:=0;
        end
      else
        if Order[j] = 1 then
          begin
            inc(i);
            if j = High(Order) then DateArray[j-i,1]:=EncodeDate(LYear, LMonth , LDay);
            DateArray[j,0]:=0;
            DateArray[j,1]:=0;
          end;
      //      DecodeDate(DateLast, LYear, LMonth, LDay);
      //      DecodeDate(DateFirst, FYear, FMonth, FDay);
      DateLast:=IncMonth(DateLast, 1);
      inc(j);
    end;
end;

function GridEhCopyToBuffer(Grid : TDBGridEh) : Longint;
var
  I, RWidth, J : LongInt ;
  AllWidth : LongInt;
  MyBookMark : TBookmark;
  TextBuffer : PChar;
  Clipboard : TClipboard;
  CountRec : Longint ;
begin
  CountRec := 0 ;
  Result := 0 ;
  with Grid do
    begin
      if ( DataSource = nil ) or ( DataSource.DataSet = nil ) then Exit;
      AllWidth := 0;
      RWidth := 0;
      J := 0;
      for i:=0 to FieldCount-1 do
        begin
          try
           if Columns.Items[I].Visible then
             Inc( RWidth, Fields[I].DisplayWidth + 1 );
          except
           ShowMessage(Fields[I].FullName);
           raise;
          end;
        end;
      inc( RWidth );
      inc( AllWidth, ( DataSource.DataSet.RecordCount ) * RWidth );
      for I := 0 to Columns.Count - 1 do
        with Columns.Items[I] do
          begin
            if Visible then
              inc(AllWidth, Length(Columns.Items[i].Title.Caption)+1);
          end;
      Inc(AllWidth);
      //   if AllWidth>65528 then AllWidth:=65528;
      GetMem( TextBuffer, AllWidth );
      for I := 0 to Columns.Count - 1 do
        with Columns.Items[I] do
          if Visible then
            begin
              strpcopy( TextBuffer + J, Columns.Items[i].Title.Caption);
              inc( J, Length(Columns.Items[i].Title.Caption) + 1 );
              strpcopy( TextBuffer + J - 1, #09 );
            end;
      {For I := 0 To FieldCount - 1 Do
        With Fields[I] Do
          Begin
            strpcopy( TextBuffer + J, copy( DisplayLabel, 1, DisplayWidth ) );
            inc( J, length( copy( DisplayLabel, 1, DisplayWidth ) ) + 1 );
            strpcopy( TextBuffer + J - 1, #09 );
          End;}
      strpcopy( TextBuffer + J - 1, #13 + #10 );
      inc( J );
      MyBookMark := DataSource.DataSet.GetBookmark;
      try
        DataSource.DataSet.DisableControls;
        DataSource.DataSet.First;
        while not DataSource.DataSet.Eof and ( J < ( AllWidth - RWidth ) ) do
          begin
            for I := 0 To FieldCount - 1 do
              if Columns.Items[I].Visible then
                with Fields[I] do
                  begin
                    strpcopy( TextBuffer + J, copy( Text, 1, DisplayWidth ) );
                    inc( J, length( copy( Text, 1, DisplayWidth ) ) + 1 );
                    strpcopy( TextBuffer + J - 1, #09 );
                  end;
            strpcopy( TextBuffer + J - 1, #13 + #10 );
            inc( J );
            Inc(CountRec);
            DataSource.DataSet.Next;
          End;
        Try
          DataSource.DataSet.GotoBookmark( MyBookMark );
        Except
        End;
      Finally
        DataSource.DataSet.EnableControls;
        DataSource.DataSet.FreeBookMark( MyBookMark );
      End;
    End;
  Clipboard := TClipboard.Create;
  Clipboard.Open;
  Clipboard.SetTextBuf( TextBuffer );
  freemem( TextBuffer, AllWidth );
  Clipboard.Close;
  Clipboard.Free;
  Result := CountRec ; {����� ������������}
end;

end.
