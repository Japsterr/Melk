unit bulEenInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, pngimage, ExtCtrls;

type
  TfrmBulEenInfo = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblNaam: TLabel;
    lblStamKoei: TLabel;
    lblStamBul: TLabel;
    lblGeboorteGewig: TLabel;
    lblGeboorteDatum: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtId: TEdit;
    btnVindBul: TButton;
    gbAddInfo: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    Image1: TImage;
    imgFoto: TImage;
    btnPrint: TSpeedButton;
    procedure btnVindBulClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function findBul(): Boolean;
    procedure display();
  end;

var
  frmBulEenInfo: TfrmBulEenInfo;

implementation

uses data, JPEG, koeiInentInfo, koeiDekInfo, bulDekInfo, bulInentInfo;

{$R *.dfm}

function TfrmBulEenInfo.findBul;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.qBul.Locate('Cattle_ID', id, SearchOptions);
    findBul := found;
end;

procedure TfrmBulEenInfo.FormCreate(Sender: TObject);
begin
  DataModule1.qBul.Active := true;
end;

procedure TfrmBulEenInfo.btnVindBulClick(Sender: TObject);
begin
  if findBul then
    display()
  else
    showMessage('Daar is nie n Bul met die ID of Tag in die stelsel nie.');
end;

procedure TfrmBulEenInfo.Button1Click(Sender: TObject);
begin
  frmBulDekInfo := TfrmBulDekInfo.Create(self);
  frmBulDekInfo.ShowModal;
  frmBulDekInfo.Free;
end;

procedure TfrmBulEenInfo.Button2Click(Sender: TObject);
begin

  frmBulInentInfo := TfrmBulInentInfo.Create(self);
  frmBulInentInfo.ShowModal;
  frmBulInentInfo.Free;
end;

procedure TfrmBulEenInfo.display;
begin
  lblNaam.Caption := DataModule1.qBulNaam.Value;
  lblStamKoei.Caption := DataModule1.qBulMother.Value;
  lblStamBul.Caption := DataModule1.qBulFather.Value;
  lblGeboorteGewig.Caption := DataModule1.qBulBirth_Weight.Value;
  lblGeboorteDatum.Caption := DateToStr(DataModule1.qBulBirth_Date.Value);
  btnPrint.Visible := true;
  if not(DataModule1.qBulPicture.Value = 'NO PICTURE') then
  begin
    imgFoto.Picture.LoadFromFile(DataModule1.qBulPicture.Value);
    imgFoto.Visible := true;
    imgFoto.Proportional := true;
  end;

  gbAddinfo.Enabled := true;
end;

end.
