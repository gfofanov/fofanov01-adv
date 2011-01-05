inherited frmSprContractor: TfrmSprContractor
  Left = 241
  Top = 170
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1074
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    inherited DBGridEh1: TDBGridEh
      Columns = <
        item
          EditButtons = <>
          FieldName = 'INN'
          Footers = <>
          Title.Caption = #1048#1053#1053
        end
        item
          EditButtons = <>
          FieldName = 'KPP'
          Footers = <>
          Title.Caption = #1050#1055#1055
        end
        item
          EditButtons = <>
          FieldName = 'NAME_CONTRACTOR'
          Footers = <>
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Width = 344
        end
        item
          EditButtons = <>
          FieldName = 'TYPE_'
          Footers = <>
          Title.Caption = #1058#1080#1087' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
          Width = 107
        end>
    end
  end
  inherited Query: TpFIBDataSet
    SelectSQL.Strings = (
      '-- frmSprContractor.Query'
      'select contractor.*'
      
        '       , case when type_contractor=1 then '#39#1061#1086#1079#1103#1080#1085#39' else '#39#1050#1083#1080#1077#1085#1090#39 +
        ' end type_'
      '  from contractor'
      '  where 0=0'
      '        @@id@'
      '        @@filter@'
      '  @@sortphrase@ @@sortfield@')
    AutoUpdateOptions.UpdateTableName = 'CONTRACTOR'
    AutoUpdateOptions.KeyFields = 'ID_CONTRACTOR'
    AutoUpdateOptions.GeneratorName = 'GEN_CONTRACTOR_ID'
  end
end
