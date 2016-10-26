object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'RiceFramework - Example'
  ClientHeight = 417
  ClientWidth = 1021
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 34
    Top = 100
    Width = 43
    Height = 13
    Caption = 'Matricula'
  end
  object Label2: TLabel
    Left = 296
    Top = 100
    Width = 23
    Height = 13
    Caption = 'Nota'
  end
  object Label3: TLabel
    Left = 20
    Top = 73
    Width = 57
    Height = 13
    Caption = 'Nome Aluno'
  end
  object Label4: TLabel
    Left = 274
    Top = 73
    Width = 45
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object lbl1: TLabel
    Left = 530
    Top = 7
    Width = 206
    Height = 19
    Caption = 'NoSQLBuilder - Examples'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 20
    Top = 7
    Width = 281
    Height = 19
    Caption = 'Rice.MongoFramework - Examples'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 5
    Top = 128
    Width = 97
    Height = 33
    Caption = 'Inserir/Atualizar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 236
    Top = 128
    Width = 86
    Height = 33
    Caption = 'getAll'
    TabOrder = 1
    OnClick = Button2Click
  end
  object btn1: TButton
    Left = 328
    Top = 128
    Width = 86
    Height = 33
    Caption = 'Filtrar'
    TabOrder = 2
    OnClick = btn1Click
  end
  object dbgrd1: TDBGrid
    Left = 0
    Top = 167
    Width = 507
    Height = 250
    Align = alCustom
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Id'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Endereco'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Matricula'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nota'
        Visible = True
      end>
  end
  object dbedtId: TDBEdit
    Left = 83
    Top = 41
    Width = 422
    Height = 21
    DataField = 'Id'
    DataSource = DataSource1
    TabOrder = 4
  end
  object dbedtNome: TDBEdit
    Left = 83
    Top = 68
    Width = 185
    Height = 21
    DataField = 'Nome'
    DataSource = DataSource1
    TabOrder = 5
  end
  object dbedtMatricula: TDBEdit
    Left = 83
    Top = 95
    Width = 185
    Height = 21
    DataField = 'Matricula'
    DataSource = DataSource1
    TabOrder = 6
  end
  object dbedtEndereco: TDBEdit
    Left = 322
    Top = 68
    Width = 185
    Height = 21
    DataField = 'Endereco'
    DataSource = DataSource1
    TabOrder = 7
  end
  object dbedtNota: TDBEdit
    Left = 322
    Top = 95
    Width = 185
    Height = 21
    DataField = 'Nota'
    DataSource = DataSource1
    TabOrder = 8
  end
  object btn2: TButton
    Left = 420
    Top = 128
    Width = 86
    Height = 33
    Caption = 'getByID'
    TabOrder = 9
    OnClick = btn2Click
  end
  object Button3: TButton
    Left = 530
    Top = 91
    Width = 105
    Height = 35
    Caption = 'Diferrent - Diferente'
    TabOrder = 10
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 530
    Top = 173
    Width = 485
    Height = 244
    TabOrder = 11
  end
  object btn3: TButton
    Left = 525
    Top = 132
    Width = 86
    Height = 35
    Caption = 'Greater - Maior'
    TabOrder = 12
    OnClick = btn3Click
  end
  object btn4: TButton
    Left = 611
    Top = 132
    Width = 170
    Height = 35
    Caption = 'Greater Or Equal - Maior ou Igual'
    TabOrder = 13
    OnClick = btn4Click
  end
  object btn5: TButton
    Left = 781
    Top = 132
    Width = 77
    Height = 35
    Caption = 'Less - Menor'
    TabOrder = 14
    OnClick = btn5Click
  end
  object btn6: TButton
    Left = 859
    Top = 132
    Width = 161
    Height = 35
    Caption = 'Less Or Equal - Menor ou Igual'
    TabOrder = 15
    OnClick = btn6Click
  end
  object btn7: TButton
    Left = 530
    Top = 32
    Width = 117
    Height = 33
    Caption = 'Inserir - NoSQLBuilder'
    TabOrder = 16
    OnClick = btn7Click
  end
  object btn8: TButton
    Left = 641
    Top = 95
    Width = 134
    Height = 31
    Caption = '> 50 | < 100'
    TabOrder = 17
    OnClick = btn8Click
  end
  object btn9: TButton
    Left = 653
    Top = 32
    Width = 134
    Height = 31
    Caption = 'Update'
    TabOrder = 18
    OnClick = btn9Click
  end
  object btn10: TButton
    Left = 108
    Top = 128
    Width = 61
    Height = 33
    Caption = 'Inserir'
    TabOrder = 19
    OnClick = btn10Click
  end
  object btn11: TButton
    Left = 169
    Top = 128
    Width = 61
    Height = 33
    Caption = 'Deletar'
    TabOrder = 20
    OnClick = btn11Click
  end
  object dtsDados: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 96
    Top = 248
    object dtsDadosId: TStringField
      FieldName = 'Id'
      Size = 50
    end
    object dtsDadosNome: TStringField
      FieldName = 'Nome'
      Size = 100
    end
    object dtsDadosEndereco: TStringField
      FieldName = 'Endereco'
      Size = 100
    end
    object dtsDadosNota: TFloatField
      FieldName = 'Nota'
    end
    object dtsDadosMatricula: TStringField
      FieldName = 'Matricula'
      Size = 100
    end
  end
  object DataSource1: TDataSource
    DataSet = dtsDados
    Left = 152
    Top = 248
  end
end
