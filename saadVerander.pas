unit saadVerander;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmSaadVerander = class(TForm)
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
    Image1: TImage;
    procedure btnVindClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function findSaad():Boolean;
    procedure display();
    procedure close();
    procedure edit();
  end;

var
  frmSaadVerander: TfrmSaadVerander;

implementation

{$R *.dfm}

uses data;

function TfrmSaadVerander.findSaad;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbSeed.Locate('ID', id, SearchOptions);
    result := found;
end;

procedure TfrmSaadVerander.display;
begin
  edtNaam.Text := DataModule1.tbSeedNames.Value;
  edtHoeveelheid.Text := IntToStr(DataModule1.tbSeedNumber_In_Stock.Value);
  edtGeboorteGewig.Text := DataModule1.tbSeedBirth_Weight.Value;

  edtNaam.Enabled := true;
  edtHoeveelheid.Enabled := true;
  edtGeboorteGewig.Enabled := true;
  btnAdd.Enabled := true;
  ShowMessage('Verander nou die saad inligting en druk die Verander knoppie.');
end;

procedure TfrmSaadVerander.btnAddClick(Sender: TObject);
begin
  edit();
end;

procedure TfrmSaadVerander.btnVindClick(Sender: TObject);
begin
  if findSaad then
    display()
  else
    ShowMessage('Daar is geen saad met die ID in the stelsel nie.');
end;

procedure TfrmSaadVerander.close;
begin
  edtId.Clear;
  edtId.SetFocus;
  edtNaam.Clear;
  edtNaam.Enabled := false;
  edtHoeveelheid.Clear;
  edtHoeveelheid.Enabled := false;
  edtGeboorteGewig.Clear;
  edtGeboorteGewig.Enabled := false;
  btnAdd.Enabled := false;
end;

procedure TfrmSaadVerander.edit;
var value: integer;
begin
  DataModule1.tbSeed.Edit;
  DataModule1.tbSeedNames.Value := edtNaam.Text;
  DataModule1.tbSeedBirth_Weight.Value := edtGeboorteGewig.Text;
  if tryStrToInt(edtHoeveelheid.Text, value) then
  begin
    DataModule1.tbSeedNumber_In_Stock.Value := value;
    DataModule1.tbSeed.Post;
    ShowMessage('Die saad is suksesvol verander.');
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
