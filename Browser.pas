unit Browser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, SHDocVw, ExtCtrls, ComCtrls, ToolWin,
  ImgList, Menus, Buttons, Registry;

type
  TFrmBrowser = class(TForm)
    MainMenu1: TMainMenu;
    Favoritos1: TMenuItem;
    Configurar1: TMenuItem;
    PginaInicial1: TMenuItem;
    Configurar2: TMenuItem;
    Sair1: TMenuItem;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    cbEndereco: TComboBox;
    wbPagina: TWebBrowser;
    PaFavoritos: TPanel;
    lbFavoritos: TListBox;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure wbPaginaDownloadBegin(Sender: TObject);
    procedure wbPaginaDownloadComplete(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbEnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure cbEnderecoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure lbFavoritosClick(Sender: TObject);
    procedure Configurar2Click(Sender: TObject);
    procedure Configurar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBrowser: TFrmBrowser;
  PaginaInicial:String;
  RegistroPagIni:Tregistry;

implementation

uses unPaginaInicial, unFavoritos;

{$R *.dfm}

procedure TFrmBrowser.ToolButton1Click(Sender: TObject);
begin
  ToolButton2.Enabled:=True;
  Try
    wbPagina.GoBack;
  Except
    ToolButton1.Enabled:=False;
  End;
end;

procedure TFrmBrowser.ToolButton2Click(Sender: TObject);
begin
  ToolButton1.Enabled:=true;
  try
    wbPagina.GoForward;
  except
    ToolButton2.Enabled:=false;
  end;
end;

procedure TFrmBrowser.ToolButton3Click(Sender: TObject);
begin
  wbPagina.Stop;
end;

procedure TFrmBrowser.ToolButton4Click(Sender: TObject);
begin
  wbPagina.Refresh;
  ToolButton1.Enabled:=True;
  ToolButton2.Enabled:=True;
end;

procedure TFrmBrowser.Sair1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmBrowser.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=False;
  If Application.MessageBox('Sair do Browser?','Aviso',MB_OKCANCEL) = idOK then
  CanClose:=true; 
end;

procedure TFrmBrowser.wbPaginaDownloadBegin(Sender: TObject);
begin
  StatusBar1.SimpleText:='Carregando a Página';
  FrmBrowser.Caption:='Navegador de Internet';
  cbEndereco.Text:=wbPagina.LocationURL;
end;

procedure TFrmBrowser.wbPaginaDownloadComplete(Sender: TObject);
begin
  StatusBar1.SimpleText:=wbPagina.LocationName;
  FrmBrowser.Caption:=wbPagina.LocationName;
  cbEndereco.Text:=wbPagina.LocationURL;
end;

procedure TFrmBrowser.ToolButton6Click(Sender: TObject);
begin
  if not PaFavoritos.Visible then
    begin
      PaFavoritos.Visible:=True;
      wbPagina.Left:=PaFavoritos.Width + 5;
      wbPagina.Width:=wbPagina.Width - PaFavoritos.Width;
      FrmFavoritos.ListaFavoritos
    end;
end;

procedure TFrmBrowser.FormActivate(Sender: TObject);
begin
  wbPagina.Navigate(PaginaInicial);
  cbEndereco.Text:=PaginaInicial;
end;

procedure TFrmBrowser.cbEnderecoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    wbPagina.Navigate(cbEndereco.Text);
    cbEndereco.Items.Add(cbEndereco.Text);
  end;
end;

procedure TFrmBrowser.cbEnderecoClick(Sender: TObject);
begin
  wbPagina.Navigate(cbEndereco.Text);
  cbEndereco.Items.Add(cbEndereco.Text);
end;

procedure TFrmBrowser.SpeedButton1Click(Sender: TObject);
begin
  PaFavoritos.Visible:=False;
  wbPagina.Left:=PaFavoritos.Left;
  wbPagina.Width:=wbPagina.Width + PaFavoritos.Width;
end;

procedure TFrmBrowser.lbFavoritosClick(Sender: TObject);
begin
  cbEndereco.Text:= lbFavoritos.Items[lbFavoritos.ItemIndex];
  if (cbEndereco.Text<>'') then
  wbPagina.Navigate(cbEndereco.text);
end;

procedure TFrmBrowser.Configurar2Click(Sender: TObject);
begin
  FrmPaginaInicial.ShowModal;
end;

procedure TFrmBrowser.Configurar1Click(Sender: TObject);
begin
  FrmFavoritos.ShowModal;
end;

Initialization
  RegistroPagIni:=TRegistry.Create;
  if RegistroPagIni.KeyExists('PagIni') then
    begin
      RegistroPagIni.OpenKey('PagIni', True);
      PaginaInicial:=RegistroPagIni.ReadString('PaginaInicial');
      RegistroPagIni.CloseKey;
    end
    else
    begin
      RegistroPagIni.CreateKey('PagIni');
      if RegistroPagIni.OpenKey('pagIni', True) then
        begin
          RegistroPagIni.WriteString('PaginaInicial','http://www.noginfo.com.br');
          Paginainicial:='http://www.noginfo.com.br';
          RegistroPagIni.CloseKey;
        end;
    end;

end.
