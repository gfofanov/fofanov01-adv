unit SprMat_Price;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseDualList, DBGridEhGrouping, DB, FIBDataSet, pFIBDataSet, Menus,
  ActnList, Placemnt, RXSplit, GridsEh, DBGridEh, ExtCtrls, ComCtrls, ToolWin,
  fg_Const;

type
  TfrmSprMat_Price = class(TfrmBaseDualList)
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(aOwner : TComponent; aActionList : TActionListForm); reintroduce;
  end;

var
  frmSprMat_Price: TfrmSprMat_Price;

implementation

{$R *.dfm}

{ TfrmSprMat_Price }

constructor TfrmSprMat_Price.Create(aOwner: TComponent;
  aActionList: TActionListForm);
begin
  inherited Create(AOwner, aActionList,
                   'spr_mat', 'id_spr_mat',
                   'mat_price', 'id_mat_price',
                   cSpr_Mat, cMat_Price,
                   cSimpleFilterMat, cSimpleFilterMat_Price);
end;

//******************* SprMat_Price *************************
function SprMat_PriceDualListCreator(AOwner : TComponent; aActionList : TActionListForm) : TfrmBaseDualList;
begin
  Result:=TfrmSprMat_Price.Create(aOwner, aActionList);
end;

initialization
  InitDualListBroker;
  BrokerDualListForm.Registration(cSprMat_Price, SprMat_PriceDualListCreator);
end.
