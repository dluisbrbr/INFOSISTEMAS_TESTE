unit untCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.TabNotBk, Vcl.StdCtrls,
  Vcl.Mask;

type
  TfrmCadCliente = class(TForm)
    pcListaCadastro: TPageControl;
    tbLista: TTabSheet;
    tbCadastro: TTabSheet;
    DBNavigator1: TDBNavigator;
    dsCliente: TDataSource;
    dsEndereco: TDataSource;
    cdsCliente: TClientDataSet;
    cdsEndereco: TClientDataSet;
    cdsClienteID: TIntegerField;
    cdsClienteNOME: TStringField;
    cdsClienteIDENTIDADE: TStringField;
    cdsClienteCPF: TStringField;
    cdsClienteDDD: TStringField;
    cdsClienteTELEFONE: TStringField;
    cdsClienteEMAIL: TStringField;
    cdsEnderecoID: TIntegerField;
    cdsEnderecoCEP: TStringField;
    cdsEnderecoLOGRADOURO: TStringField;
    cdsEnderecoNUMERO: TStringField;
    cdsEnderecoCOMPLEMENTO: TStringField;
    cdsEnderecoBAIRRO: TStringField;
    cdsEnderecoCIDADE: TStringField;
    cdsEnderecoESTADO: TStringField;
    cdsEnderecoPAIS: TStringField;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Panel1: TPanel;
    Label7: TLabel;
    dbeCEP: TDBEdit;
    Label8: TLabel;
    dbeLogradouro: TDBEdit;
    Label9: TLabel;
    dbeNumero: TDBEdit;
    Label10: TLabel;
    dbeComplemento: TDBEdit;
    Label11: TLabel;
    dbeBairro: TDBEdit;
    Label12: TLabel;
    dbeCidade: TDBEdit;
    Label13: TLabel;
    dbeEstado: TDBEdit;
    Label14: TLabel;
    dbePais: TDBEdit;
    btnSalvarCliente: TButton;
    Button5: TButton;
    panTop: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClienteClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure cdsEnderecoCEPChange(Sender: TField);
    procedure cdsClienteAfterPost(DataSet: TDataSet);
    procedure cdsEnderecoAfterPost(DataSet: TDataSet);
    procedure EnviarEMail( cdsCli: TClientDataSet );
  private
    { Private declarations }
  public
    { Public declarations }
    idCli : Integer;
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation


uses ViaCEP.Intf, ViaCEP.Core, ViaCEP.Model, TypInfo,
     IdSMTP, IdSSLOpenSSL, IdMessage, IdText, IdAttachmentFile,
     IdExplicitTLSClientServerBase;

{$R *.dfm}

procedure TfrmCadCliente.Button1Click(Sender: TObject);
begin
  pcListaCadastro.Pages[0].TabVisible := false;
  pcListaCadastro.Pages[1].TabVisible := true;
  cdsEndereco.Append;
  cdsCliente.Append;
end;


procedure TfrmCadCliente.Button2Click(Sender: TObject);
begin
  pcListaCadastro.Pages[0].TabVisible := false;
  pcListaCadastro.Pages[1].TabVisible := true;
  cdsEndereco.Edit;
  cdsCliente.Edit;
end;

procedure TfrmCadCliente.Button3Click(Sender: TObject);
begin
     cdsCliente.Delete;
     cdsEndereco.Delete;
     cdsCliente.Refresh;
     cdsEndereco.Refresh;
end;

procedure TfrmCadCliente.Button5Click(Sender: TObject);
begin
     if cdsEndereco.State in [dsInsert] then
        cdsEndereco.Delete;
     if cdsCliente.State in [dsInsert] then
        cdsCliente.Delete;
     cdsCliente.Cancel;
     cdsEndereco.Cancel;
     pcListaCadastro.Pages[0].TabVisible := true;
     pcListaCadastro.Pages[1].TabVisible := false;
end;


