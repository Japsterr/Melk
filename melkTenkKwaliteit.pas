unit melkTenkKwaliteit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Data.DB, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmMelkTenkKwaliteit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    btnRegistreer: TButton;
    edtBotterVet: TEdit;
    edtProteine: TEdit;
    edtKiem: TEdit;
    edtSel: TEdit;
    DataSource1: TDataSource;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btnRegistreerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure display();
    procedure insert();
    procedure edit();
    function find(): Boolean;
  end;

var
  frmMelkTenkKwaliteit: TfrmMelkTenkKwaliteit;

implementation

{$R *.dfm}

uses data;

function TfrmMelkTenkKwaliteit.find;
var found : Boolean;
    SearchOptions : TLocateOptions;
    day, month, year: word;
    today: TDateTime;
begin
  decodeDate(Now(), year, month, day);
  today := encodeDate(year, month, day);
  SearchOptions := [loCaseInsensitive];
  found := DataModule1.tbMelkTenkKwaliteit.Locate('Dates', today, SearchOptions);
  result := found;
end;

procedure TfrmMelkTenkKwaliteit.FormCreate(Sender: TObject);
begin
  if find then
    display()
  else
    ShowMessage('Sleutel die waardes in en druk die Registreer knoppie.');
end;

procedure TfrmMelkTenkKwaliteit.btnRegistreerClick(Sender: TObject);
begin
  if btnRegistreer.Caption = 'Verander' then
    edit()
  else
    insert();

  dataModule1.connect;
  frmMelkTenkKwaliteit.Close;
end;

procedure TfrmMelkTenkKwaliteit.display;
begin
  edtBotterVet.Text := dataModule1.tbMelkTenkKwaliteitBotter_Vet.Value;
  edtProteine.Text := dataModule1.tbMelkTenkKwaliteitProteine.Value;
  edtKiem.Text := dataModule1.tbMelkTenkKwaliteitKiem_Telling.Value;
  edtSel.Text := dataModule1.tbMelkTenkKwaliteitSel_Telling.Value;

  btnRegistreer.Caption := 'Verander';
  ShowMessage('Verander die waardes en druk die Verander knoppie.');
end;

procedure TfrmMelkTenkKwaliteit.insert;
var tempDay: TDateTime;
  year, month, day: word;
begin
  decodeDate(Now(), year, month, day);
  tempDay := encodeDate(year, month, day);

  dataModule1.tbMelkTenkKwaliteit.Insert;
  dataModule1.tbMelkTenkKwaliteitDates.Value := tempDay;
  dataModule1.tbMelkTenkKwaliteitBotter_Vet.Value := edtBotterVet.Text;
  dataModule1.tbMelkTenkKwaliteitProteine.Value := edtProteine.Text;
  dataModule1.tbMelkTenkKwaliteitKiem_Telling.Value := edtKiem.Text;
  dataModule1.tbMelkTenkKwaliteitSel_Telling.Value := edtSel.Text;
  dataModule1.tbMelkTenkKwaliteit.Post;

  ShowMessage('Die waardes is suksesvol geregistreer.');
end;

procedure TfrmMelkTenkKwaliteit.edit;
begin
  dataModule1.tbMelkTenkKwaliteit.Edit;
  dataModule1.tbMelkTenkKwaliteitBotter_Vet.Value := edtBotterVet.Text;
  dataModule1.tbMelkTenkKwaliteitProteine.Value := edtProteine.Text;
  dataModule1.tbMelkTenkKwaliteitKiem_Telling.Value := edtKiem.Text;
  dataModule1.tbMelkTenkKwaliteitSel_Telling.Value := edtSel.Text;
  dataModule1.tbMelkTenkKwaliteit.Post;

  ShowMessage('Die waardes is suksesvol verander.');
end;

end.
