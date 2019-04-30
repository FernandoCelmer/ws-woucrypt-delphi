unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus, ComCtrls, pngimage, ExtCtrls, ExtDlgs,Registry,
  jpeg, IdBaseComponent, IdAntiFreezeBase, IdAntiFreeze, Gauges, ImgList,ShellAPI,
  OleCtrls, SHDocVw, FileCtrl, DB, ADODB, System.ImageList;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Timer1: TTimer;
    ScrollBox1: TScrollBox;
    Panel_menu: TPanel;
    Image2: TImage;
    Edit3: TEdit;
    ChavedeSegurana1: TMenuItem;
    GerarChave1: TMenuItem;
    CriarChave1: TMenuItem;
    CopiarChave1: TMenuItem;
    Memo5: TMemo;
    Configuraes1: TMenuItem;
    LimparTudo1: TMenuItem;
    IdAntiFreeze1: TIdAntiFreeze;
    ImageList1: TImageList;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Timer_trial: TTimer;
    Crditos1: TMenuItem;
    trocarSenha1: TMenuItem;
    Memo6: TMemo;
    SpeedButton1: TSpeedButton;
    BitBtn_gerar_serial: TSpeedButton;
    BitBtn_criar_serial: TSpeedButton;
    BitBtn_Texto: TSpeedButton;
    BitBtn_arquivos: TSpeedButton;
    SaveDialog2: TSaveDialog;
    Idioma1: TMenuItem;
    PortugusBrasil1: TMenuItem;
    English1: TMenuItem;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    ProgressBar3: TProgressBar;
    Panel5: TPanel;
    Label5: TLabel;
    DriveComboBox1: TDriveComboBox;
    FilterComboBox1: TFilterComboBox;
    Edit1: TEdit;
    DirectoryListBox1: TDirectoryListBox;
    FileListBox1: TFileListBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    memo1: TMemo;
    Memo2: TMemo;
    Panel2: TPanel;
    BitBtn_abrir_cript: TBitBtn;
    BitBtn_salvar_cript: TBitBtn;
    BitBtn_copiar_cript: TBitBtn;
    BitBtn_colar_cript: TBitBtn;
    BitBtn_limpar_cript: TBitBtn;
    BitBtn_cript: TBitBtn;
    BitBtn_salvar1_decript: TBitBtn;
    ProgressBar1: TProgressBar;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    BitBtn_abrir_decript: TBitBtn;
    BitBtn_limpar_decript: TBitBtn;
    BitBtn_copiar_decript: TBitBtn;
    BitBtn_colar_decript: TBitBtn;
    BitBtn_salvar_decript: TBitBtn;
    BitBtn_decript: TBitBtn;
    Memo3: TMemo;
    Memo4: TMemo;
    BitBtn_salvar1_cript: TBitBtn;
    ProgressBar2: TProgressBar;
    Memo_Ingles: TMemo;
    Memo_Portugues: TMemo;
    Idioma: TMemo;
    Ajuda1: TMenuItem;
    Memo_idioma: TMemo;
    Edit2: TEdit;
    Timer_Reiniciar: TTimer;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn_abrir_criptClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure LimparTudo1Click(Sender: TObject);
    procedure BitBtn_copiar_criptClick(Sender: TObject);
    procedure BitBtn_colar_criptClick(Sender: TObject);
    procedure BitBtn_limpar_criptClick(Sender: TObject);
    procedure BitBtn_abrir_decriptClick(Sender: TObject);
    procedure BitBtn_copiar_decriptClick(Sender: TObject);
    procedure BitBtn_colar_decriptClick(Sender: TObject);
    procedure BitBtn_limpar_decriptClick(Sender: TObject);
    procedure BitBtn_criptClick(Sender: TObject);
    procedure BitBtn_decriptClick(Sender: TObject);
    procedure BitBtn_salvar_decriptClick(Sender: TObject);
    procedure BitBtn_salvar_criptClick(Sender: TObject);
    procedure BitBtn_salvar1_criptClick(Sender: TObject);
    procedure BitBtn_salvar1_decriptClick(Sender: TObject);
    procedure CopiarChave1Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ByreaPortal1Click(Sender: TObject);
    procedure Crditos1Click(Sender: TObject);
    procedure trocarSenha1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn_gerar_serialClick(Sender: TObject);
    procedure BitBtn_criar_serialClick(Sender: TObject);
    procedure BitBtn_arquivosClick(Sender: TObject);
    procedure BitBtn_TextoClick(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure PortugusBrasil1Click(Sender: TObject);
    procedure English1Click(Sender: TObject);
    procedure Ajuda1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Timer_ReiniciarTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit3, Unit2, Unit4;

{$R *.dfm}

/////////////////////////////////////////////////////////////////////////////
//CRIPTOGRAFIA DE ARQUIVOS
function MemoryStreamToString(M: TMemoryStream):string;
begin
  SetString(Result, PChar(M.Memory), M.size div SizeOf(Char));
end;

function Crypt(Texto, senha: string): string;
var
  x, y: Integer;
  Novo: String;
begin
  for x := 1 to Length(senha) do begin
    Novo := '';
    for y := 1 to Length(Texto) do
      Novo := Novo + chr((Ord(Senha[x]) xor Ord(Texto[y])));
    Texto := Novo;
  end;
  Result := Texto;
end;
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//CRIPTOGRAFIA DE TEXTO
Function EncrypKey (Src:String; Key:String):string;
  var
  //idx :integer;
  KeyLen :Integer;
  KeyPos :Integer;
  offset :Integer;
  dest :string;
  SrcPos :Integer;
  SrcAsc :Integer;
  //TmpSrcAsc :Integer;
  Range :Integer;
  Edit3 : String;
  Keyx : String;
  begin
  Edit3 := Keyx;
  KeyLen:=Length(Key);
  if KeyLen = 0
  then key:= Keyx;
  KeyPos:=0;
  SrcPos:=0;
  SrcAsc:=0;
  Range:=256;

  Randomize;
  offset:=Random(Range);
  dest:=format('%1.2x',[offset]);
  for SrcPos := 1 to Length(Src) do
  begin
  SrcAsc:=(Ord(Src[SrcPos]) + offset)   MOD   255;
  if   KeyPos < KeyLen then KeyPos:= KeyPos + 1 else KeyPos:=1;
  SrcAsc:= SrcAsc xor Ord(Key[KeyPos]);
  dest:=dest + format('%1.2x',[SrcAsc]);
  offset:=SrcAsc;
  end;
  Result:=Dest;
  end;
  Function UncrypKey (Src:String; Key:String):string;
  var
  //idx :integer;
  KeyLen :Integer;
  KeyPos :Integer;
  offset :Integer;
  dest :string;
  SrcPos :Integer;
  SrcAsc :Integer;
  TmpSrcAsc :Integer;
  Range :Integer;
  Edit3 : String;
  Keyx : String;
  begin
  Edit3 := Keyx;
  KeyLen:=Length(Key);
  if KeyLen = 0
  then key:=Keyx;
  KeyPos:=0;
  SrcPos:=0;
  SrcAsc:=0;
  Range:=256;
  offset:=StrToInt('$'+   copy(src,1,2));
  SrcPos:=3;
  repeat
  SrcAsc:=StrToInt('$'+ copy(src,SrcPos,2));
  if KeyPos < KeyLen Then KeyPos := KeyPos + 1 else KeyPos := 1;
  TmpSrcAsc := SrcAsc xor Ord(Key[KeyPos]);
  if   TmpSrcAsc <=offset then
  TmpSrcAsc :=255 + TmpSrcAsc - offset
  else
  TmpSrcAsc := TmpSrcAsc   -   offset;
  dest := dest + chr(TmpSrcAsc);
  offset:=srcAsc;
  SrcPos:=SrcPos + 2;
  until SrcPos >= Length(Src);
  Result:=Dest;
  end;
/////////////////////////////////////////////////////////////////////////////


procedure TForm1.Ajuda1Click(Sender: TObject);
begin
ShellExecute(handle, 'open',Pchar('chrome.exe'),Pchar('http://www.wousoftware.com/'), Nil, SW_SHOWNORMAL);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
Form4.show;
end;

procedure TForm1.BitBtn7Click(Sender: TObject);
var
  Arquivo: TMemoryStream;
  ArquivoString: string;
begin
  if FileExists(Edit1.Text) then begin
    Arquivo := TMemoryStream.Create;
    Arquivo.LoadFromFile(Edit1.Text);
    ArquivoString := MemoryStreamToString(Arquivo);
    ArquivoString := Crypt(ArquivoString, Edit3.Text);
    Arquivo.Free;
    Arquivo := TMemoryStream.Create;
    Arquivo.WriteBuffer(Pointer(ArquivoString)^, Length(ArquivoString));
    if SaveDialog2.Execute then begin
      Arquivo.SaveToFile(SaveDialog2.FileName);
      Application.MessageBox('Salvo com sucesso!', 'Aviso', 64);
    end;
    Arquivo.Free;
    ArquivoString := '';
  end;

end;

procedure TForm1.BitBtn_abrir_criptClick(Sender: TObject);
begin
//abre o arquivo
if OpenDialog1.Execute then
begin
  //Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
  FileListBox1.FileName := OpenDialog1.FileName;
end;
end;

procedure TForm1.BitBtn_abrir_decriptClick(Sender: TObject);
begin
//abre o arquivo
if OpenDialog1.Execute then
begin
  Memo4.Lines.LoadFromFile(OpenDialog1.FileName);
end;
end;

procedure TForm1.BitBtn_colar_criptClick(Sender: TObject);
begin
memo1.PasteFromClipboard;
end;

procedure TForm1.BitBtn_colar_decriptClick(Sender: TObject);
begin
memo4.PasteFromClipboard;
end;

procedure TForm1.BitBtn_copiar_criptClick(Sender: TObject);
begin
memo1.SelectAll;
//memo1.SelStart;
//memo1.SelLength;
memo1.CopyToClipboard;
end;

procedure TForm1.BitBtn_copiar_decriptClick(Sender: TObject);
begin
memo4.SelectAll;
//memo2.SelStart;
//memo2.SelLength;
memo4.CopyToClipboard;
end;

procedure TForm1.BitBtn_criar_serialClick(Sender: TObject);
begin
form3.showmodal;
end;

procedure TForm1.BitBtn_criptClick(Sender: TObject);
var
I:integer;

begin
if memo1.Text='' then
begin
Showmessage('Campo "Texto Original" Vazio!');
memo1.SetFocus;
end
else
if memo1.Text<>'' then
begin
Memo2.Text:= EncrypKey(Memo1.Text,Edit3.text);

with memo2 do begin
ProgressBar1.Max := Lines.Count;
for I := 0 to Lines.Count do begin
ProgressBar1.Position := I;
Sleep(1);
end;
end;

end;
end;

procedure TForm1.BitBtn_decriptClick(Sender: TObject);
Var
I:integer;

begin
if memo4.Text='' then
begin
Showmessage('Campo "Texto Criptografado" Vazio!');
memo4.SetFocus;
end
else
if memo4.Text<>'' then
begin
Memo3.Text:= UncrypKey(Memo4.Text,Edit3.text);

with memo3 do begin
ProgressBar2.Max := Lines.Count;
for I := 0 to Lines.Count do begin
ProgressBar2.Position := I;
Sleep(1);
end;
end;
end;
end;

procedure TForm1.BitBtn_gerar_serialClick(Sender: TObject);
begin
form2.showmodal;
end;

procedure TForm1.BitBtn_limpar_criptClick(Sender: TObject);
begin
progressbar1.Position:=0;
memo1.Clear;
memo2.Clear;
end;

procedure TForm1.BitBtn_limpar_decriptClick(Sender: TObject);
begin
progressbar2.Position:=0;
memo3.Clear;
memo4.Clear;
end;

procedure TForm1.BitBtn_salvar1_criptClick(Sender: TObject);
begin
{
if SaveTextFileDialog1.Execute then
begin
  Memo3.Lines.SaveToFile(SaveTextFileDialog1.FileName);
end;

}

SaveDialog1.DefaultExt:= 'txt';
  { Execute a save file dialog. }
  if SaveDialog1.Execute then
    { First check if the file exists. }

      { Otherwise, save the memo box lines into the file. }
      Memo3.Lines.SaveToFile(SaveDialog1.FileName);

end;

procedure TForm1.BitBtn_salvar1_decriptClick(Sender: TObject);
begin
{
if SaveTextFileDialog1.Execute then
begin
  Memo2.Lines.SaveToFile(SaveTextFileDialog1.FileName);
end;
}

SaveDialog1.DefaultExt:= 'txt';
  { Execute a save file dialog. }
  if SaveDialog1.Execute then
    { First check if the file exists. }

      { Otherwise, save the memo box lines into the file. }
      Memo2.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TForm1.BitBtn_salvar_criptClick(Sender: TObject);
begin
{
if SaveTextFileDialog1.Execute then
begin
  Memo1.Lines.SaveToFile(SaveTextFileDialog1.FileName);
end;
      }

SaveDialog1.DefaultExt:= 'txt';
  { Execute a save file dialog. }
  if SaveDialog1.Execute then
    { First check if the file exists. }

      { Otherwise, save the memo box lines into the file. }
      Memo1.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TForm1.BitBtn_salvar_decriptClick(Sender: TObject);
begin
{
if SaveTextFileDialog1.Execute then
begin
  Memo4.Lines.SaveToFile(SaveTextFileDialog1.FileName);
end;
        }

        SaveDialog1.DefaultExt:= 'txt';
  { Execute a save file dialog. }
  if SaveDialog1.Execute then
    { First check if the file exists. }

      { Otherwise, save the memo box lines into the file. }
      Memo4.Lines.SaveToFile(SaveDialog1.FileName);

end;

procedure TForm1.BitBtn_TextoClick(Sender: TObject);
begin
PageControl1.Visible:=true;
PageControl1.Align:=alClient;

PageControl2.Visible:=false;
PageControl2.Align:=alnone;
end;

procedure TForm1.ByreaPortal1Click(Sender: TObject);
begin
ShellExecute(handle, 'open',Pchar('chrome.exe'),Pchar('http://www.areaportal.com.br'), Nil, SW_SHOWNORMAL);
end;

procedure TForm1.CopiarChave1Click(Sender: TObject);
begin
SaveDialog1.DefaultExt:= 'txt';
  { Execute a save file dialog. }
  if SaveDialog1.Execute then
    { First check if the file exists. }

      { Otherwise, save the memo box lines into the file. }
      Memo5.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TForm1.Crditos1Click(Sender: TObject);
begin
ShellExecute(handle, 'open',Pchar('chrome.exe'),Pchar('http://www.wousoftware.com/'), Nil, SW_SHOWNORMAL);
end;

procedure TForm1.English1Click(Sender: TObject);
var
arq:TextFile;
begin
//menu
Configuraes1.Caption:=Memo_Ingles.Lines[0];
Crditos1.Caption:=Memo_Ingles.Lines[1];
Sair1.Caption:=Memo_Ingles.Lines[2];
ChavedeSegurana1.Caption:=Memo_Ingles.Lines[3];
GerarChave1.Caption:=Memo_Ingles.Lines[4];
CriarChave1.Caption:=Memo_Ingles.Lines[5];
CopiarChave1.Caption:=Memo_Ingles.Lines[6];
trocarSenha1.Caption:=Memo_Ingles.Lines[7];
LimparTudo1.Caption:=Memo_Ingles.Lines[8];
Idioma1.Caption:=Memo_Ingles.Lines[9];
Ajuda1.Caption:=Memo_Ingles.Lines[22];
//botões
BitBtn_gerar_serial.Caption:=Memo_Ingles.Lines[4];
BitBtn_criar_serial.Caption:=Memo_Ingles.Lines[5];
//botões cript
BitBtn_cript.Hint:=Memo_Ingles.Lines[10];
BitBtn_abrir_cript.Hint:=Memo_Ingles.Lines[12];
BitBtn_salvar_cript.Hint:=Memo_Ingles.Lines[13];
BitBtn_copiar_cript.Hint:=Memo_Ingles.Lines[14];
BitBtn_colar_cript.Hint:=Memo_Ingles.Lines[15];
BitBtn_limpar_cript.Hint:=Memo_Ingles.Lines[16];
BitBtn_salvar1_decript.Hint:=Memo_Ingles.Lines[13];
//botões decrypt
BitBtn_decript.Hint:=Memo_Ingles.Lines[11];
BitBtn_abrir_decript.Hint:=Memo_Ingles.Lines[12];
BitBtn_salvar_decript.Hint:=Memo_Ingles.Lines[13];
BitBtn_copiar_decript.Hint:=Memo_Ingles.Lines[14];
BitBtn_colar_decript.Hint:=Memo_Ingles.Lines[15];
BitBtn_limpar_decript.Hint:=Memo_Ingles.Lines[16];
BitBtn_salvar1_cript.Hint:=Memo_Ingles.Lines[13];
//barra
StatusBar1.Panels[0].Text:=Memo_Ingles.Lines[17];
StatusBar1.Panels[2].Text:=Memo_Ingles.Lines[18];
//form2
form2.Caption:=Memo_Ingles.Lines[3];
form2.SpeedButton1.Caption:=Memo_Ingles.Lines[19];
form2.SpeedButton2.Caption:=Memo_Ingles.Lines[20];
//form3
form3.Caption:=Memo_Ingles.Lines[3];
form3.SpeedButton3.Caption:=Memo_Ingles.Lines[21];
form3.SpeedButton4.Caption:=Memo_Ingles.Lines[20];

AssignFile(Arq, 'language.ini');
  Rewrite(Arq);
              Writeln(Arq, 'Settings');
              Writeln(Arq, 'Developer');
              Writeln(Arq, 'Sign Out');
              Writeln(Arq, 'Security Key');
              Writeln(Arq, 'Generate Key');
              Writeln(Arq, 'Create Key');
              Writeln(Arq, 'Save Key');
              Writeln(Arq, 'Change Key');
              Writeln(Arq, 'Clear Ally');
              Writeln(Arq, 'Language');
              Writeln(Arq, 'Encrypt Text');
              Writeln(Arq, 'Decrypt Text');
              Writeln(Arq, 'Open Text');
              Writeln(Arq, 'Save Text');
              Writeln(Arq, 'Copy Text');
              Writeln(Arq, 'Paste Text');
              Writeln(Arq, 'Clear Text');
              Writeln(Arq, 'Characters:');
              Writeln(Arq, 'Developed by: WouSoftware.com');
              Writeln(Arq, 'Generate');
              Writeln(Arq, 'Create');
              Writeln(Arq, 'Open');
              Writeln(Arq, 'Help');
              CloseFile(Arq);begin

              AssignFile(Arq, 'idioma.ini');
  Rewrite(Arq);
              Writeln(Arq, 'Inglês');
              CloseFile(Arq);

              Memo_idioma.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+'idioma.ini');
              form2.Memo_idioma.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+'idioma.ini');
              form3.Memo_idioma.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+'idioma.ini');
              end;


     ShellExecute(handle,'open',PChar(ExtractFilePath(Application.ExeName)+Edit2.Text), '','',SW_SHOWNORMAL);
     Timer_Reiniciar.Enabled:=true;


