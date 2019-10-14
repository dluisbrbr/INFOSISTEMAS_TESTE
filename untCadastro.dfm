object frmCadCliente: TfrmCadCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Cliente'
  ClientHeight = 542
  ClientWidth = 721
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcListaCadastro: TPageControl
    Left = 0
    Top = 0
    Width = 721
    Height = 542
    ActivePage = tbCadastro
    Align = alClient
    TabOrder = 0
    object tbLista: TTabSheet
      Caption = 'Lista'
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 73
        Width = 713
        Height = 25
        DataSource = dsCliente
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Align = alTop
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 98
        Width = 713
        Height = 191
        Align = alTop
        DataSource = dsCliente
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            ReadOnly = True
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 320
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDENTIDADE'
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DDD'
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TELEFONE'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL'
            Visible = True
          end>
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 289
        Width = 713
        Height = 225
        Align = alClient
        DataSource = dsEndereco
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CEP'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LOGRADOURO'
            Width = 230
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMERO'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMPLEMENTO'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BAIRRO'
            Width = 220
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CIDADE'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTADO'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PAIS'
            Width = 80
            Visible = True
          end>
      end
      object panTop: TPanel
        Left = 0
        Top = 0
        Width = 713
        Height = 73
        Align = alTop
        Color = clMenu
        ParentBackground = False
        TabOrder = 3
        object Button1: TButton
          Left = 160
          Top = 24
          Width = 75
          Height = 25
          Caption = 'Incluir'
          TabOrder = 0
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 312
          Top = 24
          Width = 75
          Height = 25
          Caption = 'Alterar'
          TabOrder = 1
          OnClick = Button2Click
        end
        object Button3: TButton
          Left = 480
          Top = 24
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 2
          OnClick = Button3Click
        end
      end
    end
    object tbCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 29
        Height = 13
        Caption = 'NOME'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 557
        Top = 16
        Width = 61
        Height = 13
        Caption = 'IDENTIDADE'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 16
        Top = 80
        Width = 19
        Height = 13
        Caption = 'CPF'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 184
        Top = 80
        Width = 21
        Height = 13
        Caption = 'DDD'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 232
        Top = 80
        Width = 50
        Height = 13
        Caption = 'TELEFONE'
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 376
        Top = 80
        Width = 30
        Height = 13
        Caption = 'EMAIL'
        FocusControl = DBEdit6
      end
      object Label7: TLabel
        Left = 16
        Top = 186
        Width = 19
        Height = 13
        Caption = 'CEP'
        FocusControl = dbeCEP
      end
      object Label8: TLabel
        Left = 118
        Top = 186
        Width = 71
        Height = 13
        Caption = 'LOGRADOURO'
        FocusControl = dbeLogradouro
      end
      object Label9: TLabel
        Left = 496
        Top = 186
        Width = 43
        Height = 13
        Caption = 'NUMERO'
        FocusControl = dbeNumero
      end
      object Label10: TLabel
        Left = 584
        Top = 186
        Width = 75
        Height = 13
        Caption = 'COMPLEMENTO'
        FocusControl = dbeComplemento
      end
      object Label11: TLabel
        Left = 17
        Top = 250
        Width = 39
        Height = 13
        Caption = 'BAIRRO'
        FocusControl = dbeBairro
      end
      object Label12: TLabel
        Left = 295
        Top = 250
        Width = 38
        Height = 13
        Caption = 'CIDADE'
        FocusControl = dbeCidade
      end
      object Label13: TLabel
        Left = 487
        Top = 250
        Width = 40
        Height = 13
        Caption = 'ESTADO'
        FocusControl = dbeEstado
      end
      object Label14: TLabel
        Left = 584
        Top = 250
        Width = 23
        Height = 13
        Caption = 'PAIS'
        FocusControl = dbePais
      end
      object Panel1: TPanel
        Left = 0
        Top = 454
        Width = 713
        Height = 60
        Align = alBottom
        Color = clMenu
        ParentBackground = False
        TabOrder = 14
        object btnSalvarCliente: TButton
          Left = 28
          Top = 19
          Width = 75
          Height = 25
          Caption = 'Salvar'
          TabOrder = 0
          OnClick = btnSalvarClienteClick
        end
        object Button5: TButton
          Left = 118
          Top = 19
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 1
          OnClick = Button5Click
        end
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 35
        Width = 505
        Height = 21
        DataField = 'NOME'
        DataSource = dsCliente
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 557
        Top = 35
        Width = 134
        Height = 21
        DataField = 'IDENTIDADE'
        DataSource = dsCliente
        MaxLength = 9
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 16
        Top = 99
        Width = 147
        Height = 21
        DataField = 'CPF'
        DataSource = dsCliente
        MaxLength = 10
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 184
        Top = 99
        Width = 30
        Height = 21
        DataField = 'DDD'
        DataSource = dsCliente
        MaxLength = 2
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 232
        Top = 99
        Width = 121
        Height = 21
        DataField = 'TELEFONE'
        DataSource = dsCliente
        MaxLength = 10
        TabOrder = 4
      end
      object DBEdit6: TDBEdit
        Left = 376
        Top = 99
        Width = 313
        Height = 21
        DataField = 'EMAIL'
        DataSource = dsCliente
        TabOrder = 5
      end
      object dbeCEP: TDBEdit
        Left = 16
        Top = 202
        Width = 75
        Height = 21
        DataField = 'CEP'
        DataSource = dsEndereco
        MaxLength = 9
        TabOrder = 6
      end
      object dbeLogradouro: TDBEdit
        Left = 118
        Top = 205
        Width = 363
        Height = 21
        DataField = 'LOGRADOURO'
        DataSource = dsEndereco
        TabOrder = 7
      end
      object dbeNumero: TDBEdit
        Left = 496
        Top = 205
        Width = 55
        Height = 21
        DataField = 'NUMERO'
        DataSource = dsEndereco
        TabOrder = 8
      end
      object dbeComplemento: TDBEdit
        Left = 584
        Top = 205
        Width = 109
        Height = 21
        DataField = 'COMPLEMENTO'
        DataSource = dsEndereco
        TabOrder = 9
      end
      object dbeBairro: TDBEdit
        Left = 16
        Top = 269
        Width = 266
        Height = 21
        DataField = 'BAIRRO'
        DataSource = dsEndereco
        TabOrder = 10
      end
      object dbeCidade: TDBEdit
        Left = 295
        Top = 269
        Width = 186
        Height = 21
        DataField = 'CIDADE'
        DataSource = dsEndereco
        TabOrder = 11
      end
      object dbeEstado: TDBEdit
        Left = 487
        Top = 269
        Width = 91
        Height = 21
        DataField = 'ESTADO'
        DataSource = dsEndereco
        TabOrder = 12
      end
      object dbePais: TDBEdit
        Left = 584
        Top = 269
        Width = 109
        Height = 21
        DataField = 'PAIS'
        DataSource = dsEndereco
        TabOrder = 13
      end
    end
  end
  object dsCliente: TDataSource
    DataSet = cdsCliente
    Left = 388
    Top = 225
  end
  object dsEndereco: TDataSource
    DataSet = cdsEndereco
    Left = 620
    Top = 225
  end
  object cdsCliente: TClientDataSet
    PersistDataPacket.Data = {
      C40000009619E0BD010000001800000007000000000003000000C40002494404
      00010000000000044E4F4D450100490000000100055749445448020002007800
      0A4944454E5449444144450100490000000100055749445448020002000A0003
      4350460100490000000100055749445448020002000B00034444440100490000
      0001000557494454480200020002000854454C45464F4E450100490000000100
      05574944544802000200090005454D41494C0100490000000100055749445448
      020002005A000000}
    Active = True
    Aggregates = <>
    Params = <>
    AfterPost = cdsClienteAfterPost
    Left = 332
    Top = 225
    object cdsClienteID: TIntegerField
      FieldName = 'ID'
    end
    object cdsClienteNOME: TStringField
      FieldName = 'NOME'
      Size = 120
    end
    object cdsClienteIDENTIDADE: TStringField
      FieldName = 'IDENTIDADE'
      EditMask = '!999999999;1;_'
      Size = 10
    end
    object cdsClienteCPF: TStringField
      FieldName = 'CPF'
      EditMask = '!9999999999;1;_'
      Size = 11
    end
    object cdsClienteDDD: TStringField
      FieldName = 'DDD'
      EditMask = '!99;1;_'
      Size = 2
    end
    object cdsClienteTELEFONE: TStringField
      FieldName = 'TELEFONE'
      EditMask = '!00000-0000;1;_'
      Size = 9
    end
    object cdsClienteEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 90
    end
  end
  object cdsEndereco: TClientDataSet
    PersistDataPacket.Data = {
      010100009619E0BD010000001800000009000000000003000000010102494404
      000100000000000343455001004900000001000557494454480200020008000A
      4C4F475241444F55524F0100490000000100055749445448020002007800064E
      554D45524F0100490000000100055749445448020002000A000B434F4D504C45
      4D454E544F0100490000000100055749445448020002000C000642414952524F
      0100490000000100055749445448020002007800064349444144450100490000
      0001000557494454480200020064000645535441444F01004900000001000557
      49445448020002005A0004504149530100490000000100055749445448020002
      003C000000}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'ID'
    MasterFields = 'ID'
    MasterSource = dsCliente
    PacketRecords = 0
    Params = <>
    AfterPost = cdsEnderecoAfterPost
    Left = 556
    Top = 225
    object cdsEnderecoID: TIntegerField
      DisplayWidth = 2
      FieldName = 'ID'
    end
    object cdsEnderecoCEP: TStringField
      DisplayWidth = 7
      FieldName = 'CEP'
      OnChange = cdsEnderecoCEPChange
      EditMask = '00000\-999;0;_'
      Size = 8
    end
    object cdsEnderecoLOGRADOURO: TStringField
      DisplayWidth = 120
      FieldName = 'LOGRADOURO'
      Size = 120
    end
    object cdsEnderecoNUMERO: TStringField
      DisplayWidth = 10
      FieldName = 'NUMERO'
      Size = 10
    end
    object cdsEnderecoCOMPLEMENTO: TStringField
      DisplayWidth = 12
      FieldName = 'COMPLEMENTO'
      Size = 12
    end
    object cdsEnderecoBAIRRO: TStringField
      DisplayWidth = 120
      FieldName = 'BAIRRO'
      Size = 120
    end
    object cdsEnderecoCIDADE: TStringField
      DisplayWidth = 100
      FieldName = 'CIDADE'
      Size = 100
    end
    object cdsEnderecoESTADO: TStringField
      DisplayWidth = 90
      FieldName = 'ESTADO'
      Size = 90
    end
    object cdsEnderecoPAIS: TStringField
      DisplayWidth = 60
      FieldName = 'PAIS'
      Size = 60
    end
  end
end
