inherited frmEdtAdv: TfrmEdtAdv
  Caption = 'frmEdtAdv'
  ClientHeight = 213
  ClientWidth = 514
  PixelsPerInch = 96
  TextHeight = 16
  inherited Bevel1: TBevel
    Top = 163
    Width = 514
  end
  inherited btnOk: TBitBtn
    Top = 177
    TabOrder = 2
  end
  inherited btnCancel: TBitBtn
    Left = 416
    Top = 177
    TabOrder = 3
  end
  inherited btnClose: TBitBtn
    Left = 208
    Top = 179
    TabOrder = 4
  end
  object GroupBox1: TGroupBox [4]
    Left = 0
    Top = 41
    Width = 514
    Height = 122
    Align = alClient
    Caption = #1044#1086#1075#1086#1074#1086#1088
    TabOrder = 1
    object Label2: TLabel
      Left = 110
      Top = 32
      Width = 30
      Height = 16
      Caption = #1048#1053#1053
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 328
      Top = 32
      Width = 28
      Height = 16
      Caption = #1050#1055#1055
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 16
      Top = 64
      Width = 99
      Height = 16
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 16
      Top = 94
      Width = 108
      Height = 16
      Caption = #1053#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1072
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 328
      Top = 94
      Width = 32
      Height = 16
      Caption = #1044#1072#1090#1072
      FocusControl = DBDateEdit1
    end
    object btnChooseContract: TButton
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
      OnClick = btnChooseContractClick
    end
    object DBEdit2: TDBEdit
      Left = 152
      Top = 24
      Width = 145
      Height = 24
      DataField = 'inn'
      DataSource = DataSource
      ReadOnly = True
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 381
      Top = 24
      Width = 121
      Height = 24
      DataField = 'kpp'
      DataSource = DataSource
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 152
      Top = 56
      Width = 350
      Height = 24
      DataField = 'name_contractor'
      DataSource = DataSource
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 152
      Top = 86
      Width = 145
      Height = 24
      DataField = 'num_contract'
      DataSource = DataSource
      ReadOnly = True
      TabOrder = 4
    end
    object DBDateEdit1: TDBDateEdit
      Left = 381
      Top = 86
      Width = 89
      Height = 24
      DataField = 'date_contract'
      DataSource = DataSource
      ReadOnly = True
      NumGlyphs = 2
      TabOrder = 5
      Weekends = [Sun, Sat]
      YearDigits = dyFour
    end
  end
  object Panel1: TPanel [5]
    Left = 0
    Top = 0
    Width = 514
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 107
      Height = 32
      Caption = #1040#1076#1088#1077#1089#13#10'('#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077')'
      FocusControl = DBEdit1
    end
    object DBEdit1: TDBEdit
      Left = 152
      Top = 16
      Width = 350
      Height = 24
      DataField = 'address_name'
      DataSource = DataSource
      TabOrder = 0
    end
  end
  inherited FormStorage: TFormStorage
    Left = 112
    Top = 176
  end
  inherited DataSource: TDataSource
    Left = 152
    Top = 176
  end
end
