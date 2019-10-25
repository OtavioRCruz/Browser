unit unFavoritos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Registry, StdCtrls, Buttons;

type
  TFrmFavoritos = class(TForm)
    ComboBox1: TComboBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BitBtn1: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure ListaFavoritos;
  end;

var
  FrmFavoritos: TFrmFavoritos;
  RegistroFav: TRegistry;

implementation

uses Browser;

{$R *.dfm}

procedure TFrmFavoritos.SpeedButton1Click(Sender: TObject);
var
  endereco: String;
begin
  RegistroFav:= TRegistry.Create;
  if not RegistroFav.KeyExists('Favoritos') then
    RegistroFav.CreateKey('Favoritos')
  else
  begin
    With FrmBrowser do
    begin
      RegistroFav.OpenKey('Favoritos', True);
      endereco:=RegistroFav.ReadString(ComboBox1.Text);
      if ((Length(endereco)=0) and (ComboBox1.Text <>'')) then
      begin
        RegistroFav.WriteString(wbPagina.LocationURL, wbPagina.LocationName);
        lbFavoritos.Items.Add(wbPagina.LocationURL);
      end;
    end;
  end;
  Registrofav.closekey;
end;

procedure TFrmFavoritos.SpeedButton2Click(Sender: TObject);
begin
  RegistroFav:= TRegistry.Create;
  if RegistroFav.OpenKey('Favoritos', True) then
  begin
    RegistroFav.DeleteValue(ComboBox1.Text);
    RegistroFav.CloseKey;
    ListaFavoritos;
  end;
end;

procedure TFrmFavoritos.FormActivate(Sender: TObject);
begin
  ComboBox1.Items.Clear;
  ComboBox1.Text:=FrmBrowser.cbEndereco.Text;
end;

procedure TFrmFavoritos.ListaFavoritos;
var
 Lista: TStringList;
 I: Integer;
begin
  FrmBrowser.lbFavoritos.Clear;
  Lista:=TStringList.Create;
  RegistroFav:=TRegistry.Create;
  if RegistroFav.OpenKey('Favoritos', True) then
    RegistroFav.getValueNames(Lista);
    for I:= 0 to Lista.Count -1 do
      FrmBrowser.lbFavoritos.items.add(Lista.strings[I]);
    RegistroFav.closeKey;
    Lista.Free;
end;

end.
