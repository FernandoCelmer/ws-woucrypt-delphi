unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, pngimage, ExtDlgs, Mask, DBCtrls;

type
  TForm3 = class(TForm)
    Image4: TImage;
    Panel1: TPanel;
    Panel_criar: TPanel;
    Timer1: TTimer;
    OpenTextFileDialog1: TOpenTextFileDialog;
    SaveTextFileDialog2: TSaveTextFileDialog;
    Timer_manda_senha: TTimer;
    Edit5: TEdit;
    Memo1: TMemo;
    DBEdit1: TDBEdit;
    Image2: TImage;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Image1: TImage;
    Memo_idioma: TMemo;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer_manda_senhaTimer(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);
begin
If not(fileexists(ExtractFilePath(Application.ExeName)+'idioma.ini')) then
     begin
     end
     else
     If (fileexists(ExtractFilePath(Application.ExeName)+'idioma.ini')) then
     Memo_idioma.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+'idioma.ini');
     /////////////////////////////////

if Memo_idioma.Lines[0]='Português' then
begin
Image1.Visible:=false;
Image2.Visible:=true;
end
else
if Memo_idioma.Lines[0]='Inglês' then
begin
Image1.Visible:=true;
Image2.Visible:=false;
end;

Caption:=form1.Idioma.Lines[3];
SpeedButton3.Caption:=form1.Idioma.Lines[21];
SpeedButton4.Caption:=form1.Idioma.Lines[20];
end;

procedure TForm3.Memo1KeyPress(Sender: TObject; var Key: Char);
Var
   C : Longint;
begin
{
if Length(Memo1.Lines.Strings[Memo1.CaretPos.Y]) =  then
if Key >= '0' then
Key := #0;
}
end;


procedure TForm3.SpeedButton3Click(Sender: TObject);
begin
//abre o arquivo
if OpenTextFileDialog1.Execute then
begin
  Memo1.Lines.LoadFromFile(OpenTextFileDialog1.FileName);
   edit5.Text:=memo1.Text;
  Timer_manda_senha.Enabled:=true;
end;
end;

procedure TForm3.SpeedButton4Click(Sender: TObject);
begin
Timer_manda_senha.Enabled:=true;

form1.BitBtn_Texto.Enabled:=true;
form1.BitBtn_arquivos.Enabled:=true;
//////////////////////////////////////////////////
form1.PageControl1.Enabled:=true;
form1.bitbtn1.Enabled:=false;
form1.bitbtn4.Enabled:=true;

form1.memo2.Enabled:=false;

form1.BitBtn_salvar1_cript.Enabled:=true;
form1.BitBtn_salvar1_decript.Enabled:=true;

//botões cript
form1.BitBtn_cript.Enabled:=true;
form1.BitBtn_abrir_cript.Enabled:=true;
form1.BitBtn_salvar_cript.Enabled:=true;
form1.BitBtn_copiar_cript.Enabled:=true;
form1.BitBtn_colar_cript.Enabled:=true;
form1.BitBtn_limpar_cript.Enabled:=true;
//botões decript
form1.BitBtn_decript.Enabled:=true;
form1.BitBtn_abrir_decript.Enabled:=true;
form1.BitBtn_salvar_decript.Enabled:=true;
form1.BitBtn_copiar_decript.Enabled:=true;
form1.BitBtn_colar_decript.Enabled:=true;
form1.BitBtn_limpar_decript.Enabled:=true;
//////////////////////////////////////////////////

close;
end;

procedure TForm3.Timer1Timer(Sender: TObject);
begin
memo1.Text:=edit5.Text;

if memo1.Text='' then
begin
SpeedButton4.Enabled:=false;
end
else
if memo1.Text<>'' then
begin
SpeedButton4.Enabled:=true;
end;
end;

procedure TForm3.Timer2Timer(Sender: TObject);
begin
if form1.Memo_idioma.Lines[0]='Português' then
begin
Image1.Visible:=false;
Image2.Visible:=true;
end
else
if form1.Memo_idioma.Lines[0]='Inglês' then
begin
Image1.Visible:=true;
Image2.Visible:=false;
end;
end;

procedure TForm3.Timer_manda_senhaTimer(Sender: TObject);
begin
form1.edit3.Text:=memo1.Text;
end;

end.

   {
if memo1.Text=' ' then
if memo1.Text='  ' then
if memo1.Text='   ' then
if memo1.Text='    ' then
if memo1.Text='     ' then
if memo1.Text='      ' then
if memo1.Text='       ' then
if memo1.Text='        ' then
if memo1.Text='         ' then
if memo1.Text='          ' then
if memo1.Text='           ' then
if memo1.Text='            ' then
if memo1.Text='             ' then


if memo1.Text=' ' then
begin
SpeedButton4.Enabled:=false;
end
else
if memo1.Text='  ' then
begin
SpeedButton4.Enabled:=false;
end
else
if memo1.Text='   ' then
begin
SpeedButton4.Enabled:=false;
end
else
if memo1.Text='    ' then
begin
SpeedButton4.Enabled:=false;
end
else
if memo1.Text='     ' then
begin
SpeedButton4.Enabled:=false;
end
else
if memo1.Text='      ' then
begin
SpeedButton4.Enabled:=false;
end
else
if memo1.Text='       ' then
begin
SpeedButton4.Enabled:=false;
end
else
if memo1.Text='        ' then
begin
SpeedButton4.Enabled:=false;
end
else
if memo1.Text='         ' then
begin
SpeedButton4.Enabled:=false;
end
else
if memo1.Text='          ' then
begin
SpeedButton4.Enabled:=false;
end
else
if memo1.Text='' then
begin
SpeedButton4.Enabled:=false;
end
else
if memo1.Text='' then
begin
SpeedButton4.Enabled:=false;
end
else
if memo1.Text='' then
begin
SpeedButton4.Enabled:=false;
end
else
if memo1.Text='' then
begin
SpeedButton4.Enabled:=false;
end
else
if memo1.Text='' then
begin
SpeedButton4.Enabled:=false;
end
else
}
