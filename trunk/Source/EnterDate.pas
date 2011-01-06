{*****************************************************************************
 *
 * Project  : Mat_Dept
 * Unit Name: EnterDate
 * Purpose  : Форма ввода данных
 * Create   : 06.07.06
 * History  :
 *
 *****************************************************************************}

unit EnterDate;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, Buttons, ExtCtrls;

type
  TfrmEnterDate = class(TForm)
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    DateEdit1: TDateEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEnterDate: TfrmEnterDate;

function GetEnterDate(var Enter_Date : TDateTime; FormCaption : string = ''; LabelCaption : string = '') : Boolean;

implementation

uses DataModule, fg_util, Variants;

{$R *.DFM}

function GetEnterDate(var Enter_Date : TDateTime; FormCaption : string = ''; LabelCaption : string = '') : Boolean;
begin
  Result:=False;
  with TfrmEnterDate.Create(Application) do
    try
     if FormCaption<>'' then
       Caption:=FormCaption;
     if LabelCaption<>'' then
       label1.Caption:=LabelCaption;
     DateEdit1.Date:=Enter_Date;
     if ShowModal=mrOk then
       begin
         Enter_Date:=DateEdit1.Date;
         Result:=True;
       end;
    finally
     Free;
    end;
end;

end.
