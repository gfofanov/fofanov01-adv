{*****************************************************************************
 *
 * Project  : Mat_Dept
 * Unit Name: BaseDualList
 * Purpose  : Родительская форма для двойных редактируемых списковых форм
 * Create   : 16.06.06
 * History  :
 *
 *****************************************************************************}

unit BaseDualList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ParentMat_Store, RXSplit, Grids, DBGridEh, ExtCtrls, ComCtrls, DB,
  ToolWin, Menus, ActnList, Placemnt, fg_Const, BaseEditForm,
  StdCtrls, Buttons, GridsEh, DBGridEhGrouping, FIBDataSet, pFIBDataSet;

type

  procAfterCreate = procedure(aForm : TfrmBaseEditForm; aFromForm : TObject); // После создания формы редактирования
  procAfterPost = procedure(aFromForm : TObject); // После записи
  procBeforeDelete = procedure(aFromForm : TObject); // Перед удалением записи
  procAfterDelete = procedure(aFromForm : TObject); // После удаления записи

  TfrmBaseDualList = class(TfrmParentMat_Store)
    ActionList1: TActionList;
    actNew: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actView: TAction;
    actExit: TAction;
    actChoose: TAction;
    actLeftFilter: TAction;
    actRefresh: TAction;
    actSetupColumns: TAction;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N7: TMenuItem;
    PopupMenuLeft: TPopupMenu;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton9: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton13: TToolButton;
    ToolButton12: TToolButton;
    ToolButton7: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton8: TToolButton;
    DataSourceRight: TDataSource;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    RxSplitter1: TRxSplitter;
    Panel2: TPanel;
    DBGridEh2: TDBGridEh;
    Panel3: TPanel;
    Panel4: TPanel;
    DataSourceLeft: TDataSource;
    PopupMenuRight: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    N18: TMenuItem;
    QueryLeft: TpFIBDataSet;
    QueryRight: TpFIBDataSet;
    actGetCount: TAction;
    mnuGetCount: TMenuItem;
    actCopyBuffer: TAction;
    mnuCopyBuffer: TMenuItem;
    pmnuGetCountLeft: TMenuItem;
    pmnuCopyBufferLeft: TMenuItem;
    pmnuGetCountRight: TMenuItem;
    pmnuCopyBufferRight: TMenuItem;
    procedure actLeftFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction;
      var Handled: Boolean);
    procedure actExitExecute(Sender: TObject);
    procedure actChooseExecute(Sender: TObject);
    procedure DataSourceLeftDataChange(Sender: TObject; Field: TField);
    procedure DataSourceRightDataChange(Sender: TObject; Field: TField);
    procedure Panel1Enter(Sender: TObject);
    procedure Panel1Exit(Sender: TObject);
    procedure Panel2Enter(Sender: TObject);
    procedure Panel2Exit(Sender: TObject);
    procedure DBGridEh1SortMarkingChanged(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actSetupColumnsExecute(Sender: TObject);
    procedure DBGridEh1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actGetCountExecute(Sender: TObject);
    procedure actCopyBufferExecute(Sender: TObject);
  private
    { Private declarations }
    fLeftNameTable : string; // Имя таблицы
    fLeftNameKeyField : string; // Имя ключевого поля
    fLeftTypeObject : Word; // Тип объектов в списке
    fLeftTypeFilter : Word; // Тип фильтра

    fRightNameTable : string; // Имя таблицы
    fRightNameKeyField : string; // Имя ключевого поля
    fRightTypeObject : Word; // Тип объектов в списке
    fRightTypeFilter : Word; // Тип фильтра

    fReadOnly : Boolean; // Не позволять редактировать данные
    fDoRollback : Boolean; // Делать ли rollback после cancel

    fCorrectEdit : TCorrectEdit; // Как завершился процесс редактирования

    fCurrentQuery : TpFIBDataSet;

    fAfterCreate : procAfterCreate; // После создания
    fAfterPost : procAfterPost; // После записи
    fBeforeDelete : procBeforeDelete; // Перед удалением
    fAfterDelete : procAfterDelete; // После удаления
    fOpenDataSet : Boolean;
  protected
    fAction : TActionListForm;
    CurrentID : Longint; // Текущий ID
    OldHint : TNotifyEvent;
    procedure DisplayHint(Sender : TObject); virtual; // отображение хинта в строке статуса
  public
    { Public declarations }
    property GetId : Longint read CurrentID;
    property isReadOnly : Boolean read fReadOnly Write fReadOnly;
    property DoRollback : Boolean read fDoRollback Write fDoRollback;
    property isCorrectEdit : TCorrectEdit read fCorrectEdit Write fCorrectEdit;
    property AfterCreate : procAfterCreate read fAfterCreate Write fAfterCreate;
    property AfterPost : procAfterPost read fAfterPost Write fAfterPost;
    property BeforeDelete : procBeforeDelete read fBeforeDelete Write fBeforeDelete;
    property AfterDelete : procAfterDelete read fAfterDelete Write fAfterDelete;
    procedure SetLeftFilter;
    procedure SetRightFilter;
    procedure SetId(LeftID, RightID : Longint); virtual; // Установить ID и открыть таблицу
    property FormAction : TActionListForm read fAction Write fAction;    
    constructor Create(aOwner : TComponent; aActionList : TActionListForm;
                       aLeftNameTable, aLeftNameKeyField,
                       aRightNameTable, aRightNameKeyField : string;
                       aLeftTypeObject, aRightTypeObject,
                       aLeftTypeFilter, aRightTypeFilter : Word); reintroduce; virtual;
  end;

  TCreatorDualList=function(aOwner : TComponent; aActionList : TActionListForm) : TfrmBaseDualList;

  TRegistrationDualList=record
    fCreator : TCreatorDualList; // функция создания формы
    fRegistration : Boolean; // флаг регистрации
  end;

  TBrokerDualListForm=class 
  private
    fMass : array of TRegistrationDualList; // массив записей функций создания форм
    fSize : Word;                       // размер массива
  public
    constructor Create(aSize : Word);   // создать массив нужного размера
    destructor  Destroy; override;      // деструктор
    function    CreateList(aOwner : TComponent; aType : Word; aAction : TActionListForm) : TfrmBaseDualList;
    procedure   Registration(aType : Word; aCreator : TCreatorDualList);
  end;

var
  frmBaseDualList: TfrmBaseDualList;
  BrokerDualListForm : TBrokerDualListForm=nil;

procedure InitDualListBroker;

implementation

uses DataModule, Fg_util, BaseSimpleFilter, SetupColumns;

{$R *.dfm}

{ TfrmBaseDualList }

constructor TfrmBaseDualList.Create(aOwner: TComponent;
  aActionList: TActionListForm; aLeftNameTable, aLeftNameKeyField,
  aRightNameTable, aRightNameKeyField: string;
  aLeftTypeObject, aRightTypeObject, aLeftTypeFilter,
  aRightTypeFilter: Word);
begin
  inherited Create(aOwner);
  fOpenDataSet:=True;
  fAction:=aActionList;

  fLeftNameTable:=aLeftNameTable;
  fLeftNameKeyField:=aLeftNameKeyField;
  fRightNameTable:=aRightNameTable;
  fRightNameKeyField:=aRightNameKeyField;
  fLeftTypeObject:=aLeftTypeObject;
  fLeftTypeFilter:=aLeftTypeFilter;
  fRightTypeObject:=aRightTypeObject;
  fRightTypeFilter:=aRightTypeFilter;

  fReadOnly:=False;
  fDoRollback:=False;

  fCurrentQuery:=QueryLeft;
  case fAction of
    doViewList   : begin
                     QueryLeft.Open;
                   end;
    doFilterList : begin
                     // Открыть с включенным фильтром
                     if QueryLeft.Active then
                       QueryLeft.Close;
                     SetLeftFilter;
                     if QueryRight.Active then
                       QueryRight.Close;
                     SetRightFilter;
                     QueryLeft.Open;
                   end;
    doFilterLeftList : begin
                     // Открыть с включенным левым фильтром
                     if QueryLeft.Active then
                       QueryLeft.Close;
                     SetLeftFilter;
                     if QueryRight.Active then
                       QueryRight.Close;
                     QueryLeft.Open;
                   end;
    doChooseList : begin
                     // Сразу вывести окно фильтра
                     actLeftFilterExecute(aOwner);
                   end;
    doChooseCloseList : begin
                          fOpenDataSet:=False;
                          // Сразу вывести окно фильтра
                          actLeftFilterExecute(aOwner);
                   end;
    doViewCloseList : begin
                      end;
  end;
end;

procedure TfrmBaseDualList.actViewExecute(Sender: TObject);
  var
    bForm : TfrmBaseEditForm;
begin
  inherited;
  if fCurrentQuery=QueryLeft then
    bForm:=BrokerEditForm.CreateView(Self, fLeftTypeObject, fCurrentQuery)
  else
    bForm:=BrokerEditForm.CreateView(Self, fRightTypeObject, fCurrentQuery);
  if bForm=nil then
    Exit;
  if Assigned(AfterCreate) then
    AfterCreate(bForm, Self);
  try
   bForm.ShowModal;
  finally
   FreeAndNil(bForm);
  end;
end;

procedure TfrmBaseDualList.actEditExecute(Sender: TObject);
  var
    bForm : TfrmBaseEditForm;
    strFilter : string;
    bMark : TBookMark;
begin
  inherited;
  if fCurrentQuery=QueryLeft then
    bForm:=BrokerEditForm.CreateEdit(Self, fLeftTypeObject, fCurrentQuery)
  else
    bForm:=BrokerEditForm.CreateEdit(Self, fRightTypeObject, fCurrentQuery);
  if bForm=nil then
    Exit;
  strFilter:=fCurrentQuery.ParamByName('Filter').AsString;
  fCurrentQuery.ParamByName('Filter').AsString:=' '; // Очистить фильтр (чтобы можно было вводить записи, не удовлетворяющие фильтру)
  try
   if Assigned(AfterCreate) then
     AfterCreate(bForm, Self);
   bMark:=fCurrentQuery.GetBookmark;
   try
    if bForm.ShowModal<>mrOk then
      begin
        fCorrectEdit:=doCancelEdit;
        fCurrentQuery.Cancel;
        if DoRollback then
          fCurrentQuery.Database.Rollback;
      end
    else
      begin
        fCorrectEdit:=doCorrectEdit;
        fCurrentQuery.GotoBookmark(bMark);
        if Assigned(AfterPost) then
          AfterPost(Self{.Owner});
      end;
   finally
    fCurrentQuery.FreeBookmark(bMark);
    FreeAndNil(bForm);
   end;
  finally
   fCurrentQuery.ParamByName('Filter').AsString:=strFilter; // Восстановить фильтр
  end;
end;

procedure TfrmBaseDualList.actNewExecute(Sender: TObject);
  var
    bForm : TfrmBaseEditForm;
    strFilter : string;
begin
  inherited;
  if fCurrentQuery=QueryLeft then
    bForm:=BrokerEditForm.CreateNew(Self, fLeftTypeObject, fCurrentQuery)
  else
    bForm:=BrokerEditForm.CreateNew(Self, fRightTypeObject, fCurrentQuery);
  if bForm=nil then
    Exit;
  strFilter:=fCurrentQuery.ParamByName('Filter').AsString;
  fCurrentQuery.ParamByName('Filter').AsString:=' '; // Очистить фильтр (чтобы можно было вводить записи, не удовлетворяющие фильтру)
  try
   if Assigned(AfterCreate) then
     AfterCreate(bForm, Self);
   try
    if bForm.ShowModal<>mrOk then
      begin
        if bForm.isChooseDouble then
          fCorrectEdit:=doChooseDouble
        else
          fCorrectEdit:=doCancelEdit;
        fCurrentQuery.Cancel;
        if DoRollback then
          fCurrentQuery.Database.Rollback;
      end
    else
      begin
        fCorrectEdit:=doCorrectEdit;
        if Assigned(AfterPost) then
          AfterPost(Self{.Owner});
      end;
   finally
    FreeAndNil(bForm);
   end;
  finally
   fCurrentQuery.ParamByName('Filter').AsString:=strFilter; // Восстановить фильтр
  end;
end;

procedure TfrmBaseDualList.actCopyBufferExecute(Sender: TObject);
begin
  inherited;
  if fCurrentQuery=QueryLeft then
    begin
      GridEhCopyToBuffer(DBGridEh1);
      DBGridEh1.SetFocus;
    end
  else
    begin
      GridEhCopyToBuffer(DBGridEh2);
      DBGridEh2.SetFocus;
    end;
end;

procedure TfrmBaseDualList.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if fReadOnly then
    Exit;
  if MessageDlg('Удалить запись?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
    try
     if Assigned(BeforeDelete) then
       BeforeDelete(Self{.Owner});
     fCurrentQuery.Delete;

     if Assigned(AfterDelete) then
       AfterDelete(Self{.Owner});
    except on E : Exception do
     MessageDlg('Ошибка сервера БД!'#10+E.Message, mtError, [mbOK], 0)
    end
end;

procedure TfrmBaseDualList.SetLeftFilter;
  var
    FilterString : string;
    bForm : TfrmBaseSimpleFilter;
begin
  FilterString:='';
  bForm:=BrokerSimpleFilter.CreateFilter(self, fLeftTypeFilter, doSetFilter);
  if bForm=nil then
    Exit;
  try
   FilterString:=bForm.GetFilterFromReestr;
   QueryLeft.ParamByName('filter').AsString:=FilterString;

   // Установить дополнительные фильтры, если нужно
   //if Assigned(BeforeApplyFilter) then
     //BeforeApplyFilter(TForm(Self.Owner), bForm);

   if FilterString<>'' then
     ToolButton10.Down:=True
   else
     ToolButton10.Down:=False;
  finally
   FreeAndNil(bForm);
  end;
end;

procedure TfrmBaseDualList.actLeftFilterExecute(Sender: TObject);
  var
    FilterString : string;
    bForm : TfrmBaseSimpleFilter;
begin
  inherited;
  FilterString:='';
  if fCurrentQuery=QueryLeft then
    bForm:=BrokerSimpleFilter.CreateFilter(self, fLeftTypeFilter, doSetFilter)
  else
    bForm:=BrokerSimpleFilter.CreateFilter(self, fRightTypeFilter, doSetFilter);
  if bForm=nil then
    Exit;
  try
   if bForm.ShowModal<>mrOk then
     begin
       if (fCurrentQuery.Active) and (fCurrentQuery.ParamByName('Filter').AsString<>'') then
         ToolButton10.Down:=True
       else
         ToolButton10.Down:=False;
       Exit;
     end
   else
     FilterString:=bForm.GetFilterString;

   if fCurrentQuery.Active then
     fCurrentQuery.Close;
   fCurrentQuery.ParamByName('filter').AsString:=FilterString;

   // Установить дополнительные фильтры, если нужно
   //if Assigned(BeforeApplyFilter) then
     //BeforeApplyFilter(TForm(Self.Owner), bForm);

   if fOpenDataSet then
     fCurrentQuery.Open;
   if FilterString<>'' then
     ToolButton10.Down:=True
   else
     ToolButton10.Down:=False;

  finally
   FreeAndNil(bForm);
  end;
end;

procedure TfrmBaseDualList.SetRightFilter;
  var
    FilterString : string;
    bForm : TfrmBaseSimpleFilter;
begin
  FilterString:='';
  bForm:=BrokerSimpleFilter.CreateFilter(self, fRightTypeFilter, doSetFilter);
  if bForm=nil then
    Exit;
  try
   FilterString:=bForm.GetFilterFromReestr;
   QueryRight.ParamByName('filter').AsString:=FilterString;

   // Установить дополнительные фильтры, если нужно
   //if Assigned(BeforeApplyFilter) then
     //BeforeApplyFilter(TForm(Self.Owner), bForm);

   if FilterString<>'' then
     ToolButton10.Down:=True
   else
     ToolButton10.Down:=False;
  finally
   FreeAndNil(bForm);
  end;
end;

procedure TfrmBaseDualList.SetId(LeftID, RightID: Integer);
begin
  if (LeftID<=0) or (RightID<=0) then
    Exit;
  if QueryRight.Active then
    QueryRight.Close;
  if QueryLeft.Active then
    QueryLeft.Close;
  QueryLeft.ParamByName('id').AsString:=' and '+fLeftNameTable+'.'+fLeftNameKeyField+'='+IntToStr(LeftID);
  QueryRight.ParamByName('id').AsString:=' and '+fRightNameTable+'.'+fRightNameKeyField+'='+IntToStr(RightID);
  QueryLeft.Open;
  QueryLeft.ParamByName('id').AsString:='';
  QueryRight.ParamByName('id').AsString:='';
end;

procedure TfrmBaseDualList.DisplayHint(Sender: TObject);
begin
  StatusBar1.SimpleText:=GetLongHint(Application.Hint);
end;

procedure TfrmBaseDualList.FormCreate(Sender: TObject);
begin
  inherited;
  OldHint:=Application.OnHint;
  Application.OnHint:=DisplayHint;
end;

procedure TfrmBaseDualList.FormDestroy(Sender: TObject);
begin
  inherited;
  Application.OnHint:=OldHint;
end;

procedure TfrmBaseDualList.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
begin
  inherited;
  actChoose.Enabled:=(actView.Tag<>-1) and ((fAction=doChooseList) or (fAction=doChooseCloseList)) and QueryRight.Active and not QueryRight.IsEmpty;
  actView.Enabled:=(actView.Tag<>-1) and fCurrentQuery.Active and not fCurrentQuery.IsEmpty;
  actEdit.Enabled:=(actEdit.Tag<>-1) and fCurrentQuery.Active and not fCurrentQuery.IsEmpty and not fReadOnly;
  actNew.Enabled:=(actNew.Tag<>-1) and fCurrentQuery.Active and not fReadOnly;
  actDelete.Enabled:=(actDelete.Tag<>-1) and fCurrentQuery.Active and not fCurrentQuery.IsEmpty and not fReadOnly;
  actRefresh.Enabled:=(actRefresh.Tag<>-1) and fCurrentQuery.Active;
end;

procedure TfrmBaseDualList.actExitExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmBaseDualList.actGetCountExecute(Sender: TObject);
  var
    num_record : Longint;
    sqlField : string;
begin
  inherited;
  // Показать кол-во записей
  try
   fCurrentQuery.DisableControls;
   fCurrentQuery.Close;
   // Сохраняем перечень полей в SQL-запросе для того, чтобы его изменить.
   // Это нужно потому, что, если в SQL-запросе есть одинаковые поля,
   // select count(*) выдаст ошибку - таково свойство вложенных запросов в Firebird
   sqlField:=fCurrentQuery.FieldsClause;
   // Изменяем перечень полей. При этом датасет должен быть закрыт
   fCurrentQuery.FieldsClause:='1 as field1';
   Screen.Cursor:=crSQLWait;
   try
    num_record:=fCurrentQuery.RecordCountFromSrv;
   finally
    Screen.Cursor:=crDefault;
   end;
  finally
   // Восстанавливаем перечень полей
   fCurrentQuery.FieldsClause:=sqlField;
   fCurrentQuery.Open;
   fCurrentQuery.EnableControls;
  end;
  ShowMessage('Кол-во записей='+IntToStr(num_record));
end;

procedure TfrmBaseDualList.actChooseExecute(Sender: TObject);
begin
  inherited;
  ModalResult:=mrYes;
end;

procedure TfrmBaseDualList.DataSourceLeftDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if not (QueryLeft.State in [dsBrowse]) then
    Exit;
  if QueryRight.Active then
    QueryRight.Close;
  if QueryLeft.IsEmpty then
    Exit;
  QueryRight.ParamByName(fLeftNameKeyField).AsString:=QueryLeft.FieldByName(fLeftNameKeyField).AsString;
  QueryRight.Open;
end;

procedure TfrmBaseDualList.DataSourceRightDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  CurrentID:=QueryRight.FieldByName(fRightNameKeyField).AsInteger;
end;

procedure TfrmBaseDualList.Panel1Enter(Sender: TObject);
begin
  inherited;
  Panel3.Color:=clYellow;
  fCurrentQuery:=QueryLeft;
end;

procedure TfrmBaseDualList.Panel1Exit(Sender: TObject);
begin
  inherited;
  Panel3.Color:=clBtnFace;
end;

procedure TfrmBaseDualList.Panel2Enter(Sender: TObject);
begin
  inherited;
  Panel4.Color:=clYellow;
  fCurrentQuery:=QueryRight;
end;

procedure TfrmBaseDualList.Panel2Exit(Sender: TObject);
begin
  inherited;
  Panel4.Color:=clBtnFace;
end;

procedure TfrmBaseDualList.DBGridEh1SortMarkingChanged(Sender: TObject);
  var
    s : string;
    i : Integer;
    grid : TDBGridEh;
begin
  inherited;
  s := '';
  grid:=Sender as TDBGridEh;
  for i := 0 to grid.SortMarkedColumns.Count-1 do
    begin
      if s<>'' then
        s:=s+', ';
      s:=s+grid.SortMarkedColumns[i].FieldName;
      if grid.SortMarkedColumns[i].Title.SortMarker=smUpEh then
        s:=s+' DESC';
    end;

  if s<>'' then
    TpFIBDataSet(grid.DataSource.DataSet).ParamByName('sortphrase').AsString:=' order by '
  else
    TpFIBDataSet(grid.DataSource.DataSet).ParamByName('sortphrase').AsString:=' ';
  TpFIBDataSet(grid.DataSource.DataSet).ParamByName('sortfield').AsString:=s;
  if grid.DataSource.DataSet.Active then
    grid.DataSource.DataSet.Close;
  TpFIBDataSet(grid.DataSource.DataSet).Open;
end;

procedure TfrmBaseDualList.actRefreshExecute(Sender: TObject);
begin
  inherited;
  TpFIBDataSet(fCurrentQuery).Refresh;
end;

procedure TfrmBaseDualList.actSetupColumnsExecute(Sender: TObject);
  var
    i : Integer;
begin
  inherited;
  // выбор видимых колонок
  frmSetupColumns:=TfrmSetupColumns.Create(Application);
  try
   for i:=0 to TDBGridEh(Sender).Columns.Count-1 do // По всем колонкам
     if TDBGridEh(Sender).Columns.Items[i].Tag<>-1 then
       begin
         if not TDBGridEh(Sender).Columns.Items[i].Visible then
           frmSetupColumns.ListBox1.AddItem(TDBGridEh(Sender).Columns.Items[i].Title.Caption, TDBGridEh(Sender).Columns.Items[i] as TObject)
         else
           frmSetupColumns.ListBox2.AddItem(TDBGridEh(Sender).Columns.Items[i].Title.Caption, TDBGridEh(Sender).Columns.Items[i] as TObject);
       end;
   if frmSetupColumns.ShowModal=mrOk then
     begin
       for i:=0 to frmSetupColumns.ListBox1.Items.Count-1 do
         TDBGridColumnEh(frmSetupColumns.ListBox1.Items.Objects[i]).Visible:=False;
       for i:=0 to frmSetupColumns.ListBox2.Items.Count-1 do
         TDBGridColumnEh(frmSetupColumns.ListBox2.Items.Objects[i]).Visible:=True;
     end;
  finally
   FreeAndNil(frmSetupColumns);
  end;
end;

procedure TfrmBaseDualList.DBGridEh1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var
    Cell: TGridCoord;
begin
  inherited;
  if ssRight in Shift then
    begin
      Cell := TCustomDBGridEh(Sender).MouseCoord(X, Y);
      if (Cell.Y < TDBGridEh(Sender).TopDataOffset) and (Cell.X >= TDBGridEh(Sender).IndicatorOffset) then
        begin
          // Отмена перемещения столбцов
          SendMessage(TDBGridEh(Sender).Handle, CM_CANCELMODE, 0, 0);
          // выбор видимых колонок
          if actSetupColumns.Enabled then
            actSetupColumnsExecute(Sender);
        end;
    end;
end;

{***************************************************************************}
constructor TBrokerDualListForm.Create(aSize : Word);
  var
    i : Integer;
begin
  inherited Create;
  SetLength(fMass,aSize);
  for i:=0 to aSize-1 do
    fMass[i].fRegistration:=false;
  fSize:=aSize;
end;

destructor TBrokerDualListForm.Destroy;
begin
  fSize:=0;
  SetLength(fMass,fSize);
  inherited destroy;
end;

procedure TBrokerDualListForm.Registration(aType : Word; aCreator : TCreatorDualList);
begin
  if (aType>0) and (aType<fSize) and not fMass[aType].fRegistration then
    begin
      fMass[aType].fCreator:=aCreator;
      fMass[aType].fRegistration:=True;
    end;
end;

function TBrokerDualListForm.CreateList(aOwner : TComponent; aType : Word; aAction : TActionListForm) : TfrmBaseDualList;
begin
  if (aType>0) and (aType<fSize) and fMass[aType].fRegistration then
    begin
      Result:=fMass[aType].fCreator(aOwner, aAction);
    end
  else
    begin
      Result:=nil;
      ShowMessage('Неизвестная списковая форма!'#10'Тип формы='+IntToStr(aType)+#10'Обратитесь к разработчику');
    end;
end;

procedure InitDualListBroker;
begin
  if BrokerDualListForm=nil then
    BrokerDualListForm:=TBrokerDualListForm.Create(MaxDualListType);
end;

end.
