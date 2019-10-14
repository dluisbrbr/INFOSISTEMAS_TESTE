program prjCadastroCliente;

uses
  Vcl.Forms,
  untCadastro in 'untCadastro.pas' {frmCadCliente},
  ViaCEP.Core in 'viacep\ViaCEP.Core.pas',
  ViaCEP.Intf in 'viacep\ViaCEP.Intf.pas',
  ViaCEP.Model in 'viacep\ViaCEP.Model.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCadCliente, frmCadCliente);
  Application.Run;
end.
