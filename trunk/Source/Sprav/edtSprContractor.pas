unit edtSprContractor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseEditForm, DB, Placemnt, StdCtrls, Buttons, ExtCtrls, fg_Const,
  FIBDataSet, pFIBDataSet, Mask, DBCtrls, DBCtrlsEh;

type
  TfrmEdtSprContractor = class(TfrmBaseEditForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBComboBoxEh1: TDBComboBoxEh;
    lblPhone: TLabel;
    dbedtPhone: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; ActionForm : TActionEditForm; Query : TpFIBDataSet); reintroduce; override;
  end;

var
  frmEdtSprContractor: TfrmEdtSprContractor;

implementation

{$R *.dfm}

{ TfrmEdtSprContractor }

constructor TfrmEdtSprContractor.Create(aOwner: TComponent;
  ActionForm: TActionEditForm; Query: TpFIBDataSet);
begin
  inherited Create(AOwner, ActionForm, Query);
  SetLength(FieldsRecord,4);
  FieldsRecord[0]:='inn';
  FieldsRecord[1]:='kpp';
  FieldsRecord[2]:='name_contractor';
  FieldsRecord[3]:='type_contractor';

  case ActionForm of
    doView : begin
               Caption:='Просмотр информации о контрагенте';
             end;
    doEdit : begin
               Caption:='Редактирование контрагента';
             end;
    doNew  : begin
               Caption:='Добавление контрагента';
             end;
  end;
end;

//******************* ContractorFormCreator *************************
function ContractorFormCreator(AOwner : TComponent; ActionForm : TActionEditForm; Query : TpFIBDataSet) : TfrmBaseEditForm;
begin
  Result:=TfrmEdtSprContractor.Create(aOwner, ActionForm, Query);
end;

initialization
  InitEditFormBroker;
  BrokerEditForm.Registration(cContractor,ContractorFormCreator);
end.
