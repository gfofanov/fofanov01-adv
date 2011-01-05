unit SprContractor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseList, DBGridEhGrouping, DB, FIBDataSet, pFIBDataSet, PrnDbgeh,
  Menus, ActnList, Placemnt, GridsEh, DBGridEh, ExtCtrls, ComCtrls,
  ToolWin, fg_Const;

type
  TfrmSprContractor = class(TfrmBaseList)
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; aActionList : TActionListForm); reintroduce;
  end;

var
  frmSprContractor: TfrmSprContractor;

implementation

uses DataModule;

{$R *.dfm}

{ TfrmSprContractor }

constructor TfrmSprContractor.Create(aOwner: TComponent;
  aActionList: TActionListForm);
begin
  inherited Create(AOwner, aActionList, 'contractor', 'id_contractor',
                   cContractor, cSimpleFilterContractor);
end;

//******************* ContractorListCreator *************************
function ContractorListCreator(AOwner : TComponent; aActionList : TActionListForm) : TfrmBaseList;
begin
  Result:=TfrmSprContractor.Create(aOwner, aActionList);
end;

initialization
  InitListFormBroker;
  BrokerListForm.Registration(cContractor, ContractorListCreator);
end.
