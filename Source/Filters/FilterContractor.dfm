inherited frmFilterContractor: TfrmFilterContractor
  Caption = #1060#1080#1083#1100#1090#1088' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1074
  ClientHeight = 276
  PixelsPerInch = 96
  TextHeight = 16
  inherited Bevel1: TBevel
    Top = 237
  end
  inherited btnOk: TBitBtn
    Top = 245
  end
  inherited btnCancel: TBitBtn
    Top = 245
  end
  inherited Panel1: TPanel
    Height = 237
    object Label1: TLabel
      Left = 8
      Top = 112
      Width = 30
      Height = 16
      Caption = #1048#1053#1053
      FocusControl = edtINN
    end
    object Label3: TLabel
      Left = 10
      Top = 144
      Width = 28
      Height = 16
      Caption = #1050#1055#1055
    end
    object Label4: TLabel
      Left = 8
      Top = 174
      Width = 99
      Height = 16
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object edtName_Contractor: TEdit
      Left = 152
      Top = 166
      Width = 209
      Height = 24
      TabOrder = 2
    end
    object edtINN: TEdit
      Left = 152
      Top = 104
      Width = 209
      Height = 24
      TabOrder = 0
    end
    object edtKPP: TEdit
      Left = 152
      Top = 136
      Width = 209
      Height = 24
      TabOrder = 1
    end
    object chbType_Contractor: TCheckBox
      Left = 8
      Top = 205
      Width = 97
      Height = 17
      Caption = #1058#1080#1087
      TabOrder = 3
      OnClick = chbType_ContractorClick
    end
    object cmbType_Contractor: TComboBox
      Left = 152
      Top = 196
      Width = 209
      Height = 24
      Enabled = False
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 4
      Text = #1061#1086#1079#1103#1080#1085
      Items.Strings = (
        #1061#1086#1079#1103#1080#1085
        #1050#1083#1080#1077#1085#1090)
    end
  end
  inherited fstrFilter: TFormStorage
    StoredProps.Strings = (
      'edtINN.Text'
      'edtKPP.Text'
      'edtName_Contractor.Text'
      'chbType_Contractor.Checked'
      'cmbType_Contractor.ItemIndex')
    Left = 152
    Top = 240
  end
end
