unit edtSprType_Order;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseEditForm, DB, Placemnt, StdCtrls, Buttons, ExtCtrls, fg_Const,
  FIBDataSet, pFIBDataSet, Mask, DBCtrls;

type
  TfrmEdtSprType_Order = class(TfrmBaseEditForm)
    lblName_Type_Order: TLabel;
    dbedtName_Type_Order: TDBEdit;
    lblName_Print: TLabel;
    dbedtName_Print: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; ActionForm : TActionEditForm; Query : TpFIBDataSet); reintroduce; override;
  end;

var
  frmEdtSprType_Order: TfrmEdtSprType_Order;

implementation

uses
  DataModule;

{$R *.dfm}

{ TfrmEdtSprType_Order }

procedure After_PostType_Order(aForm : TfrmBaseEditForm; aFromForm : TForm);
begin
  if dm.qrType_Order.Active then
    dm.qrType_Order.Close;
end;

procedure Before_PostType_Order(aForm : TfrmBaseEditForm);
var
  formEdtSprType_Order: TfrmEdtSprType_Order;
begin
  if aForm is TfrmEdtSprType_Order then
    begin
      formEdtSprType_Order:=TfrmEdtSprType_Order(aForm);

      if formEdtSprType_Order.DataSource.DataSet.FieldByName('name_print').AsVariant=Null then
        formEdtSprType_Order.DataSource.DataSet.FieldByName('name_print').AsString:=formEdtSprType_Order.DataSource.DataSet.FieldByName('name_type_order').AsString;
    end;
end;

constructor TfrmEdtSprType_Order.Create(aOwner: TComponent;
  ActionForm: TActionEditForm; Query: TpFIBDataSet);
begin
  inherited Create(AOwner, ActionForm, Query);
  SetLength(FieldsRecord,1);
  FieldsRecord[0]:='name_type_order';
  AfterPost := After_PostType_Order;
  BeforePost := Before_PostType_Order;

  case ActionForm of
    doView : begin
               Caption:='Просмотр информации о виде заказа';
             end;
    doEdit : begin
               Caption:='Редактирование вида заказа';
             end;
    doNew  : begin
               Caption:='Добавление вида заказа';
             end;
  end;
end;

//******************* Type_OrderFormCreator *************************
function Type_OrderFormCreator(AOwner : TComponent; ActionForm : TActionEditForm; Query : TpFIBDataSet) : TfrmBaseEditForm;
begin
  Result:=TfrmEdtSprType_Order.Create(aOwner, ActionForm, Query);
end;

initialization
  InitEditFormBroker;
  BrokerEditForm.Registration(cType_Order,Type_OrderFormCreator);
end.
