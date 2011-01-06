program Adv;

uses
  Forms,
  SysUtils,
  Dialogs,
  Users in 'Users.pas' {frmUsers},
  DataModule in 'DataModule.pas' {dm: TDataModule},
  fg_Const in 'fg_Const.pas',
  fg_Util in 'fg_Util.pas',
  SetupColumns in 'SetupColumns.pas' {frmSetupColumns},
  ParentMat_Store in 'Parent\ParentMat_Store.pas' {frmParentMat_Store},
  Main in 'Main.pas' {frmMain},
  BaseList in 'Parent\BaseList.pas' {frmBaseList},
  BaseEditForm in 'Parent\BaseEditForm.pas' {frmBaseEditForm},
  BaseSimpleFilter in 'Parent\BaseSimpleFilter.pas' {frmBaseSimpleFilter},
  Second_Start in 'Second_Start.pas',
  Reports in 'Reports\Reports.pas' {dmReport: TDataModule},
  SprContractor in 'Sprav\SprContractor.pas' {frmSprContractor},
  edtSprContractor in 'Sprav\edtSprContractor.pas' {frmEdtSprContractor},
  FilterContractor in 'Filters\FilterContractor.pas' {frmFilterContractor},
  SprContract in 'Sprav\SprContract.pas' {frmSprContract},
  FilterContract in 'Filters\FilterContract.pas' {frmFilterContract},
  BaseDualList in 'Parent\BaseDualList.pas' {frmBaseDualList},
  AdvSide in 'Sprav\AdvSide.pas' {frmAdvSide},
  FilterAdv in 'Filters\FilterAdv.pas' {frmFilterAdv},
  FilterSide in 'Filters\FilterSide.pas' {frmFilterSide},
  EnterDate in 'EnterDate.pas' {frmEnterDate},
  edtAdv in 'Sprav\edtAdv.pas' {frmEdtAdv};

{$R *.res}


begin
  CheckInstance('{1907760B-22BC-4E18-9410-FA47DA2A7C56}', False, True);
  Application.Initialize;
  ShortDateFormat:='DD.MM.YYYY';
  Application.UpdateFormatSettings:=False;
  Application.Title := 'АС Учет рекламных конструкций';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TdmReport, dmReport);
  if EnterPassword then
    begin
      Application.CreateForm(TfrmMain, frmMain);
      Application.Run;
    end;
end.
