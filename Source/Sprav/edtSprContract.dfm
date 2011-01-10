inherited frmEdtSprContract: TfrmEdtSprContract
  Caption = 'frmEdtSprContract'
  ClientHeight = 269
  ClientWidth = 496
  PixelsPerInch = 96
  TextHeight = 16
  inherited Bevel1: TBevel
    Top = 219
    Width = 496
  end
  object Label5: TLabel [1]
    Left = 8
    Top = 111
    Width = 108
    Height = 16
    Caption = #1053#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1072
    FocusControl = dbeNum_Contract
  end
  object Label6: TLabel [2]
    Left = 8
    Top = 138
    Width = 115
    Height = 32
    Caption = #1044#1072#1090#1072' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1103#13#10#1076#1086#1075#1086#1074#1086#1088#1072
    FocusControl = DBDateEdit1
  end
  object Label1: TLabel [3]
    Left = 293
    Top = 111
    Width = 109
    Height = 16
    Caption = #1044#1086#1087'. '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1077
    FocusControl = DBEdit1
  end
  object Label7: TLabel [4]
    Left = 8
    Top = 176
    Width = 83
    Height = 32
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072#13#10#1076#1077#1081#1089#1090#1074#1080#1103
    FocusControl = DBDateEdit2
  end
  object Label8: TLabel [5]
    Left = 273
    Top = 179
    Width = 105
    Height = 32
    Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103#13#10#1076#1077#1081#1089#1090#1074#1080#1103
    FocusControl = DBDateEdit3
  end
  inherited btnOk: TBitBtn
    Top = 233
    TabOrder = 6
  end
  inherited btnCancel: TBitBtn
    Left = 398
    Top = 233
    TabOrder = 7
  end
  inherited btnClose: TBitBtn
    Left = 200
    Top = 235
    TabOrder = 8
  end
  object dbeNum_Contract: TDBEdit [9]
    Left = 137
    Top = 103
    Width = 150
    Height = 24
    DataField = 'num_contract'
    DataSource = DataSource
    TabOrder = 1
  end
  object DBDateEdit1: TDBDateEdit [10]
    Left = 137
    Top = 141
    Width = 89
    Height = 24
    DataField = 'date_contract'
    DataSource = DataSource
    NumGlyphs = 2
    TabOrder = 3
    Weekends = [Sun, Sat]
    YearDigits = dyFour
  end
  object GroupBox1: TGroupBox [11]
    Left = 0
    Top = 0
    Width = 496
    Height = 97
    Align = alTop
    Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
    TabOrder = 0
    object Label2: TLabel
      Left = 115
      Top = 27
      Width = 30
      Height = 16
      Caption = #1048#1053#1053
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 313
      Top = 27
      Width = 28
      Height = 16
      Caption = #1050#1055#1055
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 8
      Top = 68
      Width = 99
      Height = 16
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FocusControl = DBEdit4
    end
    object DBEdit2: TDBEdit
      Left = 151
      Top = 19
      Width = 145
      Height = 24
      DataField = 'inn'
      DataSource = DataSource
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 366
      Top = 19
      Width = 121
      Height = 24
      DataField = 'kpp'
      DataSource = DataSource
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 137
      Top = 60
      Width = 350
      Height = 24
      DataField = 'name_contractor'
      DataSource = DataSource
      ReadOnly = True
      TabOrder = 3
    end
    object btnChooseContractor: TButton
      Left = 8
      Top = 24
      Width = 89
      Height = 25
      Caption = #1042#1099#1073#1088#1072#1090#1100' ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnChooseContractorClick
    end
  end
  object DBEdit1: TDBEdit [12]
    Left = 408
    Top = 103
    Width = 80
    Height = 24
    DataField = 'num_add_contract'
    DataSource = DataSource
    TabOrder = 2
  end
  object DBDateEdit2: TDBDateEdit [13]
    Left = 137
    Top = 179
    Width = 89
    Height = 24
    DataField = 'date_beg'
    DataSource = DataSource
    NumGlyphs = 2
    TabOrder = 4
    Weekends = [Sun, Sat]
    YearDigits = dyFour
  end
  object DBDateEdit3: TDBDateEdit [14]
    Left = 384
    Top = 179
    Width = 89
    Height = 24
    DataField = 'date_end'
    DataSource = DataSource
    NumGlyphs = 2
    TabOrder = 5
    Weekends = [Sun, Sat]
    YearDigits = dyFour
  end
  inherited FormStorage: TFormStorage
    Left = 112
    Top = 224
  end
  inherited DataSource: TDataSource
    Left = 152
    Top = 224
  end
end
