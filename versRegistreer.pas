unit versRegistreer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, StdCtrls, DB, pngimage, ExtCtrls, Vcl.ExtDlgs;

type
  TfrmVersRegistrasie = class(TForm)
    Label1: TLabel;
    lblOrder: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtId: TEdit;
    btnVind: TButton;
    edtNaam: TEdit;
    edtStamKoei: TEdit;
    edtStamBul: TEdit;
    edtGedoorteGewig: TEdit;
    btnAdd: TButton;
    BitBtn1: TBitBtn;
    edtDatum: TDateTimePicker;
    DataSource1: TDataSource;
    Image1: TImage;
    imgFoto: TImage;
    btnFoto: TButton;
    openPicture: TOpenPictureDialog;
    procedure btnVindClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnFotoClick(Sender: TObject);
  private
    { Private declarations }
    filename: String;
  public
    { Public declarations }
    function find(): Boolean;
    procedure open();
    procedure close();
    procedure insertCattle();
    procedure insertCalve();
  end;

var
  frmVersRegistrasie: TfrmVersRegistrasie;

implementation

uses data, JPEG;

{$R *.dfm}

function TfrmVersRegistrasie.find;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCattle.Locate('ID', id, SearchOptions);
    find := found;
end;

procedure TfrmVersRegistrasie.open;
begin
  edtID.Enabled := false;
  btnVind.Enabled := false;
  edtNaam.Enabled := true;
  edtStamKoei.Enabled := true;
  edtStamBul.Enabled := true;
  edtGedoorteGewig.Enabled := true;
  edtDatum.Enabled := true;
  btnAdd.Enabled := true;
  btnFoto.Enabled := true;
end;

procedure TfrmVersRegistrasie.btnAddClick(Sender: TObject);
begin
  insertCattle;
  insertCalve;
  showMessage('Die Vers is suksesvol geregistreer.');
  DataModule1.connect;
  close();
end;

procedure TfrmVersRegistrasie.btnFotoClick(Sender: TObject);
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

procedure TfrmVersRegistrasie.btnVindClick(Sender: TObject);
begin
  if find then
    showMessage('Daar is alreeds n bees met daai ID of Tag in the stelsel.')
  else
  begin
    open();
    ShowMessage('Sleutel nou die res van die vers se inligting in en druk die Registeer knoppie');
  end;
end;

procedure TfrmVersRegistrasie.close;
begin
  edtID.Enabled := true;
  edtID.Clear;
  edtID.SetFocus;
  btnVind.Enabled := true;
  edtNaam.Clear;
  edtNaam.Enabled := false;
  edtStamKoei.Clear;
  edtStamKoei.Enabled := false;
  edtStamBul.Clear;
  edtStamBul.Enabled := false;
  edtGedoorteGEwig.Clear;
  edtGedoorteGewig.Enabled := false;
  edtDatum.Enabled := false;
  btnAdd.Enabled := false;
  btnFoto.Enabled := false;
  imgFoto.Visible := false;
end;

procedure TfrmVersRegistrasie.insertCattle;
var today: TDateTime;
  day: word;
  month: word;
  year: word;
begin
  today := edtDatum.Date;
  decodeDate(today, year, month, day);
  today := encodeDate(year, month, day);

  DataModule1.tbCattle.Insert;
  DataModule1.tbCattleID.Value := edtID.Text;
  DataModule1.tbCattleNaam.Value := edtNaam.Text;
  DataModule1.tbCattleFather.Value := edtStamBul.Text;
  DataModule1.tbCattleMother.Value := edtStamKoei.Text;
  DataModule1.tbCattleBirth_Weight.Value := edtGedoorteGewig.Text;
  DataModule1.tbCattleBirth_Date.Value := today;
  DataModule1.tbCattleType.Value := 'Vers';
  if not(filename = '') then
  begin
    DataModule1.tbCattlePicture.Value := DataModule1.picturePath(filename);
    imgFoto.Picture.SaveToFile(DataModule1.picturePath(filename));
  end;
  DataModule1.tbCattle.Post;
end;

procedure TfrmVersRegistrasie.insertCalve;
begin
  DataModule1.tbCalve.Insert;
  DataModule1.tbCalveCattle_ID.Value := edtID.Text;
  DataModule1.tbCalve.Post;
end;

end.
