unit FilterOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseSimpleFilter, Placemnt, StdCtrls, ExtCtrls, Buttons, fg_Const;

type
  TfrmFilterOrder = class(TfrmBaseSimpleFilter)
    chkFact_Date_Order: TCheckBox;
    rgFact_Date_Order: TRadioGroup;
    lblName_Customer: TLabel;
    edtName_Contractor: TEdit;
    procedure btnOkClick(Sender: TObject); override;
    procedure chkFact_Date_OrderClick(Sender: TObject);
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
end;

procedure TfrmFilterOrder.chkFact_Date_OrderClick(Sender: TObject);
begin
  inherited;
  if chkFact_Date_Order.Checked then
    rgFact_Date_Order.Enabled:=True
  else
    rgFact_Date_Order.Enabled:=False;
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
