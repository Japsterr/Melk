unit bulVerander;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, StdCtrls, DB, pngimage, ExtCtrls, Vcl.ExtDlgs;

type
  TfrmBulVerander = class(TForm)
    Label1: TLabel;
    lblOrder: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    edtId: TEdit;
    btnVind: TButton;
    edtNaam: TEdit;
    edtStamKoei: TEdit;
    edtStamBul: TEdit;
    edtGeboorteGewig: TEdit;
    btnEdit: TButton;
    BitBtn1: TBitBtn;
    edtDatum: TDateTimePicker;
    DataSource1: TDataSource;
    Image1: TImage;
    imgFoto: TImage;
    btnFoto: TButton;
    openPicture: TOpenPictureDialog;
    procedure btnVindClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnFotoClick(Sender: TObject);
  private
    { Private declarations }
    filename: String;
  public
    { Public declarations }
    function findBul(): Boolean;
    function findCattle(): Boolean;
    procedure display();
    procedure editCattle();
    procedure close();
  end;

var
  frmBulVerander: TfrmBulVerander;

implementation

uses data, JPEG;

{$R *.dfm}

function TfrmBulVerander.findBul;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbBul.Locate('Cattle_ID', id, SearchOptions);
    findBul := found;
end;

function TfrmBulVerander.findCattle;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCattle.Locate('ID', id, SearchOptions);
    findCattle := found;
end;

procedure TfrmBulVerander.display;
begin
  edtNaam.Text := DataModule1.tbCattleNaam.Value;
  edtNaam.Enabled := true;
  edtStamKoei.Text := DataModule1.tbCattleMother.Value;
  edtStamKoei.Enabled := true;
  edtStamBul.Text := DataModule1.tbCattleFather.Value;
  edtStamBul.Enabled := true;
  edtGeboorteGewig.Text := DataModule1.tbCattleBirth_Weight.Value;
  edtGeboorteGewig.Enabled := true;
  edtDatum.Date := DataModule1.tbCattleBirth_Date.Value;
  edtDatum.Enabled := true;
  if not(DataModule1.tbCattlePicture.Value = 'NO PICTURE') then
  begin
    imgFoto.Visible := true;
    imgFoto.Picture.LoadFromFile(DataModule1.tbCattlePicture.Value);
    imgFoto.Proportional := true;
  end;
  btnFoto.Enabled := true;
  btnEdit.Enabled := true;
end;

procedure TfrmBulVerander.editCattle;
var tempDate: TDateTime;
  year, month, day: word;
begin
  decodeDate(edtDatum.DateTime, year, month, day);
  tempDate := encodeDate(year, month, day);

  DataModule1.tbCattle.Edit;
  DataModule1.tbCattleNaam.Value := edtNaam.Text;
  DataModule1.tbCattleFather.Value := edtStamBul.Text;
  DataModule1.tbCattleMother.Value := edtStamKoei.Text;
  DataModule1.tbCattleBirth_Weight.Value := edtGeboorteGewig.Text;
  DataModule1.tbCattleBirth_Date.Value := tempDate;
  if not(filename = '') then
  begin
    DataModule1.tbCattlePicture.Value := DataModule1.picturePath(filename);
    imgFoto.Picture.SaveToFile(DataModule1.picturePath(filename));
  end;
  DataModule1.tbCattle.Post;
end;

procedure TfrmBulVerander.btnEditClick(Sender: TObject);
begin
  editCattle();
  showMessage('Die Bul is suksesvol verander.');
  DataModule1.connect;
  close();
end;

procedure TfrmBulVerander.btnFotoClick(Sender: TObject);
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

procedure TfrmBulVerander.btnVindClick(Sender: TObject);
begin
  if findBul then
    if findCattle then
    begin
      display;
      ShowMessage('Verander nou die inligting van die bul en druk die Verander knoppie');
    end
    else
      ShowMessage('Daar is geen Bul met die ID of Tag in die stelsel nie.')
  else
    ShowMessage('Daar is geen Bul met die ID of Tag in die stelsel nie.');
end;

procedure TfrmBulVerander.close;
begin
  edtId.Clear;
  edtId.SetFocus;
  edtNaam.Clear;
  edtStamKoei.Clear;
  edtStamBul.Clear;
  edtGeboorteGewig.Clear;
  btnEdit.Enabled := false;
  btnFoto.Enabled := false;
  imgFoto.Visible := false;
end;

end.
