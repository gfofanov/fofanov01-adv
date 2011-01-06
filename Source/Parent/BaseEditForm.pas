{*****************************************************************************
 *
 * Project  : Mat_Dept
 * Unit Name: BaseEditForm
 * Purpose  : ������� ����� ��� ���� ��������������
 * Create   : 14.06.06
 *
 *****************************************************************************}

unit BaseEditForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ParentMat_Store, Placemnt, fg_Const, DB, StdCtrls,
  Buttons, ExtCtrls, FIBDataSet, pFIBDataSet;

type
  TfrmBaseEditForm = class;

  procBeforePost = procedure(aForm : TfrmBaseEditForm); // ����� Post
  procAfterPost = procedure(aForm : TfrmBaseEditForm; aFromForm : TForm); // ����� Post
  procAfterRestoreFields = procedure(aForm : TfrmBaseEditForm); // ����� �������������� �����

  TfrmBaseEditForm = class(TfrmParentMat_Store)
    DataSource: TDataSource;
    Bevel1: TBevel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    btnClose: TBitBtn;
    procedure btnOkClick(Sender: TObject); virtual;
  private
    { Private declarations }
    fBeforePost : procBeforePost; // ����� Post
    fAfterPost : procAfterPost; // ����� Post
    fAfterRestore : procAfterRestoreFields; // ����� �������������� �����
    fIsChooseDouble : Boolean; // ������� ������������ ������ (�� ������)
  protected
    FieldsRecord : array of string; // ������ ����� ������
    fAction : TActionEditForm; // ��� ����������� ����� (��������, �������������� ��� ����������)
    fOwner : TForm; // �� ����� ����� ��������� ������
  public
    { Public declarations }
    Parent_Action : TActionEditForm; // ���� ����� ������� �� ������, �� ����� �������� ����� �������������� ��� ������ �����
    constructor Create(aOwner : TComponent; ActionForm : TActionEditForm; Query : TpFIBDataSet); reintroduce; virtual;
    property BeforePost : procBeforePost read fBeforePost Write fBeforePost; // ����� Post
    property AfterPost : procAfterPost read fAfterPost Write fAfterPost; // ����� Post
    property AfterRestore : procAfterRestoreFields read fAfterRestore Write fAfterRestore; // ����� Post
    property isChooseDouble : Boolean read fIsChooseDouble Write fIsChooseDouble;
    procedure HideBevel;
  end;

  ////////////////////////////////////////////////
  // ������� �������� ������� ����� ��������������
  //
  // aOwner - ������
  // ActionForm - ��� ����������� ����� (����������, ������., ��������)
  // Query - DataSet, ������� ����� �������������
  //
  // ���������� ��������� �����
  TCreatorForm=function(aOwner : TComponent; ActionForm : TActionEditForm; Query : TpFIBDataSet) : TfrmBaseEditForm;

  //////////////////////////////////////////////////////////
  // ������ ��� �������� ���������� � ������� �������� �����
  //
  TRegistrationForm=record
    fCreator : TCreatorForm;   // ������� �������� �����
    fRegistration : Boolean;   // ���� �����������
  end;

  //////////////////////////////////////////////////////////
  // ����� - ������� �������� (������ ����)
  //
  TBrokerEditForm=Class
  private
    fMass : array of TRegistrationForm; // ������ ������� ������� �������� ����
    fSize : Word;                        // ������ �������
  public
    constructor Create(aSize : Word);    // ������� ������ ������� �������
    destructor  Destroy; override;       // ����������
    procedure   Registration(aType : Word; aCreator : TCreatorForm);
    function    CreateNew(aOwner : TComponent; aType : Word; Query : TpFIBDataSet) : TfrmBaseEditForm;
    function    CreateEdit(aOwner : TComponent; aType : Word; Query : TpFIBDataSet) : TfrmBaseEditForm;
    function    CreateView(aOwner : TComponent; aType : Word; Query : TpFIBDataSet) : TfrmBaseEditForm;
  end;

var
  frmBaseEditForm: TfrmBaseEditForm;
  BrokerEditForm : TBrokerEditForm=nil;

procedure InitEditFormBroker;

implementation

uses Fg_util, DataModule, DBCtrls;

{$R *.dfm}

{ TfrmBaseEditForm }

constructor TfrmBaseEditForm.Create(aOwner: TComponent;
  ActionForm: TActionEditForm; Query: TpFIBDataSet);
  var
    i : Integer;
    //Res_Str : string;
begin
  inherited Create(AOwner);
  fOwner:=aOwner as TForm;
  fAction:=ActionForm;
  fIsChooseDouble:=False;
  DataSource.DataSet:=Query;
  Parent_Action:=fAction;
  case fAction of
    doView : begin
               btnClose.Visible:=True;
               btnOk.Visible:=False;
               btnCancel.Visible:=False;
               SetReadOnlyEdit(Self);
               btnClose.Cancel:=True;
               ActiveControl:=btnClose;
             end;
    doEdit : begin
               Query.Edit;
             end;
    doNew  : begin
               Query.Insert;
             end;
  end;
  for i:=0 to ComponentCount-1 do // ���� �� ���� ����������� �����
    begin
      if Components[i] is TLabel then
        if ((Components[i] as TLabel).FocusControl<>nil) and ((Components[i] as TLabel).FocusControl.Tag<>0) then
          begin
            {if not isRightRead((Components[i] as TLabel).FocusControl.Tag) then
              begin
                (Components[i] as TLabel).FocusControl.Visible:=False; // ���� ��� ���� �� �������� �������, ������ ���
                (Components[i] as TLabel).Visible:=False;
              end
            else
              begin
                if isSecCond and ((Components[i] as TLabel).FocusControl is TDBEdit) then
                  begin
                    Res_Str:=GetRes_Str(AnsiUpperCase(Self.Name),
                                        AnsiUpperCase(((Components[i] as TLabel).FocusControl as TDBEdit).DataSource.Name),
                                        (Components[i] as TLabel).FocusControl.Tag,
                                        ((Components[i] as TLabel).FocusControl as TDBEdit).Text,
                                        ((Components[i] as TLabel).FocusControl as TDBEdit).DataSource);
                    if ((Components[i] as TLabel).FocusControl as TDBEdit).Text<>Res_Str then
                      begin
                        (Components[i] as TLabel).FocusControl.Visible:=False; // ���� ��� ���� �� �������� �������, ������ ���
                        (Components[i] as TLabel).Visible:=False;
                      end
                  end;
              end;}
          end;
    end;
