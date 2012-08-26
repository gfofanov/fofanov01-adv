inherited frmFilterMaterial: TfrmFilterMaterial
  Left = 230
  Top = 158
  Height = 298
  HelpContext = 32
  Caption = #1060#1080#1083#1100#1090#1088' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited Bevel1: TBevel
    Top = 232
  end
  inherited btnOk: TBitBtn
    Top = 243
  end
  inherited btnCancel: TBitBtn
    Top = 243
  end
  inherited Panel1: TPanel
    Height = 232
    object Label1: TLabel
      Left = 8
      Top = 108
      Width = 99
      Height = 16
      Caption = #1050#1086#1076' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
      FocusControl = edtCodeMaterial
    end
    object Label3: TLabel
      Left = 8
      Top = 140
      Width = 99
      Height = 16
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object Label4: TLabel
      Left = 8
      Top = 172
      Width = 134
      Height = 16
      Caption = #1058#1077#1093'. '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1072
    end
    object Label5: TLabel
      Left = 8
      Top = 204
      Width = 40
      Height = 16
      Caption = #1057#1082#1083#1072#1076
    end
    object edtCodeMaterial: TEdit
      Left = 152
      Top = 104
      Width = 209
      Height = 24
      TabOrder = 0
    end
    object edtNameMaterial: TEdit
      Left = 152
      Top = 136
      Width = 209
      Height = 24
      TabOrder = 1
    end
    object edtTx_M: TEdit
      Left = 152
      Top = 168
      Width = 209
      Height = 24
      TabOrder = 2
    end
    object edtNumStore: TEdit
      Left = 152
      Top = 200
      Width = 209
      Height = 24
      TabOrder = 3
    end
  end
  inherited fstrFilter: TFormStorage
    StoredProps.Strings = (
      'edtCodeMaterial.Text'
      'edtNameMaterial.Text'
      'edtTx_M.Text'
      'edtNumStore.Text')
    Left = 152
    Top = 240
  end
end
