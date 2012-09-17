inherited frmOrder: TfrmOrder
  Caption = #1047#1072#1082#1072#1079#1099' '#1080' '#1080#1093' '#1089#1086#1089#1090#1072#1074
  ClientWidth = 821
  PixelsPerInch = 96
  TextHeight = 16
  inherited ToolBar1: TToolBar
    Width = 821
    object btn1: TToolButton
      Left = 224
      Top = 0
      Width = 8
      Caption = 'btn1'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object lblSum_Unpaid: TLabel
      Left = 232
      Top = 0
      Width = 148
      Height = 22
      Caption = #1054#1089#1090#1072#1083#1086#1089#1100' '#1086#1087#1083#1072#1090#1080#1090#1100':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbtxtSum_unpaid: TDBText
      Left = 380
      Top = 0
      Width = 65
      Height = 22
      DataField = 'sum_all_unpaid'
      DataSource = DataSourceLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 821
  end
  inherited Panel1: TPanel
    Width = 821
    Height = 281
    Align = alTop
    inherited DBGridEh1: TDBGridEh
      Width = 821
      Height = 264
      FooterRowCount = 1
      SumList.Active = True
      OnGetCellParams = DBGridEh1GetCellParams
      Columns = <
        item
          EditButtons = <>
          FieldName = 'NUM_ORDER'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088' '#1079#1072#1082#1072#1079#1072
        end
        item
          EditButtons = <>
          FieldName = 'DATE_ORDER'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1079#1072#1082#1072#1079#1072
        end
        item
          EditButtons = <>
          FieldName = 'NAME_Contractor'
          Footers = <>
          Title.Caption = #1050#1083#1080#1077#1085#1090
          Width = 417
        end
        item
          EditButtons = <>
          FieldName = 'SUM_ORDER'
          Footer.FieldName = 'sum_order'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -13
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footer.ToolTips = True
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072' '#1079#1072#1082#1072#1079#1072
        end
        item
          EditButtons = <>
          FieldName = 'SUM_PAID'
          Footer.FieldName = 'sum_paid'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -13
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footer.ToolTips = True
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072' '#1086#1087#1083#1072#1095#1077#1085#1086
        end
        item
          EditButtons = <>
          FieldName = 'SUM_UNPAID'
          Footer.FieldName = 'sum_unpaid'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -13
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footer.ToolTips = True
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1054#1089#1090#1072#1083#1086#1089#1100' '#1086#1087#1083#1072#1090#1080#1090#1100
        end
        item
          EditButtons = <>
          FieldName = 'COMMENT_ORDER'
          Footers = <>
          Title.Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
          Width = 396
        end
        item
          EditButtons = <>
          FieldName = 'PLAN_DATE_ORDER'
          Footers = <>
          Title.Caption = #1055#1083#1072#1085#1080#1088#1091#1077#1084#1072#1103' '#1076#1072#1090#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
          Width = 101
        end
        item
          EditButtons = <>
          FieldName = 'FACT_DATE_ORDER'
          Footers = <>
          Title.Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1086
        end
        item
          EditButtons = <>
          FieldName = 'NAME_TYPE_ORDER'
          Footers = <>
          Title.Caption = #1042#1080#1076' '#1079#1072#1082#1072#1079#1072
        end
        item
          EditButtons = <>
          FieldName = 'NAME_STATUS'
          Footers = <>
          Title.Caption = #1057#1090#1072#1090#1091#1089' '#1079#1072#1082#1072#1079#1072
          Width = 209
        end
        item
          EditButtons = <>
          FieldName = 'sum_discount'
          Footers = <>
          Title.Caption = #1042' '#1090'.'#1095'. '#1089#1091#1084#1084#1072' '#1089#1082#1080#1076#1082#1080
          Width = 82
        end
        item
          EditButtons = <>
          FieldName = 'discount_perc'
          Footers = <>
          Title.Caption = '% '#1089#1082#1080#1076#1082#1080
        end
        item
          EditButtons = <>
          FieldName = 'PHONE_CONTRACTOR'
          Footers = <>
          Title.Caption = #1058#1077#1083#1077#1092#1086#1085
          Width = 148
        end
        item
          EditButtons = <>
          FieldName = 'contact_person'
          Footers = <>
          Title.Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1086#1077' '#1083#1080#1094#1086
          Width = 118
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'is_cash'
          Footers = <>
          Title.Caption = #1053#1072#1083#1080#1095#1085#1099#1077
        end
        item
          EditButtons = <>
          FieldName = 'plan_date_pay'
          Footers = <>
          Title.Caption = #1055#1083#1072#1085'. '#1076#1072#1090#1072' '#1086#1087#1083#1072#1090#1099
          Width = 77
        end
        item
          EditButtons = <>
          FieldName = 'sum_wo_discount'
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072' '#1073#1077#1079' '#1089#1082#1080#1076#1082#1080
        end>
    end
    inherited Panel3: TPanel
      Width = 821
      Caption = #1047#1072#1082#1072#1079#1099
    end
  end
  inherited RxSplitter1: TRxSplitter
    Left = 0
    Top = 310
    Width = 821
    Height = 3
    Align = alTop
  end
  inherited Panel2: TPanel
    Left = 0
    Top = 313
    Width = 821
    Height = 200
    inherited DBGridEh2: TDBGridEh
      Width = 821
      Height = 183
      OnDblClick = DBGridEh2DblClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'NAME_MAT'
          Footers = <>
          Title.Caption = #1052#1072#1090#1077#1088#1080#1072#1083' '#1080#1083#1080' '#1088#1072#1073#1086#1090#1072
          Width = 161
        end
        item
          EditButtons = <>
          FieldName = 'NAME_FILE'
          Footers = <>
          Title.Caption = #1060#1072#1081#1083
          Width = 172
        end
        item
          EditButtons = <>
          FieldName = 'QUANT_MAT'
          Footers = <>
          Title.Caption = #1050#1086#1083'-'#1074#1086
        end
        item
          EditButtons = <>
          FieldName = 'NAME_MEASURE_SHORT'
          Footers = <>
          Title.Caption = #1045#1076'. '#1080#1079#1084#1077#1088#1077#1085#1080#1103
        end
        item
          EditButtons = <>
          FieldName = 'PRICE_MAT'
          Footers = <>
          Title.Caption = #1062#1077#1085#1072
        end
        item
          EditButtons = <>
          FieldName = 'SUM_ITOG'
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072' '#1080#1090#1086#1075#1086
        end
        item
          EditButtons = <>
          FieldName = 'SIZEX'
          Footers = <>
          Title.Caption = #1056#1072#1079#1084#1077#1088' X'
        end
        item
          EditButtons = <>
          FieldName = 'SIZEY'
          Footers = <>
          Title.Caption = #1056#1072#1079#1084#1077#1088' Y'
        end
        item
          EditButtons = <>
          FieldName = 'SIZE_AREA'
          Footers = <>
          Title.Caption = #1055#1083#1086#1097#1072#1076#1100
        end
        item
          EditButtons = <>
          FieldName = 'QUALITY_PRINT'
          Footers = <>
          Title.Caption = #1050#1072#1095#1077#1089#1090#1074#1086
        end
        item
          EditButtons = <>
          FieldName = 'FACT_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'COMMENT_LINE'
          Footers = <>
          Title.Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
          Width = 103
        end
        item
          EditButtons = <>
          FieldName = 'NAME_SUPPLIER'
          Footers = <>
          Title.Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
        end
        item
          EditButtons = <>
          FieldName = 'sum_mat'
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072' '#1073#1077#1079' '#1089#1082#1080#1076#1082#1080
        end
        item
          EditButtons = <>
          FieldName = 'sum_discount'
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072' '#1089#1082#1080#1076#1082#1080
        end>
    end
    inherited Panel4: TPanel
      Width = 821
      Caption = #1055#1086#1079#1080#1094#1080#1080' '#1079#1072#1082#1072#1079#1072' ('#1076#1074#1086#1081#1085#1086#1081' '#1097#1077#1083#1095#1086#1082'-'#1091#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1076#1072#1090#1091' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103')'
    end
  end
  inherited QueryLeft: TpFIBDataSet
    SelectSQL.Strings = (
      '-- frmOrder.QueryLeft'
      'select order_doc.*, t.name_type_order, s.name_status'
      '     , c.*'
      ', (select sum(sum_unpaid) from order_doc) sum_all_unpaid'
      '  from order_doc, spr_type_order t, spr_state_order s'
      '     , contractor c'
      '  where 0=0'
      '        and order_doc.id_spr_type_order=t.id_spr_type_order'
      '        and order_doc.id_spr_state_order=s.id_spr_state_order'
      '        and order_doc.id_contractor=c.id_contractor'
      '        @@id@'
      '        @@filter@'
      '  @@sortphrase@ @@sortfield@')
    AutoUpdateOptions.UpdateTableName = 'ORDER_DOC'
    AutoUpdateOptions.KeyFields = 'ID_ORDER'
    AutoUpdateOptions.GeneratorName = 'GEN_ORDER_DOC_ID'
  end
  inherited QueryRight: TpFIBDataSet
    SelectSQL.Strings = (
      '-- frmOrder.QueryRight'
      'select order_comp.*, m.*, s.*'
      '  from order_comp, spr_mat m, spr_measure s'
      '  where 0=0'
      '        and order_comp.id_spr_mat=m.id_spr_mat'
      '        and m.id_spr_measure=s.id_spr_measure'
      '        and order_comp.id_order=:id_order'
      '        @@id@'
      '        @@filter@'
      '  @@sortphrase@ @@sortfield@')
    AutoUpdateOptions.UpdateTableName = 'ORDER_COMP'
    AutoUpdateOptions.KeyFields = 'ID_ORDER_COMP'
    AutoUpdateOptions.GeneratorName = 'GEN_ORDER_COMP_ID'
  end
end
