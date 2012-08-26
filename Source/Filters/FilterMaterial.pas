{*****************************************************************************
 *
 * Project  : Mat_Dept
 * Unit Name: FilterMaterial
 * Purpose  : Фильтр материалов
 * Create   : 16.06.06
 * History  :
 *
 *****************************************************************************}

unit FilterMaterial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseSimpleFilter, Placemnt, StdCtrls, ExtCtrls, Buttons, fg_Const;

type
  TfrmFilterMaterial = class(TfrmBaseSimpleFilter)
    Label1: TLabel;
    edtCodeMaterial: TEdit;
    Label3: TLabel;
    edtNameMaterial: TEdit;
    Label4: TLabel;
    edtTx_M: TEdit;
    Label5: TLabel;
    edtNumStore: TEdit;
    procedure btnOkClick(Sender: TObject); override;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; aNameFilter : string;
                       aActionFilter : TActionSimpleFilter); reintroduce;
  end;

var
  frmFilterMaterial: TfrmFilterMaterial;

implementation

{$R *.dfm}

{ TfrmFilterMaterial }

constructor TfrmFilterMaterial.Create(aOwner: TComponent;
  aNameFilter: string; aActionFilter: TActionSimpleFilter);
begin
  inherited Create(aOwner, aNameFilter, aActionFilter);
end;

procedure TfrmFilterMaterial.btnOkClick(Sender: TObject);
begin
  inherited;
  if edtCodeMaterial.Text<>'' then
    begin
      if (Pos('%',edtCodeMaterial.Text)=0) and (Pos('_',edtCodeMaterial.Text)=0) then
        begin
          if not TryStrToInt64(edtCodeMaterial.Text, x) then
            begin
              MessageDlg('Вы неверно ввели Код материала!', mterror, [mbok],0);
              edtCodeMaterial.Text:='';
            end
          else
            FilterString:=FilterString+' and material.mat = '#39+edtCodeMaterial.Text+#39;
        end
      else
        FilterString:=FilterString+' and material.mat like '#39+edtCodeMaterial.Text+#39;
    end;
  if edtNameMaterial.Text<>'' then
    begin
      FilterString:=FilterString+' and material.nai_m like '#39+AnsiUpperCase(edtNameMaterial.Text)+#39;
    end;
  if edtTx_M.Text<>'' then
    begin
      FilterString:=FilterString+' and material.tx_m like '#39+AnsiUpperCase(edtTx_M.Text)+#39;
    end;
  if edtNumStore.Text<>'' then
    begin
      if (Pos('%',edtNumStore.Text)=0) and (Pos('_',edtNumStore.Text)=0) then
        begin
          if not TryStrToInt64(edtNumStore.Text, x) then
            begin
              MessageDlg('Вы неверно ввели Номер Склада!', mterror, [mbok],0);
              edtNumStore.Text:='';
            end
          else
            FilterString:=FilterString+' and material.skl = '+edtNumStore.Text;
        end
      else
        FilterString:=FilterString+' and material.skl like '#39+edtNumStore.Text+#39;
    end;
end;

//******************* MaterialFilterCreator *************************
function MaterialFilterCreator(AOwner : TComponent; aActionFilter : TActionSimpleFilter) : TfrmBaseSimpleFilter;
begin
  Result:=TfrmFilterMaterial.Create(aOwner, 'FilterMaterial', aActionFilter);
end;

initialization
  InitSimpleFilterBroker;
  BrokerSimpleFilter.Registration(cSimpleFilterMaterial, MaterialFilterCreator);
end.
