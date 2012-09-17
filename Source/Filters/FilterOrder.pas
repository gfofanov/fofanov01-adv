unit FilterOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseSimpleFilter, Placemnt, StdCtrls, ExtCtrls, Buttons, fg_Const,
  Mask, sMaskEdit, sCustomComboEdit, sTooledit;

type
  TfrmFilterOrder = class(TfrmBaseSimpleFilter)
    chkFact_Date_Order: TCheckBox;
    rgFact_Date_Order: TRadioGroup;
    lblName_Customer: TLabel;
    edtName_Contractor: TEdit;
    edtSum_Unpayment: TEdit;
    chkSum_Unpayment: TCheckBox;
    rgSum_Unpayment: TRadioGroup;
    chkDate_Order: TCheckBox;
    dedtDate_Order_Beg: TsDateEdit;
    dedtDate_Order_End: TsDateEdit;
    lbldate_order_end: TLabel;
    procedure btnOkClick(Sender: TObject); override;
    procedure chkFact_Date_OrderClick(Sender: TObject);
    procedure chkSum_UnpaymentClick(Sender: TObject);
    procedure chkDate_OrderClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; aNameFilter : string;
                       aActionFilter : TActionSimpleFilter); reintroduce;
  end;

var
  frmFilterOrder: TfrmFilterOrder;

implementation

{$R *.dfm}

{ TfrmFilterOrder }

procedure TfrmFilterOrder.btnOkClick(Sender: TObject);
begin
  inherited;
  if chkFact_Date_Order.Checked then
    case rgFact_Date_Order.ItemIndex of
      0 : FilterString:=FilterString+' and order_doc.fact_date_order is null';
      1 : FilterString:=FilterString+' and order_doc.fact_date_order is not null';
    end;
  if edtName_Contractor.Text<>'' then
    begin
      FilterString:=FilterString+' and upper(c.name_contractor) like '#39+AnsiUpperCase(edtName_Contractor.Text)+#39;
    end;
  if chkSum_Unpayment.Checked then
    case rgSum_Unpayment.ItemIndex of
      0 : FilterString:=FilterString+' and order_doc.sum_unpaid>'+edtSum_Unpayment.Text;
      1 : FilterString:=FilterString+' and order_doc.sum_unpaid>(order_doc.sum_order*'+edtSum_Unpayment.Text+'/100)';
    end;
  if chkDate_Order.Checked then
    begin
      FilterString:=FilterString+' and order_doc.date_order between '''+DateToStr(dedtDate_Order_Beg.Date)+''' and '''+DateToStr(dedtDate_Order_End.Date)+'''';
    end;
end;

procedure TfrmFilterOrder.chkDate_OrderClick(Sender: TObject);
begin
  inherited;
  if chkDate_Order.Checked then
    begin
      dedtDate_Order_Beg.Enabled:=True;
      dedtDate_Order_End.Enabled:=True;
    end
  else
    begin
      dedtDate_Order_Beg.Enabled:=False;
      dedtDate_Order_End.Enabled:=False;
    end;
end;

procedure TfrmFilterOrder.chkFact_Date_OrderClick(Sender: TObject);
begin
  inherited;
  if chkFact_Date_Order.Checked then
    rgFact_Date_Order.Enabled:=True
  else
    rgFact_Date_Order.Enabled:=False;
end;

procedure TfrmFilterOrder.chkSum_UnpaymentClick(Sender: TObject);
begin
  inherited;
  if chkSum_Unpayment.Checked then
    begin
      rgSum_Unpayment.Enabled:=True;
      edtSum_Unpayment.Enabled:=True;
    end
  else
    begin
      rgSum_Unpayment.Enabled:=False;
      edtSum_Unpayment.Enabled:=False;
    end;
end;

constructor TfrmFilterOrder.Create(aOwner: TComponent; aNameFilter: string;
  aActionFilter: TActionSimpleFilter);
begin
  inherited Create(aOwner, aNameFilter, aActionFilter);
end;

//******************* OrderFilterCreator *************************
function OrderFilterCreator(AOwner : TComponent; aActionFilter : TActionSimpleFilter) : TfrmBaseSimpleFilter;
begin
  Result:=TfrmFilterOrder.Create(aOwner, 'FilterOrder', aActionFilter);
end;

initialization
  InitSimpleFilterBroker;
  BrokerSimpleFilter.Registration(cSimpleFilterOrder, OrderFilterCreator);
end.
