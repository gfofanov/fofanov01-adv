unit Order;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDualList, DBGridEhGrouping, DB, FIBDataSet, pFIBDataSet, Menus,
  ActnList, Placemnt, RXSplit, GridsEh, DBGridEh, ExtCtrls, ComCtrls, ToolWin,
  fg_Const;

type
  TfrmOrder = class(TfrmBaseDualList)
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; aActionList : TActionListForm); reintroduce;
  end;

var
  frmOrder: TfrmOrder;

implementation

{$R *.dfm}

{ TfrmOrder }

constructor TfrmOrder.Create(aOwner: TComponent; aActionList: TActionListForm);
begin
  inherited Create(AOwner, aActionList,
                   'order_doc', 'id_order',
                   'order_comp', 'id_order_comp',
                   cOrder_Doc, cOrder_Comp,
                   cSimpleFilterOrder, cSimpleFilterOrder_Comp);
end;

//******************* Order *************************
function OrderDualListCreator(AOwner : TComponent; aActionList : TActionListForm) : TfrmBaseDualList;
begin
  Result:=TfrmOrder.Create(aOwner, aActionList);
end;

initialization
  InitDualListBroker;
  BrokerDualListForm.Registration(cOrder, OrderDualListCreator);
end.
