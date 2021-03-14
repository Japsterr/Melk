unit versVerwyder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, pngimage, ExtCtrls;

type
  TfrmVersVerwyder = class(TForm)
    Label1: TLabel;
    lblOpdrag: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lblNaam: TLabel;
    lblStamKoei: TLabel;
    lblStamBul: TLabel;
    lblGeboorteGewig: TLabel;
    lblGeboorteDatum: TLabel;
    Label2: TLabel;
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
    function findCalve(): Boolean;
    function findCattle(): Boolean;
    procedure display();
    procedure close();
  end;

var
  frmVersVerwyder: TfrmVersVerwyder;

implementation

uses data, JPEG;

{$R *.dfm}

function TfrmVersVerwyder.findCalve;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCalve.Locate('Cattle_ID', id, SearchOptions);
    findCalve := found;
end;

function TfrmVersVerwyder.findCattle;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCattle.Locate('ID', id, SearchOptions);
    findCattle := found;
end;

procedure TfrmVersVerwyder.display;
begin
  lblNaam.Caption := DataModule1.tbCattleNaam.Value;
  lblStamKoei.Caption := DataModule1.tbCattleMother.Value;
  lblStamBul.Caption := DataModule1.tbCattleFather.Value;
  lblGeboorteGewig.Caption := DataModule1.tbCattleBirth_Weight.Value;
  lblGeboorteDatum.Caption := DateToStr(DataModule1.tbCattleBirth_Date.Value);
  btnVerwyder.Enabled := true;
  if not(DataModule1.tbCattlePicture.Value = 'NO PICTURE') then
  begin
    imgFoto.Picture.LoadFromFile(DataModule1.tbCattlePicture.Value);
    imgFoto.Visible := true;
    imgFoto.Proportional := true;
  end;
end;

procedure TfrmVersVerwyder.btnVerwyderClick(Sender: TObject);
begin
  if MessageDlg('Is u seker u wil die Vers Verwyder?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
  begin
    DataModule1.deleteCattle(edtId.Text);
    DataModule1.connect;
    ShowMessage('Die Vers is suksesvol verwyder.');
    close();
  end;
end;

procedure TfrmVersVerwyder.btnVindClick(Sender: TObject);
begin
  if findCalve then
    if findCattle then
    begin
      display;
      ShowMessage('Druk die Verwyder knoppie om die vers te verwyder.');
    end
    else
      showMessage('Daar is nie n Vers met die ID of Tag in die stelsel nie.')
  else
    showMessage('Daar is nie n Vers met die ID of Tag in die stelsel nie.');
end;

procedure TfrmVersVerwyder.close;
begin
  edtId.Clear;
  edtId.SetFocus;
  lblNaam.Caption := '';
  lblStamKoei.Caption := '';
  lblStamBul.Caption := '';
  lblGeboorteGewig.Caption := '';
  lblGeboorteDatum.Caption := '';
  btnVerwyder.Enabled := false;
  imgFoto.Visible := false;
end;


end.
