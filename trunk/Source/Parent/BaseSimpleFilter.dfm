object frmBaseSimpleFilter: TfrmBaseSimpleFilter
  Left = 246
  Top = 128
  Width = 382
  Height = 245
  Caption = #1060#1080#1083#1100#1090#1088
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    374
    218)
  PixelsPerInch = 96
  TextHeight = 16
  object Bevel1: TBevel
    Left = 0
    Top = 179
    Width = 374
    Height = 39
    Align = alBottom
    Shape = bsTopLine
  end
  object btnOk: TBitBtn
    Left = 8
    Top = 190
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    TabOrder = 1
    OnClick = btnOkClick
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 274
    Top = 190
    Width = 91
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 2
    Kind = bkCancel
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 374
    Height = 179
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label2: TLabel
      Left = 0
      Top = 0
      Width = 374
      Height = 96
      Align = alTop
      Caption = 
        '   '#1047#1072#1087#1086#1083#1085#1080#1090#1077' '#1086#1076#1085#1091' '#1080#1083#1080' '#1085#1077#1089#1082#1086#1083#1100#1082#1086' '#1087#1086#1079#1080#1094#1080#1081#13#10'   '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072' ('#1092#1080#1083#1100#1090#1088#1072#1094 +
        #1080#1080').'#13#10'   '#1042' '#1090#1077#1082#1089#1090#1086#1074#1099#1093' '#1087#1086#1083#1103#1093' '#1084#1086#1078#1085#1086' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1089#1087#1077#1094'. '#1089#1080#1084#1074#1086#1083#1099':'#13#10'  ' +
        '    % - 0 '#1080#1083#1080' '#1073#1086#1083#1077#1077' '#1083#1102#1073#1099#1093' '#1089#1080#1084#1074#1086#1083#1086#1074#13#10'      _  - '#1088#1086#1074#1085#1086' 1 '#1083#1102#1073#1086#1081' '#1089#1080#1084 +
        #1074#1086#1083#13#10'   '#1063#1090#1086#1073#1099' '#1091#1073#1088#1072#1090#1100' '#1092#1080#1083#1100#1090#1088', '#1086#1089#1090#1072#1074#1100#1090#1077' '#1074#1089#1077' '#1089#1090#1088#1086#1082#1080' '#1087#1091#1089#1090#1099#1084#1080'.'
    end
  end
  object fstrFilter: TFormStorage
    Active = False
    Options = [fpState]
    UseRegistry = True
    OnRestorePlacement = fstrFilterRestorePlacement
    StoredValues = <>
    Left = 144
    Top = 184
  end
end
