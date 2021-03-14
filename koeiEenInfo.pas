unit koeiEenInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, pngimage, ExtCtrls;

type
  TfrmKoeiEenInfo = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblNaam: TLabel;
    lblStamKoei: TLabel;
    lblStamBul: TLabel;
    lblGeboorteGewig: TLabel;
    lblGeboorteDatum: TLabel;
    lblLakFase: TLabel;
    lblTotaalMelk: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edtId: TEdit;
    btnVind: TButton;
    gbAddInfo: TGroupBox;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    Image1: TImage;
    imgFoto: TImage;
    btnPrint: TSpeedButton;
    procedure btnVindClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function findCow(): Boolean;
    procedure display();
  end;

var
  frmKoeiEenInfo: TfrmKoeiEenInfo;

implementation

uses data, JPEG, koeiMelkInfo, koeiMelkKwalInfo, koeiLakInfo, koeiDekInfo,
  koeiKalfInfo, koeiInentInfo;

{$R *.dfm}

function TfrmKoeiEenInfo.findCow;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.qCow.Locate('Cattle_ID', id, SearchOptions);
    findCow := found;
end;

procedure TfrmKoeiEenInfo.btnVindClick(Sender: TObject);
begin
  if findCow then
    display()
  else
    showMessage('Daar is nie n Koei met die ID of Tag in die stelsel nie.');
end;

procedure TfrmKoeiEenInfo.Button2Click(Sender: TObject);
begin
  frmKoeiMelkInfo := TfrmKoeiMelkInfo.Create(self);
  frmKoeiMelkInfo.ShowModal;
  frmKoeiMelkInfo.Free;
end;

procedure TfrmKoeiEenInfo.Button3Click(Sender: TObject);
var value: String;
begin
  frmKoeiMelkKwalInfo := TfrmKoeiMelkKwalInfo.Create(self);
  frmKoeiMelkKwalInfo.ShowModal;
  frmKoeiMelkKwalInfo.Free;
end;

procedure TfrmKoeiEenInfo.Button4Click(Sender: TObject);
begin
  frmKoeiLakInfo := TfrmKoeiLakInfo.Create(self);
  frmKoeiLakInfo.ShowModal;
  frmKoeiLakInfo.Free;
end;

procedure TfrmKoeiEenInfo.Button5Click(Sender: TObject);
begin
  frmKoeiDekInfo := TfrmKoeiDekInfo.Create(self);
  frmKoeiDekInfo.ShowModal;
  frmKoeiDekInfo.Free;
end;

procedure TfrmKoeiEenInfo.Button6Click(Sender: TObject);
var value: String;
begin
  value:= DataModule1.tbCattleID.Value;
  dataModule1.activateQueryString(DataModule1.qKoeiKalfInfo, value, 'id');

  frmKoeiKalfInfo := TfrmKoeiKalfInfo.Create(self);
  frmKoeiKalfInfo.ShowModal;
  frmKoeiKalfInfo.Free;
end;

procedure TfrmKoeiEenInfo.Button7Click(Sender: TObject);
begin
  frmKoeiInentInfo := TfrmKoeiInentInfo.Create(self);
  frmKoeiInentInfo.ShowModal;
  frmKoeiInentInfo.Free;
end;

procedure TfrmKoeiEenInfo.display;
begin
  lblNaam.Caption := DataModule1.qCowNaam.Value;
  lblStamKoei.Caption := DataModule1.qCowMother.Value;
  lblStamBul.Caption := DataModule1.qCowFather.Value;
  lblGeboorteGewig.Caption := DataModule1.qCowBirth_Weight.Value;
  lblGeboorteDatum.Caption := DateToStr(DataModule1.qCowBirth_Date.Value);
  lblLakFase.Caption := IntToStr(DataModule1.qCowLac_Phase.Value);
  lblTotaalMelk.Caption := FloatToStr(DataModule1.qCowTotal_Milk.Value);
  btnPrint.Enabled := true;
  if not(DataModule1.qCowPicture.Value = 'NO PICTURE') then
  begin
    imgFoto.Picture.LoadFromFile(DataModule1.qCowPicture.Value);
    imgFoto.Visible := true;
    imgFoto.Proportional := true;
  end;

  gbAddInfo.Enabled := true;
  btnPrint.Visible := true;
end;

end.
