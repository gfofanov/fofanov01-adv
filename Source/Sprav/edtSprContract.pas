unit edtSprContract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseEditForm, DB, Placemnt, StdCtrls, Buttons, ExtCtrls, fg_Const,
  FIBDataSet, pFIBDataSet, ToolEdit, RXDBCtrl, Mask, DBCtrls;

type
  TfrmEdtSprContract = class(TfrmBaseEditForm)
    Label5: TLabel;
    Label6: TLabel;
    dbeNum_Contract: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    btnChooseContractor: TButton;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label7: TLabel;
    DBDateEdit2: TDBDateEdit;
    Label8: TLabel;
    DBDateEdit3: TDBDateEdit;
    procedure btnChooseContractorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; ActionForm : TActionEditForm; Query : TpFIBDataSet); reintroduce; override;
  end;

var
  frmEdtSprContract: TfrmEdtSprContract;

implementation

uses
  BaseList, BaseSimpleFilter, DataModule, Fg_util;

{$R *.dfm}

{ TfrmEdtSprContract }

procedure TfrmEdtSprContract.btnChooseContractorClick(Sender: TObject);
  var
    id_contractor : Longint;
    bForm : TfrmBaseList;
    ValueFields : array [1..3] of Variant;
begin
  inherited;
  bForm:=BrokerListForm.CreateList(Self, cContractor, doViewCloseList);
  if bForm=nil then
    Exit;
  try
   // Вызвать фильтр. Он откроет датасет
   bForm.actFilterExecute(Self);

   bForm.FormAction:=doChooseList;
   bForm.DoCommitOnPost:=False;
   if bForm.ShowModal<>mrYes then
     Exit;
   id_contractor:=bForm.GetID;
   if id_contractor>0 then
     begin
       DataSource.DataSet.FieldByName('id_contractor').AsInteger:=id_contractor;
       GetBindMultField(dm.oDbAdv, 'select inn, kpp, name_contractor from contractor r where r.id_contractor=:id_contractor',
                        ['inn', 'kpp', 'name_contractor'],
                        ValueFields,
                        ['id_contractor'],
                        [id_contractor]);
       DataSource.DataSet.FieldByName('inn').AsVariant:=ValueFields[1];
       DataSource.DataSet.FieldByName('kpp').AsVariant:=ValueFields[2];
       DataSource.DataSet.FieldByName('name_contractor').AsVariant:=ValueFields[3];
     end;
  finally
   bForm.Free;
  end;
  dbeNum_Contract.SetFocus;
end;

constructor TfrmEdtSprContract.Create(aOwner: TComponent;
  ActionForm: TActionEditForm; Query: TpFIBDataSet);
begin
  inherited Create(AOwner, ActionForm, Query);
  SetLength(FieldsRecord,8);
  FieldsRecord[0]:='inn';
  FieldsRecord[1]:='kpp';
  FieldsRecord[2]:='name_contractor';
  FieldsRecord[3]:='num_contract';
  FieldsRecord[4]:='num_add_contract';
  FieldsRecord[5]:='date_contract';
  FieldsRecord[6]:='date_beg';
  FieldsRecord[7]:='date_end';

  case ActionForm of
    doView : begin
               Caption:='Просмотр информации о договоре';
             end;
    doEdit : begin
               Caption:='Редактирование договора';
             end;
    doNew  : begin
               Caption:='Добавление договора';
             end;
  end;
end;

//******************* ContractFormCreator *************************
function ContractFormCreator(AOwner : TComponent; ActionForm : TActionEditForm; Query : TpFIBDataSet) : TfrmBaseEditForm;
begin
  Result:=TfrmEdtSprContract.Create(aOwner, ActionForm, Query);
end;

initialization
  InitEditFormBroker;
  BrokerEditForm.Registration(cContract,ContractFormCreator);
end.