procedure TfrmCadCliente.cdsClienteAfterPost(DataSet: TDataSet);
begin
     cdsCliente.SaveToFile('C:\infosistemas\prjTeste\arqsxml\'+ 'arqcli.xml',dfXMLUTF8);
end;

procedure TfrmCadCliente.cdsEnderecoAfterPost(DataSet: TDataSet);
begin
     cdsEndereco.SaveToFile('C:\infosistemas\prjTeste\arqsxml\'+ 'arqcli_end.xml',dfXMLUTF8);
end;

procedure TfrmCadCliente.cdsEnderecoCEPChange(Sender: TField);
var
  ViaCEP: IViaCEP;
  CEP: TViaCEPClass;
begin
  ViaCEP := TViaCEP.Create;
  if ViaCEP.Validate( Sender.Text ) then
  begin
      CEP := ViaCEP.Get(Sender.Text);
      if not Assigned(CEP) then
      begin
        ShowMessage('CEP não localizado');
        Exit;
      end;
      try
        cdsEnderecoLOGRADOURO.Value := CEP.Logradouro;
        cdsEnderecoCOMPLEMENTO.Value := CEP.Complemento;
        cdsEnderecoBAIRRO.Value := CEP.Bairro;
        cdsEnderecoCIDADE.Value := CEP.Localidade;
        cdsEnderecoESTADO.Value := CEP.UF;
        cdsEnderecoPAIS.Value := CEP.Unidade;
      finally
        CEP.Free;
      end;
  end
  else
    ShowMessage('CEP inválido');

end;


procedure TfrmCadCliente.btnSalvarClienteClick(Sender: TObject);
begin
     if cdsCliente.State in [dsInsert] then
     begin
          Inc(idCli);
          cdsEndereco.FieldByName('ID').AsInteger := idCli;
          cdsEndereco.Post;

          cdsCliente.FieldByName('ID').AsInteger := idCli;
          cdsCliente.Post;
     end
     else if ( (cdsCliente.State in [dsEdit]) or (cdsEndereco.State in [dsEdit])) then
     begin
          if (cdsEndereco.State in [dsEdit]) then
              cdsEndereco.Post;
          if (cdsCliente.State in [dsEdit]) then
              cdsCliente.Post;
     end;

     try
        EnviarEMail(cdsCliente);
     except
        on E:Exception do
        begin
          MessageDlg('Erro na conexão ou autenticação: ' +
            E.Message, mtWarning, [mbOK], 0);
          Exit;
        end;
     end;

     pcListaCadastro.Pages[0].TabVisible := true;
     pcListaCadastro.Pages[1].TabVisible := false;


end;

procedure TfrmCadCliente.FormShow(Sender: TObject);
begin
     pcListaCadastro.Pages[1].TabVisible := false;
     idCli := 0;
end;

procedure TfrmCadCliente.EnviarEMail(cdsCli: TClientDataSet);
var
  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
  IdSMTP:     TIdSMTP;
  IdMessage:  TIdMessage;
  IdText:     TIdText;
  sAnexo, sAnexo1:     string;
begin
  IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(Self);
  IdSMTP := TIdSMTP.Create(Self);
  IdMessage := TIdMessage.Create(Self);

  try
    IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
    IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;

    IdSMTP.IOHandler := IdSSLIOHandlerSocket;
    IdSMTP.UseTLS := utUseImplicitTLS;
    IdSMTP.AuthType := satDefault;
    IdSMTP.Port := 465;
    IdSMTP.Host := 'smtp.gmail.com';
    IdSMTP.Username := 'dluisbrbr@gmail.com';
    IdSMTP.Password := 'PASSWORD';

    IdMessage.From.Address := 'dluisbr@yahoo.com.br';
    IdMessage.From.Name := 'Info Sistemas (Teste)';
    IdMessage.ReplyTo.EMailAddresses := IdMessage.From.Address;
    IdMessage.Recipients.Add.Text := cdsClienteEMAIL.Value;
    IdMessage.Recipients.Add.Text := cdsClienteEMAIL.Value;
    IdMessage.Recipients.Add.Text := cdsClienteEMAIL.Value;
    IdMessage.Subject := 'Teste de envio de e-mail';
    IdMessage.Encoding := meMIME;

    IdText := TIdText.Create(IdMessage.MessageParts);
    IdText.Body.Add('Teste Info Sistemas (Teste)');
    IdText.ContentType := 'text/plain; charset=iso-8859-1';

    sAnexo  := 'C:\infosistemas\prjTeste\arqsxml\'+ 'arqcli_end.xml';
    sAnexo1 := 'C:\infosistemas\prjTeste\arqsxml\'+ 'arqcli.xml';
    if ( FileExists(sAnexo) AND FileExists(sAnexo1)) then
    begin
      TIdAttachmentFile.Create(IdMessage.MessageParts, sAnexo);
      TIdAttachmentFile.Create(IdMessage.MessageParts, sAnexo1);
    end;

    try
      IdSMTP.Connect;
      IdSMTP.Authenticate;
    except
      on E:Exception do
      begin
        MessageDlg('Erro na conexão ou autenticação: ' +
          E.Message, mtWarning, [mbOK], 0);
        Exit;
      end;
    end;

    try
      IdSMTP.Send(IdMessage);
      MessageDlg('Mensagem enviada com sucesso!', mtInformation, [mbOK], 0);
    except
      On E:Exception do
      begin
        MessageDlg('Erro ao enviar a mensagem: ' +
          E.Message, mtWarning, [mbOK], 0);
      end;
    end;
  finally

    IdSMTP.Disconnect;
    UnLoadOpenSSLLibrary;
    FreeAndNil(IdMessage);
    FreeAndNil(IdSSLIOHandlerSocket);
    FreeAndNil(IdSMTP);
  end;

end;

end.


