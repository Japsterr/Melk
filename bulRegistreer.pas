unit bulRegistreer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, StdCtrls, DB, pngimage, ExtCtrls, Vcl.ExtDlgs;

type
  TfrmBulRegistrasie = class(TForm)
    Label1: TLabel;
    lblOrder: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    St: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    edtId: TEdit;
    btnVind: TButton;
    edtNaam: TEdit;
    edtStamKoei: TEdit;
    edtStamBul: TEdit;
    edtGeboorteGewig: TEdit;
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
    procedure insertCattle();
    procedure insertBul();
    procedure close();
    procedure open();
  end;

var
  frmBulRegistrasie: TfrmBulRegistrasie;

implementation

uses data, JPEG;

{$R *.dfm}

function TfrmBulRegistrasie.find;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCattle.Locate('ID', id, SearchOptions);
    result := found;
end;

procedure TfrmBulRegistrasie.insertCattle;
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
  DataModule1.tbCattleBirth_Date.Value := today;
  DataModule1.tbCattleType.Value := 'Bul';
  if not(filename = '') then
  begin
    DataModule1.tbCattlePicture.Value := DataModule1.picturePath(filename);
    imgFoto.Picture.SaveToFile(DataModule1.picturePath(filename));
  end;
  DataModule1.tbCattle.Post;
end;

procedure TfrmBulRegistrasie.insertBul;
begin
  DataModule1.tbBul.Insert;
  DataModule1.tbBulCattle_ID.Value := edtId.Text;
  DataModule1.tbBul.Post;
end;

procedure TfrmBulRegistrasie.btnAddClick(Sender: TObject);
begin
  insertCattle();
  insertBul();
  showMessage('Die Bul is suksesvol geregistreer.');
  DataModule1.connect;
  close();
end;

procedure TfrmBulRegistrasie.btnFotoClick(Sender: TObject);
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

procedure TfrmBulRegistrasie.btnVindClick(Sender: TObject);
begin
  if find then
    showMessage('Daar is alreeds n Bees met daai ID of Tag in the stelsel.')
  else
  begin
    open();
    ShowMessage('Sleutel nou die res van die bul se inligting in en druk die Registeer knoppie');
  end;
end;

procedure TfrmBulRegistrasie.close;
begin
  edtId.Enabled := true;
  edtId.Clear;
  edtId.SetFocus;
  btnVind.Enabled := true;
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
  btnFoto.Enabled := false;
end;

procedure TfrmBulRegistrasie.open;
begin
  edtNaam.Enabled := true;
  edtStamBul.Enabled := true;
  edtStamKoei.Enabled := true;
  edtGeboorteGewig.Enabled := true;
  edtDatum.Enabled := true;
  edtId.Enabled := false;
  btnVind.Enabled := false;
  btnAdd.Enabled := true;
  btnFoto.Enabled := true;
end;

end.
