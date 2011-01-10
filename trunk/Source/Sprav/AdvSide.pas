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
    actLoadPhotoAdv: TAction;
    N17: TMenuItem;
    actLoadPhotoSide: TAction;
    N25: TMenuItem;
    actShowPhotoAdv: TAction;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    actShowPhotoSide: TAction;
    N33: TMenuItem;
    N34: TMenuItem;
    actRepFreeAdv: TAction;
    N35: TMenuItem;
    N36: TMenuItem;
    actDelPhotoAdv: TAction;
    N37: TMenuItem;
    N38: TMenuItem;
    actDelPhotoSide: TAction;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    actRepAdvwoSide: TAction;
    N42: TMenuItem;
    procedure actDateFactSetExecute(Sender: TObject);
    procedure actDateFactUnsetExecute(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction; var Handled: Boolean);
    procedure actLoadPhotoAdvExecute(Sender: TObject);
    procedure actLoadPhotoSideExecute(Sender: TObject);
    procedure actShowPhotoAdvExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actShowPhotoSideExecute(Sender: TObject);
    procedure actRepFreeAdvExecute(Sender: TObject);
    procedure actDelPhotoAdvExecute(Sender: TObject);
    procedure actDelPhotoSideExecute(Sender: TObject);
    procedure actRepAdvwoSideExecute(Sender: TObject);
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
  EnterDate, Users, ShellAPI, DataModule, Reports;

{$R *.dfm}

{ TfrmAdvSide }

procedure TfrmAdvSide.actDateFactSetExecute(Sender: TObject);
  var
    dat : TDateTime;
begin
  inherited;
  dat:= sysdate;
  if not GetEnterDate(dat,'Введите дату установки') then
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
  if (MessageDlg('Очистить дату установки?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
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

procedure TfrmAdvSide.actDelPhotoAdvExecute(Sender: TObject);
begin
  inherited;
  QueryLeft.Edit;
  QueryLeft.FieldByName('photo').Clear;
  QueryLeft.Post;
  ShowMessage('Фото удалено');
end;

procedure TfrmAdvSide.actDelPhotoSideExecute(Sender: TObject);
begin
  inherited;
  QueryRight.Edit;
  QueryRight.FieldByName('photo').Clear;
  QueryRight.Post;
  ShowMessage('Фото удалено');
end;

procedure TfrmAdvSide.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
begin
  inherited;
  actDateFactSet.Enabled:=not QueryRight.IsEmpty and QueryRight.FieldByName('date_fact').IsNull;
  actDateFactSet.Visible:=actDateFactSet.Enabled;
  actDateFactUnSet.Enabled:=not QueryRight.IsEmpty and not QueryRight.FieldByName('date_fact').IsNull;
  actDateFactUnSet.Visible:=actDateFactUnSet.Enabled;
  actLoadPhotoAdv.Enabled:=not QueryLeft.IsEmpty;
  actLoadPhotoSide.Enabled:=not QueryRight.IsEmpty;
  actShowPhotoAdv.Enabled:=not QueryLeft.IsEmpty and not QueryLeft.FieldByName('photo').IsNull;
  actShowPhotoSide.Enabled:=not QueryRight.IsEmpty and not QueryRight.FieldByName('photo').IsNull;
  actDelPhotoAdv.Enabled:=not QueryLeft.IsEmpty and not QueryLeft.FieldByName('photo').IsNull;
  actDelPhotoSide.Enabled:=not QueryRight.IsEmpty and not QueryRight.FieldByName('photo').IsNull;
end;

procedure TfrmAdvSide.actLoadPhotoAdvExecute(Sender: TObject);
  var
    OpenDialog : TOpenDialog;
begin
  inherited;
  OpenDialog:=TOpenDialog.Create(Self);
  try
   OpenDialog.Title:='Выберите фото';
   OpenDialog.Filter:='Фото (jpg, jpeg)|*.jpg; *.jpeg';
   if OpenDialog.Execute then
     begin
       QueryLeft.Edit;
       TBlobField(QueryLeft.FieldByName('photo')).LoadFromFile(OpenDialog.FileName);
       QueryLeft.Post;
       ShowMessage('Фото загружено из файла'#10+OpenDialog.FileName);
     end;
  finally
   FreeAndNil(OpenDialog);
  end;
end;

procedure TfrmAdvSide.actLoadPhotoSideExecute(Sender: TObject);
  var
    OpenDialog : TOpenDialog;
begin
  inherited;
  OpenDialog:=TOpenDialog.Create(Self);
  try
   OpenDialog.Title:='Выберите фото';
   OpenDialog.Filter:='Фото (jpg, jpeg)|*.jpg; *.jpeg';
   if OpenDialog.Execute then
     begin
       QueryRight.Edit;
       TBlobField(QueryRight.FieldByName('photo')).LoadFromFile(OpenDialog.FileName);
       QueryRight.Post;
       ShowMessage('Фото загружено из файла'#10+OpenDialog.FileName);
     end;
  finally
   FreeAndNil(OpenDialog);
  end;
end;

procedure TfrmAdvSide.actRepAdvwoSideExecute(Sender: TObject);
begin
  inherited;
  dmReport.dsReport.DataSet:=dmReport.qrAdvwoSide;
  if dmReport.qrAdvwoSide.Active then
    dmReport.qrAdvwoSide.Close;
  dmReport.qrAdvwoSide.Open;
  dmReport.frxReport1.LoadFromFile(DirReports+'AdvwoSide.fr3');
  dmReport.frxReport1.ShowReport;
  dmReport.qrAdvwoSide.Close;
end;

procedure TfrmAdvSide.actRepFreeAdvExecute(Sender: TObject);
begin
  inherited;
  dmReport.dsReport.DataSet:=dmReport.qrFreeAdv;
  if dmReport.qrFreeAdv.Active then
    dmReport.qrFreeAdv.Close;
  dmReport.qrFreeAdv.Open;
  dmReport.frxReport1.LoadFromFile(DirReports+'FreeAdv.fr3');
  dmReport.frxReport1.ShowReport;
  dmReport.qrFreeAdv.Close;
end;

procedure TfrmAdvSide.actShowPhotoAdvExecute(Sender: TObject);
var
  FHinst: Hinst;
begin
  inherited;
  TBlobField(QueryLeft.FieldByName('photo')).SaveToFile(lTempDir+'adv-temp01.jpg');
  FHInst:=ShellExecute(Handle, 'open', 'adv-temp01.jpg', nil, PChar(lTempDir), SW_MAXIMIZE);
  if FHInst <= 32 then
    raise Exception.Create(SysErrorMessage(FHinst));
end;

procedure TfrmAdvSide.actShowPhotoSideExecute(Sender: TObject);
var
  FHinst: Hinst;
begin
  inherited;
  TBlobField(QueryRight.FieldByName('photo')).SaveToFile(lTempDir+'adv-temp01.jpg');
  FHInst:=ShellExecute(Handle, 'open', 'adv-temp01.jpg', nil, PChar(lTempDir), SW_MAXIMIZE);
  if FHInst <= 32 then
    raise Exception.Create(SysErrorMessage(FHinst));
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

procedure TfrmAdvSide.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DeleteFile(lTempDir+'adv-temp01.jpg');
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
