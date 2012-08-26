inherited frmFilterOrder: TfrmFilterOrder
  Caption = #1060#1080#1083#1100#1090#1088' '#1079#1072#1082#1072#1079#1086#1074
  ClientHeight = 268
  ClientWidth = 435
  PixelsPerInch = 96
  TextHeight = 16
  inherited Bevel1: TBevel
    Top = 229
    Width = 435
  end
  inherited btnOk: TBitBtn
    Top = 237
  end
  inherited btnCancel: TBitBtn
    Left = 335
    Top = 237
  end
  inherited Panel1: TPanel
    Width = 435
    Height = 229
    inherited Label2: TLabel
      Width = 435
    end
    object lblName_Customer: TLabel
      Left = 16
      Top = 176
      Width = 76
      Height = 16
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
    end
    object chkFact_Date_Order: TCheckBox
      Left = 16
      Top = 123
      Width = 177
      Height = 17
      Caption = #1060#1072#1082#1090' '#1076#1072#1090#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
      TabOrder = 0
      OnClick = chkFact_Date_OrderClick
    end
    object rgFact_Date_Order: TRadioGroup
      Left = 216
      Top = 99
      Width = 201
      Height = 57
      Enabled = False
      ItemIndex = 0
      Items.Strings = (
        #1055#1091#1089#1090#1072#1103
        #1053#1077' '#1087#1091#1089#1090#1072#1103)
      TabOrder = 1
    end
    object edtName_Contractor: TEdit
      Left = 112
      Top = 176
      Width = 305
      Height = 24
      TabOrder = 2
    end
  end
  inherited fstrFilter: TFormStorage
    StoredProps.Strings = (
      'chkFact_Date_Order.Checked'
      'rgFact_Date_Order.Enabled'
      'rgFact_Date_Order.ItemIndex'
      'edtName_Contractor.Text')
  end
end
