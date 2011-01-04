program Adv;

uses
  Forms,
  SysUtils,
  Dialogs,
  Users in 'Users.pas' {frmUsers},
  DataModule in 'DataModule.pas' {dm: TDataModule},
  fg_Const in 'fg_Const.pas',
  Fg_util in 'fg_Util.pas',
  SetupColumns in 'SetupColumns.pas' {frmSetupColumns},
  ParentMat_Store in 'Parent\ParentMat_Store.pas' {frmParentMat_Store},
  Main in 'Main.pas' {frmMain},
  BaseList in 'Parent\BaseList.pas' {frmBaseList},
  BaseDualList in 'Parent\BaseDualList.pas' {frmBaseDualList},
  BaseTripleList in 'Parent\BaseTripleList.pas' {frmBaseTripleList},
  BaseEditForm in 'Parent\BaseEditForm.pas' {frmBaseEditForm},
  BaseSimpleFilter in 'Parent\BaseSimpleFilter.pas' {frmBaseSimpleFilter},
  Second_Start in 'Second_Start.pas',
  Reports in 'Reports\Reports.pas' {dmReport: TDataModule},
  SprMaterial in 'Sprav\SprMaterial.pas' {frmSprMaterial},
  SprMeasure in 'Sprav\SprMeasure.pas' {frmSprMeasure},
  FilterMeasure in 'Filters\FilterMeasure.pas' {frmFilterMeasure},
  FilterMaterial in 'Filters\FilterMaterial.pas' {frmFilterMaterial},
  edtSprDept in 'Sprav\edtSprDept.pas' {frmEdtSprDept},
  SprDept in 'Sprav\SprDept.pas' {frmSprDept};

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