end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 {
CanClose := False;
If Application.MessageBox('Você deseja fechar o programa?', 'Aviso de Fechamento',MB_ICONWARNING+MB_YESNO)=ID_YES then
CanClose := True
else
CanClose := False;
}
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
DoubleBuffered := True;
edit2.Text:=(ExtractFileName(Application.ExeName)); //mostra o nome da aplicação

begin
     If not(fileexists(ExtractFilePath(Application.ExeName)+'language.ini')) then
     begin
     end
     else
     If (fileexists(ExtractFilePath(Application.ExeName)+'language.ini')) then
     Idioma.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+'language.ini');

     If not(fileexists(ExtractFilePath(Application.ExeName)+'idioma.ini')) then
     begin
     end
     else
     If (fileexists(ExtractFilePath(Application.ExeName)+'idioma.ini')) then
     Memo_idioma.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+'idioma.ini');



//menu
Configuraes1.Caption:=Idioma.Lines[0];
Crditos1.Caption:=Idioma.Lines[1];
Sair1.Caption:=Idioma.Lines[2];
ChavedeSegurana1.Caption:=Idioma.Lines[3];
GerarChave1.Caption:=Idioma.Lines[4];
CriarChave1.Caption:=Idioma.Lines[5];
CopiarChave1.Caption:=Idioma.Lines[6];
trocarSenha1.Caption:=Idioma.Lines[7];
LimparTudo1.Caption:=Idioma.Lines[8];
Idioma1.Caption:=Idioma.Lines[9];
Ajuda1.Caption:=Idioma.Lines[22];
//botões
BitBtn_gerar_serial.Caption:=Idioma.Lines[4];
BitBtn_criar_serial.Caption:=Idioma.Lines[5];
//botões cript
BitBtn_cript.Hint:=Idioma.Lines[10];
BitBtn_abrir_cript.Hint:=Idioma.Lines[12];
BitBtn_salvar_cript.Hint:=Idioma.Lines[13];
BitBtn_copiar_cript.Hint:=Idioma.Lines[14];
BitBtn_colar_cript.Hint:=Idioma.Lines[15];
BitBtn_limpar_cript.Hint:=Idioma.Lines[16];
BitBtn_salvar1_decript.Hint:=Idioma.Lines[13];
//botões decrypt
BitBtn_decript.Hint:=Idioma.Lines[11];
BitBtn_abrir_decript.Hint:=Idioma.Lines[12];
BitBtn_salvar_decript.Hint:=Idioma.Lines[13];
BitBtn_copiar_decript.Hint:=Idioma.Lines[14];
BitBtn_colar_decript.Hint:=Idioma.Lines[15];
BitBtn_limpar_decript.Hint:=Idioma.Lines[16];
BitBtn_salvar1_cript.Hint:=Idioma.Lines[13];
//barra
StatusBar1.Panels[0].Text:=Idioma.Lines[17];
StatusBar1.Panels[2].Text:=Idioma.Lines[18];
     end;



