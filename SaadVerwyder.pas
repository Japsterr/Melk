unit SaadVerwyder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.Imaging.pngimage;

type
  TfrmSaadVerwyder = class(TForm)
    Label1: TLabel;
    lblOrder: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtId: TEdit;
    btnVind: TButton;
    btnAdd: TButton;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    lblNaam: TLabel;
    lblHoeveelheid: TLabel;
    Image1: TImage;
    procedure btnAddClick(Sender: TObject);
    procedure btnVindClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function findSaad(): Boolean;
    procedure display();
    procedure close();
  end;

var
  frmSaadVerwyder: TfrmSaadVerwyder;

implementation

{$R *.dfm}

uses data;

function TfrmSaadVerwyder.findSaad;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbSeed.Locate('ID', id, SearchOptions);
    result := found;
end;

procedure TfrmSaadVerwyder.display;
begin
  lblNaam.Caption := DataModule1.tbSeedNames.Value;
  lblHoeveelheid.Caption := IntToStr(DataModule1.tbSeedNumber_In_Stock.Value);
  btnAdd.Enabled := true;
  ShowMessage('Druk die Verwyder knoppie om die saad van die stelsel af te verwyder.');
end;

procedure TfrmSaadVerwyder.btnAddClick(Sender: TObject);
begin
  if MessageDlg('Is u seker u wil die Saad Verwyder?', mtConfirmation,[mbYes, mbNo], 0) = mrYes then
  begin
    DataModule1.deleteCattle(edtId.Text);
    DataModule1.connect;
    ShowMessage('Die Saad is suksesvol verwyder.');
    close();
  end;
end;

procedure TfrmSaadVerwyder.btnVindClick(Sender: TObject);
begin
  if findSaad then
    display()
  else
    ShowMessage('Daar is geen Saad met die ID in die stelsel nie.');
end;

procedure TfrmSaadVerwyder.close;
begin
  lblNaam.Caption := '';
  lblHoeveelheid.Caption := '';
  btnAdd.Enabled := false;
end;


end.
