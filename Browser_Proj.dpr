program Browser_Proj;

uses
  Forms,
  Browser in 'Browser.pas' {FrmBrowser},
  unPaginaInicial in 'unPaginaInicial.pas' {FrmPaginaInicial},
  unFavoritos in 'unFavoritos.pas' {FrmFavoritos};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmBrowser, FrmBrowser);
  Application.CreateForm(TFrmPaginaInicial, FrmPaginaInicial);
  Application.CreateForm(TFrmFavoritos, FrmFavoritos);
  Application.Run;
end.