end;

procedure TForm1.FormShow(Sender: TObject);
begin
{ Se o primeiro parâmetro for um nome de arquivo existente... }
  if FileExists(ParamStr(1)) then
  { Carrega o conteúdo do arquivo no memo }
end;

procedure TForm1.LimparTudo1Click(Sender: TObject);
begin
memo1.Clear;
memo2.Clear;
memo3.Clear;
memo4.Clear;

progressbar1.Position:=0;
progressbar2.Position:=0;
end;

procedure TForm1.PortugusBrasil1Click(Sender: TObject);
var
arq:TextFile;
begin
Configuraes1.Caption:=Memo_Portugues.Lines[0];
Crditos1.Caption:=Memo_Portugues.Lines[1];
Sair1.Caption:=Memo_Portugues.Lines[2];
ChavedeSegurana1.Caption:=Memo_Portugues.Lines[3];
GerarChave1.Caption:=Memo_Portugues.Lines[4];
CriarChave1.Caption:=Memo_Portugues.Lines[5];
CopiarChave1.Caption:=Memo_Portugues.Lines[6];
trocarSenha1.Caption:=Memo_Portugues.Lines[7];
LimparTudo1.Caption:=Memo_Portugues.Lines[8];
Idioma1.Caption:=Memo_Portugues.Lines[9];
Ajuda1.Caption:=Memo_Portugues.Lines[22];
//botões
BitBtn_gerar_serial.Caption:=Memo_Portugues.Lines[4];
BitBtn_criar_serial.Caption:=Memo_Portugues.Lines[5];
//botões cript
BitBtn_cript.Hint:=Memo_Portugues.Lines[10];
BitBtn_abrir_cript.Hint:=Memo_Portugues.Lines[12];
BitBtn_salvar_cript.Hint:=Memo_Portugues.Lines[13];
BitBtn_copiar_cript.Hint:=Memo_Portugues.Lines[14];
BitBtn_colar_cript.Hint:=Memo_Portugues.Lines[15];
BitBtn_limpar_cript.Hint:=Memo_Portugues.Lines[16];
BitBtn_salvar1_decript.Hint:=Memo_Portugues.Lines[13];
//botões decrypt
BitBtn_decript.Hint:=Memo_Portugues.Lines[11];
BitBtn_abrir_decript.Hint:=Memo_Portugues.Lines[12];
BitBtn_salvar_decript.Hint:=Memo_Portugues.Lines[13];
BitBtn_copiar_decript.Hint:=Memo_Portugues.Lines[14];
BitBtn_colar_decript.Hint:=Memo_Portugues.Lines[15];
BitBtn_limpar_decript.Hint:=Memo_Portugues.Lines[16];
BitBtn_salvar1_cript.Hint:=Memo_Portugues.Lines[16];
//barra
StatusBar1.Panels[0].Text:=Memo_Portugues.Lines[17];
StatusBar1.Panels[2].Text:=Memo_Portugues.Lines[18];
//form2
form2.Caption:=Memo_Portugues.Lines[3];
form2.SpeedButton1.Caption:=Memo_Portugues.Lines[19];
form2.SpeedButton2.Caption:=Memo_Portugues.Lines[20];
//form3
form3.Caption:=Memo_Portugues.Lines[3];
form3.SpeedButton3.Caption:=Memo_Portugues.Lines[21];
form3.SpeedButton4.Caption:=Memo_Portugues.Lines[20];

