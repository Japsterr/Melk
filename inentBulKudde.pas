unit inentBulKudde;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, DB, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmInentBulKudde = class(TForm)
    Label1: TLabel;
    lblOrder: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    edtTipe: TEdit;
    edtDosis: TEdit;
    btnAdd: TButton;
    BitBtn1: TBitBtn;
    edtRede: TEdit;
    Label5: TLabel;
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
  frmInentBulKudde: TfrmInentBulKudde;

implementation

uses data;

{$R *.dfm}

procedure TfrmInentBulKudde.btnAddClick(Sender: TObject);
begin
  if edtTipe.Text = '' then
    showMessage('Sleutel asb die tipe dosis in en druk Ok')
  else
  begin
    insert;
    DataModule1.connect;
    frmInentBulKudde.Close;
  end;
end;

procedure TfrmInentBulKudde.FormCreate(Sender: TObject);
begin
  edtDate.DateTime := Now();
  ShowMessage('Sleutel die inligting in en druk die registreer knoppie');
end;

procedure TfrmInentBulKudde.insert;
var tempDate: TDateTime;
  year, month, day: word;
begin
  decodeDate(edtDate.DateTime, year, month, day);
  tempDate := encodeDate(year, month, day);

  DataModule1.tbBul.First;
  while not(DataModule1.tbBul.Eof) do
  begin
    DataModule1.tbInent.Insert;
    DataModule1.tbInentDates.Value := tempDate;
    DataModule1.tbInentCattle_ID.Value := DataModule1.tbBulCattle_ID.Value;
    DataModule1.tbInentType.Value := edtTipe.Text;
    DataModule1.tbInentDose.Value := edtDosis.Text;
    DataModule1.tbInentReason.Value := edtRede.Text;
    DataModule1.tbInent.Post;
    DataModule1.tbBul.Next;
  end;
  ShowMessage('Al die Bulle is ingeent');
end;

end.
