inherited frmEdtOrder: TfrmEdtOrder
  Top = 357
  Caption = 'frmEdtOrder'
  ClientHeight = 435
  ClientWidth = 634
  PixelsPerInch = 96
  TextHeight = 16
  inherited Bevel1: TBevel
    Top = 385
    Width = 634
  end
  object lblNumOrder: TLabel [1]
    Left = 8
    Top = 16
    Width = 49
    Height = 16
    Caption = #1053#1086#1084#1077#1088
    FocusControl = dbedtNum_Order
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDate_Order: TLabel [2]
    Left = 332
    Top = 16
    Width = 37
    Height = 16
    Caption = #1044#1072#1090#1072
    FocusControl = dbedtDate_Order
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblPhone_Customer: TLabel [3]
    Left = 8
    Top = 152
    Width = 139
    Height = 16
    Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1099#1081' '#1090#1077#1083#1077#1092#1086#1085
    FocusControl = dbedtPhone_Customer
  end
  object lblType_Order: TLabel [4]
    Left = 8
    Top = 184
    Width = 86
    Height = 16
    Caption = #1042#1080#1076' '#1079#1072#1082#1072#1079#1072
    FocusControl = dbcbbType_Order
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblState_order: TLabel [5]
    Left = 312
    Top = 184
    Width = 110
    Height = 16
    Caption = #1057#1090#1072#1090#1091#1089' '#1079#1072#1082#1072#1079#1072
    FocusControl = dbcbbState_Order
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblSum_Order: TLabel [6]
    Left = 8
    Top = 224
    Width = 106
    Height = 16
    Caption = #1057#1091#1084#1084#1072' '#1079#1072#1082#1072#1079#1072
    FocusControl = dbedtSum_Order
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblSum_Paid: TLabel [7]
    Left = 26
    Top = 258
    Width = 75
    Height = 16
    Caption = #1054#1087#1083#1072#1095#1077#1085#1086
    FocusControl = dbedtSum_Paid
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblSum_Unpaid: TLabel [8]
    Left = 216
    Top = 258
    Width = 144
    Height = 16
    Caption = #1054#1089#1090#1072#1083#1086#1089#1100' '#1086#1087#1083#1072#1090#1080#1090#1100
    FocusControl = dbedtSum_Unpaid
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblComment_Order: TLabel [9]
    Left = 8
    Top = 304
    Width = 89
    Height = 16
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
  end
  object lblPlan_Date_Order: TLabel [10]
    Left = 8
    Top = 352
    Width = 99
    Height = 16
    Caption = #1055#1083#1072#1085#1086#1074#1072#1103' '#1076#1072#1090#1072
    FocusControl = dbedtPlan_Date_Order
  end
  object lblFact_Date_Order: TLabel [11]
    Left = 255
    Top = 352
    Width = 120
    Height = 16
    Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1072#1103' '#1076#1072#1090#1072
    FocusControl = dbedtFact_Date_Order
  end
  object lblSum_Discount: TLabel [12]
    Left = 381
    Top = 224
    Width = 145
    Height = 16
    Caption = #1042' '#1090'.'#1095'. '#1089#1091#1084#1084#1072' '#1089#1082#1080#1076#1082#1080
    FocusControl = dbedtSum_Discount
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDiscount_Perc: TLabel [13]
    Left = 220
    Top = 224
    Width = 69
    Height = 16
    Caption = '% '#1089#1082#1080#1076#1082#1080
    FocusControl = dbedtDiscount_Perc
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited btnOk: TBitBtn
    Top = 399
    TabOrder = 14
  end
  inherited btnCancel: TBitBtn
    Left = 536
    Top = 399
    TabOrder = 15
  end
  inherited btnClose: TBitBtn
    Left = 267
    Top = 401
    TabOrder = 16
  end
  object dbedtNum_Order: TDBEdit [17]
    Left = 64
    Top = 16
    Width = 121
    Height = 24
    DataField = 'num_order'
    DataSource = DataSource
    ReadOnly = True
    TabOrder = 0
  end
  object dbedtDate_Order: TDBDateTimeEditEh [18]
    Left = 381
    Top = 16
    Width = 121
    Height = 24
    DataField = 'date_order'
    DataSource = DataSource
    EditButtons = <>
    Kind = dtkDateEh
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
  object dbedtPhone_Customer: TDBEdit [19]
    Left = 168
    Top = 152
    Width = 177
    Height = 24
    DataField = 'phone_customer'
    DataSource = DataSource
    TabOrder = 3
  end
  object dbcbbType_Order: TDBLookupComboboxEh [20]
    Left = 112
    Top = 182
    Width = 153
    Height = 24
    DataField = 'id_spr_type_order'
    DataSource = DataSource
    DropDownBox.Columns = <
      item
        FieldName = 'NAME_TYPE_ORDER'
        Title.Caption = #1042#1080#1076' '#1079#1072#1082#1072#1079#1072
        Title.ToolTips = True
      end>
    DropDownBox.ListSource = dsType_Order
    DropDownBox.Options = [dlgColumnResizeEh, dlgRowLinesEh]
    DropDownBox.ShowTitles = True
    DropDownBox.Sizable = True
    EditButtons = <>
    KeyField = 'ID_SPR_TYPE_ORDER'
    ListField = 'NAME_TYPE_ORDER'
    ListSource = dsType_Order
    ShowHint = True
    TabOrder = 4
    Visible = True
  end
  object dbcbbState_Order: TDBLookupComboboxEh [21]
    Left = 424
    Top = 184
    Width = 202
    Height = 24
    DataField = 'id_spr_state_order'
    DataSource = DataSource
    DropDownBox.Columns = <
      item
        FieldName = 'NAME_STATUS'
        Title.Caption = #1057#1090#1072#1090#1091#1089
        Title.ToolTips = True
      end>
    DropDownBox.ListSource = dsState_Order
    DropDownBox.Options = [dlgColumnResizeEh, dlgRowLinesEh]
    DropDownBox.ShowTitles = True
    DropDownBox.Sizable = True
    EditButtons = <>
    KeyField = 'ID_SPR_STATE_ORDER'
    ListField = 'NAME_STATUS'
    ListSource = dsState_Order
    ShowHint = True
    TabOrder = 5
    Visible = True
  end
  object dbedtSum_Order: TDBNumberEditEh [22]
    Left = 120
    Top = 224
    Width = 94
    Height = 24
    currency = True
    DataField = 'sum_order'
    DataSource = DataSource
    Enabled = False
    EditButtons = <>
    ReadOnly = True
    ShowHint = True
    TabOrder = 6
    Visible = True
  end
  object dbedtSum_Paid: TDBNumberEditEh [23]
    Left = 112
    Top = 258
    Width = 98
    Height = 24
    currency = True
    DataField = 'sum_paid'
    DataSource = DataSource
    EditButtons = <>
    ShowHint = True
    TabOrder = 9
    Visible = True
    OnChange = dbedtSum_PaidChange
  end
  object dbedtSum_Unpaid: TDBNumberEditEh [24]
    Left = 364
    Top = 258
    Width = 98
    Height = 24
    currency = True
    DataField = 'sum_unpaid'
    DataSource = DataSource
    Enabled = False
    EditButtons = <>
    ReadOnly = True
    ShowHint = True
    TabOrder = 10
    Visible = True
  end
  object dbmmoComment_Order: TDBMemo [25]
    Left = 112
    Top = 296
    Width = 514
    Height = 41
    DataField = 'comment_order'
    DataSource = DataSource
    ScrollBars = ssVertical
    TabOrder = 11
  end
  object dbedtPlan_Date_Order: TDBDateTimeEditEh [26]
    Left = 120
    Top = 352
    Width = 121
    Height = 24
    DataField = 'plan_date_order'
    DataSource = DataSource
    EditButtons = <>
    Kind = dtkDateEh
    ShowHint = True
    TabOrder = 12
    Visible = True
  end
  object dbedtFact_Date_Order: TDBDateTimeEditEh [27]
    Left = 381
    Top = 352
    Width = 121
    Height = 24
    DataField = 'fact_date_order'
    DataSource = DataSource
    EditButtons = <>
    Kind = dtkDateEh
    ShowHint = True
    TabOrder = 13
    Visible = True
  end
  object grpContractor: TGroupBox [28]
    Left = 8
    Top = 46
    Width = 617
    Height = 91
    Caption = #1050#1083#1080#1077#1085#1090
    TabOrder = 2
    object lblInn: TLabel
      Left = 103
      Top = 24
      Width = 30
      Height = 16
      Caption = #1048#1053#1053
      FocusControl = dbedtInn
    end
    object lblKpp: TLabel
      Left = 332
      Top = 26
      Width = 28
      Height = 16
      Caption = #1050#1055#1055
      FocusControl = dbedtKpp
    end
    object lblName_Customer: TLabel
      Left = 34
      Top = 55
      Width = 99
      Height = 16
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FocusControl = dbedtName_Customer
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
    object dbedtInn: TDBEdit
      Left = 152
      Top = 24
      Width = 153
      Height = 24
      DataField = 'inn'
      DataSource = DataSource
      ReadOnly = True
      TabOrder = 1
    end
    object dbedtKpp: TDBEdit
      Left = 389
      Top = 26
      Width = 121
      Height = 24
      DataField = 'kpp'
      DataSource = DataSource
      ReadOnly = True
      TabOrder = 2
    end
    object dbedtName_Customer: TDBEdit
      Left = 152
      Top = 56
      Width = 449
      Height = 24
      DataField = 'name_contractor'
      DataSource = DataSource
      ReadOnly = True
      TabOrder = 3
    end
  end
  object dbedtSum_Discount: TDBNumberEditEh [29]
    Left = 532
    Top = 224
    Width = 94
    Height = 24
    currency = True
    DataField = 'sum_discount'
    DataSource = DataSource
    Enabled = False
    EditButtons = <>
    ReadOnly = True
    ShowHint = True
    TabOrder = 8
    Visible = True
  end
  object dbedtDiscount_Perc: TDBNumberEditEh [30]
    Left = 295
    Top = 224
    Width = 80
    Height = 24
    currency = True
    DataField = 'discount_perc'
    DataSource = DataSource
    EditButtons = <>
    ShowHint = True
    TabOrder = 7
    Visible = True
  end
  inherited FormStorage: TFormStorage
    Left = 104
    Top = 368
  end
  inherited DataSource: TDataSource
    Left = 144
    Top = 368
  end
  object dsType_Order: TDataSource
    DataSet = dm.qrType_Order
    Left = 256
    Top = 184
  end
  object dsState_Order: TDataSource
    DataSet = dm.qrState_Order
    Left = 504
    Top = 184
  end
end
