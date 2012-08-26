{*****************************************************************************
 *
 * Project  : Mat_Store
 * Unit Name: SprDept
 * Purpose  : Справочник подразделений
 * Create   : 23.03.04
 * History  :
 *
 *****************************************************************************}

unit SprDept;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseList, PrnDbgeh, DB, OracleData, Menus, ActnList, Placemnt,
  Grids, DBGridEh, ExtCtrls, ComCtrls, ToolWin, fg_Const, GridsEh;

type
  TfrmSprDept = class(TfrmBaseList)
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; aActionList : TActionListForm); reintroduce;
  end;

var
  frmSprDept: TfrmSprDept;

implementation

{$R *.dfm}

{ TfrmSprDept }

constructor TfrmSprDept.Create(aOwner: TComponent;
  aActionList: TActionListForm);
begin
  inherited Create(AOwner, aActionList, 'spr_dept', 'id_dept',
                   cDept, cSimpleFilterDept);
end;

//******************* DeptListCreator *************************
function DeptListCreator(AOwner : TComponent; aActionList : TActionListForm) : TfrmBaseList;
begin
  Result:=TfrmSprDept.Create(aOwner, aActionList);
end;

initialization
  InitListFormBroker;
  BrokerListForm.Registration(cDept, DeptListCreator);
end.
