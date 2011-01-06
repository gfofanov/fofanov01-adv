unit FilterSide;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseSimpleFilter, Placemnt, StdCtrls, ExtCtrls, Buttons, fg_Const;

type
  TfrmFilterSide = class(TfrmBaseSimpleFilter)
    Label1: TLabel;
    edtWidth: TEdit;
    procedure btnOkClick(Sender: TObject); override;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; aNameFilter : string;
                       aActionFilter : TActionSimpleFilter); reintroduce;
  end;

var
  frmFilterSide: TfrmFilterSide;

implementation

{$R *.dfm}

{ TfrmFilterSide }

procedure TfrmFilterSide.btnOkClick(Sender: TObject);
begin
  inherited;
  if edtWidth.Text<>'' then
    begin
      FilterString:=FilterString+' and side.width='+edtWidth.Text;
    end;
end;

constructor TfrmFilterSide.Create(aOwner: TComponent; aNameFilter: string;
  aActionFilter: TActionSimpleFilter);
begin
  inherited Create(aOwner, aNameFilter, aActionFilter);
end;

//******************* SideFilterCreator *************************
function SideFilterCreator(AOwner : TComponent; aActionFilter : TActionSimpleFilter) : TfrmBaseSimpleFilter;
begin
  Result:=TfrmFilterSide.Create(aOwner, 'FilterSide', aActionFilter);
end;

initialization
  InitSimpleFilterBroker;
  BrokerSimpleFilter.Registration(cSimpleFilterSide, SideFilterCreator);
end.
