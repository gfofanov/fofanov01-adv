unit edtSprMeasure;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseEditForm, DB, Placemnt, StdCtrls, Buttons, ExtCtrls, fg_Const,
  FIBDataSet, pFIBDataSet, Mask, DBCtrls;

type
  TfrmEdtSprMeasure = class(TfrmBaseEditForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; ActionForm : TActionEditForm; Query : TpFIBDataSet); reintroduce; override;
  end;

var
  frmEdtSprMeasure: TfrmEdtSprMeasure;

implementation

{$R *.dfm}

{ TfrmEdtSprMeasure }

constructor TfrmEdtSprMeasure.Create(aOwner: TComponent;
  ActionForm: TActionEditForm; Query: TpFIBDataSet);
begin
  inherited Create(AOwner, ActionForm, Query);
  SetLength(FieldsRecord,5);
  FieldsRecord[0]:='name_measure';
  FieldsRecord[1]:='name_measure_short';
  FieldsRecord[2]:='name_measure_price';
  FieldsRecord[3]:='name_measure_price_short';
  FieldsRecord[4]:='koef_price';

  case ActionForm of
    doView : begin
               Caption:='Просмотр информации об единице измерения';
             end;
    doEdit : begin
               Caption:='Редактирование единицы измерения';
             end;
    doNew  : begin
               Caption:='Добавление единицы измерения';
             end;
  end;
end;

//******************* MeasureFormCreator *************************
function MeasureFormCreator(AOwner : TComponent; ActionForm : TActionEditForm; Query : TpFIBDataSet) : TfrmBaseEditForm;
begin
  Result:=TfrmEdtSprMeasure.Create(aOwner, ActionForm, Query);
end;

initialization
  InitEditFormBroker;
  BrokerEditForm.Registration(cMeasure,MeasureFormCreator);
end.
