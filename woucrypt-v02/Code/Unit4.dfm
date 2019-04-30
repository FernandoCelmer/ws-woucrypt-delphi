object Form4: TForm4
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Reinicio Para Tradu'#231#227'o'
  ClientHeight = 52
  ClientWidth = 196
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 16
    Top = 16
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Sim'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 105
    Top = 16
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'N'#227'o'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = BitBtn2Click
  end
end
