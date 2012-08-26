inherited frmFilterMeasure: TfrmFilterMeasure
  Height = 235
  HelpContext = 32
  Caption = #1060#1080#1083#1100#1090#1088' '#1077#1076#1080#1085#1080#1094' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited Bevel1: TBevel
    Top = 172
  end
  inherited btnOk: TBitBtn
    Top = 180
  end
  inherited btnCancel: TBitBtn
    Top = 180
  end
  inherited Panel1: TPanel
    Height = 172
    object Label1: TLabel
      Left = 8
      Top = 108
      Width = 24
      Height = 16
      Caption = #1050#1086#1076
      FocusControl = edtCodeMeasure
    end
    object Label3: TLabel
      Left = 8
      Top = 140
      Width = 135
      Height = 16
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1094#1077#1085#1099
    end
    object edtCodeMeasure: TEdit
      Left = 152
      Top = 104
      Width = 209
      Height = 24
      TabOrder = 0
    end
    object edtNamePrice: TEdit
      Left = 152
      Top = 136
      Width = 209
      Height = 24
      TabOrder = 1
    end
  end
  inherited fstrFilter: TFormStorage
    StoredProps.Strings = (
      'edtCodeMeasure.Text'
      'edtNamePrice.Text')
    Left = 128
    Top = 176
  end
end