AssignFile(Arq, 'language.ini');
  Rewrite(Arq);
              Writeln(Arq, 'Configurações');
              Writeln(Arq, 'Desenvolvedor');
              Writeln(Arq, 'Sair');
              Writeln(Arq, 'Chave de Segurança');
              Writeln(Arq, 'Gerar Chave');
              Writeln(Arq, 'Criar Chave');
              Writeln(Arq, 'Salvar Chave');
              Writeln(Arq, 'Mudar Chave');
              Writeln(Arq, 'Limpar Tudo');
              Writeln(Arq, 'Idioma');
              Writeln(Arq, 'Criptografar Texto');
              Writeln(Arq, 'Decriptografar Texto');
              Writeln(Arq, 'Abrir Texto');
              Writeln(Arq, 'Salvar Texto');
              Writeln(Arq, 'Copiar Texto');
              Writeln(Arq, 'Colar Texto');
              Writeln(Arq, 'Limpar Texto');
              Writeln(Arq, 'Caracteres:');
              Writeln(Arq, 'Desenvolvido por: WouSoftware.com');
              Writeln(Arq, 'Gerar');
              Writeln(Arq, 'Criar');
              Writeln(Arq, 'Abri');
              Writeln(Arq, 'Ajuda');
              CloseFile(Arq);

              AssignFile(Arq, 'idioma.ini');
  Rewrite(Arq);
              Writeln(Arq, 'Português');
              CloseFile(Arq);

              Memo_idioma.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+'idioma.ini');
              form2.Memo_idioma.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+'idioma.ini');
              form3.Memo_idioma.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+'idioma.ini');

     ShellExecute(handle,'open',PChar(ExtractFilePath(Application.ExeName)+Edit2.Text), '','',SW_SHOWNORMAL);
     Timer_Reiniciar.Enabled:=true;


