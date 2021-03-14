unit dekkingKoeiKalfRekord;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, DB, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmDekkingKoeiKalfRekord = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    edtId: TEdit;
    btnVind: TButton;
    gbGeslag: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    radBul: TRadioButton;
    radVers: TRadioButton;
    radBulTwee: TRadioButton;
    radVersTwee: TRadioButton;
    radBulVers: TRadioButton;
    radMiskraam: TRadioButton;
    btnAdd: TButton;
    BitBtn1: TBitBtn;
    edtDatum: TDateTimePicker;
    Label7: TLabel;
    DataSource1: TDataSource;
    Image1: TImage;
    imgFoto: TImage;
    procedure btnVindClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function vindDekking: Boolean;
    function vindVers: Boolean;
    function vindCattle: Boolean;
    function vindCow: Boolean;
    function vindLac: Boolean;
    procedure open;
    procedure insert;
    procedure close;
    function kind: String;
    procedure maakKoei;
    procedure increaseLac();
  end;

var
  frmDekkingKoeiKalfRekord: TfrmDekkingKoeiKalfRekord;

implementation

uses data, JPEG;

{$R *.dfm}

function TfrmDekkingKoeiKalfRekord.vindDekking;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbDekking.Locate('Koei_ID;Status', VarArrayOf([id,'gedek']), SearchOptions);
    result := found;
end;

function TfrmDekkingKoeiKalfRekord.vindLac;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbLactation.Locate('Koei_ID', id, SearchOptions);
    result := found;
end;

function TfrmDekkingKoeiKalfRekord.vindCattle;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCattle.Locate('ID', id, SearchOptions);
    result := found;
end;

function TfrmDekkingKoeiKalfRekord.vindVers;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCalve.Locate('Cattle_ID', id, SearchOptions);
    result := found;
end;

function TfrmDekkingKoeiKalfRekord.vindCow;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCow.Locate('Cattle_ID', id, SearchOptions);
    result := found;
end;

procedure TfrmDekkingKoeiKalfRekord.open;
begin
  edtId.Enabled := false;
  btnVind.Enabled := false;
  edtDatum.Enabled := true;
  edtDatum.Date := Now();
  gbGeslag.Enabled := true;
  btnAdd.Enabled := true;
  if not(DataModule1.tbCattlePicture.Value = 'NO PICTURE') then
  begin
    imgFoto.Visible := true;
    imgFoto.Picture.LoadFromFile(DataModule1.tbCattlePicture.Value);
    imgFoto.Proportional := true;
  end;
end;

procedure TfrmDekkingKoeiKalfRekord.insert;
var tempDate: TDateTime;
  year, month, day: word;
begin
  decodeDate(edtDatum.DateTime, year, month, day);
  tempDate := encodeDate(year, month, day);

  DataModule1.tbBirth.Insert;
  DataModule1.tbBirthDates.Value := tempDate;
  DataModule1.tbBirthCow_ID.Value := edtID.Text;
  DataModule1.tbBirthType.Value := kind;
  DataModule1.tbBirth.Post;

  DataModule1.tbDekking.Edit;
  DataModule1.tbDekkingStatus.Value := 'GEKALF';
  DataModule1.tbDekking.Post;

  if vindCow then
  begin
    if vindLac then
      increaseLac;
  end
  else if vindVers then
       maakKoei;


 
end;

procedure TfrmDekkingKoeiKalfRekord.btnAddClick(Sender: TObject);
begin
  insert();
  close();
  DataModule1.connect;
end;

procedure TfrmDekkingKoeiKalfRekord.btnVindClick(Sender: TObject);
begin
  if vindCattle then
  begin
    if vindDekking then
    begin
      open();
      ShowMessage('Sleutel die res van die kalf inligting in en druk die Registreer knoppie.');
    end
    else
      ShowMessage('Daar is geen rekord dat die Koei of Vers gedek is.');
  end
  else
    ShowMessage('Daar is geen bees met die id / tag in die stelsel nie.');

end;

procedure TfrmDekkingKoeiKalfRekord.close;
begin
  edtId.Enabled := true;
  edtId.Clear;
  edtId.SetFocus;
  btnVind.Enabled := true;
  imgFoto.Visible := false;

  edtDatum.Date := Now();
  edtDatum.Enabled := false;
  gbGeslag.Enabled := false;
  btnAdd.Enabled := false;
  showMessage('Die Koei of Vers se Kalf Rekord is suksesvol geregistreer.');
end;

function TfrmDekkingKoeiKalfRekord.kind;
begin
  if radBul.Checked then
   kind := 'Bul'
  else if radVers.Checked then
    kind := 'Vers'
  else if radBulTwee.Checked then
    kind := '2 Bulle'
  else if radVersTwee.Checked then
    kind := '2 Verse'
  else if radBulVers.Checked then
    kind := 'Bul en Vers'
  else if radMiskraam.Checked then
    kind := 'Miskraam';
end;

procedure TfrmDekkingKoeiKalfRekord.maakKoei;
begin
  DataModule1.tbCow.Insert;
  DataModule1.tbCowCattle_ID.Value := edtId.Text;
  DataModule1.tbCowDays_In_Milk.Value := 0;
  DataModule1.tbCowTotal_Milk.Value := 0;
  DataModule1.tbCowLac_Phase.Value := 1;
  DataModule1.tbCow.Post;

  DataModule1.tbLactation.Insert;
  DataModule1.tbLactationKoei_ID.Value := edtId.Text;
  DataModule1.tbLactationLak_Fase.Value := 1;
  DataModule1.tbLactation.Post;

  DataModule1.tbCattle.Edit;
  DataModule1.tbCattleType.Value := 'Koei';
  DataModule1.tbCattle.Post;

  DataModule1.tbCalve.Delete;
end;

procedure TfrmDekkingKoeiKalfRekord.increaseLac;
begin
  DataModule1.tbLactation.Edit;
  DataModule1.tbLactationLak_Fase.Value := DataModule1.tbLactationLak_Fase.Value + 1;
  DataModule1.tbLactation.Post;

  DataModule1.tbCow.Edit;
  DataModule1.tbCowLac_Phase.Value := DataModule1.tbCowLac_Phase.Value + 1;
  DataModule1.tbCow.Post;
end;

end.
