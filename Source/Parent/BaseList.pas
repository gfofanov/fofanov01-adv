{*****************************************************************************
 *
 * Project  : Mat_Dept
 * Unit Name: BaseList
 * Purpose  : Родительская форма для редактируемых списковых форм
 * Create   : 14.06.06
 * History  :
 *
 *****************************************************************************}

unit BaseList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ParentMat_Store, Placemnt, Grids, DBGridEh, ExtCtrls, ToolWin,
  ComCtrls, ActnList, DB, Menus, fg_Const, BaseEditForm,
  PrnDbgeh, GridsEh, DBGridEhGrouping, FIBDataSet, pFIBDataSet;

type

  procAfterCreate = procedure(aForm : TfrmBaseEditForm; aFromForm : TObject); // После создания формы редактирования
  procAfterDelete = procedure(aFromForm : TObject); // После удаления записи
  procBeforeDelete = procedure(aFromForm : TObject); // Перед удалением записи
  procAfterPost = procedure(aFromForm : TObject); // После записи
  procBeforeApplyFilter = procedure(aFromForm : TForm; aFilterForm : TForm); // Перед открытием набора данных, но после установки фильтра
  procBeforeSetFilter = procedure(aFromForm : TForm; aFilterForm : TForm); // Перед появлением окна установки фильтра

  TfrmBaseList = class(TfrmParentMat_Store)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    ActionList1: TActionList;
    DataSource: TDataSource;
    PopupMenu: TPopupMenu;
    MainMenu1: TMainMenu;
    actNew: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actView: TAction;
    actExit: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    actChoose: TAction;
    ToolButton9: TToolButton;
    actFilter: TAction;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    actRefresh: TAction;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    actSetupColumns: TAction;
    N17: TMenuItem;
    PrintDBGridEh1: TPrintDBGridEh;
    actPrintGrid: TAction;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    actGetCount: TAction;
    mnuGetCount: TMenuItem;
    actCopyBuffer: TAction;
    N34: TMenuItem;
    Query: TpFIBDataSet;
    procedure FormCreate(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure DBGridEh1SortMarkingChanged(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actSetupColumnsExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction;
      var Handled: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure DBGridEh1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure actChooseExecute(Sender: TObject);
    procedure actPrintGridExecute(Sender: TObject);
    procedure actGetCountExecute(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure actCopyBufferExecute(Sender: TObject);
  private
    { Private declarations }
    fNameTable : string; // Имя таблицы
    fNameKeyField : string; // Имя ключевого поля
    fTypeObject : Word; // Тип объектов в списке
    fTypeFilter : Word; // Тип фильтра

    fNameIdParent : string;
    fIdParent : Longint;

    fReadOnly : Boolean; // Не позволять редактировать данные
    fDoRollback : Boolean; // Делать ли rollback после cancel

    fCorrectEdit : TCorrectEdit; // Как завершился процесс редактирования

    fAfterCreate : procAfterCreate; // После создания
    fAfterDelete : procAfterDelete; // После удаления
    fBeforeDelete : procBeforeDelete; // Перед удалением
    fAfterPost : procAfterPost; // После записи
    fBeforeApplyFilter : procBeforeApplyFilter; // Перед открытием набора данных, но после установки фильтра
    fBeforeSetFilter : procBeforeSetFilter; // Перед появлением окна установки фильтра

    OldHint : TNotifyEvent;

    procedure DisplayHint(Sender : TObject); virtual; // отображение хинта в строке статуса

    procedure fDoCommitOnPost(isCommitOnPost : Boolean); // Делать ли commit после изменений в БД
  protected
    fAction : TActionListForm;
    fCurrentID : Longint; // Текущий ID
  public
    { Public declarations }
    property KeyField : string read fNameKeyField Write fNameKeyField;
    property NameTable : string read fNameTable Write fNameTable;
    property TypeObject : Word read fTypeObject Write fTypeObject;
    property TypeFilter : Word read fTypeFilter Write fTypeFilter;
    property isReadOnly : Boolean read fReadOnly Write fReadOnly;
    property DoRollback : Boolean read fDoRollback Write fDoRollback;
    property AfterCreate : procAfterCreate read fAfterCreate Write fAfterCreate;
    property AfterDelete : procAfterDelete read fAfterDelete Write fAfterDelete;
    property BeforeDelete : procBeforeDelete read fBeforeDelete Write fBeforeDelete;
    property AfterPost : procAfterPost read fAfterPost Write fAfterPost;
    property BeforeApplyFilter : procBeforeApplyFilter read fBeforeApplyFilter Write fBeforeApplyFilter;
    property BeforeSetFilter : procBeforeSetFilter read fBeforeSetFilter Write fBeforeSetFilter;
    property isCorrectEdit : TCorrectEdit read fCorrectEdit Write fCorrectEdit;
    property DoCommitOnPost : Boolean Write fDoCommitOnPost;
    property NameIdParent : string read fNameIdParent Write fNameIdParent;
    property IdParent : Longint read fIdParent Write fIdParent;
    property FormAction : TActionListForm read fAction Write fAction;
    property GetId : Longint read fCurrentID;
    procedure SetFilter;
    procedure SetId(id : Longint); virtual; // Установить ID и открыть таблицу
    function AddRecord : Boolean; // Добавление новой записи без открытия списка
    procedure SetIdParent(id : Longint); // Открыть как дочернюю таблицу
    constructor Create(aOwner : TComponent; aActionList : TActionListForm;
                       aNameTable, aNameKeyField : string;
                       aTypeObject, aTypeFilter : Word); reintroduce;
  end;

  TCreatorList=function(aOwner : TComponent; aActionList : TActionListForm) : TfrmBaseList;

  TRegistrationList=record
    fCreator : TCreatorList; // функция создания формы
    fRegistration : Boolean; // флаг регистрации
  end;

  TBrokerListForm=Class
  private
    fMass : array of TRegistrationList; // массив записей функций создания форм
    fSize : Word;                       // размер массива
  public
    constructor Create(aSize : Word);   // создать массив нужного размера
    destructor  Destroy; override;      // деструктор
    function    CreateList(aOwner : TComponent; aType : Word; aAction : TActionListForm) : TfrmBaseList;
    procedure   Registration(aType : Word; aCreator : TCreatorList);
  end;

var
  frmBaseList: TfrmBaseList;
  BrokerListForm : TBrokerListForm=nil;

procedure InitListFormBroker;

implementation

uses DataModule, BaseSimpleFilter, SetupColumns;

{$R *.dfm}

function TfrmBaseList.AddRecord : Boolean; // Добавление новой записи без открытия списка
begin
  Result:=False;
  //Application.OnHint:=nil;
  actNewExecute(Self);
  if (isCorrectEdit=doCorrectEdit) or
     (isCorrectEdit=doChooseDouble) then
    Result:=True;
end;

procedure TfrmBaseList.fDoCommitOnPost(isCommitOnPost : Boolean);
begin
  Query.AutoCommit:=isCommitOnPost;
end;

procedure TfrmBaseList.DisplayHint(Sender: TObject);
begin
  StatusBar1.SimpleText:=GetLongHint(Application.Hint);
end;

procedure TfrmBaseList.SetIdParent(id : Longint);
begin
  if id<>0 then
    Query.ParamByName('parent').AsString:=' and '+fNameTable+'.'+NameIdParent+'='+IntToStr(id);
  IdParent:=id;
end;

procedure TfrmBaseList.FormCreate(Sender: TObject);
begin
  inherited;
  OldHint:=Application.OnHint;
  Application.OnHint:=DisplayHint;
end;

procedure TfrmBaseList.FormDestroy(Sender: TObject);
begin
  inherited;
  Application.OnHint:=OldHint;
end;

constructor TfrmBaseList.Create(aOwner: TComponent;
  aActionList: TActionListForm; aNameTable, aNameKeyField : string;
  aTypeObject, aTypeFilter: Word);
begin
  inherited Create(aOwner);
  if Query.Active then
    Query.Close;
  fAction:=aActionList;
  fNameTable:=aNameTable;
  fNameKeyField:=aNameKeyField;
  fTypeObject:=aTypeObject;
  fTypeFilter:=aTypeFilter;

  fReadOnly:=False;
  fDoRollback:=False;
  case fAction of
    doViewList   : begin
                     {$IFDEF NO_THREAD}
                     Query.Open;
                     {$ELSE}
                     OpenCancellableQuery(Query, DataSource);
                     {$ENDIF}
                   end;
    doFilterList : begin
                     // Открыть с включенным фильтром
                     if Query.Active then
                       Query.Close;
                     SetFilter;
                     {$IFDEF NO_THREAD}
                     Query.Open;
                     {$ELSE}
                     OpenCancellableQuery(Query, DataSource);
                     {$ENDIF}
                   end;
    doChooseList : begin
                     // Сразу вывести окно фильтра
                     actFilterExecute(aOwner);
                   end;
    doViewCloseList : begin
                      end;
  end;
end;

procedure TfrmBaseList.SetFilter;
  var
    FilterString : string;
    bForm : TfrmBaseSimpleFilter;
begin
  FilterString:='';
  bForm:=BrokerSimpleFilter.CreateFilter(self, fTypeFilter, doSetFilter);
  if bForm=nil then
    Exit;
  try
   FilterString:=bForm.GetFilterFromReestr;
   Query.ParamByName('filter').AsString:=FilterString;

   // Установить дополнительные фильтры, если нужно
   if Assigned(BeforeApplyFilter) then
     BeforeApplyFilter(TForm(Self), bForm);

   if FilterString<>'' then
     ToolButton10.Down:=True
   else
     ToolButton10.Down:=False;
  finally
   FreeAndNil(bForm);
  end;
end;

procedure TfrmBaseList.actFilterExecute(Sender: TObject);
  var
    FilterString : string;
    bForm : TfrmBaseSimpleFilter;
begin
  inherited;
  FilterString:='';
  bForm:=BrokerSimpleFilter.CreateFilter(self, fTypeFilter, doSetFilter);
  if bForm=nil then
    Exit;
  if Assigned(BeforeSetFilter) then
    //BeforeSetFilter(TForm(Self.Owner), bForm);
    bForm.BeforeSetFilter:=BeforeSetFilter;
  try
   if bForm.ShowModal<>mrOk then
     begin
       if (Query.Active) and (Query.ParamByName('Filter').AsString<>'') then
         ToolButton10.Down:=True
       else
         ToolButton10.Down:=False;
       Exit;
     end
   else
     FilterString:=bForm.GetFilterString;

   if Query.Active then
     Query.Close;
   Query.ParamByName('filter').AsString:=FilterString;

   // Установить дополнительные фильтры, если нужно
   if Assigned(BeforeApplyFilter) then
     BeforeApplyFilter(TForm(Self), bForm);

   {$IFDEF NO_THREAD}
   Query.Open;
   {$ELSE}
   OpenCancellableQuery(Query, DataSource);
   {$ENDIF}
   if FilterString<>'' then
     ToolButton10.Down:=True
   else
     ToolButton10.Down:=False;

  finally
   FreeAndNil(bForm);
  end;
end;

procedure TfrmBaseList.actExitExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmBaseList.DBGridEh1SortMarkingChanged(Sender: TObject);
  var
    s : string;
    i : Integer;
    grid : TDBGridEh;
begin
  inherited;
  grid:=Sender as TDBGridEh;
  if grid.DataSource.DataSet=nil then
    Exit;
  s := '';
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
  {$IFDEF NO_THREAD}
  grid.DataSource.DataSet.Open;
  {$ELSE}
  OpenCancellableQuery(TOracleDataSet(grid.DataSource.DataSet), grid.DataSource);
  {$ENDIF}
end;

procedure TfrmBaseList.actRefreshExecute(Sender: TObject);
begin
  inherited;
  {$IFDEF NO_THREAD}
  Query.Refresh;
  {$ELSE}
  RefreshCancellableQuery(Query, DataSource);
  {$ENDIF}
end;

procedure TfrmBaseList.actSetupColumnsExecute(Sender: TObject);
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

procedure TfrmBaseList.actViewExecute(Sender: TObject);
  var
    bForm : TfrmBaseEditForm;
begin
  inherited;
  bForm:=BrokerEditForm.CreateView(Self, fTypeObject, Query);
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

procedure TfrmBaseList.actNewExecute(Sender: TObject);
  var
    bForm : TfrmBaseEditForm;
    strFilter : string;
begin
  inherited;
  bForm:=BrokerEditForm.CreateNew(Self, fTypeObject, Query);
  if bForm=nil then
    Exit;
  strFilter:=Query.ParamByName('Filter').AsString;
  Query.ParamByName('Filter').AsString:=' '; // Очистить фильтр (чтобы можно было вводить записи, не удовлетворяющие фильтру)
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
        Query.Cancel;
        if DoRollback then
          Query.Database.Rollback;
      end
    else
      begin
        fCorrectEdit:=doCorrectEdit;
        if Assigned(AfterPost) then
          AfterPost(Self);
      end;
   finally
    FreeAndNil(bForm);
   end;
  finally
   Query.ParamByName('Filter').AsString:=strFilter; // Восстановить фильтр
  end;
end;

procedure TfrmBaseList.actEditExecute(Sender: TObject);
  var
    bForm : TfrmBaseEditForm;
    strFilter : string;
    bMark : TBookMark;
begin
  inherited;
  bForm:=BrokerEditForm.CreateEdit(Self, fTypeObject, Query);
  if bForm=nil then
    Exit;
  strFilter:=Query.ParamByName('Filter').AsString;
  Query.ParamByName('Filter').AsString:=' '; // Очистить фильтр (чтобы можно было вводить записи, не удовлетворяющие фильтру)
  try
   if Assigned(AfterCreate) then
     AfterCreate(bForm, Self);
   bMark:=Query.GetBookmark;
   try
    if bForm.ShowModal<>mrOk then
      begin
        fCorrectEdit:=doCancelEdit;
        Query.Cancel;
        if DoRollback then
          Query.DataBase.Rollback;
      end
    else
      begin
        fCorrectEdit:=doCorrectEdit;
        Query.GotoBookmark(bMark);
        if Assigned(AfterPost) then
          AfterPost(Self);
      end;
   finally
    Query.FreeBookmark(bMark);
    FreeAndNil(bForm);
   end;
  finally
   Query.ParamByName('Filter').AsString:=strFilter; // Восстановить фильтр
  end;
end;

procedure TfrmBaseList.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if fReadOnly then
    Exit;
  if MessageDlg('Удалить запись?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
    try
     if Assigned(BeforeDelete) then
       BeforeDelete(Self);
     Query.Delete;
     if Assigned(AfterDelete) then
       AfterDelete(Self);
    except on E : Exception do
     MessageDlg('Ошибка Oracle!'#10+E.Message, mtError, [mbOK], 0)
    end
end;

procedure TfrmBaseList.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
begin
  inherited;
  actView.Enabled:=(actView.Tag<>-1) and Query.Active and not Query.IsEmpty;
  actEdit.Enabled:=(actEdit.Tag<>-1) and Query.Active and not Query.IsEmpty and not fReadOnly;
  actNew.Enabled:=(actNew.Tag<>-1) and Query.Active and not fReadOnly;
  actDelete.Enabled:=(actDelete.Tag<>-1) and Query.Active and not Query.IsEmpty and not fReadOnly;
  actRefresh.Enabled:=(actRefresh.Tag<>-1) and Query.Active;
  actChoose.Enabled:=(actChoose.Tag<>-1) and (fAction=doChooseList) and Query.Active and not Query.IsEmpty;
end;

procedure TfrmBaseList.DBGridEh1MouseDown(Sender: TObject;
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

procedure TfrmBaseList.SetId(id: Integer);
begin
  if id<=0 then
    Exit;
  if not Assigned(DBGridEh1.DataSource.DataSet) then
    Exit;
  if DBGridEh1.DataSource.DataSet.Active then
    DBGridEh1.DataSource.DataSet.Close;
  TpFIBDataSet(DBGridEh1.DataSource.DataSet).ParamByName('id').AsString:=' and '+NameTable+'.'+KeyField+'='+IntToStr(id);
  {$IFDEF NO_THREAD}
  DBGridEh1.DataSource.DataSet.Open;
  {$ELSE}
  OpenCancellableQuery(TOracleDataSet(DBGridEh1.DataSource.DataSet), DBGridEh1.DataSource);
  {$ENDIF}
  TpFIBDataSet(DBGridEh1.DataSource.DataSet).ParamByName('id').AsString:='';
end;

procedure TfrmBaseList.DataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if not Assigned(DataSource.DataSet) then
    Exit;
  fCurrentID:=DataSource.DataSet.FieldByName(KeyField).AsInteger;
end;

procedure TfrmBaseList.actChooseExecute(Sender: TObject);
begin
  inherited;
  ModalResult:=mrYes;
end;

procedure TfrmBaseList.actPrintGridExecute(Sender: TObject);
  var
    strTitle : string;
begin
  inherited;
  strTitle:='';
  strTitle:=InputBox('Заголовок отчета','Введите заголовок отчета',strTitle);
  if strTitle='' then
    Exit;
  PrintDBGridEh1.Title.Clear;
  PrintDBGridEh1.Title.Add(strTitle);
  PrintDBGridEh1.Preview;
end;

procedure TfrmBaseList.actGetCountExecute(Sender: TObject);
  var
    num_record : Longint;
begin
  inherited;
  // Показать кол-во записей
  Screen.Cursor:=crSQLWait;
  try
   num_record:=Query.RecordCountFromSrv;
  finally
   Screen.Cursor:=crDefault;
  end;
  ShowMessage('Кол-во записей='+IntToStr(num_record));
end;

procedure TfrmBaseList.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
  var
    Res_Str : string;
    CurColor : TColor;
begin
  inherited;
  if isSecCond and (Column.Tag<>0) then
    begin
      if not Assigned((Sender as TDBGridEH).DataSource.DataSet) then
        Exit;
      Res_Str:=GetRes_Str(AnsiUpperCase(Self.Name),
                          AnsiUpperCase((Sender as TDBGridEH).DataSource.Name),
                          Column.Tag,
                          Column.Field.Text,
                          (Sender as TDBGridEH).DataSource);
      if Res_Str<>Column.Field.Text then
        with (Sender as TDBGridEH).Canvas do
          begin
            CurColor:=Font.Color;
            Font.Color:=clWhite;
            fillRect(Rect);
            Font.Color:=CurColor;
            TextOut(Rect.Left,Rect.Top,Res_Str);
          end;
    end;
end;

procedure TfrmBaseList.actCopyBufferExecute(Sender: TObject);
begin
  inherited;
  //GridEhCopyToBuffer(DBGridEh1,Caption);
  DBGridEh1.SetFocus;
end;

constructor TBrokerListForm.Create(aSize : Word);
  var
    i : Integer;
begin
  inherited Create;
  SetLength(fMass,aSize);
  for i:=0 to aSize-1 do
    fMass[i].fRegistration:=false;
  fSize:=aSize;
end;

destructor TBrokerListForm.Destroy;
begin
  fSize:=0;
  SetLength(fMass,fSize);
  inherited;
end;

procedure TBrokerListForm.Registration(aType : Word; aCreator : TCreatorList);
begin
  if (aType>0) and (aType<fSize) and not fMass[aType].fRegistration then
    begin
      fMass[aType].fCreator:=aCreator;
      fMass[aType].fRegistration:=True;
    end;
end;

function TBrokerListForm.CreateList(aOwner : TComponent; aType : Word; aAction : TActionListForm) : TfrmBaseList;
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

procedure InitListFormBroker;
begin
  if BrokerListForm=nil then
    BrokerListForm:=TBrokerListForm.Create(MaxType);
end;

end.
