inherited frmSprType_Order: TfrmSprType_Order
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1074#1080#1076#1086#1074' '#1079#1072#1082#1072#1079#1086#1074
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    inherited DBGridEh1: TDBGridEh
      Columns = <
        item
          EditButtons = <>
          FieldName = 'name_type_order'
          Footers = <>
          Title.Caption = #1042#1080#1076' '#1079#1072#1082#1072#1079#1072
          Width = 289
        end
        item
          EditButtons = <>
          FieldName = 'name_print'
          Footers = <>
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1076#1083#1103' '#1087#1077#1095#1072#1090#1080
          Width = 165
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'is_no_comp'
          Footers = <>
          Title.Caption = #1053#1077#1090' '#1087#1086#1079#1080#1094#1080#1081' '#1079#1072#1082#1072#1079#1072
          Width = 114
        end>
    end
  end
  inherited Query: TpFIBDataSet
    SelectSQL.Strings = (
      '-- frmSprType_Order.Query'
      'select spr_type_order.*'
      '  from spr_type_order'
      '  where 0=0'
      '        @@id@'
      '        @@filter@'
      '  @@sortphrase@ @@sortfield@')
    AutoUpdateOptions.UpdateTableName = 'SPR_TYPE_ORDER'
    AutoUpdateOptions.KeyFields = 'id_spr_type_order'
    AutoUpdateOptions.GeneratorName = 'GEN_SPR_TYPE_ORDER_ID'
  end
end
