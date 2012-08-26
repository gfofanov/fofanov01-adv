inherited frmEdtSprMeasure: TfrmEdtSprMeasure
  Caption = 'frmEdtSprMeasure'
  ClientHeight = 221
  PixelsPerInch = 96
  TextHeight = 16
  inherited Bevel1: TBevel
    Top = 171
  end
  object Label1: TLabel [1]
    Left = 8
    Top = 24
    Width = 99
    Height = 16
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    FocusControl = DBEdit1
  end
  object Label2: TLabel [2]
    Left = 8
    Top = 52
    Width = 97
    Height = 32
    Caption = #1050#1088#1072#1090#1082#1086#1077#13#10#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    FocusControl = DBEdit2
  end
  object Label3: TLabel [3]
    Left = 8
    Top = 93
    Width = 99
    Height = 32
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077#13#10#1094#1077#1085#1099
    FocusControl = DBEdit3
  end
  object Label4: TLabel [4]
    Left = 8
    Top = 132
    Width = 97
    Height = 32
    Caption = #1050#1088#1072#1090#1082#1086#1077#13#10#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    FocusControl = DBEdit4
  end
  object Label5: TLabel [5]
    Left = 240
    Top = 144
    Width = 116
    Height = 16
    Caption = #1050#1086#1101#1092#1092'. '#1087#1077#1088#1077#1074#1086#1076#1072
  end
  inherited btnOk: TBitBtn
    Top = 185
    TabOrder = 5
  end
  inherited btnCancel: TBitBtn
    Top = 185
    TabOrder = 6
  end
  inherited btnClose: TBitBtn
    Top = 187
    TabOrder = 7
  end
  object DBEdit1: TDBEdit [9]
    Left = 128
    Top = 16
    Width = 374
    Height = 24
    DataField = 'name_measure'
    DataSource = DataSource
    TabOrder = 0
  end
  object DBEdit2: TDBEdit [10]
    Left = 128
    Top = 56
    Width = 97
    Height = 24
    DataField = 'name_measure_short'
    DataSource = DataSource
    TabOrder = 1
  end
  object DBEdit3: TDBEdit [11]
    Left = 128
    Top = 96
    Width = 374
    Height = 24
    DataField = 'name_measure_price'
    DataSource = DataSource
    TabOrder = 2
  end
  object DBEdit4: TDBEdit [12]
    Left = 128
    Top = 136
    Width = 97
    Height = 24
    DataField = 'name_measure_price_short'
    DataSource = DataSource
    TabOrder = 3
  end
  object DBEdit5: TDBEdit [13]
    Left = 376
    Top = 136
    Width = 121
    Height = 24
    DataField = 'koef_price'
    DataSource = DataSource
    TabOrder = 4
  end
end
