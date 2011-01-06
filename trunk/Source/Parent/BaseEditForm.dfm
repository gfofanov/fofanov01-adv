inherited frmBaseEditForm: TfrmBaseEditForm
  Left = 505
  Top = 471
  BorderStyle = bsDialog
  Caption = 'frmBaseEditForm'
  ClientHeight = 242
  ClientWidth = 511
  OldCreateOrder = True
  DesignSize = (
    511
    242)
  PixelsPerInch = 96
  TextHeight = 16
  object Bevel1: TBevel [0]
    Left = 0
    Top = 192
    Width = 511
    Height = 50
    Align = alBottom
    Shape = bsTopLine
  end
  object btnOk: TBitBtn [1]
    Left = 8
    Top = 206
    Width = 89
    Height = 25
    Anchors = [akLeft, akBottom]
    TabOrder = 0
    OnClick = btnOkClick
    Kind = bkOK
  end
  object btnCancel: TBitBtn [2]
    Left = 413
    Top = 206
    Width = 89
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 1
    Kind = bkCancel
  end
  object btnClose: TBitBtn [3]
    Left = 207
    Top = 208
    Width = 89
    Height = 25
    Anchors = [akBottom]
    TabOrder = 2
    Visible = False
    Kind = bkClose
  end
  object DataSource: TDataSource
    AutoEdit = False
    Left = 64
    Top = 8
  end
end
