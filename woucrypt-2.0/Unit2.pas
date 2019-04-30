unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, pngimage, ExtDlgs;

type
  TForm2 = class(TForm)
    Image1: TImage;
    ListBox1: TListBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Panel_gerar: TPanel;
    Timer1: TTimer;
    SaveTextFileDialog2: TSaveTextFileDialog;
    Timer_manda_senha: TTimer;
    Memo1: TMemo;
    Edit5: TEdit;
    SaveDialog1: TSaveDialog;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Image2: TImage;
    Memo_idioma: TMemo;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer_manda_senhaTimer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
begin
If not(fileexists(ExtractFilePath(Application.ExeName)+'idioma.ini')) then
     begin
     end
     else
     If (fileexists(ExtractFilePath(Application.ExeName)+'idioma.ini')) then
     Memo_idioma.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+'idioma.ini');
     /////////////////////////////////

if form1.Memo_idioma.Lines[0]='Português' then
begin
Image2.Visible:=false;
Image1.Visible:=true;
end
else
if form1.Memo_idioma.Lines[0]='Inglês' then
begin
Image2.Visible:=true;
Image1.Visible:=false;
end;


Caption:=form1.Idioma.Lines[3];
SpeedButton1.Caption:=form1.Idioma.Lines[19];
SpeedButton2.Caption:=form1.Idioma.Lines[20];
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
timer1.Enabled:=true;
begin
Edit1.Text:=ListBox1.Items[Random(Listbox1.items.count)]
+ ListBox1.Items[Random(Listbox1.items.count)]
+ ListBox1.Items[Random(Listbox1.items.count)]
+ ListBox1.Items[Random(Listbox1.items.count)]
+ ListBox1.Items[Random(Listbox1.items.count)]
end;
begin
Edit2.Text:=ListBox1.Items[Random(Listbox1.items.count)]
+ ListBox1.Items[Random(Listbox1.items.count)]
+ ListBox1.Items[Random(Listbox1.items.count)]
+ ListBox1.Items[Random(Listbox1.items.count)]
+ ListBox1.Items[Random(Listbox1.items.count)]
end;
begin
Edit3.Text:=ListBox1.Items[Random(Listbox1.items.count)]
+ ListBox1.Items[Random(Listbox1.items.count)]
+ ListBox1.Items[Random(Listbox1.items.count)]
+ ListBox1.Items[Random(Listbox1.items.count)]
+ ListBox1.Items[Random(Listbox1.items.count)]
end;
begin
Edit4.Text:=ListBox1.Items[Random(Listbox1.items.count)]
+ ListBox1.Items[Random(Listbox1.items.count)]
+ ListBox1.Items[Random(Listbox1.items.count)]
+ ListBox1.Items[Random(Listbox1.items.count)]
+ ListBox1.Items[Random(Listbox1.items.count)]
end;
edit5.Text:=(edit1.Text + '-'+edit2.Text + '-'+edit3.Text + '-'+edit4.Text );
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
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
 {
if SaveDialog1.Execute then
begin
  Memo1.Lines.SaveToFile(SaveDialog1.FileName);
end;
  }
close;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
memo1.Text:=edit5.Text;



if edit1.Text='' then
begin
SpeedButton2.Enabled:=false;
end
else
if edit1.Text<>'' then
SpeedButton2.Enabled:=true;
end;

procedure TForm2.Timer_manda_senhaTimer(Sender: TObject);
begin
form1.edit3.Text:=memo1.Text;
end;

end.
