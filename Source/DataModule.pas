unit DataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, Registry, db, RxStrUtils, FIBDatabase, pFIBDatabase;

type
  Tdm = class(TDataModule)
    imgProject: TImageList;
    oDbAdv: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  RegistryKey = '\software\app_Adv';

var
  dm : Tdm;
  regMat_Dept : TRegistry;
  ID_USER : Longint;
  DirReports : string; // Каталог с отчетами
  cHelpFile : string; // Путь к hlp-файлу
  lTempDir : string; // Временный каталог

function fgGetCmdLineArg(const Switch: string; SwitchChars: TCharSet): string;

implementation

{$R *.DFM}


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
