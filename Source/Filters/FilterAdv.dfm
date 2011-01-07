inherited frmFilterAdv: TfrmFilterAdv
  Caption = #1060#1080#1083#1100#1090#1088' '#1088#1077#1082#1083#1072#1084#1085#1099#1093' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1081
  ClientHeight = 316
  PixelsPerInch = 96
  TextHeight = 16
  inherited Bevel1: TBevel
    Top = 277
  end
  inherited btnOk: TBitBtn
    Top = 285
  end
  inherited btnCancel: TBitBtn
    Top = 285
  end
  inherited Panel1: TPanel
    Height = 277
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
    object rgrAdv: TRadioGroup
      Left = 8
      Top = 145
      Width = 357
      Height = 126
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080' ...'
      ItemIndex = 0
      Items.Strings = (
        #1042#1089#1077
        #1063#1072#1089#1090#1080#1095#1085#1086' '#1089#1074#1086#1073#1086#1076#1085#1099#1077
        #1055#1086#1083#1085#1086#1089#1090#1100#1102' '#1079#1072#1085#1103#1090#1099#1077
        #1055#1086#1083#1085#1086#1089#1090#1100#1102' '#1089#1074#1086#1073#1086#1076#1085#1099#1077
        #1041#1077#1079' '#1089#1090#1086#1088#1086#1085)
      TabOrder = 1
    end
  end
  inherited fstrFilter: TFormStorage
    StoredProps.Strings = (
      'edtAddress.Text'
      'rgrAdv.ItemIndex')
    Top = 280
  end
end
