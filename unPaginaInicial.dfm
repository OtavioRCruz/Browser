object FrmPaginaInicial: TFrmPaginaInicial
  Left = 313
  Top = 163
  Width = 536
  Height = 111
  Caption = 'P'#225'gina Inicial'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 80
    Height = 16
    Caption = 'P'#225'gina Inicial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 104
    Top = 48
    Width = 73
    Height = 22
    Caption = 'Aplicar'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton1Click
  end
  object Edit1: TEdit
    Left = 104
    Top = 8
    Width = 409
    Height = 21
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 440
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 1
    Kind = bkClose
  end
end
