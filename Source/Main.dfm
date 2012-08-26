inherited frmMain: TfrmMain
  Left = 280
  Top = 242
  HelpContext = 12
  BorderStyle = bsSingle
  Caption = #1056#1077#1082#1083#1072#1084#1085#1086'-'#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1077#1085#1085#1072#1103' '#1092#1080#1088#1084#1072' "'#1051#1072#1074#1088'"'
  ClientHeight = 142
  ClientWidth = 469
  Menu = MainMenu1
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  object SpeedBar1: TSpeedBar [0]
    Left = 0
    Top = 0
    Width = 469
    Height = 156
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    BtnOffsetHorz = 3
    BtnOffsetVert = 3
    BtnWidth = 111
    BtnHeight = 98
    TabOrder = 0
    InternalVer = 1
    object SpeedbarSection1: TSpeedbarSection
      Caption = 'Untitled (0)'
    end
    object SpeedItem3: TSpeedItem
      Action = actOrder
      BtnCaption = #1047#1072#1082#1072#1079#1099
      Caption = 'SpeedItem3'
      Hint = #1047#1072#1082#1072#1079#1099'|'#1047#1072#1082#1072#1079#1099' '#1082#1083#1080#1077#1085#1090#1086#1074
      Spacing = 1
      Left = 3
      Top = 3
      Visible = True
      WordWrap = True
      OnClick = actOrderExecute
      SectionName = 'Untitled (0)'
    end
    object SpeedItem1: TSpeedItem
      Action = actAdvSide
      BtnCaption = #1056#1077#1082#1083#1072#1084#1085#1099#1077' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080
      Caption = 'SpeedItem1'
      Hint = #1056#1077#1082#1083#1072#1084#1085#1099#1077' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080'|'#1056#1077#1082#1083#1072#1084#1085#1099#1077' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080
      Spacing = 1
      Left = 151
      Top = 3
      Visible = True
      WordWrap = True
      OnClick = actAdvSideExecute
      SectionName = 'Untitled (0)'
    end
    object SpeedItem2: TSpeedItem
      Action = actExit
      BtnCaption = #1042#1099#1093#1086#1076
      Caption = 'SpeedItem2'
      Hint = #1042#1099#1093#1086#1076'|'#1042#1099#1081#1090#1080' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      ImageIndex = 4
      Spacing = 1
      Left = 336
      Top = 3
      Visible = True
      OnClick = actExitExecute
      SectionName = 'Untitled (0)'
    end
  end
  object StatusBar1: TStatusBar [1]
    Left = 0
    Top = 123
    Width = 469
    Height = 19
    Panels = <>
  end
  object ActionList1: TActionList
    Left = 232
    Top = 48
    object actExit: TAction
      Caption = #1042#1099#1093#1086#1076
      Hint = #1042#1099#1093#1086#1076'|'#1042#1099#1081#1090#1080' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      ImageIndex = 4
      ShortCut = 32856
      OnExecute = actExitExecute
    end
    object actOptions: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1080'|'#1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
    end
    object actSprContractor: TAction
      Category = 'Sprav'
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099
      Hint = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099'|'#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1074
      OnExecute = actSprContractorExecute
    end
    object actSprContract: TAction
      Category = 'Sprav'
      Caption = #1044#1086#1075#1086#1074#1086#1088#1099
      Hint = #1044#1086#1075#1086#1074#1086#1088#1099'|'#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1076#1086#1075#1086#1074#1086#1088#1086#1074
      OnExecute = actSprContractExecute
    end
    object actAdvSide: TAction
      Category = 'Sprav'
      Caption = #1056#1077#1082#1083#1072#1084#1085#1099#1077' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080
      Hint = #1056#1077#1082#1083#1072#1084#1085#1099#1077' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080'|'#1056#1077#1082#1083#1072#1084#1085#1099#1077' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080
      OnExecute = actAdvSideExecute
    end
    object actContractPrice_Contract: TAction
      Category = 'Sprav'
      Caption = #1044#1086#1075#1086#1074#1086#1088#1099' '#1089' '#1094#1077#1085#1072#1084#1080
      Hint = #1044#1086#1075#1086#1074#1086#1088#1099' '#1089' '#1094#1077#1085#1072#1084#1080'|'#1044#1086#1075#1086#1074#1086#1088#1099' '#1089' '#1094#1077#1085#1072#1084#1080
    end
    object actSprMeasure: TAction
      Category = 'Sprav'
      Caption = #1045#1076'. '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      Hint = #1045#1076'. '#1080#1079#1084#1077#1088#1077#1085#1080#1103'|'#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1077#1076#1080#1085#1080#1094' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      OnExecute = actSprMeasureExecute
    end
    object actSprMat_Price: TAction
      Category = 'Sprav'
      Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1080' '#1094#1077#1085#1099
      Hint = #1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1080' '#1094#1077#1085#1099'|'#1052#1072#1090#1077#1088#1080#1072#1083#1099', '#1088#1072#1073#1086#1090#1072' '#1089' '#1094#1077#1085#1072#1084#1080
      OnExecute = actSprMat_PriceExecute
    end
    object actOrder: TAction
      Caption = #1047#1072#1082#1072#1079#1099
      Hint = #1047#1072#1082#1072#1079#1099'|'#1047#1072#1082#1072#1079#1099' '#1082#1083#1080#1077#1085#1090#1086#1074
      OnExecute = actOrderExecute
    end
  end
  object MainMenu1: TMainMenu
    Left = 192
    Top = 24
    object N8: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      object N1: TMenuItem
        Action = actSprContractor
      end
      object N2: TMenuItem
        Action = actSprContract
      end
      object N7: TMenuItem
        Action = actSprMeasure
      end
      object N9: TMenuItem
        Action = actSprMat_Price
      end
    end
    object N4: TMenuItem
      Caption = #1056#1072#1073#1086#1090#1072
      object N11: TMenuItem
        Action = actOrder
      end
      object N5: TMenuItem
        Action = actAdvSide
      end
      object N6: TMenuItem
        Action = actContractPrice_Contract
      end
    end
    object N10: TMenuItem
      Caption = #1057#1077#1088#1074#1080#1089
      object N17: TMenuItem
        Action = actOptions
      end
    end
    object N3: TMenuItem
      Action = actExit
    end
  end
end
