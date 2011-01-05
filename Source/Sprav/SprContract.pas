unit SprContract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseList, DBGridEhGrouping, DB, FIBDataSet, pFIBDataSet, PrnDbgeh,
  Menus, ActnList, Placemnt, GridsEh, DBGridEh, ExtCtrls, ComCtrls, ToolWin, fg_Const;

type
  TfrmSprContract = class(TfrmBaseList)
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; aActionList : TActionListForm); reintroduce;
  end;

var
  frmSprContract: TfrmSprContract;

implementation

{$R *.dfm}

{ TfrmSprContract }

constructor TfrmSprContract.Create(aOwner: TComponent;
  aActionList: TActionListForm);
begin
  inherited Create(AOwner, aActionList, 'contract', 'id_contract',
                   cContract, cSimpleFilterContract);
end;

//******************* ContractListCreator *************************
function ContractListCreator(AOwner : TComponent; aActionList : TActionListForm) : TfrmBaseList;
begin
  Result:=TfrmSprContract.Create(aOwner, aActionList);
end;

initialization
  InitListFormBroker;
  BrokerListForm.Registration(cContract, ContractListCreator);
end.
