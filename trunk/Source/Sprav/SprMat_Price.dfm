inherited frmSprMat_Price: TfrmSprMat_Price
  Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099', '#1088#1072#1073#1086#1090#1072' '#1080' '#1094#1077#1085#1099
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    Width = 688
    Height = 275
    Align = alTop
    inherited DBGridEh1: TDBGridEh
      Width = 688
      Height = 258
      Columns = <
        item
          EditButtons = <>
          FieldName = 'NAME_MAT'
          Footers = <>
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1072', '#1088#1072#1073#1086#1090#1099
          Width = 297
        end
        item
          EditButtons = <>
          FieldName = 'NAME_SUPPLIER'
          Footers = <>
          Title.Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
          Width = 204
        end
        item
          EditButtons = <>
          FieldName = 'NAME_MEASURE'
          Footers = <>
          Title.Caption = #1045#1076'. '#1080#1079#1084#1077#1088#1077#1085#1080#1103' '#1082#1086#1083'-'#1074#1072
        end
        item
          EditButtons = <>
          FieldName = 'NAME_MEASURE_PRICE'
          Footers = <>
          Title.Caption = #1045#1076'. '#1080#1079#1084#1077#1088#1077#1085#1080#1103' '#1094#1077#1085#1099
        end
        item
          EditButtons = <>
          FieldName = 'KOEF_PRICE'
          Footers = <>
          Title.Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' '#1094#1077#1085#1099
        end
        item
          EditButtons = <>
          FieldName = 'NUM_CALC'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088' '#1072#1083#1075#1086#1088#1080#1090#1084#1072' '#1088#1072#1089#1095#1077#1090#1072
          Visible = False
        end>
    end
    inherited Panel3: TPanel
      Width = 688
      Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1080' '#1088#1072#1073#1086#1090#1072
    end
  end
  inherited RxSplitter1: TRxSplitter
    Left = 0
    Top = 304
    Width = 688
    Height = 3
    Align = alTop
  end
  inherited Panel2: TPanel
    Left = 0
    Top = 307
    Width = 688
    Height = 206
    inherited DBGridEh2: TDBGridEh
      Width = 688
      Height = 189
    end
    inherited Panel4: TPanel
      Width = 688
      Caption = #1062#1077#1085#1099
    end
  end
  inherited QueryLeft: TpFIBDataSet
    SelectSQL.Strings = (
      '-- frmSprMat_Price.QueryLeft'
      'select m.*, s.*'
      '  from spr_mat m, spr_measure s'
      '  where 0=0'
      '        and m.id_spr_measure=s.id_spr_measure'
      '        @@id@'
      '        @@filter@'
      '  @@sortphrase@ @@sortfield@')
    AutoUpdateOptions.GeneratorName = 'GEN__ID'
  end
  inherited QueryRight: TpFIBDataSet
    SelectSQL.Strings = (
      '-- frmSprMat_Price.QueryRight'
      'select *'
      '  from mat_price p'
      '  where 0=0'
      '        and p.id_spr_mat=:id_spr_mat'
      '        @@id@'
      '        @@filter@'
      '  @@sortphrase@ @@sortfield@')
    AutoUpdateOptions.GeneratorName = 'GEN__ID'
  end
end
