{*****************************************************************************
 *
 * Project  : Mat_Store
 * Unit Name: edtSprDept
 * Purpose  : Редактирование подразделений
 * Create   : 23.03.04
 * History  :
 *
 *****************************************************************************}

unit edtSprDept;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseEditForm, StdCtrls, DB, Placemnt, Buttons, ExtCtrls, Mask,
  DBCtrls, fg_Const, RxDBComb, FIBDataSet, pFIBDataSet;

type
  TfrmEdtSprDept = class(TfrmBaseEditForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    RxDBComboBox1: TRxDBComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; ActionForm : TActionEditForm; Query : TpFIBDataSet); reintroduce; override;
  end;

var
  frmEdtSprDept: TfrmEdtSprDept;

implementation

{$R *.dfm}

{ TfrmEdtSprDept }

constructor TfrmEdtSprDept.Create(aOwner: TComponent;
  ActionForm: TActionEditForm; Query: TpFIBDataSet);
begin
  inherited Create(AOwner, ActionForm, Query);
  SetLength(FieldsRecord,1);
  FieldsRecord[0]:='num_dept';

  case ActionForm of
    doView : begin
               Caption:='Просмотр информации о подразделении';
             end;
    doEdit : begin
               Caption:='Редактирование подразделения';
             end;
    doNew  : begin
               Caption:='Добавление подразделения';
             end;
  end;
end;

//******************* DeptFormCreator *************************
function DeptFormCreator(AOwner : TComponent; ActionForm : TActionEditForm; Query : TpFIBDataSet) : TfrmBaseEditForm;
begin
  Result:=TfrmEdtSprDept.Create(aOwner, ActionForm, Query);
end;

initialization
  InitEditFormBroker;
  BrokerEditForm.Registration(cDept,DeptFormCreator);
end.
