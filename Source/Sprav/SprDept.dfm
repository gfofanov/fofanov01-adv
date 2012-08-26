inherited frmSprDept: TfrmSprDept
  Left = 189
  Top = 98
  HelpContext = 30
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    inherited DBGridEh1: TDBGridEh
      Columns = <
        item
          EditButtons = <>
          FieldName = 'NUM_DEPT'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
          Width = 93
        end
        item
          EditButtons = <>
          FieldName = 'TYPE_DEPT'
          Footers = <>
          KeyList.Strings = (
            '1'
            '2')
          PickList.Strings = (
            #1062#1077#1093
            #1054#1090#1076#1077#1083)
          Title.Caption = #1058#1080#1087
          Width = 70
        end>
    end
  end
  inherited Query: TOracleDataSet
    SQL.Strings = (
      '-- frmSprDept.Query'
      'select spr_dept.*, spr_dept.rowid'
      '  from spr_dept'
      '  where 0=0'
      '        :id'
      '        :filter'
      '  :sortphrase :sortfield')
    Variables.Data = {
      0300000004000000030000003A4944010000000000000000000000070000003A
      46494C5445520100000000000000000000000B0000003A534F52545048524153
      450100000000000000000000000A0000003A534F52544649454C440100000000
      00000000000000}
    QBEDefinition.QBEFieldDefs = {
      04000000030000000700000049445F44455054010000000000080000004E554D
      5F4445505401000000000009000000545950455F44455054010000000000}
    Active = True
  end
end