end;

procedure TfrmBaseEditForm.btnOkClick(Sender: TObject);
  var
    FillFields : array of Variant;
    i : integer;
begin
  inherited;
  btnOk.SetFocus; // ��� ����, ����� ����������� �������� ����, �� ������� ������ �����
  ModalResult:=mrNone;

  // ��������� ����������� ����
  SetLength(FillFields,Length(FieldsRecord));
  for i:=0 to Length(FieldsRecord)-1 do
    FillFields[i]:=DataSource.DataSet.FieldByName(FieldsRecord[i]).AsVariant;

  if Assigned(BeforePost) then
    BeforePost(Self);

  try
   DataSource.DataSet.Post;

   if Assigned(AfterPost) then
     AfterPost(Self, fOwner);

   ModalResult:=mrOk
  except
   on E : EDatabaseError do
     begin
       DataSource.DataSet.Cancel;
       if MessageDlg('�������� ������ ������� ��:'#10+E.Message+#10#10'��������, �� ��������� ������������ ���� (�������� ������)'#10'���������� ��������������?', mtError, [mbYes, mbNo], 0) = mrNo then
         ModalResult:=mrCancel
       else
         begin
           case fAction of
             doEdit : TpFIBDataSet(DataSource.DataSet).Edit;
             doNew  : TpFIBDataSet(DataSource.DataSet).Insert
           end;
           // ������������ ����������� ����
           for i:=0 to Length(FieldsRecord)-1 do
             DataSource.DataSet.FieldByName(FieldsRecord[i]).AsVariant:=FillFields[i];
           // ����� ��������������
           if Assigned(AfterRestore) then
             AfterRestore(Self);
         end
     end;
   on E : Exception do
     begin
       DataSource.DataSet.Cancel;
       ModalResult:=mrCancel;
       ShowMessage('�������� ������ ��� ������� ������ � ���� ������!'#10+E.Message)
     end
  end
end;

//////////////////////////////////////////////////////
// TBrokerEditForm
//
constructor TBrokerEditForm.Create(aSize : Word);
  var
    i : Integer;
begin
  inherited Create;
  SetLength(fMass,aSize);
  for i:=0 to aSize-1 do
    fMass[i].fRegistration:=false;
  fSize:=aSize;
end;

destructor TBrokerEditForm.Destroy;
begin
  fSize:=0;
  SetLength(fMass,fSize);
  inherited destroy;
end;

procedure TBrokerEditForm.Registration(aType : Word; aCreator : TCreatorForm);
begin
  if (aType>0) and (aType<fSize) and not fMass[aType].fRegistration then
    begin
      fMass[aType].fCreator:=aCreator;
      fMass[aType].fRegistration:=true;
    end;
end;

function TBrokerEditForm.CreateNew(aOwner : TComponent; aType : Word; Query : TpFIBDataSet) : TfrmBaseEditForm;
begin
  if (aType>0) and (aType<fSize) and fMass[aType].fRegistration then
    begin
      Result:=fMass[aType].fCreator(aOwner, doNew, Query);
    end
  else
    begin
      Result:=nil;
      ShowMessage('����������� ����� ����������!'#10'��� �����='+inttostr(atype)+#10'���������� � ������������');
    end;
end;

function TBrokerEditForm.CreateEdit(aOwner : TComponent; aType : Word; Query : TpFIBDataSet) : TfrmBaseEditForm;
begin
  if (aType>0) and (aType<fSize) and fMass[aType].fRegistration then
    begin
      result:=fMass[aType].fCreator(aOwner, doEdit, Query);
    end
  else
    begin
      Result:=nil;
      ShowMessage('����������� ����� ��������������!'#10'��� �����='+inttostr(atype)+#10'���������� � ������������');
    end;
end;

function TBrokerEditForm.CreateView(aOwner : TComponent; aType : Word; Query : TpFIBDataSet) : TfrmBaseEditForm;
begin
  if (aType>0) and (aType<fSize) and fMass[aType].fRegistration then
    begin
      result:=fMass[aType].fCreator(aOwner, doView, Query);
    end
  else
    begin
      Result:=nil;
      ShowMessage('����������� ����� ���������!'#10'��� �����='+inttostr(atype)+#10'���������� � ������������');
    end;
end;

procedure InitEditFormBroker;
begin
  if BrokerEditForm=nil then
    BrokerEditForm:=TBrokerEditForm.Create(MaxType);
end;

procedure TfrmBaseEditForm.HideBevel;
begin
  Bevel1.Visible:=False;
  btnOk.Visible:=False;
  btnClose.Visible:=False;
  btnCancel.Visible:=False;
end;

end.
