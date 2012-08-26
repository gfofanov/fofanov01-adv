inherited frmEdtSprDept: TfrmEdtSprDept
  Left = 252
  Top = 193
  HelpContext = 31
  Caption = 'frmEdtSprDept'
  ClientHeight = 125
  ClientWidth = 375
  PixelsPerInch = 96
  TextHeight = 16
  inherited Bevel1: TBevel
    Top = 75
    Width = 375
  end
  object Label1: TLabel [1]
    Left = 16
    Top = 12
    Width = 169
    Height = 16
    Caption = #1053#1086#1084#1077#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel [2]
    Left = 16
    Top = 44
    Width = 149
    Height = 16
    Caption = #1058#1080#1087' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited btnOk: TBitBtn
    Top = 89
    TabOrder = 1
  end
  inherited btnCancel: TBitBtn
    Left = 277
    Top = 89
    TabOrder = 2
  end
  inherited btnClose: TBitBtn
    Left = 140
    Top = 91
    TabOrder = 3
  end
  object DBEdit1: TDBEdit [6]
    Left = 200
    Top = 8
    Width = 121
    Height = 24
    DataField = 'num_dept'
    DataSource = DataSource
    TabOrder = 0
  end
  object RxDBComboBox1: TRxDBComboBox [7]
    Left = 200
    Top = 40
    Width = 161
    Height = 24
    DataField = 'type_dept'
    DataSource = DataSource
    ItemHeight = 16
    Items.Strings = (
      #1062#1077#1093
      #1054#1090#1076#1077#1083)
    TabOrder = 4
    Values.Strings = (
      '1'
      '2')
  end
  inherited FormStorage: TFormStorage
    Left = 80
    Top = 72
  end
  inherited DataSource: TDataSource
    Left = 120
    Top = 72
  end
end
