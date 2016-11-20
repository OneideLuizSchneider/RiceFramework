object FormMainTest: TFormMainTest
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'RiceFramework - TestAPP'
  ClientHeight = 506
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 736
    Height = 19
    Align = alTop
    Alignment = taCenter
    Caption = 'Rice.MongoFramework - Examples / NoSQLBuilder - Examples'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitLeft = 20
    ExplicitTop = 8
    ExplicitWidth = 506
  end
  object PageControl1: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 28
    Width = 736
    Height = 475
    ActivePage = ts1
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 27
    ExplicitTop = 44
    object ts1: TTabSheet
      Caption = 'Rice.MongoFramework - Examples'
      ExplicitLeft = -68
      ExplicitTop = 0
      object lbl3: TLabel
        Left = 107
        Top = 106
        Width = 58
        Height = 13
        Caption = 'Registration'
      end
      object lbl4: TLabel
        Left = 375
        Top = 106
        Width = 30
        Height = 13
        Caption = 'Notice'
      end
      object lbl5: TLabel
        Left = 96
        Top = 79
        Width = 68
        Height = 13
        Caption = 'Name Student'
      end
      object lbl6: TLabel
        Left = 366
        Top = 81
        Width = 39
        Height = 13
        Caption = 'Address'
      end
      object lbl7: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 722
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'Rice.MongoFramework - Examples'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 281
      end
      object dbgrd1: TDBGrid
        Left = 0
        Top = 216
        Width = 728
        Height = 231
        Align = alBottom
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Id'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Title.Caption = 'Name'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Endereco'
            Title.Caption = 'Address'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Matricula'
            Title.Caption = 'Registration'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nota'
            Title.Caption = 'Notice'
            Visible = True
          end>
      end
      object btn12: TButton
        Left = 59
        Top = 152
        Width = 97
        Height = 33
        Caption = 'Insert / Update'
        TabOrder = 1
        OnClick = btn12Click
      end
      object btn13: TButton
        Left = 368
        Top = 152
        Width = 97
        Height = 33
        Caption = 'getAll'
        TabOrder = 2
        OnClick = btn13Click
      end
      object btn1: TButton
        Left = 471
        Top = 152
        Width = 97
        Height = 33
        Caption = 'Filter'
        TabOrder = 3
        OnClick = btn1Click
      end
      object dbedtId: TDBEdit
        Left = 171
        Top = 49
        Width = 422
        Height = 21
        DataField = 'Id'
        DataSource = DataSource1
        TabOrder = 4
      end
      object dbedtNome: TDBEdit
        Left = 171
        Top = 76
        Width = 185
        Height = 21
        DataField = 'Nome'
        DataSource = DataSource1
        TabOrder = 5
      end
      object dbedtMatricula: TDBEdit
        Left = 171
        Top = 103
        Width = 185
        Height = 21
        DataField = 'Matricula'
        DataSource = DataSource1
        TabOrder = 6
      end
      object dbedtEndereco: TDBEdit
        Left = 410
        Top = 76
        Width = 185
        Height = 21
        DataField = 'Endereco'
        DataSource = DataSource1
        TabOrder = 7
      end
      object dbedtNota: TDBEdit
        Left = 410
        Top = 103
        Width = 185
        Height = 21
        DataField = 'Nota'
        DataSource = DataSource1
        TabOrder = 8
      end
      object btn2: TButton
        Left = 574
        Top = 152
        Width = 97
        Height = 33
        Caption = 'getByID'
        TabOrder = 9
        OnClick = btn2Click
      end
      object btn10: TButton
        Left = 162
        Top = 152
        Width = 97
        Height = 33
        Caption = 'Insert'
        TabOrder = 10
        OnClick = btn10Click
      end
      object btn11: TButton
        Left = 265
        Top = 152
        Width = 97
        Height = 33
        Caption = 'Delete'
        TabOrder = 11
        OnClick = btn11Click
      end
    end
    object ts2: TTabSheet
      Caption = 'NoSQLBuilder - Examples'
      ImageIndex = 1
      ExplicitLeft = 8
      ExplicitWidth = 1013
      ExplicitHeight = 443
      object lbl1: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 722
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'NoSQLBuilder - Examples'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 74
        ExplicitTop = 23
        ExplicitWidth = 206
      end
      object mmoResult: TMemo
        Left = 0
        Top = 156
        Width = 728
        Height = 291
        Align = alBottom
        TabOrder = 0
        ExplicitTop = 152
        ExplicitWidth = 1013
      end
      object btn14: TButton
        Left = 62
        Top = 87
        Width = 117
        Height = 35
        Caption = 'Diferrent - Diferente'
        TabOrder = 1
        OnClick = btn14Click
      end
      object btn3: TButton
        Left = 381
        Top = 46
        Width = 86
        Height = 35
        Caption = 'Greater - Maior'
        TabOrder = 2
        OnClick = btn3Click
      end
      object btn4: TButton
        Left = 473
        Top = 46
        Width = 170
        Height = 35
        Caption = 'Greater Or Equal - Maior ou Igual'
        TabOrder = 3
        OnClick = btn4Click
      end
      object btn5: TButton
        Left = 381
        Top = 87
        Width = 86
        Height = 35
        Caption = 'Less - Menor'
        TabOrder = 4
        OnClick = btn5Click
      end
      object btn6: TButton
        Left = 473
        Top = 87
        Width = 170
        Height = 35
        Caption = 'Less Or Equal - Menor ou Igual'
        TabOrder = 5
        OnClick = btn6Click
      end
      object btn7: TButton
        Left = 62
        Top = 48
        Width = 117
        Height = 33
        Caption = 'Insert - NoSQLBuilder'
        TabOrder = 6
        OnClick = btn7Click
      end
      object btn8: TButton
        Left = 185
        Top = 87
        Width = 134
        Height = 35
        Caption = '> 50 | < 100'
        TabOrder = 7
        OnClick = btn8Click
      end
      object btn9: TButton
        Left = 185
        Top = 48
        Width = 134
        Height = 31
        Caption = 'Update'
        TabOrder = 8
        OnClick = btn9Click
      end
    end
  end
  object dtsData: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 672
    Top = 72
    object dtsDataId: TStringField
      FieldName = 'Id'
      Size = 50
    end
    object dtsDataNome: TStringField
      FieldName = 'Nome'
      Size = 100
    end
    object dtsDataEndereco: TStringField
      FieldName = 'Endereco'
      Size = 100
    end
    object dtsDataNota: TFloatField
      FieldName = 'Nota'
    end
    object dtsDataMatricula: TStringField
      FieldName = 'Matricula'
      Size = 100
    end
  end
  object DataSource1: TDataSource
    DataSet = dtsData
    Left = 672
    Top = 120
  end
end
