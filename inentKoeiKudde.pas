unit inentKoeiKudde;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DB, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmInentKoeiKudde = class(TForm)
    Label1: TLabel;
    lblOrder: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    edtTipe: TEdit;
    edtDosis: TEdit;
    BitBtn1: TBitBtn;
    btnAdd: TButton;
    edtRede: TEdit;
    Label6: TLabel;
    edtDate: TDateTimePicker;
    DataSource1: TDataSource;
    Image1: TImage;
    procedure btnAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure insert();
  end;

var
  frmInentKoeiKudde: TfrmInentKoeiKudde;

implementation

uses data;

{$R *.dfm}

procedure TfrmInentKoeiKudde.btnAddClick(Sender: TObject);
begin
  if edtTipe.Text = '' then
    showMessage('Sleutel asb die tipe dosis in en druk Ok')
  else
  begin
    insert;
    DataModule1.connect;
    frmInentKoeiKudde.Close;
  end;
end;

procedure TfrmInentKoeiKudde.FormCreate(Sender: TObject);
begin
  edtDate.DateTime := Now();
  ShowMessage('Sleutel die inligting in en druk die registreer knoppie');
end;

procedure TfrmInentKoeiKudde.insert;
var tempDate: TDateTime;
  year, month, day: word;
begin
  decodeDate(edtDate.DateTime, year, month, day);
  tempDate := encodeDate(year, month, day);

  DataModule1.tbCow.First;
  while not(DataModule1.tbCow.Eof) do
  begin
    DataModule1.tbInent.Insert;
    DataModule1.tbInentDates.Value := tempDate;
    DataModule1.tbInentCattle_ID.Value := DataModule1.tbCowCattle_ID.Value;
    DataModule1.tbInentType.Value := edtTipe.Text;
    DataModule1.tbInentDose.Value := edtDosis.Text;
    DataModule1.tbInentReason.Value := edtRede.Text;
    DataModule1.tbInent.Post;
    DataModule1.tbCow.Next;
  end;
  ShowMessage('Al die Koeie is ingeent');
end;

end.
