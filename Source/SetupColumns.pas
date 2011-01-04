{*****************************************************************************
 *
 * Project  : Mat_Dept
 * Unit Name: SetupColumns
 * Purpose  : Выбор колонок грида, которые будет видеть пользователь
 * Create   : 14.06.06
 * History  :
 *
 *****************************************************************************}

unit SetupColumns;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXSplit, ExtCtrls, StdCtrls, Buttons, ActnList;

type
  TfrmSetupColumns = class(TForm)
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    RxSplitter1: TRxSplitter;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ActionList1: TActionList;
    actToLeft: TAction;
    actToRight: TAction;
    procedure actToLeftExecute(Sender: TObject);
    procedure actToRightExecute(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction;
      var Handled: Boolean);
    procedure ListBox2DblClick(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetupColumns: TfrmSetupColumns;

implementation

uses DataModule;

{$R *.dfm}

procedure TfrmSetupColumns.actToLeftExecute(Sender: TObject);
  var
    old_index : Integer;
begin
  if ListBox2.ItemIndex<0 then
    Exit;
  old_index:=ListBox2.ItemIndex;
  ListBox1.AddItem(ListBox2.Items[ListBox2.ItemIndex], ListBox2.Items.Objects[ListBox2.ItemIndex]);
  ListBox2.DeleteSelected;
  if ListBox2.Items.Count=0 then
    Exit;
  if old_index=ListBox2.Items.Count then
    Dec(old_index);
  ListBox2.ItemIndex:=old_index;
end;

procedure TfrmSetupColumns.actToRightExecute(Sender: TObject);
  var
    old_index : Integer;
begin
  if ListBox1.ItemIndex<0 then
    Exit;
  old_index:=ListBox1.ItemIndex;
  ListBox2.AddItem(ListBox1.Items[ListBox1.ItemIndex], ListBox1.Items.Objects[ListBox1.ItemIndex]);
  ListBox1.DeleteSelected;
  if ListBox1.Items.Count=0 then
    Exit;
  if old_index=ListBox1.Items.Count then
    Dec(old_index);
  ListBox1.ItemIndex:=old_index;
end;

procedure TfrmSetupColumns.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
begin
  actToLeft.Enabled:= (ListBox2.Items.Count>0) and (ListBox2.ItemIndex>=0);
  actToRight.Enabled:= (ListBox1.Items.Count>0) and (ListBox1.ItemIndex>=0);
end;

procedure TfrmSetupColumns.ListBox2DblClick(Sender: TObject);
begin
  actToLeftExecute(Sender);
end;

procedure TfrmSetupColumns.ListBox1DblClick(Sender: TObject);
begin
  actToRightExecute(Sender);
end;

end.
