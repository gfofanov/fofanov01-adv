unit FilterOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseSimpleFilter, Placemnt, StdCtrls, ExtCtrls, Buttons, fg_Const;

type
  TfrmFilterOrder = class(TfrmBaseSimpleFilter)
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
