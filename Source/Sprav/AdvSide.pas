unit AdvSide;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDualList, DBGridEhGrouping, DB, FIBDataSet, pFIBDataSet,
  Menus, ActnList, Placemnt, RXSplit, GridsEh, DBGridEh, ExtCtrls,
  ComCtrls, ToolWin, fg_Const;

type
  TfrmAdvSide = class(TfrmBaseDualList)
    N19: TMenuItem;
    actDateFactSet: TAction;
    N20: TMenuItem;
    actDateFactUnset: TAction;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    procedure actDateFactSetExecute(Sender: TObject);
    procedure actDateFactUnsetExecute(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; aActionList : TActionListForm); reintroduce;
  end;

var
  frmAdvSide: TfrmAdvSide;

implementation

uses
  EnterDate, Users;

{$R *.dfm}

{ TfrmAdvSide }

procedure TfrmAdvSide.actDateFactSetExecute(Sender: TObject);
  var
    dat : TDateTime;
begin
  inherited;
  dat:= sysdate;
  if not GetEnterDate(dat,'¬ведите дату установки') then
    Exit;
  QueryRight.Edit;
  QueryRight.FieldByName('date_fact').AsDateTime:=dat;
  try
   QueryRight.Post;
  except
   QueryRight.Cancel;
   raise;
  end;
  QueryRight.RefreshClientFields;
end;

procedure TfrmAdvSide.actDateFactUnsetExecute(Sender: TObject);
begin
  inherited;
  if (MessageDlg('ќчистить дату установки?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    Exit;
  QueryRight.Edit;
  QueryRight.FieldByName('date_fact').AsVariant:=null;
  try
   QueryRight.Post;
  except
   QueryRight.Cancel;
   raise;
  end;
  QueryRight.RefreshClientFields;
end;

procedure TfrmAdvSide.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
begin
  inherited;
  actDateFactSet.Enabled:=not QueryRight.IsEmpty and QueryRight.FieldByName('date_fact').IsNull;
  actDateFactSet.Visible:=actDateFactSet.Enabled;
  actDateFactUnSet.Enabled:=not QueryRight.IsEmpty and not QueryRight.FieldByName('date_fact').IsNull;
  actDateFactUnSet.Visible:=actDateFactUnSet.Enabled;
end;

constructor TfrmAdvSide.Create(aOwner: TComponent;
  aActionList: TActionListForm);
begin
  inherited Create(AOwner, aActionList,
                   'adv', 'id_adv',
                   'side', 'id_side',
                   cAdv, cSide,
                   cSimpleFilterAdv, cSimpleFilterSide);
end;

//******************* AdvSide *************************
function AdvSideDualListCreator(AOwner : TComponent; aActionList : TActionListForm) : TfrmBaseDualList;
begin
  Result:=TfrmAdvSide.Create(aOwner, aActionList);
end;

initialization
  InitDualListBroker;
  BrokerDualListForm.Registration(cAdvSide, AdvSideDualListCreator);
end.
