inherited frmEdtSprSide: TfrmEdtSprSide
  Caption = 'frmEdtSprSide'
  ClientHeight = 267
  ClientWidth = 517
  PixelsPerInch = 96
  TextHeight = 16
  inherited Bevel1: TBevel
    Top = 217
    Width = 517
  end
  inherited btnOk: TBitBtn
    Top = 231
    TabOrder = 2
  end
  inherited btnCancel: TBitBtn
    Left = 419
    Top = 231
    TabOrder = 3
  end
  inherited btnClose: TBitBtn
    Left = 210
    Top = 233
    TabOrder = 4
  end
  object GroupBox1: TGroupBox [4]
    Left = 0
    Top = 90
    Width = 517
    Height = 127
    Align = alClient
    Caption = #1044#1086#1075#1086#1074#1086#1088
    TabOrder = 1
    object Label5: TLabel
      Left = 110
      Top = 32
      Width = 30
      Height = 16
      Caption = #1048#1053#1053
      FocusControl = DBEdit2
    end
    object Label6: TLabel
      Left = 328
      Top = 32
      Width = 28
      Height = 16
      Caption = #1050#1055#1055
      FocusControl = DBEdit3
    end
    object Label7: TLabel
      Left = 16
      Top = 64
      Width = 99
      Height = 16
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FocusControl = DBEdit4
    end
    object Label8: TLabel
      Left = 16
      Top = 94
      Width = 108
      Height = 16
      Caption = #1053#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1072
      FocusControl = DBEdit5
    end
    object Label9: TLabel
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
    Width = 517
    Height = 90
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 51
      Height = 16
      Caption = #1064#1080#1088#1080#1085#1072
      FocusControl = edtWidth
    end
    object Label2: TLabel
      Left = 176
      Top = 16
      Width = 48
      Height = 16
      Caption = #1042#1099#1089#1086#1090#1072
      FocusControl = edtHeight
    end
    object Label3: TLabel
      Left = 8
      Top = 56
      Width = 25
      Height = 16
      Caption = #1058#1080#1087
      FocusControl = DBComboBoxEh1
    end
    object Label4: TLabel
      Left = 224
      Top = 56
      Width = 97
      Height = 16
      Caption = #1056#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077
      FocusControl = DBComboBoxEh2
    end
    object edtWidth: TDBEdit
      Left = 72
      Top = 8
      Width = 89
      Height = 24
      DataField = 'Width'
      DataSource = DataSource
      TabOrder = 0
    end
    object edtHeight: TDBEdit
      Left = 240
      Top = 8
      Width = 89
      Height = 24
      DataField = 'Height'
      DataSource = DataSource
      TabOrder = 1
    end
    object DBComboBoxEh1: TDBComboBoxEh
      Left = 72
      Top = 48
      Width = 129
      Height = 24
      DataField = 'type_side'
      DataSource = DataSource
      EditButtons = <>
      Items.Strings = (
        #1041#1072#1085#1085#1077#1088
        #1057#1074#1077#1090#1086#1074#1072#1103)
      KeyItems.Strings = (
        '1'
        '2')
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object DBComboBoxEh2: TDBComboBoxEh
      Left = 336
      Top = 48
      Width = 121
      Height = 24
      DataField = 'location_side'
      DataSource = DataSource
      EditButtons = <>
      Items.Strings = (
        #1055#1077#1088#1077#1076#1085#1103#1103
        #1051#1077#1074#1072#1103
        #1047#1072#1076#1085#1103#1103
        #1055#1088#1072#1074#1072#1103)
      KeyItems.Strings = (
        '1'
        '2'
        '3'
        '4')
      ShowHint = True
      TabOrder = 3
      Visible = True
    end
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
