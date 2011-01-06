inherited frmFilterSide: TfrmFilterSide
  Caption = #1060#1080#1083#1100#1090#1088' '#1089#1090#1086#1088#1086#1085#1099
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    object Label1: TLabel
      Left = 8
      Top = 120
      Width = 51
      Height = 16
      Caption = #1064#1080#1088#1080#1085#1072
      FocusControl = edtWidth
    end
    object edtWidth: TEdit
      Left = 104
      Top = 112
      Width = 261
      Height = 24
      TabOrder = 0
    end
  end
  inherited fstrFilter: TFormStorage
    StoredProps.Strings = (
      'edtWidth.Text')
  end
end
