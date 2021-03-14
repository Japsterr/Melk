unit saadRegistreer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmSaadRegistreer = class(TForm)
    Image1: TImage;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    btnAdd: TButton;
    edtGeboorteGewig: TEdit;
    edtHoeveelheid: TEdit;
    edtNaam: TEdit;
    btnVind: TButton;
    edtId: TEdit;
    Label2: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    lblOrder: TLabel;
    Label1: TLabel;
    procedure btnVindClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function findSaad(): Boolean;
    procedure open();
    procedure close();
    procedure insert();
  end;

var
  frmSaadRegistreer: TfrmSaadRegistreer;

implementation

{$R *.dfm}

uses data;

function TfrmSaadRegistreer.findSaad;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbSeed.Locate('ID', id, SearchOptions);
    result := found;
end;

procedure TfrmSaadRegistreer.open;
begin
  edtNaam.Enabled := true;
  edtHoeveelheid.Enabled := true;
  edtGeboorteGewig.Enabled := true;
  btnAdd.Enabled := true;

  ShowMessage('Sleutel nou die res van die informasie in, en druk die Registreer knoppie.');
end;

procedure TfrmSaadRegistreer.btnAddClick(Sender: TObject);
begin
  insert;
end;

procedure TfrmSaadRegistreer.btnVindClick(Sender: TObject);
begin
  if findSaad then
    ShowMessage('Daar is reeds saad met daai ID in die stelsel. Kies n ander ID.')
  else
    open();
end;

procedure TfrmSaadRegistreer.close;
begin
  edtId.Clear;
  edtId.SetFocus;
  edtNaam.Clear;
  edtNaam.Enabled := false;
  edtHoeveelheid.Text := '1';
  edtHoeveelheid.Enabled := false;
  edtGeboorteGewig.Clear;
  edtGeboorteGewig.Enabled := false;
  btnAdd.Enabled := false;
end;

procedure TfrmSaadRegistreer.insert;
var value: integer;
begin
  DataModule1.tbSeed.Insert;
  DataModule1.tbSeedID.Value := edtId.Text;
  DataModule1.tbSeedNames.Value := edtNaam.Text;
  DataModule1.tbSeedBirth_Weight.Value := edtGeboorteGewig.Text;
  if tryStrToInt(edtHoeveelheid.Text, value) then
  begin
    DataModule1.tbSeedNumber_In_Stock.Value := value;
    DataModule1.tbSeed.Post;
    ShowMessage('Die saad is suksesvol geregistreer.');
    DataModule1.connect;
    close();
  end
  else
  begin
    ShowMessage('Die saad hoeveelheid is nie n geldige getal nie. Sleutel n geldige getal in en druk die registreer knoppie');
    edtHoeveelheid.SetFocus;
  end;
end;

end.
