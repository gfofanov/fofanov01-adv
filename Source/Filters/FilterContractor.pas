unit FilterContractor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseSimpleFilter, Placemnt, StdCtrls, ExtCtrls, Buttons, fg_Const;

type
  TfrmFilterContractor = class(TfrmBaseSimpleFilter)
    Label1: TLabel;
    edtINN: TEdit;
    edtKPP: TEdit;
    Label3: TLabel;
    edtName_Contractor: TEdit;
    Label4: TLabel;
    chbType_Contractor: TCheckBox;
    cmbType_Contractor: TComboBox;
    procedure btnOkClick(Sender: TObject); override;
    procedure chbType_ContractorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; aNameFilter : string;
                       aActionFilter : TActionSimpleFilter); reintroduce;
  end;

var
  frmFilterContractor: TfrmFilterContractor;

implementation

{$R *.dfm}

{ TfrmFilterContractor }

procedure TfrmFilterContractor.btnOkClick(Sender: TObject);
begin
  inherited;
  if edtINN.Text<>'' then
    begin
      FilterString:=FilterString+' and contractor.inn like '#39+edtINN.Text+#39;
    end;
  if edtKPP.Text<>'' then
    begin
      FilterString:=FilterString+' and contractor.kpp like '#39+edtKPP.Text+#39;
    end;
  if edtName_Contractor.Text<>'' then
    begin
      FilterString:=FilterString+' and contractor.name_contractor like '#39+edtName_Contractor.Text+#39;
    end;
  if chbType_Contractor.Checked then
    begin
      FilterString:=FilterString+' and contractor.type_contractor= '+IntToStr(cmbType_Contractor.ItemIndex+1);
    end;
end;

procedure TfrmFilterContractor.chbType_ContractorClick(Sender: TObject);
begin
  inherited;
  if chbType_Contractor.Checked then
    cmbType_Contractor.Enabled:=True
  else
    cmbType_Contractor.Enabled:=False;
end;

constructor TfrmFilterContractor.Create(aOwner: TComponent;
  aNameFilter: string; aActionFilter: TActionSimpleFilter);
begin
  inherited Create(aOwner, aNameFilter, aActionFilter);
end;

//******************* ContractorFilterCreator *************************
function ContractorFilterCreator(AOwner : TComponent; aActionFilter : TActionSimpleFilter) : TfrmBaseSimpleFilter;
begin
  Result:=TfrmFilterContractor.Create(aOwner, 'FilterContractor', aActionFilter);
end;

initialization
  InitSimpleFilterBroker;
  BrokerSimpleFilter.Registration(cSimpleFilterContractor, ContractorFilterCreator);
end.
