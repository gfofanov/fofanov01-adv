{*****************************************************************************
 *
 * Project  : Mat_Dept
 * Unit Name: SprMaterial
 * Purpose  : Справочник материалов
 * Create   : 16.06.06
 * History  :
 *
 *****************************************************************************}

unit SprMaterial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseList, BaseDualList, PrnDbgeh, DB, OracleData, Menus, ActnList, Placemnt,
  Grids, DBGridEh, ExtCtrls, ComCtrls, ToolWin, fg_Const, GridsEh;

type
  TfrmSprMaterial = class(TfrmBaseList)
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; aActionList : TActionListForm); reintroduce;
  end;

var
  frmSprMaterial: TfrmSprMaterial;

implementation

uses DataModule, OracleCancellableUtils;

{$R *.dfm}

{ TfrmSprMaterial }

constructor TfrmSprMaterial.Create(aOwner: TComponent;
  aActionList: TActionListForm);
begin
  inherited Create(AOwner, aActionList, 'material', 'id_material',
                   cMaterial, cSimpleFilterMaterial);
end;

//******************* MaterialListCreator *************************
function MaterialListCreator(AOwner : TComponent; aActionList : TActionListForm) : TfrmBaseList;
begin
  Result:=TfrmSprMaterial.Create(aOwner, aActionList);
end;

initialization
  InitListFormBroker;
  BrokerListForm.Registration(cMaterial, MaterialListCreator);
end.
