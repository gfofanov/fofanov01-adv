unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ParentMat_Store, Placemnt, ActnList, ExtCtrls, SpeedBar, Menus,
  ComCtrls;

type
  TfrmMain = class(TfrmParentMat_Store)
    SpeedBar1: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    SpeedItem1: TSpeedItem;
    SpeedItem2: TSpeedItem;
    SpeedItem3: TSpeedItem;
    ActionList1: TActionList;
    MainMenu1: TMainMenu;
    actExit: TAction;
    N3: TMenuItem;
    StatusBar1: TStatusBar;
    N8: TMenuItem;
    actOptions: TAction;
    N10: TMenuItem;
    N17: TMenuItem;
    actSprContractor: TAction;
    N1: TMenuItem;
    actSprContract: TAction;
    N2: TMenuItem;
    actAdvSide: TAction;
    N4: TMenuItem;
    N5: TMenuItem;
    actContractPrice_Contract: TAction;
    N6: TMenuItem;
    procedure actExitExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actSprContractorExecute(Sender: TObject);
    procedure actSprContractExecute(Sender: TObject);
    procedure actAdvSideExecute(Sender: TObject);
  private
    { Private declarations }
    OldHint : TNotifyEvent;
    procedure DisplayHint(Sender : TObject); virtual; // отображение хинта в строке статуса
    procedure OpenListForm(Sender : TObject; aType : Word);
    procedure OpenDualListForm(Sender : TObject; aType : Word);
    //procedure OpenTripleListForm(Sender : TObject; aType : Word);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses DataModule, BaseList, BaseDualList, {BaseTripleList, }BaseSimpleFilter, fg_Const;

{$R *.dfm}

procedure TfrmMain.actAdvSideExecute(Sender: TObject);
begin
  inherited;
  OpenDualListForm(Sender, cAdvSide);
end;

procedure TfrmMain.actExitExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmMain.DisplayHint(Sender: TObject);
begin
  StatusBar1.SimpleText:=GetLongHint(Application.Hint);
end;

procedure TfrmMain.OpenListForm(Sender: TObject; aType: Word);
  var
    bForm : TfrmBaseList;
begin
  bForm:=BrokerListForm.CreateList(Self, aType, doFilterList);
  if bForm=nil then
    Exit;
  try
   bForm.ShowModal;
  finally
   FreeAndNil(bForm);
  end;
end;

procedure TfrmMain.OpenDualListForm(Sender: TObject; aType: Word);
  var
    bForm : TfrmBaseDualList;
begin
  bForm:=BrokerDualListForm.CreateList(Self, aType, doFilterList);
  if bForm=nil then
    Exit;
  try
   bForm.ShowModal;
  finally
   FreeAndNil(bForm);
  end;
end;

{procedure TfrmMain.OpenTripleListForm(Sender: TObject; aType: Word);
  var
    bForm : TfrmBaseTripleList;
begin
  bForm:=BrokerTripleListForm.CreateList(Self, aType, doFilterList);
  if bForm=nil then
    Exit;
  try
   bForm.ShowModal;
  finally
   FreeAndNil(bForm);
  end;
end;}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  inherited;
  OldHint:=Application.OnHint;
  Application.OnHint:=DisplayHint;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  inherited;
  Application.OnHint:=OldHint;
end;

procedure TfrmMain.actSprContractExecute(Sender: TObject);
begin
  inherited;
  OpenListForm(Sender, cContract);
end;

procedure TfrmMain.actSprContractorExecute(Sender: TObject);
begin
  inherited;
  OpenListForm(Sender, cContractor);
end;

end.
