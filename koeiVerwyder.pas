unit koeiVerwyder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, pngimage, ExtCtrls;

type
  TfrmKoeiVerwyder = class(TForm)
    Label1: TLabel;
    lblOpdrag: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lblNaam: TLabel;
    lblStamKoei: TLabel;
    lblStamBul: TLabel;
    lblLakFase: TLabel;
    lblGeboorteGewig: TLabel;
    lblGeboorteDatum: TLabel;
    Label9: TLabel;
    edtId: TEdit;
    btnVind: TButton;
    btnVerwyder: TButton;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    Image1: TImage;
    imgFoto: TImage;
    procedure btnVindClick(Sender: TObject);
    procedure btnVerwyderClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function findCow(): Boolean;
    function findCattle(): Boolean;
    function findLac(): Boolean;
    procedure display();
    procedure close();
  end;

var
  frmKoeiVerwyder: TfrmKoeiVerwyder;

implementation

uses data, JPEG;

{$R *.dfm}

function TfrmKoeiVerwyder.findCow;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCow.Locate('Cattle_ID', id, SearchOptions);
    result := found;
end;

function TfrmKoeiVerwyder.findCattle;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCattle.Locate('ID', id, SearchOptions);
    result := found;
end;

function TfrmKoeiVerwyder.findLac;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbLactation.Locate('Koei_ID', id, SearchOptions);
    result := found;
end;

procedure TfrmKoeiVerwyder.display;
begin
  lblNaam.Caption := DataModule1.tbCattleNaam.Value;
  lblStamKoei.Caption := DataModule1.tbCattleMother.Value;
  lblStamBul.Caption := DataModule1.tbCattleFather.Value;
  lblGeboorteGewig.Caption := DataModule1.tbCattleBirth_Weight.Value;
  lblGeboorteDatum.Caption := DateToStr(DataModule1.tbCattleBirth_Date.Value);
  lblLakFase.Caption := IntTOStr(DataModule1.tbCowLac_Phase.Value);
  btnVerwyder.Enabled := true;
  if not(DataModule1.tbCattlePicture.Value = 'NO PICTURE') then
  begin
    imgFoto.Picture.LoadFromFile(DataModule1.tbCattlePicture.Value);
    imgFoto.Visible := true;
    imgFoto.Proportional := true;
  end;
end;

procedure TfrmKoeiVerwyder.btnVerwyderClick(Sender: TObject);
begin
  if MessageDlg('Is u seker u wil die Koei Verwyder?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
  begin
    DataModule1.deleteCattle(edtID.Text);
    DataModule1.connect;
    showMessage('Die koei is suksesvol verwyder.');
    close();
  end;
end;

procedure TfrmKoeiVerwyder.btnVindClick(Sender: TObject);
begin
  if findCow then
    if (findCattle) AND (findLac) then
    begin
      display;
      ShowMessage('Druk die Verwyder knoppie om die koei te verwyder.');
    end
    else
      showMessage('Daar is nie n Koei met die ID of Tag in die stelsel nie.')
  else
    showMessage('Daar is nie n Koei met die ID of Tag in die stelsel nie.');
end;

procedure TfrmKoeiVerwyder.close;
begin
  edtId.Clear;
  edtId.SetFocus;
  lblNaam.Caption := '';
  lblStamKoei.Caption := '';
  lblStamBul.Caption := '';
  lblGeboorteGewig.Caption := '';
  lblGeboorteDatum.Caption := '';
  lblLakFase.Caption := '';
  btnVerwyder.Enabled := false;
  imgFoto.Visible := false;
end;

end.
