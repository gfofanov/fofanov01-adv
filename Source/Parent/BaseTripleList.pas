{*****************************************************************************
 *
 * Project  : Mat_Dept
 * Unit Name: BaseTripleList
 * Purpose  : Родительская форма для тройных редактируемых списковых форм
 * Create   : 15.06.06
 * History  :
 *
 *****************************************************************************}

unit BaseTripleList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ParentMat_Store, RXSplit, Grids, DBGridEh, ExtCtrls, ComCtrls, DB,
  OracleData, ToolWin, Menus, ActnList, Placemnt, fg_Const, BaseEditForm,
  GridsEh;

type

  procAfterCreate = procedure(aForm : TfrmBaseEditForm; aFromForm : TObject); // После создания формы редактирования
  procAfterPost = procedure(aFromForm : TObject); // После записи
  procBeforeDelete = procedure(aFromForm : TObject); // Перед удалением записи
  procAfterDelete = procedure(aFromForm : TObject); // После удаления записи

  TfrmBaseTripleList = class(TfrmParentMat_Store)
    ActionList1: TActionList;
    actFirstNew: TAction;
    actFirstEdit: TAction;
    actFirstDelete: TAction;
    actFirstView: TAction;
    actExit: TAction;
    actChoose: TAction;
    actFirstFilter: TAction;
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
    PopupMenuFirst: TPopupMenu;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    DataSourceSecond: TDataSource;
    QuerySecond: TOracleDataSet;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    RxSplitter1: TRxSplitter;
    Panel2: TPanel;
    Panel3: TPanel;
    QueryFirst: TOracleDataSet;
    DataSourceFirst: TDataSource;
    PopupMenuSecond: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    N18: TMenuItem;
    Panel5: TPanel;
    DBGridEh2: TDBGridEh;
    Panel4: TPanel;
    RxSplitter2: TRxSplitter;
    Panel6: TPanel;
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
    DBGridEh3: TDBGridEh;
    Panel7: TPanel;
    actSecondNew: TAction;
    actSecondView: TAction;
    actSecondEdit: TAction;
    actSecondDelete: TAction;
    actSecondFilter: TAction;
    DataSourceThird: TDataSource;
    QueryThird: TOracleDataSet;
    actThirdView: TAction;
    actThirdNew: TAction;
    actThirdEdit: TAction;
    actThirdDelete: TAction;
    actThirdFilter: TAction;
    PopupMenuThird: TPopupMenu;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    actGetCount: TAction;
    mnuGetCount: TMenuItem;
    actCopyBuffer: TAction;
    mnuCopyBuffer: TMenuItem;
    procedure actFirstFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction;
      var Handled: Boolean);
    procedure actExitExecute(Sender: TObject);
    procedure actChooseExecute(Sender: TObject);
    procedure DataSourceFirstDataChange(Sender: TObject; Field: TField);
    procedure Panel1Enter(Sender: TObject);
    procedure Panel1Exit(Sender: TObject);
    procedure DBGridEh1SortMarkingChanged(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actSetupColumnsExecute(Sender: TObject);
    procedure DBGridEh1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure actFirstViewExecute(Sender: TObject);
    procedure actFirstEditExecute(Sender: TObject);
    procedure actFirstNewExecute(Sender: TObject);
    procedure actFirstDeleteExecute(Sender: TObject);
    procedure Panel5Enter(Sender: TObject);
    procedure Panel5Exit(Sender: TObject);
    procedure Panel6Enter(Sender: TObject);
    procedure Panel6Exit(Sender: TObject);
    procedure actSecondViewExecute(Sender: TObject);
    procedure actSecondNewExecute(Sender: TObject);
    procedure actSecondEditExecute(Sender: TObject);
    procedure actSecondDeleteExecute(Sender: TObject);
    procedure actSecondFilterExecute(Sender: TObject);
    procedure actThirdViewExecute(Sender: TObject);
    procedure actThirdNewExecute(Sender: TObject);
    procedure actThirdEditExecute(Sender: TObject);
    procedure actThirdDeleteExecute(Sender: TObject);
    procedure actThirdFilterExecute(Sender: TObject);
    procedure actGetCountExecute(Sender: TObject);
    procedure actCopyBufferExecute(Sender: TObject);
  private
    { Private declarations }
    fFirstNameTable : string; // Имя таблицы
    fFirstNameKeyField : string; // Имя ключевого поля
    fFirstTypeObject : Word; // Тип объектов в списке
    fFirstTypeFilter : Word; // Тип фильтра

    fSecondNameTable : string; // Имя таблицы
    fSecondNameKeyField : string; // Имя ключевого поля
    fSecondTypeObject : Word; // Тип объектов в списке
    fSecondTypeFilter : Word; // Тип фильтра

    fThirdNameTable : string; // Имя таблицы
    fThirdNameKeyField : string; // Имя ключевого поля
    fThirdTypeObject : Word; // Тип объектов в списке
    fThirdTypeFilter : Word; // Тип фильтра

    fReadOnly : Boolean; // Не позволять редактировать данные
    fDoRollback : Boolean; // Делать ли rollback после cancel

    fCorrectEdit : TCorrectEdit; // Как завершился процесс редактирования

    fCurrentQuery : TOracleDataSet; // Текущий датасет
    fCurrentDataSource : TDataSource; // Текущий DataSource
    fCurrentTypeObject : Word; // Текущий тип данных
    fCurrentTypeFilter : Word; // Текущий тип фильтра

    fAfterCreate : procAfterCreate; // После создания
    fAfterPost : procAfterPost; // После записи
    fBeforeDelete : procBeforeDelete; // Перед удалением
    fAfterDelete : procAfterDelete; // После удаления
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
    property FormAction : TActionListForm read fAction Write fAction;
    procedure SetFirstFilter;
    procedure SetId(FirstID, SecondID : Longint); virtual; // Установить ID и открыть таблицу
    constructor Create(aOwner: TComponent;
                       aActionList: TActionListForm; aFirstNameTable, aFirstNameKeyField,
                       aSecondNameTable, aSecondNameKeyField,
                       aThirdNameTable, aThirdNameKeyField : string;
                       aFirstTypeObject, aFirstTypeFilter,
                       aSecondTypeObject, aSecondTypeFilter,
                       aThirdTypeObject, aThirdTypeFilter : Word); reintroduce; virtual;
  end;

  TCreatorTripleList=function(aOwner : TComponent; aActionList : TActionListForm) : TfrmBaseTripleList;

  TRegistrationTripleList=record
    fCreator : TCreatorTripleList; // функция создания формы
    fRegistration : Boolean; // флаг регистрации
  end;

  TBrokerTripleListForm=class 
  private
    fMass : array of TRegistrationTripleList; // массив записей функций создания форм
    fSize : Word;                       // размер массива
  public
    constructor Create(aSize : Word);   // создать массив нужного размера
    destructor  Destroy; override;      // деструктор
    function    CreateList(aOwner : TComponent; aType : Word; aAction : TActionListForm) : TfrmBaseTripleList;
    procedure   Registration(aType : Word; aCreator : TCreatorTripleList);
  end;

var
  frmBaseTripleList: TfrmBaseTripleList;
  BrokerTripleListForm : TBrokerTripleListForm=nil;

procedure InitTripleListBroker;

implementation

uses DataModule, Fg_util, OracleCancellableUtils, BaseSimpleFilter,
  SetupColumns, Oracle{, Mat_Store_Util};

{$R *.dfm}

{ TfrmBaseTripleList }

constructor TfrmBaseTripleList.Create(aOwner: TComponent;
  aActionList: TActionListForm; aFirstNameTable, aFirstNameKeyField,
  aSecondNameTable, aSecondNameKeyField,
  aThirdNameTable, aThirdNameKeyField : string;
  aFirstTypeObject, aFirstTypeFilter,
  aSecondTypeObject, aSecondTypeFilter,
  aThirdTypeObject, aThirdTypeFilter : Word);
begin
  inherited Create(aOwner);
  fAction:=aActionList;

  fFirstNameTable:=aFirstNameTable;
  fFirstNameKeyField:=aFirstNameKeyField;
  fFirstTypeObject:=aFirstTypeObject;
  fFirstTypeFilter:=aFirstTypeFilter;

  fSecondNameTable:=aSecondNameTable;
  fSecondNameKeyField:=aSecondNameKeyField;
  fSecondTypeObject:=aSecondTypeObject;
  fSecondTypeFilter:=aSecondTypeFilter;

  fThirdNameTable:=aThirdNameTable;
  fThirdNameKeyField:=aThirdNameKeyField;
  fThirdTypeObject:=aThirdTypeObject;
  fThirdTypeFilter:=aThirdTypeFilter;

  fReadOnly:=False;
  fDoRollback:=False;

  fCurrentQuery:=QueryFirst;
  fCurrentDataSource:=DataSourceFirst;
  fCurrentTypeObject:=fFirstTypeObject;
  fCurrentTypeFilter:=fFirstTypeFilter;
  case fAction of
    doViewList   : begin
                     {$IFDEF NO_THREAD}
                     QueryFirst.Open;
                     {$ELSE}
                     OpenCancellableQuery(QueryFirst, DataSourceFirst);
                     {$ENDIF}
                   end;
    doFilterList : begin
                     // Открыть с включенным фильтром
                     if QueryFirst.Active then
                       QueryFirst.Close;
                     SetFirstFilter;
                     try
                      {$IFDEF NO_THREAD}
                      QueryFirst.Open;
                      {$ELSE}
                      OpenCancellableQuery(QueryFirst, DataSourceFirst);
                      {$ENDIF}
                     except
                      on E:EOracleError do
                        begin
                          // Если открыть не удалось, то, возможно, это ошибка в списке полей для сортировки
                          // Очистить поля сортировки
                          QueryFirst.SetVariable('sortphrase','');
                          QueryFirst.SetVariable('sortfield','');
                          // Еще раз открыть
                          //QueryFirst.Open;
                          OpenCancellableQuery(QueryFirst, DataSourceFirst);
                        end;
                      else
                        raise;
                     end;
                   end;
    doChooseList : begin
                     // Сразу вывести окно фильтра
                     actFirstFilterExecute(aOwner);
                   end;
    doViewCloseList : begin
                      end;
  end;
end;

procedure TfrmBaseTripleList.actFirstViewExecute(Sender: TObject);
  var
    bForm : TfrmBaseEditForm;
begin
  inherited;
  bForm:=BrokerEditForm.CreateView(Self, fCurrentTypeObject, fCurrentQuery);
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

procedure TfrmBaseTripleList.actFirstEditExecute(Sender: TObject);
  var
    bForm : TfrmBaseEditForm;
    strFilter : string;
    bMark : TBookMark;
begin
  inherited;
  bForm:=BrokerEditForm.CreateEdit(Self, fCurrentTypeObject, fCurrentQuery);
  if bForm=nil then
    Exit;
  strFilter:=fCurrentQuery.GetVariable('Filter');
  fCurrentQuery.SetVariable('Filter',' '); // Очистить фильтр (чтобы можно было вводить записи, не удовлетворяющие фильтру)
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
          fCurrentQuery.Session.Rollback;
      end
    else
      begin
        fCorrectEdit:=doCorrectEdit;
        fCurrentQuery.GotoBookmark(bMark);
        if Assigned(AfterPost) then
          AfterPost(Self.Owner);
      end;
   finally
    fCurrentQuery.FreeBookmark(bMark);
    FreeAndNil(bForm);
   end;
  finally
   fCurrentQuery.SetVariable('Filter',strFilter); // Восстановить фильтр
  end;
end;

procedure TfrmBaseTripleList.actFirstNewExecute(Sender: TObject);
  var
    bForm : TfrmBaseEditForm;
    strFilter : string;
begin
  inherited;
  bForm:=BrokerEditForm.CreateNew(Self, fCurrentTypeObject, fCurrentQuery);
  if bForm=nil then
    Exit;
  strFilter:=fCurrentQuery.GetVariable('Filter');
  fCurrentQuery.SetVariable('Filter',' '); // Очистить фильтр (чтобы можно было вводить записи, не удовлетворяющие фильтру)
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
          fCurrentQuery.Session.Rollback;
      end
    else
      begin
        fCorrectEdit:=doCorrectEdit;
        if Assigned(AfterPost) then
          AfterPost(Self.Owner);
      end;
   finally
    FreeAndNil(bForm);
   end;
  finally
   fCurrentQuery.SetVariable('Filter',strFilter); // Восстановить фильтр
  end;
end;

procedure TfrmBaseTripleList.actFirstDeleteExecute(Sender: TObject);
begin
  inherited;
  if fReadOnly then
    Exit;
  if MessageDlg('Удалить запись?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
    try
     if Assigned(BeforeDelete) then
       BeforeDelete(Self.Owner);
     fCurrentQuery.Delete;
     if Assigned(AfterDelete) then
       AfterDelete(Self.Owner);
    except on E : Exception do
     MessageDlg('Ошибка Oracle!'#10+E.Message, mtError, [mbOK], 0)
    end
end;

procedure TfrmBaseTripleList.SetFirstFilter;
  var
    FilterString : string;
    bForm : TfrmBaseSimpleFilter;
begin
  FilterString:='';
  bForm:=BrokerSimpleFilter.CreateFilter(self, fFirstTypeFilter, doSetFilter);
  if bForm=nil then
    Exit;
  try
   FilterString:=bForm.GetFilterFromReestr;
   QueryFirst.SetVariable('filter',FilterString);

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

procedure TfrmBaseTripleList.actFirstFilterExecute(Sender: TObject);
  var
    FilterString : string;
    bForm : TfrmBaseSimpleFilter;
begin
  inherited;
  FilterString:='';
  bForm:=BrokerSimpleFilter.CreateFilter(self, fCurrentTypeFilter, doSetFilter);
  if bForm=nil then
    Exit;
  try
   if bForm.ShowModal<>mrOk then
     begin
       if (fCurrentQuery.Active) and (fCurrentQuery.GetVariable('Filter')<>'') then
         ToolButton10.Down:=True
       else
         ToolButton10.Down:=False;
       Exit;
     end
   else
     FilterString:=bForm.GetFilterString;

   if fCurrentQuery.Active then
     fCurrentQuery.Close;
   fCurrentQuery.SetVariable('filter',FilterString);

   // Установить дополнительные фильтры, если нужно
   //if Assigned(BeforeApplyFilter) then
     //BeforeApplyFilter(TForm(Self.Owner), bForm);

   {$IFDEF NO_THREAD}
   fCurrentQuery.Open;
   {$ELSE}
   OpenCancellableQuery(fCurrentQuery, fCurrentDataSource);
   {$ENDIF}
   if FilterString<>'' then
     ToolButton10.Down:=True
   else
     ToolButton10.Down:=False;

  finally
   FreeAndNil(bForm);
  end;
end;

procedure TfrmBaseTripleList.SetId(FirstID, SecondID: Integer);
begin
  if (FirstID<=0) or (SecondID<=0) then
    Exit;
  if QuerySecond.Active then
    QuerySecond.Close;
  if QueryFirst.Active then
    QueryFirst.Close;
  QueryFirst.SetVariable('id',' and '+fFirstNameTable+'.'+fFirstNameKeyField+'='+IntToStr(FirstID));
  QuerySecond.SetVariable('id',' and '+fSecondNameTable+'.'+fSecondNameKeyField+'='+IntToStr(SecondID));
  OpenCancellableQuery(QueryFirst, DataSourceFirst);
  QueryFirst.SetVariable('id','');
  QuerySecond.SetVariable('id','');
end;

procedure TfrmBaseTripleList.DisplayHint(Sender: TObject);
begin
  StatusBar1.SimpleText:=GetLongHint(Application.Hint);
end;

procedure TfrmBaseTripleList.FormCreate(Sender: TObject);
begin
  inherited;
  OldHint:=Application.OnHint;
  Application.OnHint:=DisplayHint;
end;

procedure TfrmBaseTripleList.FormDestroy(Sender: TObject);
begin
  inherited;
  Application.OnHint:=OldHint;
end;

procedure TfrmBaseTripleList.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
begin
  inherited;
  actChoose.Enabled:=(actFirstView.Tag<>-1) and (fAction=doChooseList) and QueryFirst.Active and not QueryFirst.IsEmpty;

  {actFirstView.Enabled:=(actFirstView.Tag<>-1) and fCurrentQuery.Active and not fCurrentQuery.IsEmpty;
  actFirstNew.Enabled:=(actFirstNew.Tag<>-1) and fCurrentQuery.Active and not fReadOnly;
  actFirstEdit.Enabled:=(actFirstEdit.Tag<>-1) and fCurrentQuery.Active and not fCurrentQuery.IsEmpty and not fReadOnly;
  actFirstDelete.Enabled:=(actFirstDelete.Tag<>-1) and fCurrentQuery.Active and not fCurrentQuery.IsEmpty and not fReadOnly;}

  actFirstView.Enabled:=(actFirstView.Tag<>-1) and QueryFirst.Active and not QueryFirst.IsEmpty;
  actFirstNew.Enabled:=(actFirstNew.Tag<>-1) and QueryFirst.Active and not fReadOnly;
  actFirstEdit.Enabled:=(actFirstEdit.Tag<>-1) and QueryFirst.Active and not QueryFirst.IsEmpty and not fReadOnly;
  actFirstDelete.Enabled:=(actFirstDelete.Tag<>-1) and QueryFirst.Active and not QueryFirst.IsEmpty and not fReadOnly;

  actSecondView.Enabled:=(actSecondView.Tag<>-1) and QuerySecond.Active and not QuerySecond.IsEmpty;
  actSecondNew.Enabled:=(actSecondNew.Tag<>-1) and QuerySecond.Active and not fReadOnly;
  actSecondEdit.Enabled:=(actSecondEdit.Tag<>-1) and QuerySecond.Active and not QuerySecond.IsEmpty and not fReadOnly;
  actSecondDelete.Enabled:=(actSecondDelete.Tag<>-1) and QuerySecond.Active and not QuerySecond.IsEmpty and not fReadOnly;

  actThirdView.Enabled:=(actThirdView.Tag<>-1) and QueryThird.Active and not QueryThird.IsEmpty;
  actThirdNew.Enabled:=(actThirdNew.Tag<>-1) and QueryThird.Active and not fReadOnly;
  actThirdEdit.Enabled:=(actThirdEdit.Tag<>-1) and QueryThird.Active and not QueryThird.IsEmpty and not fReadOnly;
  actThirdDelete.Enabled:=(actThirdDelete.Tag<>-1) and QueryThird.Active and not QueryThird.IsEmpty and not fReadOnly;

  actRefresh.Enabled:=(actRefresh.Tag<>-1) and fCurrentQuery.Active;
end;

procedure TfrmBaseTripleList.actExitExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmBaseTripleList.actChooseExecute(Sender: TObject);
begin
  inherited;
  ModalResult:=mrYes;
end;

procedure TfrmBaseTripleList.DataSourceFirstDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  CurrentID:=QueryFirst.FieldByName(fFirstNameKeyField).AsInteger;
  if not (QueryFirst.State in [dsBrowse]) then
    Exit;
  if QuerySecond.Active then
    QuerySecond.Close;
  if QueryThird.Active then
    QueryThird.Close;
  if QueryFirst.IsEmpty then
    Exit;
  QuerySecond.SetVariable(fFirstNameKeyField,QueryFirst.FieldByName(fFirstNameKeyField).AsString);
  QuerySecond.Open;
  QueryThird.SetVariable(fFirstNameKeyField,QueryFirst.FieldByName(fFirstNameKeyField).AsString);
  try
   QueryThird.Open;
  except
   on E:EOracleError do
     begin
       // Если открыть не удалось, то, возможно, это ошибка в списке полей для сортировки
       // Очистить поля сортировки
       QueryThird.SetVariable('sortphrase','');
       QueryThird.SetVariable('sortfield','');
       // Еще раз открыть
       QueryThird.Open;
     end;
   else
     raise;
  end;
end;

procedure TfrmBaseTripleList.Panel1Enter(Sender: TObject);
begin
  inherited;
  Panel3.Color:=clYellow;
  fCurrentQuery:=QueryFirst;
  fCurrentDataSource:=DataSourceFirst;
  fCurrentTypeObject:=fFirstTypeObject;
  fCurrentTypeFilter:=fFirstTypeFilter;

  N2.Action:=actFirstView;
  N4.Action:=actFirstNew;
  N5.Action:=actFirstEdit;
  N6.Action:=actFirstDelete;
  N14.Action:=actFirstFilter;

  ToolButton2.Action:=actFirstView;
  ToolButton4.Action:=actFirstNew;
  ToolButton5.Action:=actFirstEdit;
  ToolButton6.Action:=actFirstDelete;
  ToolButton10.Action:=actFirstFilter;
end;

procedure TfrmBaseTripleList.Panel1Exit(Sender: TObject);
begin
  inherited;
  Panel3.Color:=clBtnFace;
end;

procedure TfrmBaseTripleList.Panel5Enter(Sender: TObject);
begin
  inherited;
  Panel4.Color:=clYellow;
  fCurrentQuery:=QuerySecond;
  fCurrentDataSource:=DataSourceSecond;
  fCurrentTypeObject:=fSecondTypeObject;
  fCurrentTypeFilter:=fSecondTypeFilter;

  N2.Action:=actSecondView;
  N4.Action:=actSecondNew;
  N5.Action:=actSecondEdit;
  N6.Action:=actSecondDelete;
  N14.Action:=actSecondFilter;

  ToolButton2.Action:=actSecondView;
  ToolButton4.Action:=actSecondNew;
  ToolButton5.Action:=actSecondEdit;
  ToolButton6.Action:=actSecondDelete;
  ToolButton10.Action:=actSecondFilter;
end;

procedure TfrmBaseTripleList.Panel5Exit(Sender: TObject);
begin
  inherited;
  Panel4.Color:=clBtnFace;
end;

procedure TfrmBaseTripleList.Panel6Enter(Sender: TObject);
begin
  inherited;
  Panel7.Color:=clYellow;
  fCurrentQuery:=QueryThird;
  fCurrentDataSource:=DataSourceThird;
  fCurrentTypeObject:=fThirdTypeObject;
  fCurrentTypeFilter:=fThirdTypeFilter;

  N2.Action:=actThirdView;
  N4.Action:=actThirdNew;
  N5.Action:=actThirdEdit;
  N6.Action:=actThirdDelete;
  N14.Action:=actThirdFilter;

  ToolButton2.Action:=actThirdView;
  ToolButton4.Action:=actThirdNew;
  ToolButton5.Action:=actThirdEdit;
  ToolButton6.Action:=actThirdDelete;
  ToolButton10.Action:=actThirdFilter;
end;

procedure TfrmBaseTripleList.Panel6Exit(Sender: TObject);
begin
  inherited;
  Panel7.Color:=clBtnFace;
end;

procedure TfrmBaseTripleList.actSecondViewExecute(Sender: TObject);
begin
  inherited;
  actFirstViewExecute(Sender);
end;

procedure TfrmBaseTripleList.actSecondNewExecute(Sender: TObject);
begin
  inherited;
  actFirstNewExecute(Sender);
end;

procedure TfrmBaseTripleList.actSecondEditExecute(Sender: TObject);
begin
  inherited;
  actFirstEditExecute(Sender);
end;

procedure TfrmBaseTripleList.actSecondDeleteExecute(Sender: TObject);
begin
  inherited;
  actFirstDeleteExecute(Sender);
end;

procedure TfrmBaseTripleList.actSecondFilterExecute(Sender: TObject);
begin
  inherited;
  actFirstFilterExecute(Sender);
end;

procedure TfrmBaseTripleList.actThirdViewExecute(Sender: TObject);
begin
  inherited;
  actFirstViewExecute(Sender);
end;

procedure TfrmBaseTripleList.actThirdNewExecute(Sender: TObject);
begin
  inherited;
  actFirstNewExecute(Sender);
end;

procedure TfrmBaseTripleList.actThirdEditExecute(Sender: TObject);
begin
  inherited;
  actFirstEditExecute(Sender);
end;

procedure TfrmBaseTripleList.actThirdDeleteExecute(Sender: TObject);
begin
  inherited;
  actFirstDeleteExecute(Sender);
end;

procedure TfrmBaseTripleList.actThirdFilterExecute(Sender: TObject);
begin
  inherited;
  actFirstFilterExecute(Sender);
end;

procedure TfrmBaseTripleList.DBGridEh1SortMarkingChanged(Sender: TObject);
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
    TOracleDataSet(grid.DataSource.DataSet).SetVariable('sortphrase',' order by ')
  else
    TOracleDataSet(grid.DataSource.DataSet).SetVariable('sortphrase',' ');
  TOracleDataSet(grid.DataSource.DataSet).SetVariable('sortfield',s);
  if grid.DataSource.DataSet.Active then
    grid.DataSource.DataSet.Close;

  try
   {$IFDEF NO_THREAD}
   grid.DataSource.DataSet.Open;
   {$ELSE}
   OpenCancellableQuery(TOracleDataSet(grid.DataSource.DataSet), grid.DataSource);
   {$ENDIF}
  except
   on E:EOracleError do
     begin
       // Если открыть не удалось, то, возможно, это ошибка в списке полей для сортировки
       // Очистить поля сортировки
       TOracleDataSet(grid.DataSource.DataSet).SetVariable('sortphrase','');
       TOracleDataSet(grid.DataSource.DataSet).SetVariable('sortfield','');
       // Еще раз открыть
       {$IFDEF NO_THREAD}
       grid.DataSource.DataSet.Open;
       {$ELSE}
       OpenCancellableQuery(TOracleDataSet(grid.DataSource.DataSet), grid.DataSource);
       {$ENDIF}
     end
   else
     raise;
  end;
end;

procedure TfrmBaseTripleList.actRefreshExecute(Sender: TObject);
begin
  inherited;
  RefreshCancellableQuery(fCurrentQuery, fCurrentDataSource);
end;

procedure TfrmBaseTripleList.DBGridEh1MouseDown(Sender: TObject;
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

procedure TfrmBaseTripleList.actGetCountExecute(Sender: TObject);
  var
    num_record : Longint;
begin
  inherited;
  // Показать кол-во записей
  Screen.Cursor:=crSQLWait;
  try
   num_record:=QueryFirst.CountQueryHits;
  finally
   Screen.Cursor:=crDefault;
  end;
  ShowMessage('Кол-во записей='+IntToStr(num_record));
end;

procedure TfrmBaseTripleList.actCopyBufferExecute(Sender: TObject);
begin
  inherited;
  //GridEhCopyToBuffer(DBGridEh1,Caption);
  DBGridEh1.SetFocus;
end;

procedure TfrmBaseTripleList.actSetupColumnsExecute(Sender: TObject);
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

{***************************************************************************}
constructor TBrokerTripleListForm.Create(aSize : Word);
  var
    i : Integer;
begin
  inherited Create;
  SetLength(fMass,aSize);
  for i:=0 to aSize-1 do
    fMass[i].fRegistration:=false;
  fSize:=aSize;
end;

destructor TBrokerTripleListForm.Destroy;
begin
  fSize:=0;
  SetLength(fMass,fSize);
  inherited destroy;
end;

procedure TBrokerTripleListForm.Registration(aType : Word; aCreator : TCreatorTripleList);
begin
  if (aType>0) and (aType<fSize) and not fMass[aType].fRegistration then
    begin
      fMass[aType].fCreator:=aCreator;
      fMass[aType].fRegistration:=True;
    end;
end;

function TBrokerTripleListForm.CreateList(aOwner : TComponent; aType : Word; aAction : TActionListForm) : TfrmBaseTripleList;
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

procedure InitTripleListBroker;
begin
  if BrokerTripleListForm=nil then
    BrokerTripleListForm:=TBrokerTripleListForm.Create(MaxTripleListType);
end;

end.
