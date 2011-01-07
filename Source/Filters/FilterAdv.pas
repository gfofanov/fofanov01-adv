unit FilterAdv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseSimpleFilter, Placemnt, StdCtrls, ExtCtrls, Buttons, fg_Const;

type
  TfrmFilterAdv = class(TfrmBaseSimpleFilter)
    Label1: TLabel;
    edtAddress: TEdit;
    rgrAdv: TRadioGroup;
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
  case rgrAdv.ItemIndex of
    1 : FilterString:=FilterString+' and adv.id_adv in (select id_adv from'+' ( select id_adv, count(*) c_all, sum(case when date_fact is not null then 1 else 0 end) c_full, sum(case when date_fact is null then 1 else 0 end) c_empty from side group by id_adv) where c_all<>c_full and c_all<>c_empty)';
    2 : FilterString:=FilterString+' and adv.id_adv in (select id_adv from ( select id_adv, count(*) c_all, sum(case when date_fact is not null then 1 else 0 end) c_full, sum(case when date_fact is null then 1 else 0 end) c_empty from side group by id_adv) where c_all=c_full)';
    3 : FilterString:=FilterString+' and adv.id_adv in (select id_adv from ( select id_adv, count(*) c_all, sum(case when date_fact is not null then 1 else 0 end) c_full, sum(case when date_fact is null then 1 else 0 end) c_empty from side group by id_adv) where c_all=c_empty)';
    4 : FilterString:=FilterString+' and not exists (select 1 from side s where s.id_adv=adv.id_adv)';
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
