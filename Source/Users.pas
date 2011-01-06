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

uses DataModule, fg_Util, Variants;

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
            cHelpFile:=ExtractFilePath(ParamStr(0))+'adv.hlp';
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
end;

end.
