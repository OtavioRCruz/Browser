unit unPaginaInicial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Registry;

type
  TFrmPaginaInicial = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPaginaInicial: TFrmPaginaInicial;
  RegPaginaInicial: TRegistry;

implementation

{$R *.dfm}

procedure TFrmPaginaInicial.SpeedButton1Click(Sender: TObject);
begin
  RegPaginaInicial:= TRegistry.Create;
  if RegPaginaInicial.OpenKey('PagIni',True) then
    RegPaginaInicial.WriteString('PaginaInicial', Edit1.Text);
    RegPaginaInicial.CloseKey;
end;

procedure TFrmPaginaInicial.FormActivate(Sender: TObject);
begin
  Edit1.SetFocus;
end;

end.
