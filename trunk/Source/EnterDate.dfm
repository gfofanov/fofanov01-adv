object frmEnterDate: TfrmEnterDate
  Left = 285
  Top = 177
  BorderStyle = bsDialog
  Caption = #1042#1074#1086#1076' '#1076#1072#1090#1099
  ClientHeight = 105
  ClientWidth = 443
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    443
    105)
  PixelsPerInch = 96
  TextHeight = 16
  object Bevel1: TBevel
    Left = 0
    Top = 65
    Width = 443
    Height = 40
    Align = alBottom
    Shape = bsTopLine
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 422
    Height = 16
    HelpContext = 39
    Alignment = taCenter
    Anchors = [akLeft, akRight]
    AutoSize = False
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1076#1072#1090#1091
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 73
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 345
    Top = 73
    Width = 89
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 2
    Kind = bkCancel
  end
  object DateEdit1: TDateEdit
    Left = 184
    Top = 32
    Width = 89
    Height = 21
    HelpContext = 39
    CheckOnExit = True
    NumGlyphs = 2
    Weekends = [Sun, Sat]
    YearDigits = dyFour
    TabOrder = 0
  end
end
