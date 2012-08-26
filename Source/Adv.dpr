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
  edtAdv in 'Sprav\edtAdv.pas' {frmEdtAdv},
  edtSprSide in 'Sprav\edtSprSide.pas' {frmEdtSprSide},
  edtSprContract in 'Sprav\edtSprContract.pas' {frmEdtSprContract},
  SprMeasure in 'Sprav\SprMeasure.pas' {frmSprMeasure},
  edtSprMeasure in 'Sprav\edtSprMeasure.pas' {frmEdtSprMeasure},
  SprMat_Price in 'Sprav\SprMat_Price.pas' {frmSprMat_Price},
  Order in 'Sprav\Order.pas' {frmOrder},
  FilterOrder in 'Filters\FilterOrder.pas' {frmFilterOrder},
  FilterOrder_Comp in 'Filters\FilterOrder_Comp.pas' {frmFilterOrder_Comp},
  edtOrder in 'Sprav\edtOrder.pas' {frmEdtOrder},
  edtOrder_Comp in 'Sprav\edtOrder_Comp.pas' {frmEdtOrder_Comp},
  SprType_Order in 'Sprav\SprType_Order.pas' {frmSprType_Order},
  edtSprType_Order in 'Sprav\edtSprType_Order.pas' {frmEdtSprType_Order};

{$R *.res}


begin
  CheckInstance('{1907760B-22BC-4E18-9410-FA47DA2A7C56}', False, True);
  Application.Initialize;
  ShortDateFormat:='DD.MM.YYYY';
  Application.UpdateFormatSettings:=False;
  Application.Title := 'Рекламно-производственная фирма "Лавр"';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TdmReport, dmReport);
  if EnterPassword then
    begin
      Application.CreateForm(TfrmMain, frmMain);
      Application.Run;
    end;
end.
