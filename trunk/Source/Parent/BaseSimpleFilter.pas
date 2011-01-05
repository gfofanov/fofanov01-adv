{*****************************************************************************
 *
 * Project  : Mat_Dept
 * Unit Name: BaseSimpleFilter
 * Purpose  : Базовая форма для фильтров
 * Create   : 14.06.06
 * History  : 
 *
 *****************************************************************************}

unit BaseSimpleFilter;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Registry, fg_Const, Placemnt;

type
  procBeforeSetFilter = procedure(aFromForm : TForm; aFilterForm : TForm); // Перед появлением окна установки фильтра

  TfrmBaseSimpleFilter = class(TForm)
    Bevel1: TBevel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    fstrFilter: TFormStorage;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject); virtual;
    procedure fstrFilterRestorePlacement(Sender: TObject);
  private
    { Private declarations }
    NameFilter : string;
    fBeforeSetFilter : procBeforeSetFilter; // Перед появлением окна установки фильтра
  protected
    fAction : TActionSimpleFilter; // Состояние фильтра
    FilterString : string; // Строка фильтрации
    x : Int64; // Переменная для проверки правильность ввода числовых реквизитов
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; aNameFilter : string;
                       aActionFilter : TActionSimpleFilter); reintroduce;
    destructor Destroy; override;
    function GetFilterString : string; virtual;
    function GetFilterFromReestr : string;
    property BeforeSetFilter : procBeforeSetFilter read fBeforeSetFilter Write fBeforeSetFilter;
  end;

  TCreatorSimpleFilter=function(aOwner : TComponent; aActionFilter : TActionSimpleFilter) : TfrmBaseSimpleFilter;

  TRegistrationSimpleFilter=record
    fCreator : TCreatorSimpleFilter; // функция создания формы
    fRegistration : Boolean; // флаг регистрации
  end;

  TBrokerSimpleFilter=Class
  private
    fMass : array of TRegistrationSimpleFilter; // массив записей функций создания форм
    fSize : Word;                               // размер массива
  public
    constructor Create(aSize : Word);   // создать массив нужного размера
    destructor  Destroy; override;      // деструктор
    function    CreateFilter(aOwner : TComponent; aType : Word; aAction : TActionSimpleFilter) : TfrmBaseSimpleFilter;
    procedure   Registration(aType : Word; aCreator : TCreatorSimpleFilter);
  end;

var
  frmBaseSimpleFilter: TfrmBaseSimpleFilter;
  BrokerSimpleFilter : TBrokerSimpleFilter=nil;

procedure InitSimpleFilterBroker;

implementation

uses DataModule;

{$R *.DFM}

function TfrmBaseSimpleFilter.GetFilterString : string;
begin
  Result:=FilterString;
end;

constructor TfrmBaseSimpleFilter.Create(aOwner : TComponent; aNameFilter : string;
                                        aActionFilter : TActionSimpleFilter);
begin
  fAction:=aActionFilter;
  FilterString:='';
  NameFilter:=aNameFilter;
  inherited Create(aOwner);
end;

destructor TfrmBaseSimpleFilter.Destroy;
begin
  inherited Destroy;
end;

procedure TfrmBaseSimpleFilter.FormCreate(Sender: TObject);
begin
  fstrFilter.IniFileName:=RegistryKey+'\SimpleFilters';
  fstrFilter.IniSection:=NameFilter;
  fstrFilter.Active:=True;
end;

procedure TfrmBaseSimpleFilter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fstrFilter.Active:=False;
end;

function TfrmBaseSimpleFilter.GetFilterFromReestr : string;
begin
  Result:='';
  fstrFilter.RestoreFormPlacement;
  btnOkClick(Self);
  Result:=GetFilterString;
end;

procedure TfrmBaseSimpleFilter.fstrFilterRestorePlacement(Sender: TObject);
begin
  if Assigned(BeforeSetFilter) then
    BeforeSetFilter(nil, Self);
end;

procedure TfrmBaseSimpleFilter.btnOkClick(Sender: TObject);
  var
    i : Integer;
begin
  // Удалить пробелы из полей фильтра
  for i:=0 to ComponentCount-1 do
    begin
      if Components[i] is TEdit then
        begin
          if (Components[i] as TEdit).Text<>'' then
            (Components[i] as TEdit).Text:=trim((Components[i] as TEdit).Text);
        end;
    end;
end;

constructor TBrokerSimpleFilter.Create(aSize : Word);
  var
    i : Integer;
begin
  inherited Create;
  SetLength(fMass,aSize);
  for i:=0 to aSize-1 do
    fMass[i].fRegistration:=false;
  fSize:=aSize;
end;

destructor TBrokerSimpleFilter.Destroy;
begin
  fSize:=0;
  SetLength(fMass,fSize);
  inherited destroy;
end;

procedure TBrokerSimpleFilter.Registration(aType : Word; aCreator : TCreatorSimpleFilter);
begin
  if (aType>0) and (aType<fSize) and not fMass[aType].fRegistration then
    begin
      fMass[aType].fCreator:=aCreator;
      fMass[aType].fRegistration:=True;
    end;
end;

function TBrokerSimpleFilter.CreateFilter(aOwner : TComponent; aType : Word; aAction : TActionSimpleFilter) : TfrmBaseSimpleFilter;
begin
  if (aType>0) and (aType<fSize) and fMass[aType].fRegistration then
    begin
      Result:=fMass[aType].fCreator(aOwner, aAction);
    end
  else
    begin
      Result:=nil;
      ShowMessage('Неизвестная форма фильтра!'#10'Тип формы='+IntToStr(aType)+#10'Обратитесь к разработчику');
    end;
end;

procedure InitSimpleFilterBroker;
begin
  if BrokerSimpleFilter=nil then
    BrokerSimpleFilter:=TBrokerSimpleFilter.Create(MaxSimpleFilter);
end;

end.
