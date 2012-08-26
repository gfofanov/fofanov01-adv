inherited frmEdtOrder: TfrmEdtOrder
  Caption = 'frmEdtOrder'
  ClientHeight = 339
  ClientWidth = 634
  PixelsPerInch = 96
  TextHeight = 16
  inherited Bevel1: TBevel
    Top = 289
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
  object lblName_Customer: TLabel [3]
    Left = 8
    Top = 56
    Width = 54
    Height = 16
    Caption = #1050#1083#1080#1077#1085#1090
    FocusControl = dbedtName_Customer
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblPhone_Customer: TLabel [4]
    Left = 8
    Top = 96
    Width = 139
    Height = 16
    Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1099#1081' '#1090#1077#1083#1077#1092#1086#1085
    FocusControl = dbedtPhone_Customer
  end
  object lblType_Order: TLabel [5]
    Left = 8
    Top = 128
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
  object lblState_order: TLabel [6]
    Left = 312
    Top = 128
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
  object lblSum_Order: TLabel [7]
    Left = 8
    Top = 168
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
  object lblSum_Paid: TLabel [8]
    Left = 205
    Top = 168
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
  object lblSum_Unpaid: TLabel [9]
    Left = 383
    Top = 168
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
  object lblComment_Order: TLabel [10]
    Left = 8
    Top = 208
    Width = 89
    Height = 16
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
  end
  object lblPlan_Date_Order: TLabel [11]
    Left = 8
    Top = 256
    Width = 99
    Height = 16
    Caption = #1055#1083#1072#1085#1086#1074#1072#1103' '#1076#1072#1090#1072
    FocusControl = dbedtPlan_Date_Order
  end
  object lblFact_Date_Order: TLabel [12]
    Left = 255
    Top = 256
    Width = 120
    Height = 16
    Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1072#1103' '#1076#1072#1090#1072
    FocusControl = dbedtFact_Date_Order
  end
  inherited btnOk: TBitBtn
    Top = 303
    TabOrder = 12
  end
  inherited btnCancel: TBitBtn
    Left = 536
    Top = 303
    TabOrder = 13
  end
  inherited btnClose: TBitBtn
    Left = 267
    Top = 305
    TabOrder = 14
  end
  object dbedtNum_Order: TDBEdit [16]
    Left = 64
    Top = 16
    Width = 121
    Height = 24
    DataField = 'num_order'
    DataSource = DataSource
    TabOrder = 0
  end
  object dbedtDate_Order: TDBDateTimeEditEh [17]
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
  object dbedtName_Customer: TDBEdit [18]
    Left = 64
    Top = 56
    Width = 562
    Height = 24
    DataField = 'name_customer'
    DataSource = DataSource
    TabOrder = 2
  end
  object dbedtPhone_Customer: TDBEdit [19]
    Left = 168
    Top = 96
    Width = 177
    Height = 24
    DataField = 'phone_customer'
    DataSource = DataSource
    TabOrder = 3
  end
  object dbcbbType_Order: TDBLookupComboboxEh [20]
    Left = 112
    Top = 126
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
    Top = 128
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
    Left = 107
    Top = 168
    Width = 94
    Height = 24
    currency = True
    DataField = 'sum_order'
    DataSource = DataSource
    EditButtons = <>
    ShowHint = True
    TabOrder = 6
    Visible = True
  end
  object dbedtSum_Paid: TDBNumberEditEh [23]
    Left = 279
    Top = 168
    Width = 98
    Height = 24
    currency = True
    DataField = 'sum_paid'
    DataSource = DataSource
    EditButtons = <>
    ShowHint = True
    TabOrder = 7
    Visible = True
  end
  object dbedtSum_Unpaid: TDBNumberEditEh [24]
    Left = 528
    Top = 168
    Width = 98
    Height = 24
    currency = True
    DataField = 'sum_unpaid'
    DataSource = DataSource
    EditButtons = <>
    ShowHint = True
    TabOrder = 8
    Visible = True
  end
  object dbmmoComment_Order: TDBMemo [25]
    Left = 112
    Top = 200
    Width = 514
    Height = 41
    DataField = 'comment_order'
    DataSource = DataSource
    ScrollBars = ssVertical
    TabOrder = 9
  end
  object dbedtPlan_Date_Order: TDBDateTimeEditEh [26]
    Left = 120
    Top = 256
    Width = 121
    Height = 24
    DataField = 'plan_date_order'
    DataSource = DataSource
    EditButtons = <>
    Kind = dtkDateEh
    ShowHint = True
    TabOrder = 10
    Visible = True
  end
  object dbedtFact_Date_Order: TDBDateTimeEditEh [27]
    Left = 381
    Top = 256
    Width = 121
    Height = 24
    DataField = 'fact_date_order'
    DataSource = DataSource
    EditButtons = <>
    Kind = dtkDateEh
    ShowHint = True
    TabOrder = 11
    Visible = True
  end
  inherited FormStorage: TFormStorage
    Left = 104
    Top = 296
  end
  inherited DataSource: TDataSource
    Left = 144
    Top = 296
  end
  object dsType_Order: TDataSource
    DataSet = dm.qrType_Order
    Left = 256
    Top = 128
  end
  object dsState_Order: TDataSource
    DataSet = dm.qrState_Order
    Left = 504
    Top = 128
  end
end
