unit koeiVerander;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, DB, pngimage, ExtCtrls, Vcl.ExtDlgs,
  Vcl.DBCtrls;

type
  TfrmKoeiVerander = class(TForm)
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
    btnVind: TButton;
    btnEdit: TButton;
    BitBtn1: TBitBtn;
    edtId: TEdit;
    edtNaam: TEdit;
    edtStamKoei: TEdit;
    edtStamBul: TEdit;
    edtLakFase: TEdit;
    edtGeboorteGewig: TEdit;
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
    function findCow(): Boolean;
    function findCattle(): Boolean;
    function findLac():Boolean;
    procedure display();
    procedure editCow();
    procedure editCattle();
    procedure close();
  end;

var
  frmKoeiVerander: TfrmKoeiVerander;

implementation

uses data, JPEG;

{$R *.dfm}

function TfrmKoeiVerander.findCow;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCow.Locate('Cattle_ID', id, SearchOptions);
    findCow := found;

end;

function TfrmKoeiVerander.findCattle;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCattle.Locate('ID', id, SearchOptions);
    findCattle := found;

end;

function TfrmKoeiVerander.findLac;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbLactation.Locate('Koei_ID', id, SearchOptions);
    result := found;
end;

procedure TfrmKoeiVerander.display;
begin
  edtNaam.Text := DataModule1.tbCattleNaam.Value;
  edtStamKoei.Text := DataModule1.tbCattleMother.Value;
  edtStamBul.Text := DataModule1.tbCattleFather.Value;
  edtLakFase.Text := IntToStr(DataModule1.tbCowLac_Phase.Value);
  edtGeboorteGewig.Text := DataModule1.tbCattleBirth_Weight.Value;
  edtDatum.Date := DataModule1.tbCattleBirth_Date.Value;
  if not(DataModule1.tbCattlePicture.Value = 'NO PICTURE') then
  begin
    imgFoto.Visible := true;
    imgFoto.Picture.LoadFromFile(DataModule1.tbCattlePicture.Value);
    imgFoto.Proportional := true;
  end;
  btnFoto.Enabled := true;
  btnEdit.Enabled := true;

end;

procedure TfrmKoeiVerander.editCow;
begin
  DataModule1.tbCow.Edit;
  DataModule1.tbCowLac_Phase.Value := StrToInt(edtLakFase.Text);
  DataModule1.tbCow.Post;

  DataModule1.tbLactation.Edit;
  DataModule1.tbLactationLak_Fase.Value := StrToInt(edtLakFase.Text);
  DataModule1.tbLactation.Post;
end;

procedure TfrmKoeiVerander.editCattle;
begin
  DataModule1.tbCattle.Edit;
  DataModule1.tbCattleNaam.Value := edtNaam.Text;
  DataModule1.tbCattleFather.Value := edtStamBul.Text;
  DataModule1.tbCattleMother.Value := edtStamKoei.Text;
  DataModule1.tbCattleBirth_Weight.Value := edtGeboorteGewig.Text;
  DataModule1.tbCattleBirth_Date.Value := edtDatum.Date;
  if not(filename = '') then
  begin
    DataModule1.tbCattlePicture.Value := DataModule1.picturePath(filename);
    imgFoto.Picture.SaveToFile(DataModule1.picturePath(filename));
  end;
  DataModule1.tbCattle.Post;
end;

procedure TfrmKoeiVerander.btnEditClick(Sender: TObject);
var value: integer;
begin
  if tryStrToInt(edtLakFase.Text, value) then
    begin
      editCow();
      editCattle();
      showMessage('Die Koei is suksesvol verander.');
      DataModule1.connect;
      close();
    end
    else
    begin
     ShowMessage('Die Laktasie Fase het nie n geldige nommer nie');
     edtLakFase.SetFocus;
    end;
end;

procedure TfrmKoeiVerander.btnFotoClick(Sender: TObject);
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

procedure TfrmKoeiVerander.btnVindClick(Sender: TObject);
begin
  if findCow then
    if (findCattle) AND (findLac) then
    begin
      display;
      ShowMessage('Verander nou die inligting van die koei en druk die Verander knoppie.');
    end
    else
      ShowMessage('Daar is geen Koei met die ID of Tag in die stelsel nie.')
  else
    ShowMessage('Daar is geen Koei met die ID of Tag in die stelsel nie.');
end;

procedure TfrmKoeiVerander.close;
begin
  edtId.Clear;
  edtId.SetFocus;
  edtNaam.Clear;
  edtStamKoei.Clear;
  edtStamBul.Clear;
  edtLakFase.Clear;
  edtGeboorteGewig.Clear;
  btnEdit.Enabled := false;
  btnFoto.Enabled := false;
  imgFoto.Visible := false;
end;

end.




























































































































































































































































































































































































































































































































































































