unit edtSprSide;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseEditForm, DB, Placemnt, StdCtrls, Buttons, ExtCtrls, fg_Const,
  FIBDataSet, pFIBDataSet, Mask, DBCtrls, DBCtrlsEh, ToolEdit, RXDBCtrl;

type
  TfrmEdtSprSide = class(TfrmBaseEditForm)
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    btnChooseContract: TButton;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    Panel1: TPanel;
    Label1: TLabel;
    edtWidth: TDBEdit;
    Label2: TLabel;
    edtHeight: TDBEdit;
    Label3: TLabel;
    DBComboBoxEh1: TDBComboBoxEh;
    Label4: TLabel;
    DBComboBoxEh2: TDBComboBoxEh;
    procedure btnChooseContractClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; ActionForm : TActionEditForm; Query : TpFIBDataSet); reintroduce; override;
  end;

var
  frmEdtSprSide: TfrmEdtSprSide;

implementation

uses
  BaseList, BaseSimpleFilter, Fg_util, DataModule;

{$R *.dfm}

{ TfrmEdtSprSide }

procedure TfrmEdtSprSide.btnChooseContractClick(Sender: TObject);
  var
    id_contract : Longint;
    bForm : TfrmBaseList;
    ValueFields : array [1..5] of Variant;
    fForm : TfrmBaseSimpleFilter;
    FilterString : string;
begin
  inherited;
  bForm:=BrokerListForm.CreateList(Self, cContract, doViewCloseList);
  if bForm=nil then
    Exit;
  try
   FilterString:='';
   fForm:=BrokerSimpleFilter.CreateFilter(self, cSimpleFilterContract, doEditFilter);
   if fForm=nil then
     Exit;
   try
    if fForm.ShowModal<>mrOk then
      Exit;
    FilterString:=fForm.GetFilterFromReestr;
    bForm.Query.ParamByName('filter').AsString:=FilterString+' and c.type_contractor=2 ';
   finally
     FreeAndNil(fForm);
   end;

   bForm.FormAction:=doChooseList;
   bForm.DoCommitOnPost:=False;
   bForm.Query.Open;
   if bForm.ShowModal<>mrYes then
     Exit;
   id_contract:=bForm.GetID;
   if id_contract>0 then
     begin
       DataSource.DataSet.FieldByName('id_contract').AsInteger:=id_contract;
       GetBindMultField(dm.oDbAdv, 'select inn, kpp, name_contractor, num_contract, date_contract from contract c, contractor r where c.id_contract=:id_contract and c.id_contractor=r.id_contractor',
                        ['inn', 'kpp', 'name_contractor', 'num_contract', 'date_contract'],
                        ValueFields,
                        ['id_contract'],
                        [id_contract]);
       DataSource.DataSet.FieldByName('inn').AsVariant:=ValueFields[1];
       DataSource.DataSet.FieldByName('kpp').AsVariant:=ValueFields[2];
       DataSource.DataSet.FieldByName('name_contractor').AsVariant:=ValueFields[3];
       DataSource.DataSet.FieldByName('num_contract').AsVariant:=ValueFields[4];
       DataSource.DataSet.FieldByName('date_contract').AsVariant:=ValueFields[5];
     end;
  finally
   bForm.Free;
  end;
  btnOk.SetFocus;
end;

constructor TfrmEdtSprSide.Create(aOwner: TComponent;
  ActionForm: TActionEditForm; Query: TpFIBDataSet);
begin
  inherited Create(AOwner, ActionForm, Query);
  SetLength(FieldsRecord,5);
  FieldsRecord[0]:='width';
  FieldsRecord[1]:='height';
  FieldsRecord[2]:='width';
  FieldsRecord[3]:='type_side';
  FieldsRecord[4]:='location_side';

  case ActionForm of
    doView : begin
               Caption:='Просмотр информации о рекламной конструкции';
             end;
    doEdit : begin
               Caption:='Редактирование рекламной конструкции';
             end;
    doNew  : begin
               Caption:='Добавление рекламной конструкции';
             end;
  end;
end;

//******************* SideFormCreator *************************
function SideFormCreator(AOwner : TComponent; ActionForm : TActionEditForm; Query : TpFIBDataSet) : TfrmBaseEditForm;
begin
  Result:=TfrmEdtSprSide.Create(aOwner, ActionForm, Query);
end;

initialization
  InitEditFormBroker;
  BrokerEditForm.Registration(cSide,SideFormCreator);
end.
