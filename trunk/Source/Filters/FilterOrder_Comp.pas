unit FilterOrder_Comp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseSimpleFilter, Placemnt, StdCtrls, ExtCtrls, Buttons, fg_Const;

type
  TfrmFilterOrder_Comp = class(TfrmBaseSimpleFilter)
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; aNameFilter : string;
                       aActionFilter : TActionSimpleFilter); reintroduce;
  end;

var
  frmFilterOrder_Comp: TfrmFilterOrder_Comp;

implementation

{$R *.dfm}

{ TfrmFilterOrder_Comp }

constructor TfrmFilterOrder_Comp.Create(aOwner: TComponent; aNameFilter: string;
  aActionFilter: TActionSimpleFilter);
begin
  inherited Create(aOwner, aNameFilter, aActionFilter);
end;

//******************* Order_CompFilterCreator *************************
function Order_CompFilterCreator(AOwner : TComponent; aActionFilter : TActionSimpleFilter) : TfrmBaseSimpleFilter;
begin
  Result:=TfrmFilterOrder_Comp.Create(aOwner, 'FilterOrder_Comp', aActionFilter);
end;

initialization
  InitSimpleFilterBroker;
  BrokerSimpleFilter.Registration(cSimpleFilterOrder_Comp, Order_CompFilterCreator);
end.
