unit SprMeasure;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseList, PrnDbgeh, DB, Menus, ActnList, Placemnt,
  DBGridEh, ExtCtrls, ComCtrls, ToolWin, fg_Const, GridsEh,
  DBGridEhGrouping, FIBDataSet, pFIBDataSet;

type
  TfrmSprMeasure = class(TfrmBaseList)
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; aActionList : TActionListForm); reintroduce;
  end;

var
  frmSprMeasure: TfrmSprMeasure;

implementation

uses DataModule;

{$R *.dfm}

{ TfrmSprMeasure }

constructor TfrmSprMeasure.Create(aOwner: TComponent;
  aActionList: TActionListForm);
begin
  inherited Create(AOwner, aActionList, 'measure', 'id_spr_measure',
                   cMeasure, cSimpleFilterMeasure);
end;

//******************* MeasureListCreator *************************
function MeasureListCreator(AOwner : TComponent; aActionList : TActionListForm) : TfrmBaseList;
begin
  Result:=TfrmSprMeasure.Create(aOwner, aActionList);
end;

initialization
  InitListFormBroker;
  BrokerListForm.Registration(cMeasure, MeasureListCreator);
end.
