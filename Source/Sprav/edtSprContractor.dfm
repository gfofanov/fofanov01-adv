inherited frmEdtSprContractor: TfrmEdtSprContractor
  Left = 244
  Top = 194
  Caption = 'frmEdtSprContractor'
  ClientHeight = 228
  ClientWidth = 508
  PixelsPerInch = 96
  TextHeight = 16
  inherited Bevel1: TBevel
    Top = 178
    Width = 508
  end
  object Label1: TLabel [1]
    Left = 85
    Top = 16
    Width = 30
    Height = 16
    Caption = #1048#1053#1053
    FocusControl = DBEdit1
  end
  object Label2: TLabel [2]
    Left = 323
    Top = 16
    Width = 28
    Height = 16
    Caption = #1050#1055#1055
    FocusControl = DBEdit2
  end
  object Label3: TLabel [3]
    Left = 8
    Top = 56
    Width = 112
    Height = 16
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    FocusControl = DBEdit3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel [4]
    Left = 8
    Top = 96
    Width = 29
    Height = 16
    Caption = #1058#1080#1087
    FocusControl = DBComboBoxEh1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblPhone: TLabel [5]
    Left = 248
    Top = 96
    Width = 60
    Height = 16
    Caption = #1058#1077#1083#1077#1092#1086#1085
    FocusControl = dbedtPhone
  end
  object lblContact_Person: TLabel [6]
    Left = 8
    Top = 140
    Width = 112
    Height = 16
    Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1086#1077' '#1083#1080#1094#1086
    FocusControl = dbedtContact_Person
  end
  inherited btnOk: TBitBtn
    Top = 192
    TabOrder = 6
  end
  inherited btnCancel: TBitBtn
    Left = 410
    Top = 192
    TabOrder = 7
  end
  inherited btnClose: TBitBtn
    Left = 206
    Top = 194
    TabOrder = 8
  end
  object DBEdit1: TDBEdit [10]
    Left = 121
    Top = 16
    Width = 174
    Height = 24
    DataField = 'inn'
    DataSource = DataSource
    TabOrder = 0
  end
  object DBEdit2: TDBEdit [11]
    Left = 379
    Top = 16
    Width = 121
    Height = 24
    DataField = 'kpp'
    DataSource = DataSource
    TabOrder = 1
  end
  object DBEdit3: TDBEdit [12]
    Left = 121
    Top = 56
    Width = 378
    Height = 24
    DataField = 'name_contractor'
    DataSource = DataSource
    TabOrder = 2
  end
  object DBComboBoxEh1: TDBComboBoxEh [13]
    Left = 57
    Top = 96
    Width = 174
    Height = 24
    DataField = 'type_contractor'
    DataSource = DataSource
    EditButtons = <>
    Items.Strings = (
      #1061#1086#1079#1103#1080#1085
      #1050#1083#1080#1077#1085#1090)
    KeyItems.Strings = (
      '1'
      '2')
    ShowHint = True
    TabOrder = 3
    Tooltips = True
    Visible = True
  end
  object dbedtPhone: TDBEdit [14]
    Left = 314
    Top = 96
    Width = 186
    Height = 24
    DataField = 'phone_contractor'
    DataSource = DataSource
    TabOrder = 4
  end
  object dbedtContact_Person: TDBEdit [15]
    Left = 138
    Top = 140
    Width = 362
    Height = 24
    DataField = 'contact_person'
    DataSource = DataSource
    TabOrder = 5
  end
  inherited FormStorage: TFormStorage
    Left = 352
    Top = 88
  end
  inherited DataSource: TDataSource
    Left = 392
    Top = 88
  end
end
