unit edtAdv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseEditForm, DB, Placemnt, StdCtrls, Buttons, ExtCtrls, FIBDataSet, pFIBDataSet,
  fg_Const, Mask, DBCtrls, ToolEdit, RXDBCtrl;

type
  TfrmEdtAdv = class(TfrmBaseEditForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    btnChooseContract: TButton;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBDateEdit1: TDBDateEdit;
    procedure btnChooseContractClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; ActionForm : TActionEditForm; Query : TpFIBDataSet); reintroduce; override;
  end;

var
  frmEdtAdv: TfrmEdtAdv;

implementation

uses
  BaseList, DataModule, Fg_util, BaseSimpleFilter;

{$R *.dfm}

{ TfrmEdtAdv }

procedure TfrmEdtAdv.btnChooseContractClick(Sender: TObject);
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
    bForm.Query.ParamByName('filter').AsString:=FilterString+' and c.type_contractor=1 ';
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

constructor TfrmEdtAdv.Create(aOwner: TComponent; ActionForm: TActionEditForm;
  Query: TpFIBDataSet);
begin
  inherited Create(AOwner, ActionForm, Query);
  SetLength(FieldsRecord,1);
  FieldsRecord[0]:='address_name';

  case ActionForm of
    doView : begin
               Caption:='Просмотр информации о рекламной конструкции';
               btnChooseContract.Enabled:=False;
             end;
    doEdit : begin
               Caption:='Редактирование рекламной конструкции';
             end;
    doNew  : begin
               Caption:='Добавление рекламной конструкции';
             end;
  end;
end;

//******************* AdvFormCreator *************************
function AdvFormCreator(AOwner : TComponent; ActionForm : TActionEditForm; Query : TpFIBDataSet) : TfrmBaseEditForm;
begin
  Result:=TfrmEdtAdv.Create(aOwner, ActionForm, Query);
end;

initialization
  InitEditFormBroker;
  BrokerEditForm.Registration(cAdv,AdvFormCreator);
end.
