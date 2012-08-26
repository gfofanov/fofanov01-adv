unit SprType_Order;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseList, DBGridEhGrouping, DB, FIBDataSet, pFIBDataSet, PrnDbgeh,
  Menus, ActnList, Placemnt, GridsEh, DBGridEh, ExtCtrls, ComCtrls, ToolWin, fg_Const;

type
  TfrmSprType_Order = class(TfrmBaseList)
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; aActionList : TActionListForm); reintroduce;
  end;

var
  frmSprType_Order: TfrmSprType_Order;

implementation

uses
  DataModule;

{$R *.dfm}

{ TfrmSprType_Order }

constructor TfrmSprType_Order.Create(aOwner: TComponent;
  aActionList: TActionListForm);
begin
  inherited Create(AOwner, aActionList, 'type_order', 'id_spr_type_order',
                   cType_Order, cSimpleFilterType_Order);
end;

//******************* Type_OrderListCreator *************************
function Type_OrderListCreator(AOwner : TComponent; aActionList : TActionListForm) : TfrmBaseList;
begin
  Result:=TfrmSprType_Order.Create(aOwner, aActionList);
end;

initialization
  InitListFormBroker;
  BrokerListForm.Registration(cType_Order, Type_OrderListCreator);
end.
