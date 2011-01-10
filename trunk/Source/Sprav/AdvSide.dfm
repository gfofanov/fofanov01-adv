inherited frmAdvSide: TfrmAdvSide
  Caption = #1056#1077#1082#1083#1072#1084#1085#1099#1077' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080' '#1080' '#1080#1093' '#1089#1090#1086#1088#1086#1085#1099
  ClientHeight = 551
  PixelsPerInch = 96
  TextHeight = 16
  inherited StatusBar1: TStatusBar
    Top = 532
  end
  inherited Panel1: TPanel
    Width = 688
    Height = 204
    Align = alTop
    inherited DBGridEh1: TDBGridEh
      Width = 688
      Height = 187
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ADDRESS_NAME'
          Footers = <>
          Title.Caption = #1040#1076#1088#1077#1089' '#1080#1083#1080' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080
          Width = 193
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
          Width = 306
        end
        item
          EditButtons = <>
          FieldName = 'TYPE_'
          Footers = <>
          Title.Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090'|'#1058#1080#1087
          Width = 55
        end
        item
          EditButtons = <>
          FieldName = 'NUM_CONTRACT'
          Footers = <>
          Title.Caption = #1044#1086#1075#1086#1074#1086#1088'|'#1053#1086#1084#1077#1088
          Width = 220
        end
        item
          EditButtons = <>
          FieldName = 'DATE_CONTRACT'
          Footers = <>
          Title.Caption = #1044#1086#1075#1086#1074#1086#1088'|'#1044#1072#1090#1072' '#1079#1072#1082#1083#1102#1095
          Width = 83
        end
        item
          EditButtons = <>
          FieldName = 'NUM_ADD_CONTRACT'
          Footers = <>
          Title.Caption = #8470' '#1076#1086#1087' '#1089#1086#1075#1083#1072#1096
        end
        item
          EditButtons = <>
          FieldName = 'DATE_BEG'
          Footers = <>
          Title.Caption = #1055#1077#1088#1080#1086#1076' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1076#1086#1075#1086#1074#1086#1088#1072'|'#1053#1072#1095#1072#1083#1086
          Width = 82
        end
        item
          EditButtons = <>
          FieldName = 'DATE_END'
          Footers = <>
          Title.Caption = #1055#1077#1088#1080#1086#1076' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1076#1086#1075#1086#1074#1086#1088#1072'|'#1054#1082#1086#1085#1095#1072#1085#1080#1077
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'IS_PHOTO'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          Title.Caption = #1045#1089#1090#1100' '#1092#1086#1090#1086
        end>
    end
    inherited Panel3: TPanel
      Width = 688
      Caption = #1056#1077#1082#1083#1072#1084#1085#1099#1077' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080
    end
  end
  inherited RxSplitter1: TRxSplitter
    Left = 0
    Top = 233
    Width = 688
    Height = 3
    Align = alTop
  end
  inherited Panel2: TPanel
    Left = 0
    Top = 236
    Width = 688
    Height = 296
    inherited DBGridEh2: TDBGridEh
      Width = 688
      Height = 279
      Columns = <
        item
          EditButtons = <>
          FieldName = 'WIDTH'
          Footers = <>
          Title.Caption = #1064#1080#1088#1080#1085#1072
        end
        item
          EditButtons = <>
          FieldName = 'HEIGHT'
          Footers = <>
          Title.Caption = #1042#1099#1089#1086#1090#1072
        end
        item
          EditButtons = <>
          FieldName = 'TYPE_SIDE_'
          Footers = <>
          Title.Caption = #1058#1080#1087' '#1089#1090#1086#1088#1086#1085#1099
          Width = 78
        end
        item
          EditButtons = <>
          FieldName = 'LOCATION_SIDE_'
          Footers = <>
          Title.Caption = #1056#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077' '#1089#1090#1086#1088#1086#1085#1099
          Width = 77
        end
        item
          EditButtons = <>
          FieldName = 'DATE_FACT'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1092#1072#1082#1090' '#1091#1089#1090#1072#1085#1086#1074#1082#1080
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'NUM_CONTRACT'
          Footers = <>
          Title.Caption = #1044#1086#1075#1086#1074#1086#1088'|'#1053#1086#1084#1077#1088
        end
        item
          EditButtons = <>
          FieldName = 'DATE_CONTRACT'
          Footers = <>
          Title.Caption = #1044#1086#1075#1086#1074#1086#1088'|'#1044#1072#1090#1072' '#1079#1072#1082#1083#1102#1095
          Width = 79
        end
        item
          EditButtons = <>
          FieldName = 'NUM_ADD_CONTRACT'
          Footers = <>
          Title.Caption = #8470' '#1076#1086#1087' '#1089#1086#1075#1083#1072#1096
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
          Width = 82
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
          Width = 140
        end
        item
          EditButtons = <>
          FieldName = 'TYPE_CONTRACTOR_'
          Footers = <>
          Title.Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090'|'#1058#1080#1087
        end
        item
          EditButtons = <>
          FieldName = 'PRICE'
          Footers = <>
          Title.Caption = #1062#1077#1085#1072
        end
        item
          EditButtons = <>
          FieldName = 'DATE_BEG1'
          Footers = <>
          Title.Caption = #1055#1077#1088#1080#1086#1076' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1094#1077#1085#1099'|'#1053#1072#1095#1072#1083#1086
        end
        item
          EditButtons = <>
          FieldName = 'DATE_END1'
          Footers = <>
          Title.Caption = #1055#1077#1088#1080#1086#1076' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1094#1077#1085#1099'|'#1054#1082#1086#1085#1095#1072#1085#1080#1077
        end
        item
          Checkboxes = True
          EditButtons = <>
          FieldName = 'is_photo'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          Title.Caption = #1045#1089#1090#1100' '#1092#1086#1090#1086
        end>
    end
    inherited Panel4: TPanel
      Width = 688
      Caption = #1057#1090#1086#1088#1086#1085#1099' '#1088#1077#1082#1083#1072#1084#1085#1086#1081' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080
    end
  end
  inherited FormStorage: TFormStorage
    StoredProps.Strings = (
      'Panel1.Width'
      'Panel1.Height')
  end
  inherited ActionList1: TActionList
    object actDateFactSet: TAction
      Category = 'Service'
      Caption = #1047#1072#1076#1072#1090#1100' '#1076#1072#1090#1091' '#1091#1089#1090#1072#1085#1086#1074#1082#1080
      Hint = #1047#1072#1076#1072#1090#1100' '#1076#1072#1090#1091' '#1091#1089#1090#1072#1085#1086#1074#1082#1080'|'#1047#1072#1076#1072#1090#1100' '#1076#1072#1090#1091' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1086#1081' '#1091#1089#1090#1072#1085#1086#1074#1082#1080
      OnExecute = actDateFactSetExecute
    end
    object actDateFactUnset: TAction
      Category = 'Service'
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1076#1072#1090#1091' '#1091#1089#1090#1072#1085#1086#1074#1082#1080
      OnExecute = actDateFactUnsetExecute
    end
    object actLoadPhotoAdv: TAction
      Category = 'Service'
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1086#1090#1086' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1086#1090#1086' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080'|'#1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1086#1090#1086' '#1088#1077#1082#1083#1072#1084#1085#1086#1081' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080
      OnExecute = actLoadPhotoAdvExecute
    end
    object actLoadPhotoSide: TAction
      Category = 'Service'
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1086#1090#1086' '#1089#1090#1086#1088#1086#1085#1099
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1086#1090#1086' '#1089#1090#1086#1088#1086#1085#1099'|'#1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1086#1090#1086' '#1089#1090#1086#1088#1086#1085#1099
      OnExecute = actLoadPhotoSideExecute
    end
    object actShowPhotoAdv: TAction
      Category = 'Service'
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1092#1086#1090#1086' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1092#1086#1090#1086' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080'|'#1055#1088#1086#1089#1084#1086#1090#1088' '#1092#1086#1090#1086' '#1088#1077#1082#1083#1072#1084#1085#1086#1081' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080
      OnExecute = actShowPhotoAdvExecute
    end
    object actShowPhotoSide: TAction
      Category = 'Service'
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1092#1086#1090#1086' '#1089#1090#1086#1088#1086#1085#1099
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1092#1086#1090#1086' '#1089#1090#1086#1088#1086#1085#1099'|'#1055#1088#1086#1089#1084#1086#1090#1088' '#1092#1086#1090#1086' '#1089#1090#1086#1088#1086#1085#1099
      OnExecute = actShowPhotoSideExecute
    end
    object actRepFreeAdv: TAction
      Category = 'Reports'
      Caption = #1057#1074#1086#1073#1086#1076#1085#1099#1077' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080
      Hint = #1057#1074#1086#1073#1086#1076#1085#1099#1077' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080'|'#1054#1090#1095#1077#1090' '#1087#1086' '#1089#1074#1086#1073#1086#1076#1085#1099#1084' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1103#1084
      OnExecute = actRepFreeAdvExecute
    end
    object actDelPhotoAdv: TAction
      Category = 'Service'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1092#1086#1090#1086' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1092#1086#1090#1086' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080'|'#1059#1076#1072#1083#1080#1090#1100' '#1092#1086#1090#1086' '#1088#1077#1082#1083#1072#1084#1085#1086#1081' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080
      OnExecute = actDelPhotoAdvExecute
    end
    object actDelPhotoSide: TAction
      Category = 'Service'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1092#1086#1090#1086' '#1089#1090#1086#1088#1086#1085#1099
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1092#1086#1090#1086' '#1089#1090#1086#1088#1086#1085#1099'|'#1059#1076#1072#1083#1080#1090#1100' '#1092#1086#1090#1086' '#1089#1090#1086#1088#1086#1085#1099
      OnExecute = actDelPhotoSideExecute
    end
    object actRepAdvwoSide: TAction
      Category = 'Reports'
      Caption = #1050#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080' '#1073#1077#1079' '#1089#1090#1086#1088#1086#1085
      Hint = #1050#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080' '#1073#1077#1079' '#1089#1090#1086#1088#1086#1085'|'#1054#1090#1095#1077#1090' '#1087#1086' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1103#1084' '#1073#1077#1079' '#1089#1090#1086#1088#1086#1085
      OnExecute = actRepAdvwoSideExecute
    end
  end
  inherited MainMenu1: TMainMenu
    object N35: TMenuItem [1]
      Caption = #1054#1090#1095#1077#1090#1099
      object N36: TMenuItem
        Action = actRepFreeAdv
      end
      object N42: TMenuItem
        Action = actRepAdvwoSide
      end
    end
    object N19: TMenuItem [2]
      Caption = #1057#1077#1088#1074#1080#1089
      object N20: TMenuItem
        Action = actDateFactSet
      end
      object N21: TMenuItem
        Action = actDateFactUnset
      end
      object N28: TMenuItem
        Caption = '-'
      end
      object N17: TMenuItem
        Action = actLoadPhotoAdv
      end
      object N27: TMenuItem
        Action = actShowPhotoAdv
      end
      object N37: TMenuItem
        Action = actDelPhotoAdv
      end
      object N26: TMenuItem
        Caption = '-'
      end
      object N25: TMenuItem
        Action = actLoadPhotoSide
      end
      object N33: TMenuItem
        Action = actShowPhotoSide
      end
      object N39: TMenuItem
        Action = actDelPhotoSide
      end
    end
  end
  inherited PopupMenuLeft: TPopupMenu
    object N29: TMenuItem
      Caption = '-'
    end
    object N30: TMenuItem
      Action = actLoadPhotoAdv
    end
    object N31: TMenuItem
      Action = actShowPhotoAdv
    end
    object N38: TMenuItem
      Action = actDelPhotoAdv
    end
  end
  inherited PopupMenuRight: TPopupMenu
    object N22: TMenuItem
      Caption = '-'
    end
    object N23: TMenuItem
      Action = actDateFactSet
    end
    object N41: TMenuItem
      Caption = '-'
    end
    object N24: TMenuItem
      Action = actDateFactUnset
    end
    object N32: TMenuItem
      Action = actLoadPhotoSide
    end
    object N34: TMenuItem
      Action = actShowPhotoSide
    end
    object N40: TMenuItem
      Action = actDelPhotoSide
    end
  end
  inherited QueryLeft: TpFIBDataSet
    SelectSQL.Strings = (
      '-- frmAdvSide.QueryLeft'
      'select adv.*'
      '       , c.*, r.*'
      
        '       , case when r.type_contractor=1 then '#39#1061#1086#1079#1103#1080#1085#39' else '#39#1050#1083#1080#1077#1085 +
        #1090#39' end type_'
      
        '       , case when adv.photo is not null then 1 else 0 end is_ph' +
        'oto'
      '  from adv, contract c, contractor r'
      '  where 0=0'
      '        and adv.id_contract=c.id_contract'
      '        and c.id_contractor=r.id_contractor'
      '        @@id@'
      '        @@filter@'
      '  @@sortphrase@ @@sortfield@')
    AutoUpdateOptions.UpdateTableName = 'ADV'
    AutoUpdateOptions.KeyFields = 'ID_ADV'
    AutoUpdateOptions.GeneratorName = 'GEN_ADV_ID'
  end
  inherited QueryRight: TpFIBDataSet
    SelectSQL.Strings = (
      '-- frmAdvSide.QueryRight'
      'select side.*'
      '       , c.*, r.*, p.*'
      '       , case when r.type_contractor=1 then '#39#1061#1086#1079#1103#1080#1085#39
      '              when r.type_contractor=2 then '#39#1050#1083#1080#1077#1085#1090#39
      '              else null'
      '         end type_contractor_'
      '       , case when side.type_side=1 then '#39#1041#1072#1085#1085#1077#1088#39
      '              when side.type_side=2 then '#39#1057#1074#1077#1090#1086#1074#1072#1103#39
      '              else '#39#1053#1077#1080#1079#1074#1077#1089#1090#1085#1086#39
      '         end type_side_'
      '       , case when side.location_side=1 then '#39#1055#1077#1088#1077#1076#1085#1103#1103#39
      '              when side.location_side=2 then '#39#1051#1077#1074#1072#1103#39
      '              when side.location_side=3 then '#39#1047#1072#1076#1085#1103#1103#39
      '              when side.location_side=4 then '#39#1055#1088#1072#1074#1072#1103#39
      '              else '#39#1053#1077#1080#1079#1074#1077#1089#1090#1085#1086#39
      '         end location_side_'
      
        '       , case when side.photo is not null then 1 else 0 end is_p' +
        'hoto'
      '  from side'
      '  left outer join contract c'
      '  on (side.id_contract=c.id_contract)'
      '  left outer join contractor r'
      '  on (c.id_contractor=r.id_contractor)'
      '  left outer join price_contract p'
      '  on (side.id_price_contract=p.id_price_contract)'
      '  where 0=0'
      '        and id_adv=:id_adv'
      '        @@id@'
      '        @@filter@'
      '  @@sortphrase@ @@sortfield@')
    AutoUpdateOptions.UpdateTableName = 'SIDE'
    AutoUpdateOptions.KeyFields = 'ID_SIDE'
    AutoUpdateOptions.GeneratorName = 'GEN_SIDE_ID'
  end
end
