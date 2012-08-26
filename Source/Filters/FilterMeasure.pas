{*****************************************************************************
 *
 * Project  : Mat_Store
 * Unit Name: FilterMeasure
 * Purpose  : Фильтр единиц измерения
 * Create   : 16.02.04
 * History  :
 *
 *****************************************************************************}

unit FilterMeasure;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseSimpleFilter, Placemnt, StdCtrls, ExtCtrls, Buttons, fg_Const;

type
  TfrmFilterMeasure = class(TfrmBaseSimpleFilter)
    Label1: TLabel;
    edtCodeMeasure: TEdit;
    Label3: TLabel;
    edtNamePrice: TEdit;
    procedure btnOkClick(Sender: TObject); override;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; aNameFilter : string;
                       aActionFilter : TActionSimpleFilter); reintroduce;
  end;

var
  frmFilterMeasure: TfrmFilterMeasure;

implementation

{$R *.dfm}

{ TfrmFilterMeasure }

constructor TfrmFilterMeasure.Create(aOwner: TComponent;
  aNameFilter: string; aActionFilter: TActionSimpleFilter);
begin
  inherited Create(aOwner, aNameFilter, aActionFilter);
end;

procedure TfrmFilterMeasure.btnOkClick(Sender: TObject);
begin
  inherited;
  if edtCodeMeasure.Text<>'' then
    begin
      if (Pos('%',edtCodeMeasure.Text)=0) and (Pos('_',edtCodeMeasure.Text)=0) then
        begin
          if not TryStrToInt64(edtCodeMeasure.Text, x) then
            begin
              MessageDlg('Вы неверно ввели Код единицы измерения!', mterror, [mbok],0);
              edtCodeMeasure.Text:='';
            end
          else
            FilterString:=FilterString+' and measure.kod = '+edtCodeMeasure.Text;
        end
      else
        FilterString:=FilterString+' and measure.kod like '#39+edtCodeMeasure.Text+#39;
    end;
  if edtNamePrice.Text<>'' then
    begin
      FilterString:=FilterString+' and measure.name_price like '#39+edtNamePrice.Text+#39;
    end;
end;

//******************* MeasureFilterCreator *************************
function MeasureFilterCreator(AOwner : TComponent; aActionFilter : TActionSimpleFilter) : TfrmBaseSimpleFilter;
begin
  Result:=TfrmFilterMeasure.Create(aOwner, 'FilterMeasure', aActionFilter);
end;

initialization
  InitSimpleFilterBroker;
  BrokerSimpleFilter.Registration(cSimpleFilterMeasure, MeasureFilterCreator);
end.
