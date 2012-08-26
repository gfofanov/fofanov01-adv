unit edtOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseEditForm, DB, Placemnt, StdCtrls, Buttons, ExtCtrls, pFIBDataSet,
  fg_Const, Mask, DBCtrls, DBCtrlsEh, DBGridEh, DBLookupEh, FIBDataSet;

type
  TfrmEdtOrder = class(TfrmBaseEditForm)
    lblNumOrder: TLabel;
    dbedtNum_Order: TDBEdit;
    lblDate_Order: TLabel;
    dbedtDate_Order: TDBDateTimeEditEh;
    lblPhone_Customer: TLabel;
    dbedtPhone_Customer: TDBEdit;
    lblType_Order: TLabel;
    dbcbbType_Order: TDBLookupComboboxEh;
    dsType_Order: TDataSource;
    lblState_order: TLabel;
    dbcbbState_Order: TDBLookupComboboxEh;
    dsState_Order: TDataSource;
    lblSum_Order: TLabel;
    dbedtSum_Order: TDBNumberEditEh;
    lblSum_Paid: TLabel;
    dbedtSum_Paid: TDBNumberEditEh;
    lblSum_Unpaid: TLabel;
    dbedtSum_Unpaid: TDBNumberEditEh;
    lblComment_Order: TLabel;
    dbmmoComment_Order: TDBMemo;
    lblPlan_Date_Order: TLabel;
    dbedtPlan_Date_Order: TDBDateTimeEditEh;
    lblFact_Date_Order: TLabel;
    dbedtFact_Date_Order: TDBDateTimeEditEh;
    grpContractor: TGroupBox;
    btnChooseContract: TButton;
    lblInn: TLabel;
    dbedtInn: TDBEdit;
    lblKpp: TLabel;
    dbedtKpp: TDBEdit;
    lblName_Customer: TLabel;
    dbedtName_Customer: TDBEdit;
    lblSum_Discount: TLabel;
    dbedtSum_Discount: TDBNumberEditEh;
    lblDiscount_Perc: TLabel;
    dbedtDiscount_Perc: TDBNumberEditEh;
    procedure btnChooseContractClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; ActionForm : TActionEditForm; Query : TpFIBDataSet); reintroduce; override;
  end;

var
  frmEdtOrder: TfrmEdtOrder;

implementation

uses
  DataModule, Fg_util, BaseList;

{$R *.dfm}

{ TfrmEdtOrder }

procedure TfrmEdtOrder.btnChooseContractClick(Sender: TObject);
  var
    id_contractor : Longint;
    bForm : TfrmBaseList;
    ValueFields : array [1..4] of Variant;
begin
  inherited;
  bForm:=BrokerListForm.CreateList(Self, cContractor, doViewCloseList);
  if bForm=nil then
    Exit;
  try
   // Вызвать фильтр. Он откроет датасет
   bForm.actFilterExecute(Self);

   bForm.FormAction:=doChooseList;
   bForm.DoCommitOnPost:=False;
   if bForm.ShowModal<>mrYes then
     Exit;
   id_contractor:=bForm.GetID;
   if id_contractor>0 then
     begin
       DataSource.DataSet.FieldByName('id_contractor').AsInteger:=id_contractor;
       GetBindMultField(dm.oDbAdv, 'select inn, kpp, name_contractor, phone_contractor from contractor c where c.id_contractor=:id_contractor',
                        ['inn', 'kpp', 'name_contractor','phone_contractor'],
                        ValueFields,
                        ['id_contractor'],
                        [id_contractor]);
       DataSource.DataSet.FieldByName('inn').AsVariant:=ValueFields[1];
       DataSource.DataSet.FieldByName('kpp').AsVariant:=ValueFields[2];
       DataSource.DataSet.FieldByName('name_contractor').AsVariant:=ValueFields[3];
       // Скопировать телефон
       DataSource.DataSet.FieldByName('phone_customer').AsVariant:=ValueFields[4];
     end;
  finally
   bForm.Free;
  end;
  dbedtPhone_Customer.SetFocus;
end;

constructor TfrmEdtOrder.Create(aOwner: TComponent; ActionForm: TActionEditForm;
  Query: TpFIBDataSet);
var
  l_num_order : Variant;
begin
  inherited Create(AOwner, ActionForm, Query);
  SetLength(FieldsRecord,1);
  FieldsRecord[0]:='num_order';
  if not dsType_Order.DataSet.Active then
    dsType_Order.DataSet.Open;
  if not dsState_Order.DataSet.Active then
    dsState_Order.DataSet.Open;

  case ActionForm of
    doView : begin
               Caption:='Просмотр информации о заказе';
             end;
    doEdit : begin
               Caption:='Редактирование заказа';
             end;
    doNew  : begin
               Caption:='Добавление заказа';
               // Получить следующий номер заказа
               l_num_order:=GetResSqlFIB(dm.oDbAdv,'select max(num_order)+1 Result from order_doc');
               if l_num_order=null then
                 DataSource.DataSet.FieldByName('num_order').AsInteger:=1
               else
                 DataSource.DataSet.FieldByName('num_order').AsInteger:=l_num_order;
               DataSource.DataSet.FieldByName('date_order').AsDateTime:=trunc(Now);
               DataSource.DataSet.FieldByName('id_spr_type_order').AsInteger:=dsType_Order.DataSet.FieldByName('id_spr_type_order').AsInteger;
               DataSource.DataSet.FieldByName('id_spr_state_order').AsInteger:=dsState_Order.DataSet.FieldByName('id_spr_state_order').AsInteger;
             end;
  end;
end;

//******************* OrderFormCreator *************************
function OrderFormCreator(AOwner : TComponent; ActionForm : TActionEditForm; Query : TpFIBDataSet) : TfrmBaseEditForm;
begin
  Result:=TfrmEdtOrder.Create(aOwner, ActionForm, Query);
end;

initialization
  InitEditFormBroker;
  BrokerEditForm.Registration(cOrder_Doc,OrderFormCreator);
end.
