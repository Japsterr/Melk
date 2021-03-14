unit dekkingEerste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, Buttons, StdCtrls, DB, ComCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TfrmDekkingEerste = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    edtKoeiId: TEdit;
    btnVindKoei: TButton;
    edtBulId: TEdit;
    btnVindBul: TButton;
    btnAdd: TButton;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    edtDatum: TDateTimePicker;
    Label4: TLabel;
    Image1: TImage;
    imgFoto1: TImage;
    imgFoto2: TImage;
    procedure btnVindKoeiClick(Sender: TObject);
    procedure btnVindBulClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function vindKoei: Boolean;
    function vindVers: Boolean;
    function vindBul: Boolean;
    function vindSaad: Boolean;
    function vindDekking: Boolean;
    procedure insert();
    procedure openFirst();
    procedure openSecond();
    procedure close();
    function vindCattle(id: String): Boolean;
    procedure showFoto(foto: TImage);
  end;

var
  frmDekkingEerste: TfrmDekkingEerste;

implementation

uses data, JPEG;

{$R *.dfm}

function TfrmDekkingEerste.vindKoei;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtKoeiId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCow.Locate('Cattle_ID', id, SearchOptions);
    vindKoei := found;
end;

function TfrmDekkingEerste.vindDekking;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtKoeiId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbDekking.Locate('Koei_ID;Status', VarArrayOf([id, 'gedek']), SearchOptions);
    vindDekking := found;
end;

function TfrmDekkingEerste.vindVers;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtKoeiId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCalve.Locate('Cattle_ID', id, SearchOptions);
    vindVers := found;
end;

function TfrmDekkingEerste.vindBul;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtBulId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbBul.Locate('Cattle_ID', id, SearchOptions);
    vindBul := found;
end;

function TfrmDekkingEerste.vindSaad;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtBulId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbSeed.Locate('ID', id, SearchOptions);
    vindSaad := found;
end;

procedure TfrmDekkingEerste.insert;
var kalf_Interval: Integer;
  droog_Dae: Integer;
  tempDate: TDateTime;
  year, month, day: word;
begin
  decodeDate(edtDatum.DateTime, year, month, day);
  tempDate := encodeDate(year, month, day);

  kalf_Interval := DataModule1.tbAdminKalf_Interval.Value;
  droog_Dae :=kalf_Interval - DataModule1.tbAdminDroog_Datum.Value;

  DataModule1.tbDekking.Insert;
  DataModule1.tbDekkingDek_Datum.Value := tempDate;
  DataModule1.tbDekkingKoei_ID.Value := edtKoeiId.Text;
  DataModule1.tbDekkingBul_ID.Value := edtBulId.Text;
  DataModule1.tbDekkingStatus.Value := 'gedek';
  DataModule1.tbDekkingKalf_Datum.Value := tempDate + kalf_Interval;
  DataModule1.tbDekkingDroog_Datum.Value := tempDate + droog_Dae;
  DataModule1.tbDekking.Post;
end;

procedure TfrmDekkingEerste.openFirst;
begin
  showMessage('Sleutel Bul of Saad ID in en druk Vind Bul knoppie');
  edtKoeiId.Enabled := false;
  btnVindKoei.Enabled := false;
  edtBulId.Enabled := true;
  btnVindBul.Enabled := true;
  showFoto(imgFoto1);
end;

procedure TfrmDEkkingEerste.openSecond;
begin
  showMessage('Stel die datum en druk die Registreer knoppie om die dekking te registreer.');
  btnAdd.Enabled := true;
  edtDatum.Enabled := true;
  edtBulId.Enabled := false;
  btnVindBul.Enabled := false;
end;

procedure TfrmDekkingEerste.btnAddClick(Sender: TObject);
begin
  insert;
  close;
  DataModule1.connect;
  ShowMessage('Die koei of vers is suksesvol gedek.');
end;

procedure TfrmDekkingEerste.btnVindBulClick(Sender: TObject);
begin
  if (vindBul) AND (vindCattle(edtBulId.Text)) then
  begin
    openSecond;
    showFoto(imgFoto2);
  end
  else if vindSaad then
       openSecond
  else
    showMessage('Daar is nie n Bul of Saad met daai ID in die stelsel nie.');
end;

procedure TfrmDekkingEerste.btnVindKoeiClick(Sender: TObject);
begin
  if vindDekking then
    showMessage('Die Koei of Vers met die ID is alreeds gedek en het nog nie gekalf nie')
  else if (vindKoei) AND (vindCattle(edtKoeiId.Text))  then
    openFirst
  else if (vindVers) AND (vindCattle(edtKoeiId.Text)) then
       openFirst
  else
    ShowMessage('Daar is nie n Koei of Vers met daai ID in die stelsel nie.');
end;

procedure TfrmDekkingEerste.close;
begin
  showMessage('Die dekking is suksesvol geregistreer.');
  btnAdd.Enabled := false;
  edtKoeiId.Enabled := true;
  edtKoeiId.Clear;
  edtKoeiId.SetFocus;
  btnVindKoei.Enabled := true;
  edtBulId.Enabled := true;
  edtBulId.Clear;
  edtBulId.Enabled := false;
  edtDatum.Enabled := false;
  imgFoto1.Visible := false;
  imgFoto2.Visible := false;
end;

procedure TfrmDekkingEerste.FormCreate(Sender: TObject);
begin
  edtDatum.DateTime := Now();
end;

function TfrmDekkingEerste.vindCattle(id: string): Boolean;
var found : Boolean;
    SearchOptions : TLocateOptions;
begin
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCattle.Locate('ID', id, SearchOptions);
    result := found;
end;

procedure TfrmDekkingEerste.showFoto(foto: TImage);
begin
  if not(DataModule1.tbCattlePicture.Value = 'NO PICTURE') then
  begin
    foto.Visible := true;
    foto.Picture.LoadFromFile(DataModule1.tbCattlePicture.Value);
    foto.Proportional := true;
  end;
end;

end.
