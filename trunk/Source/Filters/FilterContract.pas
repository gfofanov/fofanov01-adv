unit FilterContract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseSimpleFilter, Placemnt, StdCtrls, ExtCtrls, Buttons, fg_Const;

type
  TfrmFilterContract = class(TfrmBaseSimpleFilter)
    Label1: TLabel;
    edtNumContract: TEdit;
    procedure btnOkClick(Sender: TObject); override;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; aNameFilter : string;
                       aActionFilter : TActionSimpleFilter); reintroduce;
  end;

var
  frmFilterContract: TfrmFilterContract;

implementation

{$R *.dfm}

{ TfrmFilterContract }

procedure TfrmFilterContract.btnOkClick(Sender: TObject);
begin
  inherited;
  if edtNumContract.Text<>'' then
    begin
      FilterString:=FilterString+' and contract.num_contract like '#39+edtNumContract.Text+#39;
    end;
end;

constructor TfrmFilterContract.Create(aOwner: TComponent; aNameFilter: string;
  aActionFilter: TActionSimpleFilter);
begin
  inherited Create(aOwner, aNameFilter, aActionFilter);
end;

//******************* ContractFilterCreator *************************
function ContractFilterCreator(AOwner : TComponent; aActionFilter : TActionSimpleFilter) : TfrmBaseSimpleFilter;
begin
  Result:=TfrmFilterContract.Create(aOwner, 'FilterContract', aActionFilter);
end;

initialization
  InitSimpleFilterBroker;
  BrokerSimpleFilter.Registration(cSimpleFilterContract, ContractFilterCreator);
end.
