inherited frmFilterAdv: TfrmFilterAdv
  Caption = #1060#1080#1083#1100#1090#1088' '#1088#1077#1082#1083#1072#1084#1085#1099#1093' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1081
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    object Label1: TLabel
      Left = 8
      Top = 120
      Width = 40
      Height = 16
      Caption = #1040#1076#1088#1077#1089
      FocusControl = edtAddress
    end
    object edtAddress: TEdit
      Left = 104
      Top = 112
      Width = 261
      Height = 24
      TabOrder = 0
    end
  end
  inherited fstrFilter: TFormStorage
    StoredProps.Strings = (
      'edtAddress.Text')
  end
end
