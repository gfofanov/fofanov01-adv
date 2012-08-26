unit edtOrder_Comp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseEditForm, DB, Placemnt, StdCtrls, Buttons, ExtCtrls, fg_Const,
  pFIBDataSet, DBGridEh, Mask, DBCtrlsEh, DBLookupEh, DBCtrls;

type
  TfrmEdtOrder_Comp = class(TfrmBaseEditForm)
    dbcbbSpr_Mat: TDBLookupComboboxEh;
    lblSpr_Mat: TLabel;
    dsSpr_Mat: TDataSource;
    lblSum_Order: TLabel;
    dbedtSum_Mat: TDBNumberEditEh;
    lblSum_Paid: TLabel;
    dbedtSum_Discount: TDBNumberEditEh;
    lblSum_Unpaid: TLabel;
    dbedtSum_Itog: TDBNumberEditEh;
    lblQuant_Mat: TLabel;
    dbedtQuant_Mat: TDBNumberEditEh;
    lblPrice_Mat: TLabel;
    dbedtPrice_Mat: TDBNumberEditEh;
    lblName_File: TLabel;
    dbedtName_File: TDBEdit;
    lblSizeX: TLabel;
    dbedtSizeX: TDBNumberEditEh;
    lblSizeY: TLabel;
    dbedtSizeY: TDBNumberEditEh;
    lblSize_Area: TLabel;
    dbedtSize_Area: TDBNumberEditEh;
    lblQuality_Print: TLabel;
    lblDate_Order: TLabel;
    dbedtDate_Order: TDBDateTimeEditEh;
    lblComment_Order: TLabel;
    dbmmoComment_Order: TDBMemo;
    dbcbbQuality_Print: TDBComboBoxEh;
    procedure dbedtSizeXChange(Sender: TObject);
    procedure dbedtSizeYChange(Sender: TObject);
    procedure dbedtQuant_MatChange(Sender: TObject);
    procedure dbedtPrice_MatChange(Sender: TObject);
  private
    { Private declarations }
    l_discount_perc : Double;
    procedure Calc_Sum;
    procedure Calc_Size_Area;
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; ActionForm : TActionEditForm; Query : TpFIBDataSet); reintroduce; override;
  end;

var
  frmEdtOrder_Comp: TfrmEdtOrder_Comp;

implementation

uses
  DataModule, Fg_util, Order;

{$R *.dfm}

{ TfrmEdtOrder_Comp }

procedure PostOrder_Comp(aForm : TfrmBaseEditForm; aFromForm : TForm);
var
  form_Order_Doc : TfrmOrder;
begin
  if (aFromForm is TfrmOrder) then
    begin
      form_Order_Doc:=TfrmOrder(aFromForm);
      form_Order_Doc.QueryLeft.Refresh;
    end;
end;

procedure TfrmEdtOrder_Comp.Calc_Size_Area;
begin
  if DataSource.DataSet.State in [dsEdit, dsInsert] then
    DataSource.DataSet.FieldByName('size_area').AsFloat:=DataSource.DataSet.FieldByName('sizex').AsFloat*DataSource.DataSet.FieldByName('sizey').AsFloat;
end;

procedure TfrmEdtOrder_Comp.Calc_Sum;
begin
  if (DataSource.DataSet.State in [dsEdit, dsInsert]) and (DataSource.DataSet.FieldByName('id_spr_mat').AsInteger<>0) then
    begin
      DataSource.DataSet.FieldByName('sum_mat').AsCurrency:=DataSource.DataSet.FieldByName('quant_mat').AsFloat*DataSource.DataSet.FieldByName('price_mat').AsCurrency/dsSpr_Mat.DataSet.FieldByName('koef_price').AsInteger;
      DataSource.DataSet.FieldByName('sum_discount').AsCurrency:=DataSource.DataSet.FieldByName('sum_mat').AsCurrency*l_discount_perc;
      DataSource.DataSet.FieldByName('sum_itog').AsCurrency:=DataSource.DataSet.FieldByName('sum_mat').AsCurrency-DataSource.DataSet.FieldByName('sum_mat').AsCurrency*l_discount_perc;
    end;
end;

constructor TfrmEdtOrder_Comp.Create(aOwner: TComponent;
  ActionForm: TActionEditForm; Query: TpFIBDataSet);
begin
  if not dm.qrSpr_Mat.Active then
    dm.qrSpr_Mat.Open;
  inherited Create(AOwner, ActionForm, Query);
  SetLength(FieldsRecord,1);
  FieldsRecord[0]:='quant_mat';
  AfterPost := PostOrder_Comp;
  if not dsSpr_Mat.DataSet.Active then
    dsSpr_Mat.DataSet.Open;
  l_discount_perc:=GetResBindSqlFib(dm.oDbAdv,'select discount_perc Result from order_doc where id_order=:id_order',
                                    ['id_order'],[DataSource.DataSet.FieldByName('id_order').AsInteger]);

  case ActionForm of
    doView : begin
               Caption:='Просмотр информации о составе заказа';
             end;
    doEdit : begin
               Caption:='Редактирование состава заказа';
             end;
    doNew  : begin
               Caption:='Добавление состава заказа';
             end;
  end;
end;

procedure TfrmEdtOrder_Comp.dbedtPrice_MatChange(Sender: TObject);
begin
  inherited;
  Calc_Sum;
end;

procedure TfrmEdtOrder_Comp.dbedtQuant_MatChange(Sender: TObject);
begin
  inherited;
  Calc_Sum;
end;

procedure TfrmEdtOrder_Comp.dbedtSizeXChange(Sender: TObject);
begin
  inherited;
  Calc_Size_Area;
end;

procedure TfrmEdtOrder_Comp.dbedtSizeYChange(Sender: TObject);
begin
  inherited;
  Calc_Size_Area;
end;

//******************* Order_CompFormCreator *************************
function Order_CompFormCreator(AOwner : TComponent; ActionForm : TActionEditForm; Query : TpFIBDataSet) : TfrmBaseEditForm;
begin
  Result:=TfrmEdtOrder_Comp.Create(aOwner, ActionForm, Query);
end;

initialization
  InitEditFormBroker;
  BrokerEditForm.Registration(cOrder_Comp,Order_CompFormCreator);
end.
