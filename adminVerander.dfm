object frmAdminVerander: TfrmAdminVerander
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Plaas Informasie'
  ClientHeight = 600
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 266
    Top = 16
    Width = 269
    Height = 45
    Caption = 'Plaas Informasie'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 48
    Top = 88
    Width = 697
    Height = 241
    Caption = 'Plaas Besonderhede'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label2: TLabel
      Left = 29
      Top = 40
      Width = 75
      Height = 18
      Caption = 'Plaas naam'
    end
    object Label3: TLabel
      Left = 12
      Top = 78
      Width = 92
      Height = 18
      Caption = 'Melkery naam'
    end
    object Label4: TLabel
      Left = 15
      Top = 116
      Width = 89
      Height = 18
      Caption = 'Eienaar naam'
    end
    object Label5: TLabel
      Left = 28
      Top = 154
      Width = 76
      Height = 18
      Caption = 'Eienaar van'
    end
    object Label6: TLabel
      Left = 29
      Top = 192
      Width = 75
      Height = 18
      Caption = 'Telefoon nr'
    end
    object edtPlaas: TEdit
      Left = 128
      Top = 37
      Width = 200
      Height = 26
      TabOrder = 0
    end
    object edtMelk: TEdit
      Left = 128
      Top = 75
      Width = 200
      Height = 26
      TabOrder = 1
    end
    object edtNaam: TEdit
      Left = 128
      Top = 113
      Width = 200
      Height = 26
      TabOrder = 2
    end
    object edtVan: TEdit
      Left = 128
      Top = 151
      Width = 200
      Height = 26
      TabOrder = 3
    end
    object edtTelefoon: TEdit
      Left = 128
      Top = 189
      Width = 200
      Height = 26
      TabOrder = 4
    end
  end
  object GroupBox2: TGroupBox
    Left = 48
    Top = 360
    Width = 697
    Height = 129
    Caption = 'Kalf Besonderhede'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label7: TLabel
      Left = 25
      Top = 40
      Width = 79
      Height = 18
      Caption = 'Kalf Interval'
    end
    object Label8: TLabel
      Left = 16
      Top = 80
      Width = 88
      Height = 18
      Caption = 'Droog Datum'
    end
    object Label9: TLabel
      Left = 184
      Top = 40
      Width = 155
      Height = 18
      Caption = 'Hoeveel dae na dekking'
    end
    object Label10: TLabel
      Left = 184
      Top = 80
      Width = 254
      Height = 18
      Caption = 'Hoeveel dae voor verwagte kalf datum'
    end
    object edtInterval: TEdit
      Left = 128
      Top = 37
      Width = 50
      Height = 26
      TabOrder = 0
      Text = '0'
    end
    object edtDroog: TEdit
      Left = 128
      Top = 77
      Width = 50
      Height = 26
      TabOrder = 1
      Text = '0'
    end
  end
  object Button1: TButton
    Left = 48
    Top = 528
    Width = 192
    Height = 41
    Caption = 'Verander'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object BitBtn1: TBitBtn
    Left = 553
    Top = 528
    Width = 192
    Height = 41
    Caption = 'Kanselleer'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = bkCancel
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 3
  end
  object DataSource1: TDataSource
    Left = 760
    Top = 8
  end
end
