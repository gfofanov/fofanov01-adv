unit ParentMat_Store;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Registry, OracleData, DBGridEh, ActnList, Placemnt, IniFiles;

type
  TfrmParentMat_Store = class(TForm)
    FormStorage: TFormStorage;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    regGrid : TRegIniFile;
    SprRegistryKey : string; // Ключ в реестре
  protected
    isSecCond : Boolean; // Есть ли на этой форме DataSource с ограничением по условию
  public
    { Public declarations }
  end;

var
  frmParentMat_Store: TfrmParentMat_Store;

implementation

uses DataModule, Db;

{$R *.dfm}

procedure TfrmParentMat_Store.FormCreate(Sender: TObject);
  var
    i{, j} : Integer;
    sortfield : string;
begin
  FormStorage.IniFileName:=RegistryKey;
  FormStorage.Active:=True;

  SprRegistryKey:=RegistryKey+'\'+Name;
  regGrid:=TRegIniFile.Create(SprRegistryKey);
  isSecCond:=False;

  for i:=0 to ComponentCount-1 do // Цикл по всем компонентам формы
    begin
      if Components[i] is TDBGridEH then // Если это грид
        begin
          with Components[i] as TDBGridEH do
            begin
              if Assigned(DataSource) and Assigned(DataSource.DataSet) then
                begin
                  // Прочитать сортировку прошлого сеанса и восстановить ее
                  sortfield:=regGrid.ReadString(SprRegistryKey,DataSource.DataSet.Name+'_sortfield','');
                  if sortfield<>'' then
                    begin
                      TOracleDataSet(DataSource.DataSet).SetVariable('sortphrase',' order by ');
                      TOracleDataSet(DataSource.DataSet).SetVariable('sortfield',sortfield);
                      // Если отпарсить не удалось, то, возможно, это ошибка в списке полей для сортировки
                      {if not TOracleDataSet(DataSource.DataSet).ParseSQL then
                        begin
                          // Очистить поля сортировки
                          TOracleDataSet(DataSource.DataSet).SetVariable('sortphrase','');
                          TOracleDataSet(DataSource.DataSet).SetVariable('sortfield','');
                        end;}
                    end;
                  // Восстановить размер и положение колонок
                  try
                   RestoreColumnsLayout(regGrid, [crpColIndexEh, crpColWidthsEh, crpSortMarkerEh, crpColVisibleEh, crpDropDownRowsEh, crpDropDownWidthEh]);
                  except
                  end;
                end;
              {for j:=0 to Columns.Count-1 do // По всем колонкам
                begin
                  if not isRightRead(Columns.Items[j].Tag) then
                    begin
                      Columns.Items[j].Visible:=False; // Если нет прав на просмотр столбца, скрыть его
                      Columns.Items[j].Tag:=-1;
                    end;
                end;}
            end;
        end;
      {if Components[i] is TAction then // Если это TAction
        with Components[i] as TAction do
          begin
            if not isRightExec(Tag) then
              begin
                Tag:=-1;
                Enabled:=False;
                Visible:=False;
              end;
          end;}
      {if Components[i] is TOracleDataSet then
        with Components[i] as TOracleDataSet do
          begin
            // Прочитать права на строки
            for j:=0 to Variables.Count-1 do
              if AnsiUpperCase(VariableName(j))=':SEC_ROWS' then
                begin
                  SetVariable('sec_rows',Get_Sec_Rows(Self.Name,Name));
                end;
          end;}
      {if Components[i] is TDataSource then
        if isExistsSecCond(AnsiUpperCase(Self.Name),AnsiUpperCase((Components[i] as TDataSource).Name)) then
          // В этой форме нужно будет проверить права доступа по условию
          isSecCond:=True;}
    end;
end;

procedure TfrmParentMat_Store.FormClose(Sender: TObject;
  var Action: TCloseAction);
  var
    i : Integer;
    Section : string;
begin
  FormStorage.Active:=False;
  for i:=0 to ComponentCount-1 do
    begin
      if Components[i] is TDBGridEH then
        begin
          if Assigned((Components[i] as TDBGridEH).DataSource) and Assigned((Components[i] as TDBGridEH).DataSource.DataSet) and ((Components[i] as TDBGridEH).DataSource.DataSet is TOracleDataSet) then
            regGrid.WriteString(SprRegistryKey,(Components[i] as TDBGridEH).DataSource.DataSet.Name+'_sortfield',
                                TOracleDataSet((Components[i] as TDBGridEH).DataSource.DataSet).GetVariable('sortfield'));
          Section:=Self.ClassName+(Components[i] as TDBGridEH).Name;
          (Components[i] as TDBGridEH).SaveColumnsLayout(TCustomIniFile(regGrid), Section);
        end;
    end;
end;

procedure TfrmParentMat_Store.FormDestroy(Sender: TObject);
begin
  FreeAndNil(regGrid);
end;

end.
