inherited frmFilterOrder: TfrmFilterOrder
  Caption = #1060#1080#1083#1100#1090#1088' '#1079#1072#1082#1072#1079#1086#1074
  ClientHeight = 366
  ClientWidth = 435
  PixelsPerInch = 96
  TextHeight = 16
  inherited Bevel1: TBevel
    Top = 327
    Width = 435
  end
  inherited btnOk: TBitBtn
    Top = 335
  end
  inherited btnCancel: TBitBtn
    Left = 335
    Top = 335
  end
  inherited Panel1: TPanel
    Width = 435
    Height = 327
    inherited Label2: TLabel
      Width = 435
    end
    object lblName_Customer: TLabel
      Left = 16
      Top = 168
      Width = 47
      Height = 16
      Caption = #1050#1083#1080#1077#1085#1090
    end
    object lbldate_order_end: TLabel
      Left = 272
      Top = 278
      Width = 16
      Height = 16
      Caption = #1076#1086
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
      Top = 168
      Width = 305
      Height = 24
      TabOrder = 2
    end
    object edtSum_Unpayment: TEdit
      Left = 226
      Top = 222
      Width = 80
      Height = 24
      Enabled = False
      TabOrder = 4
      Text = '0'
    end
    object chkSum_Unpayment: TCheckBox
      Left = 16
      Top = 222
      Width = 204
      Height = 17
      Caption = #1054#1089#1090#1072#1083#1086#1089#1100' '#1086#1087#1083#1072#1090#1080#1090#1100' '#1073#1086#1083#1077#1077
      TabOrder = 3
      OnClick = chkSum_UnpaymentClick
    end
    object rgSum_Unpayment: TRadioGroup
      Left = 312
      Top = 198
      Width = 105
      Height = 57
      Enabled = False
      ItemIndex = 0
      Items.Strings = (
        #1056#1091#1073#1083#1077#1081
        #1055#1088#1086#1094#1077#1085#1090#1086#1074)
      TabOrder = 5
    end
    object chkDate_Order: TCheckBox
      Left = 16
      Top = 278
      Width = 129
      Height = 17
      Caption = #1044#1072#1090#1072' '#1079#1072#1082#1072#1079#1072' '#1086#1090
      TabOrder = 6
      OnClick = chkDate_OrderClick
    end
    object dedtDate_Order_Beg: TsDateEdit
      Left = 160
      Top = 278
      Width = 97
      Height = 21
      AutoSize = False
      Enabled = False
      EditMask = '!99/99/9999;1; '
      MaxLength = 10
      TabOrder = 7
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
      DefaultToday = True
      DialogTitle = #1042#1099#1073#1086#1088' '#1076#1072#1090#1099
      Weekends = [dowSaturday, dowSunday, dowLocaleDefault]
    end
    object dedtDate_Order_End: TsDateEdit
      Left = 312
      Top = 278
      Width = 105
      Height = 21
      AutoSize = False
      Enabled = False
      EditMask = '!99/99/9999;1; '
      MaxLength = 10
      TabOrder = 8
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      SkinData.SkinSection = 'EDIT'
      GlyphMode.Blend = 0
      GlyphMode.Grayed = False
      DefaultToday = True
      DialogTitle = #1042#1099#1073#1086#1088' '#1076#1072#1090#1099
      Weekends = [dowSaturday, dowSunday, dowLocaleDefault]
    end
  end
  inherited fstrFilter: TFormStorage
    StoredProps.Strings = (
      'chkFact_Date_Order.Checked'
      'rgFact_Date_Order.Enabled'
      'rgFact_Date_Order.ItemIndex'
      'edtName_Contractor.Text'
      'chkSum_Unpayment.Checked'
      'rgSum_Unpayment.Enabled'
      'rgSum_Unpayment.ItemIndex'
      'edtSum_Unpayment.Enabled'
      'edtSum_Unpayment.Text'
      'chkDate_Order.Checked'
      'dedtDate_Order_Beg.Date'
      'dedtDate_Order_End.Date')
    Left = 168
    Top = 320
  end
end
