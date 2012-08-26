inherited frmSprMeasure: TfrmSprMeasure
  Left = 279
  Top = 204
  HelpContext = 30
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1077#1076#1080#1085#1080#1094' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    inherited DBGridEh1: TDBGridEh
      Columns = <
        item
          EditButtons = <>
          FieldName = 'NAME_MEASURE'
          Footers = <>
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072'|'#1055#1086#1083#1085#1086#1077
          Width = 96
        end
        item
          EditButtons = <>
          FieldName = 'NAME_MEASURE_SHORT'
          Footers = <>
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072'|'#1050#1088#1072#1090#1082#1086#1077
          Width = 196
        end
        item
          EditButtons = <>
          FieldName = 'NAME_MEASURE_PRICE'
          Footers = <>
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1094#1077#1085#1099'|'#1055#1086#1083#1085#1086#1077
          Width = 148
        end
        item
          EditButtons = <>
          FieldName = 'NAME_MEASURE_PRICE_SHORT'
          Footers = <>
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1094#1077#1085#1099'|'#1050#1088#1072#1090#1082#1086#1077
          Width = 91
        end
        item
          EditButtons = <>
          FieldName = 'KOEF_PRICE'
          Footers = <>
          Title.Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090
          Width = 93
        end>
    end
  end
  inherited Query: TpFIBDataSet
    SelectSQL.Strings = (
      '-- frmSprMeasure.Query'
      'select spr_measure.*'
      '  from spr_measure'
      '  where 0=0'
      '        @@id@'
      '        @@filter@'
      '  @@sortphrase@ @@sortfield@')
    AutoUpdateOptions.UpdateTableName = 'SPR_MEASURE'
    AutoUpdateOptions.KeyFields = 'ID_SPR_MEASURE'
    AutoUpdateOptions.GeneratorName = 'GEN_SPR_MEASURE_ID'
  end
end
