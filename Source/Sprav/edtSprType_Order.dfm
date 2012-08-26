inherited frmEdtSprType_Order: TfrmEdtSprType_Order
  Caption = 'frmEdtSprType_Order'
  ClientHeight = 172
  PixelsPerInch = 96
  TextHeight = 16
  inherited Bevel1: TBevel
    Top = 122
  end
  object lblName_Type_Order: TLabel [1]
    Left = 8
    Top = 24
    Width = 170
    Height = 32
    Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077#13#10#1074#1080#1076#1072' '#1079#1072#1082#1072#1079#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblName_Print: TLabel [2]
    Left = 8
    Top = 72
    Width = 99
    Height = 32
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077#13#10#1076#1083#1103' '#1087#1077#1095#1072#1090#1080
  end
  inherited btnOk: TBitBtn
    Top = 136
    TabOrder = 2
  end
  inherited btnCancel: TBitBtn
    Top = 136
    TabOrder = 3
  end
  inherited btnClose: TBitBtn
    Top = 138
    TabOrder = 4
  end
  object dbedtName_Type_Order: TDBEdit [6]
    Left = 184
    Top = 24
    Width = 318
    Height = 24
    DataField = 'name_type_order'
    DataSource = DataSource
    TabOrder = 0
  end
  object dbedtName_Print: TDBEdit [7]
    Left = 184
    Top = 72
    Width = 318
    Height = 24
    DataField = 'name_print'
    DataSource = DataSource
    TabOrder = 1
  end
  inherited FormStorage: TFormStorage
    Left = 80
    Top = 128
  end
  inherited DataSource: TDataSource
    Left = 120
    Top = 128
  end
end
