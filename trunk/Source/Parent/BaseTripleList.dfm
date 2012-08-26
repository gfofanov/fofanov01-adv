inherited frmBaseTripleList: TfrmBaseTripleList
  Left = 186
  Top = 156
  Width = 776
  Height = 545
  Caption = 'frmBaseTripleList'
  Menu = MainMenu1
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 768
    Height = 228
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    OnEnter = Panel1Enter
    OnExit = Panel1Exit
    object DBGridEh1: TDBGridEh
      Left = 0
      Top = 46
      Width = 768
      Height = 182
      Align = alClient
      AllowedSelections = [gstRecordBookmarks]
      ColumnDefValues.Title.TitleButton = True
      ColumnDefValues.Title.ToolTips = True
      ColumnDefValues.ToolTips = True
      DataSource = DataSourceFirst
      Flat = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch]
      ParentFont = False
      PopupMenu = PopupMenuFirst
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      UseMultiTitle = True
      VTitleMargin = 5
      OnMouseDown = DBGridEh1MouseDown
      OnSortMarkingChanged = DBGridEh1SortMarkingChanged
    end
    object Panel3: TPanel
      Left = 0
      Top = 29
      Width = 768
      Height = 17
      Align = alTop
      Caption = #1055#1077#1088#1074#1099#1081
      TabOrder = 1
    end
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 768
      Height = 29
      Caption = 'ToolBar1'
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Flat = True
      Images = dm.imgHRMS
      TabOrder = 2
      object ToolButton9: TToolButton
        Left = 0
        Top = 0
        Action = actChoose
      end
      object ToolButton1: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        Style = tbsSeparator
      end
      object ToolButton2: TToolButton
        Left = 31
        Top = 0
        Action = actFirstView
      end
      object ToolButton3: TToolButton
        Left = 54
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton4: TToolButton
        Left = 62
        Top = 0
        Action = actFirstNew
      end
      object ToolButton5: TToolButton
        Left = 85
        Top = 0
        Action = actFirstEdit
      end
      object ToolButton6: TToolButton
        Left = 108
        Top = 0
        Action = actFirstDelete
      end
      object ToolButton13: TToolButton
        Left = 131
        Top = 0
        Width = 8
        Caption = 'ToolButton13'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object ToolButton12: TToolButton
        Left = 139
        Top = 0
        Action = actRefresh
      end
      object ToolButton7: TToolButton
        Left = 162
        Top = 0
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object ToolButton10: TToolButton
        Left = 170
        Top = 0
        Action = actFirstFilter
      end
      object ToolButton11: TToolButton
        Left = 193
        Top = 0
        Width = 8
        Caption = 'ToolButton11'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object ToolButton8: TToolButton
        Left = 201
        Top = 0
        Action = actExit
      end
    end
  end
  object RxSplitter1: TRxSplitter [1]
    Left = 0
    Top = 228
    Width = 768
    Height = 3
    ControlFirst = Panel1
    ControlSecond = Panel2
    Align = alTop
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 231
    Width = 768
    Height = 271
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object StatusBar1: TStatusBar
      Left = 0
      Top = 252
      Width = 768
      Height = 19
      Panels = <>
      SimplePanel = False
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 369
      Height = 252
      Align = alLeft
      BevelOuter = bvNone
      PopupMenu = PopupMenuSecond
      TabOrder = 0
      OnEnter = Panel5Enter
      OnExit = Panel5Exit
      object DBGridEh2: TDBGridEh
        Left = 0
        Top = 17
        Width = 369
        Height = 235
        Align = alClient
        AllowedSelections = [gstRecordBookmarks]
        ColumnDefValues.Title.TitleButton = True
        ColumnDefValues.Title.ToolTips = True
        ColumnDefValues.ToolTips = True
        DataSource = DataSourceSecond
        Flat = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch]
        ParentFont = False
        PopupMenu = PopupMenuSecond
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        VTitleMargin = 5
        OnMouseDown = DBGridEh1MouseDown
        OnSortMarkingChanged = DBGridEh1SortMarkingChanged
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 369
        Height = 17
        Align = alTop
        Caption = #1042#1090#1086#1088#1086#1081
        TabOrder = 1
      end
    end
    object RxSplitter2: TRxSplitter
      Left = 369
      Top = 0
      Width = 3
      Height = 252
      ControlFirst = Panel5
      ControlSecond = Panel6
      Align = alLeft
    end
    object Panel6: TPanel
      Left = 372
      Top = 0
      Width = 396
      Height = 252
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      OnEnter = Panel6Enter
      OnExit = Panel6Exit
      object DBGridEh3: TDBGridEh
        Left = 0
        Top = 17
        Width = 396
        Height = 235
        Align = alClient
        AllowedSelections = [gstRecordBookmarks]
        ColumnDefValues.Title.TitleButton = True
        ColumnDefValues.Title.ToolTips = True
        ColumnDefValues.ToolTips = True
        DataSource = DataSourceThird
        Flat = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch]
        ParentFont = False
        PopupMenu = PopupMenuThird
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        UseMultiTitle = True
        VTitleMargin = 5
        OnMouseDown = DBGridEh1MouseDown
        OnSortMarkingChanged = DBGridEh1SortMarkingChanged
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 396
        Height = 17
        Align = alTop
        Caption = #1058#1088#1077#1090#1080#1081
        TabOrder = 1
      end
    end
  end
  inherited FormStorage: TFormStorage
    StoredProps.Strings = (
      'Panel1.Width')
    Left = 16
    Top = 88
  end
  object ActionList1: TActionList
    Images = dm.imgHRMS
    OnUpdate = ActionList1Update
    Left = 240
    Top = 32
    object actSecondView: TAction
      Category = 'EditSecond'
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088'|'#1055#1088#1086#1089#1084#1086#1090#1088' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 0
      ShortCut = 114
      OnExecute = actSecondViewExecute
    end
    object actExit: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100'|'#1047#1072#1082#1088#1099#1090#1080#1077' '#1086#1082#1085#1072
      ImageIndex = 4
      ShortCut = 27
      OnExecute = actExitExecute
    end
    object actFirstView: TAction
      Category = 'EditFirst'
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088'|'#1055#1088#1086#1089#1084#1086#1090#1088' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 0
      ShortCut = 114
      OnExecute = actFirstViewExecute
    end
    object actFirstNew: TAction
      Category = 'EditFirst'
      Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077
      Hint = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077'|'#1057#1086#1079#1076#1072#1085#1080#1077' '#1085#1086#1074#1086#1081' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 1
      ShortCut = 45
      OnExecute = actFirstNewExecute
    end
    object actFirstEdit: TAction
      Category = 'EditFirst'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077'|'#1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 2
      ShortCut = 115
      OnExecute = actFirstEditExecute
    end
    object actFirstDelete: TAction
      Category = 'EditFirst'
      Caption = #1059#1076#1072#1083#1077#1085#1080#1077
      Hint = #1059#1076#1072#1083#1077#1085#1080#1077'|'#1059#1076#1072#1083#1077#1085#1080#1077' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 3
      ShortCut = 119
      OnExecute = actFirstDeleteExecute
    end
    object actRefresh: TAction
      Caption = #1055#1077#1088#1077#1095#1080#1090#1072#1090#1100
      Hint = #1055#1077#1088#1077#1095#1080#1090#1072#1090#1100'|'#1047#1072#1085#1086#1074#1086' '#1087#1077#1088#1077#1095#1080#1090#1072#1090#1100' '#1089#1086#1076#1077#1088#1078#1080#1084#1086#1077
      ImageIndex = 8
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actFirstFilter: TAction
      Category = 'EditFirst'
      Caption = #1060#1080#1083#1100#1090#1088
      Hint = #1060#1080#1083#1100#1090#1088'|'#1042#1099#1073#1088#1072#1090#1100' '#1085#1091#1078#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 5
      ShortCut = 120
      OnExecute = actFirstFilterExecute
    end
    object actChoose: TAction
      Caption = #1042#1099#1073#1086#1088
      Hint = #1042#1099#1073#1086#1088'|'#1042#1099#1073#1086#1088' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 6
      ShortCut = 13
      OnExecute = actChooseExecute
    end
    object actSetupColumns: TAction
      Caption = #1050#1086#1083#1086#1085#1082#1080
      Hint = #1050#1086#1083#1086#1085#1082#1080'|'#1042#1099#1073#1088#1072#1090#1100' '#1085#1091#1078#1085#1099#1077' '#1082#1086#1083#1086#1085#1082#1080
      OnExecute = actSetupColumnsExecute
    end
    object actSecondNew: TAction
      Category = 'EditSecond'
      Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077
      Hint = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077'|'#1057#1086#1079#1076#1072#1085#1080#1077' '#1085#1086#1074#1086#1081' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 1
      ShortCut = 45
      OnExecute = actSecondNewExecute
    end
    object actSecondEdit: TAction
      Category = 'EditSecond'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077'|'#1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 2
      ShortCut = 115
      OnExecute = actSecondEditExecute
    end
    object actSecondDelete: TAction
      Category = 'EditSecond'
      Caption = #1059#1076#1072#1083#1077#1085#1080#1077
      Hint = #1059#1076#1072#1083#1077#1085#1080#1077'|'#1059#1076#1072#1083#1077#1085#1080#1077' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 3
      ShortCut = 119
      OnExecute = actSecondDeleteExecute
    end
    object actSecondFilter: TAction
      Category = 'EditSecond'
      Caption = #1060#1080#1083#1100#1090#1088
      Hint = #1060#1080#1083#1100#1090#1088'|'#1042#1099#1073#1088#1072#1090#1100' '#1085#1091#1078#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 5
      ShortCut = 120
      OnExecute = actSecondFilterExecute
    end
    object actThirdView: TAction
      Category = 'EditThird'
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088'|'#1055#1088#1086#1089#1084#1086#1090#1088' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 0
      ShortCut = 114
      OnExecute = actThirdViewExecute
    end
    object actThirdNew: TAction
      Category = 'EditThird'
      Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077
      Hint = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077'|'#1057#1086#1079#1076#1072#1085#1080#1077' '#1085#1086#1074#1086#1081' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 1
      ShortCut = 45
      OnExecute = actThirdNewExecute
    end
    object actThirdEdit: TAction
      Category = 'EditThird'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077'|'#1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 2
      ShortCut = 115
      OnExecute = actThirdEditExecute
    end
    object actThirdDelete: TAction
      Category = 'EditThird'
      Caption = #1059#1076#1072#1083#1077#1085#1080#1077
      Hint = #1059#1076#1072#1083#1077#1085#1080#1077'|'#1059#1076#1072#1083#1077#1085#1080#1077' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 3
      ShortCut = 119
      OnExecute = actThirdDeleteExecute
    end
    object actThirdFilter: TAction
      Category = 'EditThird'
      Caption = #1060#1080#1083#1100#1090#1088
      Hint = #1060#1080#1083#1100#1090#1088'|'#1042#1099#1073#1088#1072#1090#1100' '#1085#1091#1078#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 5
      ShortCut = 120
      OnExecute = actThirdFilterExecute
    end
    object actGetCount: TAction
      Caption = #1050#1086#1083'-'#1074#1086' '#1079#1072#1087#1080#1089#1077#1081
      Hint = #1050#1086#1083'-'#1074#1086' '#1079#1072#1087#1080#1089#1077#1081'|'#1055#1086#1076#1089#1095#1080#1090#1072#1090#1100' '#1082#1086#1083'-'#1074#1086' '#1079#1072#1087#1080#1089#1077#1081
      OnExecute = actGetCountExecute
    end
    object actCopyBuffer: TAction
      Caption = #1042' '#1073#1091#1092#1077#1088
      Hint = #1042' '#1073#1091#1092#1077#1088'|'#1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1089#1086#1076#1077#1088#1078#1080#1084#1086#1077' '#1089#1087#1080#1089#1082#1072' '#1074' '#1073#1091#1092#1077#1088
      ImageIndex = 15
      ShortCut = 16451
      OnExecute = actCopyBufferExecute
    end
  end
  object MainMenu1: TMainMenu
    Left = 272
    Top = 32
    object N1: TMenuItem
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103
      object N2: TMenuItem
        Action = actFirstView
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object N4: TMenuItem
        Action = actFirstNew
      end
      object N5: TMenuItem
        Action = actFirstEdit
      end
      object N6: TMenuItem
        Action = actFirstDelete
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object N14: TMenuItem
        Action = actFirstFilter
      end
      object N18: TMenuItem
        Action = actRefresh
      end
      object mnuCopyBuffer: TMenuItem
        Action = actCopyBuffer
      end
      object mnuGetCount: TMenuItem
        Action = actGetCount
      end
    end
    object N7: TMenuItem
      Action = actExit
    end
  end
  object PopupMenuFirst: TPopupMenu
    Left = 168
    Top = 64
    object N8: TMenuItem
      Action = actFirstView
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object N10: TMenuItem
      Action = actFirstNew
    end
    object N11: TMenuItem
      Action = actFirstEdit
    end
    object N12: TMenuItem
      Action = actFirstDelete
    end
    object N15: TMenuItem
      Caption = '-'
    end
    object N16: TMenuItem
      Action = actFirstFilter
    end
  end
  object DataSourceSecond: TDataSource
    AutoEdit = False
    DataSet = QuerySecond
    Left = 80
    Top = 392
  end
  object QuerySecond: TOracleDataSet
    OracleDictionary.DefaultValues = True
    OracleDictionary.FieldKinds = True
    OracleDictionary.DisplayFormats = True
    OracleDictionary.RangeValues = True
    OracleDictionary.RequiredFields = False
    QueryAllRecords = False
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    DesignActivation = True
    Left = 112
    Top = 392
  end
  object QueryFirst: TOracleDataSet
    OracleDictionary.DefaultValues = True
    OracleDictionary.FieldKinds = True
    OracleDictionary.DisplayFormats = True
    OracleDictionary.RangeValues = True
    OracleDictionary.RequiredFields = False
    QueryAllRecords = False
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    DesignActivation = True
    Left = 136
    Top = 152
  end
  object DataSourceFirst: TDataSource
    AutoEdit = False
    DataSet = QueryFirst
    OnDataChange = DataSourceFirstDataChange
    Left = 104
    Top = 152
  end
  object PopupMenuSecond: TPopupMenu
    Left = 176
    Top = 320
    object MenuItem1: TMenuItem
      Action = actSecondView
    end
    object MenuItem2: TMenuItem
      Caption = '-'
    end
    object MenuItem3: TMenuItem
      Action = actSecondNew
    end
    object MenuItem4: TMenuItem
      Action = actSecondEdit
    end
    object MenuItem5: TMenuItem
      Action = actSecondDelete
    end
    object MenuItem6: TMenuItem
      Caption = '-'
    end
    object MenuItem7: TMenuItem
      Action = actSecondFilter
    end
  end
  object DataSourceThird: TDataSource
    AutoEdit = False
    DataSet = QueryThird
    Left = 512
    Top = 352
  end
  object QueryThird: TOracleDataSet
    OracleDictionary.DefaultValues = True
    OracleDictionary.FieldKinds = True
    OracleDictionary.DisplayFormats = True
    OracleDictionary.RangeValues = True
    OracleDictionary.RequiredFields = False
    QueryAllRecords = False
    RefreshOptions = [roBeforeEdit, roAfterInsert, roAfterUpdate, roAllFields]
    DesignActivation = True
    Left = 544
    Top = 352
  end
  object PopupMenuThird: TPopupMenu
    Left = 432
    Top = 336
    object MenuItem8: TMenuItem
      Action = actThirdView
    end
    object MenuItem9: TMenuItem
      Caption = '-'
    end
    object MenuItem10: TMenuItem
      Action = actThirdNew
    end
    object MenuItem11: TMenuItem
      Action = actThirdEdit
    end
    object MenuItem12: TMenuItem
      Action = actThirdDelete
    end
    object MenuItem13: TMenuItem
      Caption = '-'
    end
    object MenuItem14: TMenuItem
      Action = actThirdFilter
    end
  end
end
