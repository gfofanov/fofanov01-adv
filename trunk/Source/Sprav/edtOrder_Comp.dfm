inherited frmEdtOrder_Comp: TfrmEdtOrder_Comp
  Caption = 'frmEdtOrder_Comp'
  ClientHeight = 352
  ClientWidth = 683
  PixelsPerInch = 96
  TextHeight = 16
  inherited Bevel1: TBevel
    Top = 302
    Width = 683
  end
  object lblSpr_Mat: TLabel [1]
    Left = 8
    Top = 16
    Width = 75
    Height = 16
    Caption = #1052#1072#1090#1077#1088#1080#1072#1083
    FocusControl = dbcbbSpr_Mat
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblSum_Order: TLabel [2]
    Left = 8
    Top = 80
    Width = 80
    Height = 32
    Caption = #1057#1091#1084#1084#1072' '#1073#1077#1079#13#10#1089#1082#1080#1076#1082#1080
    FocusControl = dbedtSum_Mat
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblSum_Paid: TLabel [3]
    Left = 220
    Top = 88
    Width = 104
    Height = 16
    Caption = #1057#1091#1084#1084#1072' '#1089#1082#1080#1076#1082#1080
    FocusControl = dbedtSum_Discount
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblSum_Unpaid: TLabel [4]
    Left = 463
    Top = 80
    Width = 110
    Height = 32
    Caption = #1057#1091#1084#1084#1072' '#1089#13#10#1091#1095#1077#1090#1086#1084' '#1089#1082#1080#1076#1082#1080
    FocusControl = dbedtSum_Itog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblQuant_Mat: TLabel [5]
    Left = 8
    Top = 50
    Width = 51
    Height = 16
    Caption = #1050#1086#1083'-'#1074#1086
    FocusControl = dbedtQuant_Mat
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblPrice_Mat: TLabel [6]
    Left = 220
    Top = 50
    Width = 127
    Height = 16
    Caption = #1062#1077#1085#1072' '#1079#1072' '#1077#1076#1080#1085#1080#1094#1091
    FocusControl = dbedtPrice_Mat
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblName_File: TLabel [7]
    Left = 8
    Top = 128
    Width = 72
    Height = 16
    Caption = #1048#1084#1103' '#1092#1072#1081#1083#1072
  end
  object lblSizeX: TLabel [8]
    Left = 8
    Top = 168
    Width = 61
    Height = 16
    Caption = #1056#1072#1079#1084#1077#1088' X'
    FocusControl = dbedtSizeX
  end
  object lblSizeY: TLabel [9]
    Left = 236
    Top = 168
    Width = 62
    Height = 16
    Caption = #1056#1072#1079#1084#1077#1088' Y'
    FocusControl = dbedtSizeY
  end
  object lblSize_Area: TLabel [10]
    Left = 479
    Top = 168
    Width = 58
    Height = 16
    Caption = #1055#1083#1086#1097#1072#1076#1100
    FocusControl = dbedtSize_Area
  end
  object lblQuality_Print: TLabel [11]
    Left = 8
    Top = 208
    Width = 112
    Height = 16
    Caption = #1050#1072#1095#1077#1089#1090#1074#1086' '#1087#1077#1095#1072#1090#1080
  end
  object lblDate_Order: TLabel [12]
    Left = 260
    Top = 208
    Width = 120
    Height = 16
    Caption = #1060#1072#1082#1090'. '#1076#1072#1090#1072' '#1087#1077#1095#1072#1090#1080
    FocusControl = dbedtDate_Order
  end
  object lblComment_Order: TLabel [13]
    Left = 8
    Top = 264
    Width = 89
    Height = 16
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
  end
  object lblName_Measure: TLabel [14]
    Left = 466
    Top = 50
    Width = 97
    Height = 16
    Caption = #1045#1076'. '#1080#1079#1084#1077#1088#1077#1085#1080#1103
  end
  inherited btnOk: TBitBtn
    Top = 316
    TabOrder = 14
  end
  inherited btnCancel: TBitBtn
    Left = 585
    Top = 316
    TabOrder = 15
  end
  inherited btnClose: TBitBtn
    Left = 291
    Top = 318
    TabOrder = 16
  end
  object dbcbbSpr_Mat: TDBLookupComboboxEh [18]
    Left = 112
    Top = 14
    Width = 562
    Height = 24
    DataField = 'id_spr_mat'
    DataSource = DataSource
    DropDownBox.ColumnDefValues.ToolTips = True
    DropDownBox.Columns = <
      item
        FieldName = 'NAME_MAT'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Title.ToolTips = True
      end
      item
        FieldName = 'NAME_MEASURE_SHORT'
        Title.Caption = #1045#1076'. '#1080#1079#1084#1077#1088#1077#1085#1080#1103
        Title.ToolTips = True
      end
      item
        FieldName = 'NAME_MEASURE_PRICE_SHORT'
        Title.Caption = #1045#1076'. '#1080#1079#1084#1077#1088#1077#1085#1080#1103' '#1094#1077#1085#1099
        Title.ToolTips = True
      end>
    DropDownBox.ListSource = dsSpr_Mat
    DropDownBox.Options = [dlgColumnResizeEh, dlgRowLinesEh]
    DropDownBox.ShowTitles = True
    DropDownBox.Sizable = True
    EditButtons = <>
    KeyField = 'ID_SPR_MAT'
    ListField = 'NAME_MAT'
    ListSource = dsSpr_Mat
    ShowHint = True
    TabOrder = 0
    Tooltips = True
    Visible = True
  end
  object dbedtSum_Mat: TDBNumberEditEh [19]
    Left = 120
    Top = 88
    Width = 94
    Height = 24
    currency = True
    DataField = 'sum_mat'
    DataSource = DataSource
    Enabled = False
    EditButtons = <>
    ReadOnly = True
    ShowHint = True
    TabOrder = 4
    Visible = True
  end
  object dbedtSum_Discount: TDBNumberEditEh [20]
    Left = 342
    Top = 88
    Width = 107
    Height = 24
    currency = True
    DataField = 'sum_discount'
    DataSource = DataSource
    Enabled = False
    EditButtons = <>
    ReadOnly = True
    ShowHint = True
    TabOrder = 5
    Visible = True
  end
  object dbedtSum_Itog: TDBNumberEditEh [21]
    Left = 577
    Top = 80
    Width = 98
    Height = 24
    currency = True
    DataField = 'sum_itog'
    DataSource = DataSource
    Enabled = False
    EditButtons = <>
    ReadOnly = True
    ShowHint = True
    TabOrder = 6
    Visible = True
  end
  object dbedtQuant_Mat: TDBNumberEditEh [22]
    Left = 112
    Top = 50
    Width = 94
    Height = 24
    currency = False
    DataField = 'quant_mat'
    DataSource = DataSource
    DecimalPlaces = 3
    EditButtons = <>
    ShowHint = True
    TabOrder = 1
    Visible = True
    OnChange = dbedtQuant_MatChange
  end
  object dbedtPrice_Mat: TDBNumberEditEh [23]
    Left = 353
    Top = 50
    Width = 107
    Height = 24
    currency = True
    DataField = 'price_mat'
    DataSource = DataSource
    EditButtons = <>
    ShowHint = True
    TabOrder = 2
    Visible = True
    OnChange = dbedtPrice_MatChange
  end
  object dbedtSizeX: TDBNumberEditEh [24]
    Left = 112
    Top = 168
    Width = 94
    Height = 24
    currency = False
    DataField = 'sizeX'
    DataSource = DataSource
    EditButtons = <>
    ShowHint = True
    TabOrder = 8
    Visible = True
    OnChange = dbedtSizeXChange
  end
  object dbedtSizeY: TDBNumberEditEh [25]
    Left = 342
    Top = 168
    Width = 107
    Height = 24
    currency = False
    DataField = 'sizeY'
    DataSource = DataSource
    EditButtons = <>
    ShowHint = True
    TabOrder = 9
    Visible = True
    OnChange = dbedtSizeYChange
  end
  object dbedtSize_Area: TDBNumberEditEh [26]
    Left = 576
    Top = 168
    Width = 98
    Height = 24
    currency = False
    DataField = 'size_Area'
    DataSource = DataSource
    Enabled = False
    EditButtons = <>
    ReadOnly = True
    ShowHint = True
    TabOrder = 10
    Visible = True
  end
  object dbedtDate_Order: TDBDateTimeEditEh [27]
    Left = 400
    Top = 208
    Width = 121
    Height = 24
    DataField = 'fact_date'
    DataSource = DataSource
    EditButtons = <>
    Kind = dtkDateEh
    ShowHint = True
    TabOrder = 12
    Visible = True
  end
  object dbmmoComment_Order: TDBMemo [28]
    Left = 112
    Top = 248
    Width = 498
    Height = 41
    DataField = 'comment_line'
    DataSource = DataSource
    ScrollBars = ssVertical
    TabOrder = 13
  end
  object dbcbbQuality_Print: TDBComboBoxEh [29]
    Left = 126
    Top = 208
    Width = 121
    Height = 24
    DataField = 'quality_print'
    DataSource = DataSource
    DropDownBox.Sizable = True
    EditButtons = <>
    Items.Strings = (
      '360'
      '540'
      '720')
    ShowHint = True
    TabOrder = 11
    Tooltips = True
    Visible = True
  end
  object fnedtName_File: TsFilenameEdit [30]
    Left = 112
    Top = 128
    Width = 562
    Height = 21
    AutoSize = False
    MaxLength = 255
    TabOrder = 7
    OnChange = fnedtName_FileChange
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'Tahoma'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    SkinData.SkinSection = 'EDIT'
    GlyphMode.Blend = 0
    GlyphMode.Grayed = False
    FilterIndex = 2
    Filter = 'All files (*.*)|*.*|Jpeg files (*.jpg)|*.jpg'
  end
  object dbedtName_Measure: TDBEdit [31]
    Left = 577
    Top = 50
    Width = 98
    Height = 24
    DataField = 'name_measure_price_short'
    DataSource = DataSource
    Enabled = False
    ReadOnly = True
    TabOrder = 3
  end
  inherited FormStorage: TFormStorage
    Left = 128
    Top = 288
  end
  inherited DataSource: TDataSource
    Left = 168
    Top = 288
  end
  object dsSpr_Mat: TDataSource
    DataSet = dm.qrSpr_Mat
    Left = 256
    Top = 16
  end
end
