unit FilterAdv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseSimpleFilter, Placemnt, StdCtrls, ExtCtrls, Buttons, fg_Const;

type
  TfrmFilterAdv = class(TfrmBaseSimpleFilter)
    Label1: TLabel;
    edtAddress: TEdit;
    procedure btnOkClick(Sender: TObject); override;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; aNameFilter : string;
                       aActionFilter : TActionSimpleFilter); reintroduce;
  end;

var
  frmFilterAdv: TfrmFilterAdv;

implementation

{$R *.dfm}

{ TfrmFilterAdv }

procedure TfrmFilterAdv.btnOkClick(Sender: TObject);
begin
  inherited;
  if edtAddress.Text<>'' then
    begin
      FilterString:=FilterString+' and adv.address_name like '#39+edtAddress.Text+#39;
    end;
end;

constructor TfrmFilterAdv.Create(aOwner: TComponent; aNameFilter: string;
  aActionFilter: TActionSimpleFilter);
begin
  inherited Create(aOwner, aNameFilter, aActionFilter);
end;

//******************* AdvFilterCreator *************************
function AdvFilterCreator(AOwner : TComponent; aActionFilter : TActionSimpleFilter) : TfrmBaseSimpleFilter;
begin
  Result:=TfrmFilterAdv.Create(aOwner, 'FilterAdv', aActionFilter);
end;

initialization
  InitSimpleFilterBroker;
  BrokerSimpleFilter.Registration(cSimpleFilterAdv, AdvFilterCreator);
end.
