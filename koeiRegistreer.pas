unit koeiRegistreer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, StdCtrls, DB, pngimage, ExtCtrls, Vcl.DBCtrls,
  Vcl.ExtDlgs;

type
  TfrmKoeiRegistrasie = class(TForm)
    Label1: TLabel;
    lblOrder: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    Label12: TLabel;
    edtId: TEdit;
    btnVind: TButton;
    edtNaam: TEdit;
    edtStamKoei: TEdit;
    edtStamBul: TEdit;
    edtLakFase: TEdit;
    edtGeboorteGewig: TEdit;
    BitBtn2: TBitBtn;
    btnAdd: TButton;
    edtDatum: TDateTimePicker;
    DataSource1: TDataSource;
    Image1: TImage;
    btnFoto: TButton;
    openPicture: TOpenPictureDialog;
    imgFoto: TImage;
    procedure btnVindClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnFotoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    fileName: String;
  public
    { Public declarations }
    function find(): Boolean;
    procedure open();
    procedure close();
    procedure insertCattle();
    procedure insertCow();
    procedure insertLac();
  end;

var
  frmKoeiRegistrasie: TfrmKoeiRegistrasie;

implementation

uses data, JPEG;

{$R *.dfm}

function TfrmKoeiRegistrasie.find;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCattle.Locate('ID', id, SearchOptions);
    find := found;
end;

procedure TfrmKoeiRegistrasie.FormCreate(Sender: TObject);
begin
  filename := '';
end;

procedure TfrmKoeiRegistrasie.open;
begin
  edtNaam.Enabled := true;
  edtStamKoei.Enabled := true;
  edtStamBul.Enabled := true;
  edtLakFase.Enabled := true;
  edtGeboorteGewig.Enabled := true;
  edtDatum.Enabled := true;
  btnAdd.Enabled := true;
  edtId.Enabled := false;
  btnFoto.Enabled := true;
end;

procedure TfrmKoeiRegistrasie.btnAddClick(Sender: TObject);
begin
  insertCattle;
  insertCow;
  insertLac;
  showMessage('Die Koei is suksesvol geregistreer.');
  DataModule1.connect;
  close();
end;

procedure TfrmKoeiRegistrasie.btnVindClick(Sender: TObject);
begin
  if find then
    showMessage('Daar is alreeds n bees met daai ID of Tag in the stelsel.')
  else
  begin
    open();
    ShowMessage('Sleutel nou die res van die koei se inligting in en druk die Registeer knoppie');
  end;
end;

procedure TfrmKoeiRegistrasie.btnFotoClick(Sender: TObject);
begin
  openPicture.Execute();
  filename := openPicture.FileName;
  if not(fileName = '') then
  begin
  imgFoto.Picture.LoadFromFile(filename);
  imgFoto.Visible := true;
  imgFoto.Proportional := true;
  imgFoto.Stretch := true;
  end;
end;

procedure TfrmKoeiRegistrasie.close;
begin
  edtId.Enabled := true;
  edtId.Clear;
  edtId.SetFocus;
  edtNaam.Clear;
  edtNaam.Enabled := false;
  edtStamKoei.Clear;
  edtStamKoei.Enabled := false;
  edtStamBul.Clear;
  edtStamBul.Enabled := false;
  edtGeboorteGewig.Clear;
  edtGeboorteGewig.Enabled := false;
  edtDatum.Enabled := false;
  btnAdd.Enabled := false;
  imgFoto.Visible := false;
  fileName := '';
  btnFoto.Enabled := false;
end;

procedure TfrmKoeiRegistrasie.insertCattle;
var today: TDateTime;
  day: word;
  month: word;
  year: word;
begin
  today := edtDatum.Date;
  decodeDate(today, year, month, day);
  today := encodeDate(year, month, day);

  DataModule1.tbCattle.Insert;
  DataModule1.tbCattleID.Value := edtId.Text;
  DataModule1.tbCattleNaam.Value := edtNaam.Text;
  DataModule1.tbCattleFather.Value := edtStamBul.Text;
  DataModule1.tbCattleMother.Value := edtStamKoei.Text;
  DataModule1.tbCattleBirth_Weight.Value := edtGeboorteGewig.Text;
  DataModule1.tbCattleBirth_Date.Value := today;;
  DataModule1.tbCattleType.Value := 'Cow';
  if not(filename = '') then
  begin
    DataModule1.tbCattlePicture.Value := DataModule1.picturePath(filename);
    imgFoto.Picture.SaveToFile(DataModule1.picturePath(filename));
  end;
  DataModule1.tbCattle.Post;

end;

procedure TfrmKoeiRegistrasie.insertCow;
begin
  DataModule1.tbCow.Insert;
  DataModule1.tbCowCattle_ID.Value := edtId.Text;
  DataModule1.tbCowLac_Phase.Value := StrToInt(edtLakFase.Text);
  DataModule1.tbCow.Post;
end;

procedure TfrmKoeiRegistrasie.insertLac;
begin
  DataModule1.tbLactation.Insert;
  DataModule1.tbLactationKoei_ID.Value := edtId.Text;
  DataModule1.tbLactationLak_Fase.Value := StrToInt(edtLakFase.Text);
  DataModule1.tbLactation.Post;
end;

end.