end;

procedure TForm1.Sair1Click(Sender: TObject);
begin
close;
end;

procedure TForm1.Sair2Click(Sender: TObject);
begin
BitBtn_gerar_serial.Enabled:=true;
BitBtn_criar_serial.Enabled:=true;
edit3.Clear;
memo5.Clear;

form2.Edit5.Clear;
form3.Edit5.Clear;

GerarChave1.Enabled:=true;
CriarChave1.Enabled:=true;

//////////////////////////////////////////////////
form1.PageControl1.Enabled:=false;
//
form1.memo2.Enabled:=false;
form1.memo3.Enabled:=false;
//
form1.BitBtn_salvar1_cript.Enabled:=false;
form1.BitBtn_salvar1_decript.Enabled:=false;
//botões cript
form1.BitBtn_cript.Enabled:=false;
form1.BitBtn_abrir_cript.Enabled:=false;
form1.BitBtn_salvar_cript.Enabled:=false;
form1.BitBtn_copiar_cript.Enabled:=false;
form1.BitBtn_colar_cript.Enabled:=false;
form1.BitBtn_limpar_cript.Enabled:=false;
//botões decript
form1.BitBtn_decript.Enabled:=false;
form1.BitBtn_abrir_decript.Enabled:=false;
form1.BitBtn_salvar_decript.Enabled:=false;
form1.BitBtn_copiar_decript.Enabled:=false;
form1.BitBtn_colar_decript.Enabled:=false;
form1.BitBtn_limpar_decript.Enabled:=false;
//////////////////////////////////////////////////
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
ShellExecute(handle, 'open',Pchar('chrome.exe'),Pchar('http://www.wousoftware.com/'), Nil, SW_SHOWNORMAL);
end;

