unit dekkingHerdekking;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, DB, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmDekkingHerdekking = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblDatum: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    edtKoeiId: TEdit;
    btnVindKoei: TButton;
    edtBulId: TEdit;
    btnVindBul: TButton;
    btnAdd: TButton;
    BitBtn1: TBitBtn;
    edtDatum: TDateTimePicker;
    Label6: TLabel;
    DataSource1: TDataSource;
    Image1: TImage;
    imgFoto1: TImage;
    imgFoto2: TImage;
    procedure btnVindKoeiClick(Sender: TObject);
    procedure btnVindBulClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function vindBul: Boolean;
    function vindSaad: Boolean;
    function vindDekking: Boolean;
    function vindCattle(id: String): Boolean;
    procedure edit();
    procedure openFirst();
    procedure openSecond();
    procedure close();
    procedure showFoto(foto: TImage);
    procedure nieGevat();
  end;

var
  frmDekkingHerdekking: TfrmDekkingHerdekking;

implementation

uses data, JPEG;

{$R *.dfm}

function TfrmDekkingHerdekking.vindBul;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtBulId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbBul.Locate('Cattle_ID', id, SearchOptions);
    vindBul := found;
end;

function TfrmDekkingHerdekking.vindCattle(id: String): Boolean;
var found : Boolean;
    SearchOptions : TLocateOptions;
begin
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCattle.Locate('ID', id, SearchOptions);
    result := found;
end;

function TfrmDekkingHerdekking.vindSaad;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtBulId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbSeed.Locate('ID', id, SearchOptions);
    vindSaad := found;
end;

function TfrmDekkingHerdekking.vindDekking;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtKoeiId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbDekking.Locate('Koei_ID;Status', VarArrayOf([id,'gedek']), SearchOptions);
    vindDekking := found;
end;

procedure TfrmDekkingHerdekking.edit;
var kalf_Interval: Integer;
  droog_Dae: Integer;
  tempDate: TDateTime;
  year, month, day: word;
begin
  decodeDate(edtDatum.DateTime, year, month, day);
  tempDate := encodeDate(year, month, day);

  kalf_Interval := DataModule1.tbAdminKalf_Interval.Value;
  droog_Dae :=kalf_Interval - DataModule1.tbAdminDroog_Datum.Value;

  DataModule1.tbDekking.edit;
  DataModule1.tbDekkingStatus.Value := 'NIE GEVAT';
  DataModule1.tbDekking.post;

  DataModule1.tbDekking.Insert;
  DataModule1.tbDekkingKoei_ID.Value := edtKoeiId.Text;
  DataModule1.tbDekkingDek_Datum.Value := tempDate;
  DataModule1.tbDekkingBul_ID.Value := edtBulId.Text;
  DataModule1.tbDekkingStatus.Value := 'gedek';
  DataModule1.tbDekkingKalf_Datum.Value := tempDate + kalf_Interval;
  DataModule1.tbDekkingDroog_Datum.Value := tempDate + droog_Dae;
  DataModule1.tbDekking.Post;
end;

procedure TfrmDekkingHerdekking.openFirst;
begin
  lblDatum.Caption := DateToStr(DataModule1.tbDekkingDek_Datum.Value);
  edtBulId.Enabled := true;
  btnVindBul.Enabled := true;
  edtKoeiId.Enabled := false;
  btnVindKoei.Enabled := false;
  showFoto(imgFoto1);
  showMessage('Sleutel die Bul of Saad ID en druk die Vind Bul knoppie.');
end;

procedure TfrmDekkingHerdekking.openSecond;
begin
  btnVindBul.Enabled := false;
  edtBulId.Enabled := false;
  edtDatum.Enabled := true;
  edtDatum.Date := DataModule1.tbDekkingDek_Datum.Value;
  btnAdd.Enabled := true;
  ShowMessage('Stel die datum en druk die Registreer knoppie om die dekking te registreer.');
end;

procedure TfrmDekkingHerdekking.btnAddClick(Sender: TObject);
begin
  //nieGevat();
  edit;
  close;
end;

procedure TfrmDekkingHerdekking.btnVindBulClick(Sender: TObject);
begin
  if (vindBul) and (vindCattle(edtBulId.Text)) then
  begin
    openSecond;
    showFoto(imgFoto2);
  end
  else
  if vindSaad then
    opensecond
  else
    ShowMessage('Daar is geen Bul of Saad met die id / tag in die stelsel nie.');
end;

procedure TfrmDekkingHerdekking.btnVindKoeiClick(Sender: TObject);
begin
  if (vindDekking) AND(vindCattle(edtKoeiId.Text)) then
    openfirst
  else
    showMessage('Die Koei of Vers met die ID is nog nie gedek nie.');
end;

procedure TfrmDekkingHerdekking.close;
begin
  edtKoeiId.Enabled := true;
  edtKoeiId.Clear;
  edtKoeiId.SetFocus;
  btnVindKoei.Enabled := true;
  imgFoto1.Visible := false;

  lblDatum.Caption := '';

  edtBulId.Enabled := true;
  edtBulId.Clear;
  edtBulId.Enabled := false;
  imgFoto2.Visible := false;

  btnAdd.Enabled := false;

  showMessage('Die Koei of Vers se Herdekking is suksesvol geregistreer.');
end;

procedure TfrmDekkingHerdekking.showFoto(foto: TImage);
begin
  if not(DataModule1.tbCattlePicture.Value = 'NO PICTURE') then
  begin
    foto.Visible := true;
    foto.Picture.LoadFromFile(DataModule1.tbCattlePicture.Value);
    foto.Proportional := true;
  end;
end;

procedure TfrmDekkingHerdekking.nieGevat;
begin
  DataModule1.tbDekking.Edit;
  DataModule1.tbDekkingStatus.Value := 'NIE GEVAT';
  DataModule1.tbDekking.Post;
end;

end.
