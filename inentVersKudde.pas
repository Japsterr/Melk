unit inentVersKudde;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Data.DB, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmInentVersKudde = class(TForm)
    Image1: TImage;
    DataSource1: TDataSource;
    edtDate: TDateTimePicker;
    edtRede: TEdit;
    btnAdd: TButton;
    BitBtn1: TBitBtn;
    edtDosis: TEdit;
    edtTipe: TEdit;
    Label6: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    lblOrder: TLabel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure insert();
  end;

var
  frmInentVersKudde: TfrmInentVersKudde;

implementation

{$R *.dfm}

uses data;

procedure TfrmInentVersKudde.btnAddClick(Sender: TObject);
begin
  if edtTipe.Text = '' then
    showMessage('Sleutel asb die tipe dosis in en druk Ok')
  else
  begin
    insert;
    DataModule1.connect;
    frmInentVersKudde.Close;
  end;
end;

procedure TfrmInentVersKudde.FormCreate(Sender: TObject);
begin
  edtDate.DateTime := Now();
  ShowMessage('Sleutel die inligting in en druk die registreer knoppie');
end;

procedure TfrmInentVersKudde.insert;
var tempDate: TDateTime;
  year, month, day: word;
begin
  decodeDate(edtDate.DateTime, year, month, day);
  tempDate := encodeDate(year, month, day);

  DataModule1.tbCalve.First;
  while not(DataModule1.tbCalve.Eof) do
  begin
    DataModule1.tbInent.Insert;
    DataModule1.tbInentDates.Value := tempDate;
    DataModule1.tbInentCattle_ID.Value := DataModule1.tbCalveCattle_ID.Value;
    DataModule1.tbInentType.Value := edtTipe.Text;
    DataModule1.tbInentDose.Value := edtDosis.Text;
    DataModule1.tbInentReason.Value := edtRede.Text;
    DataModule1.tbInent.Post;
    DataModule1.tbCalve.Next;
  end;
  ShowMessage('Al die Verse is ingeent');

end;

end.