procedure TForm1.BitBtn_arquivosClick(Sender: TObject);
begin
PageControl2.Visible:=true;
PageControl2.Align:=alClient;

PageControl1.Visible:=false;
PageControl1.Align:=alnone;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
//FileListBox1.Refresh;
StatusBar1.Panels[1].Text:=IntToStr(Length(Memo1.Text)); //mostra os caracteres

memo5.Text:=edit3.Text;
if edit3.Text='' then
begin
//webbrowser1.Navigate('http://wousoftware.com/wousoftware.txt');
BitBtn_gerar_serial.Enabled:=true;
BitBtn_criar_serial.Enabled:=true;
CopiarChave1.Enabled:=false;
LimparTudo1.Enabled:=false;
end
else
if edit3.Text<>'' then
begin
//memo6.Text:= WebBrowser1.OleObject.Document.documentElement.innerText;
//StatusBar1.Panels[3].Text:=(Memo6.Text); //mostra os caracteres
BitBtn_gerar_serial.Enabled:=false;
BitBtn_criar_serial.Enabled:=false;
CopiarChave1.Enabled:=true;
trocarSenha1.Enabled:=true;
GerarChave1.Enabled:=false;
CriarChave1.Enabled:=false;
LimparTudo1.Enabled:=true;
end;
end;




