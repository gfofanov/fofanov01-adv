object frmUsers: TfrmUsers
  Left = 362
  Top = 229
  HelpContext = 13
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
  ClientHeight = 118
  ClientWidth = 388
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 85
    Width = 388
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 97
      Height = 33
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object btnOk: TBitBtn
        Left = 8
        Top = 4
        Width = 75
        Height = 25
        TabOrder = 0
        OnClick = btnOkClick
        Kind = bkOK
      end
    end
    object Panel4: TPanel
      Left = 274
      Top = 0
      Width = 114
      Height = 33
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object btnCancel: TBitBtn
        Left = 16
        Top = 4
        Width = 89
        Height = 25
        TabOrder = 0
        Kind = bkCancel
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 388
    Height = 85
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 21
      Width = 144
      Height = 16
      Caption = #1042#1074#1077#1076#1080#1090#1077' '#1080#1084#1103' '#1089#1077#1088#1074#1077#1088#1072':'
    end
    object Label2: TLabel
      Left = 8
      Top = 51
      Width = 137
      Height = 16
      Caption = #1042#1074#1077#1076#1080#1090#1077' '#1087#1091#1090#1100' '#1082' '#1073#1072#1079#1077':'
    end
    object edtLogin: TEdit
      Left = 158
      Top = 13
      Width = 221
      Height = 24
      TabOrder = 0
      Text = 'localhost'
    end
    object edtPassword: TEdit
      Left = 158
      Top = 43
      Width = 221
      Height = 24
      TabOrder = 1
      Text = 'D:\Projects\Adv\Base\ADV.FDB'
    end
  end
  object FormStorage: TFormStorage
    Active = False
    UseRegistry = True
    StoredProps.Strings = (
      'edtLogin.Text'
      'edtPassword.Text')
    StoredValues = <>
    Left = 24
    Top = 8
  end
end
