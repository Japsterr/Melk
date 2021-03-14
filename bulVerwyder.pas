unit bulVerwyder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, pngimage, ExtCtrls, Vcl.ExtDlgs;

type
  TfrmBulVerwyder = class(TForm)
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
    lblGeboorteDatum: TLabel;
    Label2: TLabel;
    lblGeboorteGewig: TLabel;
    edtId: TEdit;
    btnVindBul: TButton;
    btnVerwyder: TButton;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    Image1: TImage;
    imgFoto: TImage;
    procedure btnVindBulClick(Sender: TObject);
    procedure btnVerwyderClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function findBul(): Boolean;
    function findCattle(): Boolean;
    procedure display();
    procedure close();
  end;

var
  frmBulVerwyder: TfrmBulVerwyder;

implementation

uses data, JPEG;

{$R *.dfm}

function TfrmBulVerwyder.findBul;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbBul.Locate('Cattle_ID', id, SearchOptions);
    findBul := found;
end;

function TfrmBulVerwyder.findCattle;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCattle.Locate('ID', id, SearchOptions);
    findCattle := found;
end;

procedure TfrmBulVerwyder.display;
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

procedure TfrmBulVerwyder.btnVerwyderClick(Sender: TObject);
begin
  if MessageDlg('Is u seker u wil die Bul Verwyder?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
  begin
    DataModule1.deleteCattle(edtID.Text);
    DataModule1.connect;
    ShowMessage('Die bul is suksesvol verwyder.');
    close();
  end;
end;

procedure TfrmBulVerwyder.btnVindBulClick(Sender: TObject);
begin
  if findBul then
    if findCattle then
    begin
      display;
      ShowMessage('Druk die Verwyder knoppie om die bul te verwyder.');
    end
    else
      showMessage('Daar is nie n Bul met die ID of Tag in die stelsel nie.')
  else
    showMessage('Daar is nie n Bul met die ID of Tag in die stelsel nie.');
end;

procedure TfrmBulVerwyder.close;
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
