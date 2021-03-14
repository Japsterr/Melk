unit versEenInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, pngimage, ExtCtrls;

type
  TfrmVersEenInfo = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lblDatumEen: TLabel;
    Label15: TLabel;
    lblGewigEen: TLabel;
    Label17: TLabel;
    lblDatumTwee: TLabel;
    Label19: TLabel;
    lblGewigTwee: TLabel;
    Label21: TLabel;
    lblDatumDrie: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    lblDatumVier: TLabel;
    lblGewigDrie: TLabel;
    Label28: TLabel;
    lblGewigVier: TLabel;
    lblNaam: TLabel;
    lblStamKoei: TLabel;
    lblStamBul: TLabel;
    lblGeboorteGewig: TLabel;
    lblGeboorteDatum: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    edtId: TEdit;
    btnVindKalf: TButton;
    gbAddInfo: TGroupBox;
    Button2: TButton;
    Button3: TButton;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    Image1: TImage;
    imgFoto: TImage;
    btnPrint: TSpeedButton;
    procedure btnVindKalfClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function findCalve(): Boolean;
    procedure display();
  end;

var
  frmVersEenInfo: TfrmVersEenInfo;

implementation

uses data, JPEG, koeiInentInfo, koeiDekInfo, versDekInfo, versInentInfo;

{$R *.dfm}

function TfrmVersEenInfo.findCalve;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.qCalve.Locate('Cattle_ID', id, SearchOptions);
    findCalve := found;
end;

procedure TfrmVersEenInfo.btnVindKalfClick(Sender: TObject);
begin
  if findCalve then
    display()
  else
    showMessage('Daar is nie n Vers met die ID of Tag in die stelsel nie.');
end;

procedure TfrmVersEenInfo.Button2Click(Sender: TObject);
var value: String;
begin
  value:= DataModule1.tbCattleID.Value;
  dataModule1.activateQueryString(DataModule1.qKoeiDekInfo, value, 'id');

  frmVersDekInfo := TfrmVersDekInfo.Create(self);
  frmVersDekInfo.ShowModal;
  frmVersDekInfo.Free;
end;

procedure TfrmVersEenInfo.Button3Click(Sender: TObject);
begin
  frmVersInentInfo := TfrmVersInentInfo.Create(self);
  frmVersInentInfo.ShowModal;
  frmVersInentInfo.Free;
end;

procedure TfrmVersEenInfo.display;
begin
  lblNaam.Caption := DataModule1.qCalveNaam.Value;
  lblStamKoei.Caption := DataModule1.qCalveMother.Value;
  lblStamBul.Caption := DataModule1.qCalveFather.Value;
  lblGeboorteGewig.Caption := DataModule1.qCalveBirth_Weight.Value;
  lblGeboorteDatum.Caption := DateToStr(DataModule1.qCalveBirth_Date.Value);
  lblDatumEen.Caption := DataModule1.qCalveDate_One.Value;
  lblGewigEen.Caption := DataModule1.qCalveWeight_One.Value;
  lblDatumTwee.Caption := DataModule1.qCalveDate_Two.Value;
  lblGewigTwee.Caption := DataModule1.qCalveWeight_Two.Value;
  lblDatumDrie.Caption := DataModule1.qCalveDate_Three.Value;
  lblGewigDrie.Caption := DataModule1.qCalveWeight_Three.Value;
  lblDatumVier.Caption := DataModule1.qCalveDate_Four.Value;
  lblGewigVier.Caption := DataModule1.qCalveWeight_Four.Value;
  btnPrint.Visible := true;
  if not(DataModule1.tbCattlePicture.Value = 'NO PICTURE') then
  begin
    imgFoto.Picture.LoadFromFile(DataModule1.qCalvePicture.Value);
    imgFoto.Visible := true;
    imgFoto.Proportional := true;
  end;

  gbAddInfo.Enabled := true;
end;

end.