procedure TForm1.Timer_ReiniciarTimer(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.trocarSenha1Click(Sender: TObject);
begin
///form2
 form2.Timer_manda_senha.Enabled:=false;
 form2.Edit5.Clear;
//////////////////////////////////////////////////
///form3
 form3.Timer_manda_senha.Enabled:=false;
 form3.Edit5.Clear;
//////////////////////////////////////////////////
form1.PageControl1.Enabled:=false;
form1.bitbtn1.Enabled:=true;
form1.bitbtn4.Enabled:=false;

form1.memo2.Enabled:=true;

form1.BitBtn_salvar1_cript.Enabled:=false;
form1.BitBtn_salvar1_decript.Enabled:=false;

//botões cript
form1.BitBtn_cript.Enabled:=false;
form1.BitBtn_abrir_cript.Enabled:=false;
form1.BitBtn_salvar_cript.Enabled:=false;
form1.BitBtn_copiar_cript.Enabled:=false;
form1.BitBtn_colar_cript.Enabled:=false;
form1.BitBtn_limpar_cript.Enabled:=false;
//botões decript
form1.BitBtn_decript.Enabled:=false;
form1.BitBtn_abrir_decript.Enabled:=false;
form1.BitBtn_salvar_decript.Enabled:=false;
form1.BitBtn_copiar_decript.Enabled:=false;
form1.BitBtn_colar_decript.Enabled:=false;
form1.BitBtn_limpar_decript.Enabled:=false;
//////////////////////////////////////////////////
///
memo1.Clear;
memo2.Clear;
memo3.Clear;
memo4.Clear;

form1.BitBtn_Texto.Enabled:=false;
form1.BitBtn_arquivos.Enabled:=false;


Edit3.Clear;
BitBtn_gerar_serial.Enabled:=true;
BitBtn_criar_serial.Enabled:=true;
CopiarChave1.Enabled:=false;
trocarSenha1.Enabled:=false;
GerarChave1.Enabled:=true;
CriarChave1.Enabled:=true;
end;

end.
