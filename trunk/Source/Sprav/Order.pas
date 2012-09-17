unit Order;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDualList, DBGridEhGrouping, DB, FIBDataSet, pFIBDataSet, Menus,
  ActnList, Placemnt, RXSplit, GridsEh, DBGridEh, ExtCtrls, ComCtrls, ToolWin,
  fg_Const, DBCtrls, StdCtrls;

type
  TfrmOrder = class(TfrmBaseDualList)
    lblSum_Unpaid: TLabel;
    dbtxtSum_unpaid: TDBText;
    btn1: TToolButton;
    procedure DBGridEh2DblClick(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; aActionList : TActionListForm); reintroduce;
  end;

var
  frmOrder: TfrmOrder;

implementation

uses
  Fg_util, DataModule;

{$R *.dfm}

{ TfrmOrder }

procedure TfrmOrder.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if DBGridEh2.Focused then
    QueryLeft.Refresh;
end;

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

procedure TfrmOrder.DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  inherited;
  if QueryLeft.FieldByName('sum_unpaid').AsFloat>0 then
    Background:=clRed;
end;

procedure TfrmOrder.DBGridEh2DblClick(Sender: TObject);
var
  l_count_non_complete : Integer;
begin
  inherited;
  // Пометить позицию заказа как выполненную
  DBGridEh2.SetFocus;
  if (DataSourceRight.DataSet.Active) and (not DataSourceRight.DataSet.IsEmpty) then
    begin
      if DataSourceRight.DataSet.FieldByName('fact_date').IsNull then
        begin
          DataSourceRight.DataSet.Edit;
          DataSourceRight.DataSet.FieldByName('fact_date').AsDateTime:=Trunc(Now);
          DataSourceRight.DataSet.Post;
        end;
      l_count_non_complete:=GetResBindSqlFib(dm.oDbAdv,'select count(*) Result from order_comp where id_order=:id_order and fact_date is null',
                                    ['id_order'],[DataSourceRight.DataSet.FieldByName('id_order').AsInteger]);
      // Все позиции заказа выполнены
      // Пометить выполненным весь заказ
      if (l_count_non_complete=0) and (DataSourceLeft.DataSet.FieldByName('fact_date_order').IsNull) then
        begin
          DataSourceLeft.DataSet.Edit;
          DataSourceLeft.DataSet.FieldByName('fact_date_order').AsDateTime:=Trunc(Now);
          DataSourceLeft.DataSet.FieldByName('id_spr_state_order').AsInteger:=3;
          DataSourceLeft.DataSet.Post;
        end;
    end;
end;

initialization
  InitDualListBroker;
  BrokerDualListForm.Registration(cOrder, OrderDualListCreator);
end.
