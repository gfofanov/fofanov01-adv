inherited frmBaseDualList: TfrmBaseDualList
  Caption = 'frmBaseDualList'
  ClientHeight = 532
  Menu = MainMenu1
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  object ToolBar1: TToolBar [0]
    Left = 0
    Top = 0
    Width = 688
    Height = 29
    Caption = 'ToolBar1'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Images = dm.imgProject
    TabOrder = 0
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
      Action = actView
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
      Action = actNew
    end
    object ToolButton5: TToolButton
      Left = 85
      Top = 0
      Action = actEdit
    end
    object ToolButton6: TToolButton
      Left = 108
      Top = 0
      Action = actDelete
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
      Action = actLeftFilter
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
  object StatusBar1: TStatusBar [1]
    Left = 0
    Top = 513
    Width = 688
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 29
    Width = 281
    Height = 484
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
    OnEnter = Panel1Enter
    OnExit = Panel1Exit
    object DBGridEh1: TDBGridEh
      Left = 0
      Top = 17
      Width = 281
      Height = 467
      Align = alClient
      AllowedSelections = [gstRecordBookmarks]
      ColumnDefValues.Title.TitleButton = True
      ColumnDefValues.Title.ToolTips = True
      ColumnDefValues.ToolTips = True
      DataGrouping.GroupLevels = <>
      DataSource = DataSourceLeft
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
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghColumnResize, dghColumnMove]
      ParentFont = False
      PopupMenu = PopupMenuLeft
      RowDetailPanel.Color = clBtnFace
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
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 281
      Height = 17
      Align = alTop
      Caption = #1051#1077#1074#1099#1081
      TabOrder = 1
    end
  end
  object RxSplitter1: TRxSplitter [3]
    Left = 281
    Top = 29
    Width = 3
    Height = 484
    ControlFirst = Panel1
    ControlSecond = Panel2
    Align = alLeft
  end
  object Panel2: TPanel [4]
    Left = 284
    Top = 29
    Width = 404
    Height = 484
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    OnEnter = Panel2Enter
    OnExit = Panel2Exit
    object DBGridEh2: TDBGridEh
      Left = 0
      Top = 17
      Width = 404
      Height = 467
      Align = alClient
      AllowedSelections = [gstRecordBookmarks]
      ColumnDefValues.Title.TitleButton = True
      ColumnDefValues.Title.ToolTips = True
      ColumnDefValues.ToolTips = True
      DataGrouping.GroupLevels = <>
      DataSource = DataSourceRight
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
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghColumnResize, dghColumnMove]
      ParentFont = False
      PopupMenu = PopupMenuRight
      RowDetailPanel.Color = clBtnFace
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
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 404
      Height = 17
      Align = alTop
      Caption = #1055#1088#1072#1074#1099#1081
      TabOrder = 1
    end
  end
  inherited FormStorage: TFormStorage
    StoredProps.Strings = (
      'Panel1.Width')
    Left = 16
    Top = 88
  end
  object ActionList1: TActionList
    Images = dm.imgProject
    OnUpdate = ActionList1Update
    Left = 240
    Top = 32
    object actExit: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100'|'#1047#1072#1082#1088#1099#1090#1080#1077' '#1086#1082#1085#1072
      ImageIndex = 4
      ShortCut = 27
      OnExecute = actExitExecute
    end
    object actNew: TAction
      Category = 'Edit'
      Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077
      Hint = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077'|'#1057#1086#1079#1076#1072#1085#1080#1077' '#1085#1086#1074#1086#1081' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 1
      ShortCut = 45
      OnExecute = actNewExecute
    end
    object actLeftFilter: TAction
      Caption = #1060#1080#1083#1100#1090#1088
      Hint = #1060#1080#1083#1100#1090#1088'|'#1042#1099#1073#1088#1072#1090#1100' '#1085#1091#1078#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 5
      ShortCut = 120
      OnExecute = actLeftFilterExecute
    end
    object actEdit: TAction
      Category = 'Edit'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077'|'#1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 2
      ShortCut = 115
      OnExecute = actEditExecute
    end
    object actDelete: TAction
      Category = 'Edit'
      Caption = #1059#1076#1072#1083#1077#1085#1080#1077
      Hint = #1059#1076#1072#1083#1077#1085#1080#1077'|'#1059#1076#1072#1083#1077#1085#1080#1077' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 3
      ShortCut = 119
      OnExecute = actDeleteExecute
    end
    object actView: TAction
      Category = 'Edit'
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088'|'#1055#1088#1086#1089#1084#1086#1090#1088' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 0
      ShortCut = 114
      OnExecute = actViewExecute
    end
    object actChoose: TAction
      Caption = #1042#1099#1073#1086#1088
      Hint = #1042#1099#1073#1086#1088'|'#1042#1099#1073#1086#1088' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 6
      ShortCut = 13
      OnExecute = actChooseExecute
    end
    object actRefresh: TAction
      Caption = #1055#1077#1088#1077#1095#1080#1090#1072#1090#1100
      Hint = #1055#1077#1088#1077#1095#1080#1090#1072#1090#1100'|'#1047#1072#1085#1086#1074#1086' '#1087#1077#1088#1077#1095#1080#1090#1072#1090#1100' '#1089#1086#1076#1077#1088#1078#1080#1084#1086#1077
      ImageIndex = 8
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
    object actSetupColumns: TAction
      Caption = #1050#1086#1083#1086#1085#1082#1080
      Hint = #1050#1086#1083#1086#1085#1082#1080'|'#1042#1099#1073#1088#1072#1090#1100' '#1085#1091#1078#1085#1099#1077' '#1082#1086#1083#1086#1085#1082#1080
      OnExecute = actSetupColumnsExecute
    end
    object actGetCount: TAction
      Caption = #1050#1086#1083'-'#1074#1086' '#1079#1072#1087#1080#1089#1077#1081
      Hint = #1050#1086#1083'-'#1074#1086' '#1079#1072#1087#1080#1089#1077#1081'|'#1055#1086#1076#1089#1095#1080#1090#1072#1090#1100' '#1082#1086#1083'-'#1074#1086' '#1079#1072#1087#1080#1089#1077#1081
      OnExecute = actGetCountExecute
    end
    object actCopyBuffer: TAction
      Caption = #1042' '#1073#1091#1092#1077#1088
      Hint = #1042' '#1073#1091#1092#1077#1088'|'#1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1089#1086#1076#1077#1088#1078#1080#1084#1086#1077' '#1075#1088#1080#1076#1072' '#1074' '#1073#1091#1092#1077#1088
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
        Action = actView
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object N4: TMenuItem
        Action = actNew
      end
      object N5: TMenuItem
        Action = actEdit
      end
      object N6: TMenuItem
        Action = actDelete
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object N14: TMenuItem
        Action = actLeftFilter
      end
      object N18: TMenuItem
        Action = actRefresh
      end
      object mnuGetCount: TMenuItem
        Action = actGetCount
      end
      object mnuCopyBuffer: TMenuItem
        Action = actCopyBuffer
      end
    end
    object N7: TMenuItem
      Action = actExit
    end
  end
  object PopupMenuLeft: TPopupMenu
    Left = 168
    Top = 64
    object N8: TMenuItem
      Action = actView
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object N10: TMenuItem
      Action = actNew
    end
    object N11: TMenuItem
      Action = actEdit
    end
    object N12: TMenuItem
      Action = actDelete
    end
    object N15: TMenuItem
      Caption = '-'
    end
    object N16: TMenuItem
      Action = actLeftFilter
    end
    object pmnuGetCountLeft: TMenuItem
      Action = actGetCount
    end
    object pmnuCopyBufferLeft: TMenuItem
      Action = actCopyBuffer
    end
  end
  object DataSourceRight: TDataSource
    AutoEdit = False
    DataSet = QueryRight
    OnDataChange = DataSourceRightDataChange
    Left = 448
    Top = 152
  end
  object DataSourceLeft: TDataSource
    AutoEdit = False
    DataSet = QueryLeft
    OnDataChange = DataSourceLeftDataChange
    Left = 104
    Top = 152
  end
  object PopupMenuRight: TPopupMenu
    Left = 448
    Top = 64
    object MenuItem1: TMenuItem
      Action = actView
    end
    object MenuItem2: TMenuItem
      Caption = '-'
    end
    object MenuItem3: TMenuItem
      Action = actNew
    end
    object MenuItem4: TMenuItem
      Action = actEdit
    end
    object MenuItem5: TMenuItem
      Action = actDelete
    end
    object MenuItem6: TMenuItem
      Caption = '-'
    end
    object MenuItem7: TMenuItem
      Action = actLeftFilter
    end
    object pmnuGetCountRight: TMenuItem
      Action = actGetCount
    end
    object pmnuCopyBufferRight: TMenuItem
      Action = actCopyBuffer
    end
  end
  object QueryLeft: TpFIBDataSet
    AutoUpdateOptions.AutoReWriteSqls = True
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.UpdateOnlyModifiedFields = True
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoUpdateOptions.AutoParamsToFields = True
    AutoUpdateOptions.SeparateBlobUpdate = True
    Transaction = dm.pFIBTransaction1
    Database = dm.oDbAdv
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    Left = 136
    Top = 152
    oUseSelectForLock = True
    oStartTransaction = False
  end
  object QueryRight: TpFIBDataSet
    AutoUpdateOptions.AutoReWriteSqls = True
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.UpdateOnlyModifiedFields = True
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoUpdateOptions.AutoParamsToFields = True
    AutoUpdateOptions.SeparateBlobUpdate = True
    Transaction = dm.pFIBTransaction1
    Database = dm.oDbAdv
    AutoCommit = True
    SQLScreenCursor = crSQLWait
    Left = 480
    Top = 152
    oUseSelectForLock = True
    oStartTransaction = False
  end
end
