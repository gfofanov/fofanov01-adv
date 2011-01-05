inherited frmSprContract: TfrmSprContract
  Left = 260
  Top = 199
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1076#1086#1075#1086#1074#1086#1088#1086#1074
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    inherited DBGridEh1: TDBGridEh
      Columns = <
        item
          EditButtons = <>
          FieldName = 'NUM_CONTRACT'
          Footers = <>
          Title.Caption = #1044#1086#1075#1086#1074#1086#1088'|'#1053#1086#1084#1077#1088
          Width = 201
        end
        item
          EditButtons = <>
          FieldName = 'DATE_CONTRACT'
          Footers = <>
          Title.Caption = #1044#1086#1075#1086#1074#1086#1088'|'#1044#1072#1090#1072' '#1079#1072#1082#1083#1102#1095
          Width = 77
        end
        item
          EditButtons = <>
          FieldName = 'NUM_ADD_CONTRACT'
          Footers = <>
          Title.Caption = #8470' '#1076#1086#1087'. '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1103
        end
        item
          EditButtons = <>
          FieldName = 'DATE_BEG'
          Footers = <>
          Title.Caption = #1055#1077#1088#1080#1086#1076' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1076#1086#1075#1086#1074#1086#1088#1072'|'#1053#1072#1095#1072#1083#1086
        end
        item
          EditButtons = <>
          FieldName = 'DATE_END'
          Footers = <>
          Title.Caption = #1055#1077#1088#1080#1086#1076' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1076#1086#1075#1086#1074#1086#1088#1072'|'#1054#1082#1086#1085#1095#1072#1085#1080#1077
        end
        item
          EditButtons = <>
          FieldName = 'INN'
          Footers = <>
          Title.Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090'|'#1048#1053#1053
        end
        item
          EditButtons = <>
          FieldName = 'KPP'
          Footers = <>
          Title.Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090'|'#1050#1055#1055
        end
        item
          EditButtons = <>
          FieldName = 'NAME_CONTRACTOR'
          Footers = <>
          Title.Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090'|'#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Width = 326
        end
        item
          EditButtons = <>
          FieldName = 'TYPE_'
          Footers = <>
          Title.Caption = #1058#1080#1087
        end>
    end
  end
  inherited Query: TpFIBDataSet
    SelectSQL.Strings = (
      '-- frmSprContract.Query'
      'select contract.*'
      '       , c.*'
      
        '       , case when c.type_contractor=1 then '#39#1061#1086#1079#1103#1080#1085#39' else '#39#1050#1083#1080#1077#1085 +
        #1090#39' end type_'
      '  from contract, contractor c'
      '  where 0=0'
      '        and contract.id_contractor=c.id_contractor'
      '        @@id@'
      '        @@filter@'
      '  @@sortphrase@ @@sortfield@')
    AutoUpdateOptions.UpdateTableName = 'CONTRACT'
    AutoUpdateOptions.KeyFields = 'ID_CONTRACT'
    AutoUpdateOptions.GeneratorName = 'GEN__ID'
  end
end
