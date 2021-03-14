unit inentVers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, DB, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmInentVers = class(TForm)
    Label1: TLabel;
    lblOrder: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    edtId: TEdit;
    btnVind: TButton;
    edtTipe: TEdit;
    edtDosis: TEdit;
    btnAdd: TButton;
    BitBtn1: TBitBtn;
    edtRede: TEdit;
    Label7: TLabel;
    edtDate: TDateTimePicker;
    DataSource1: TDataSource;
    Image1: TImage;
    imgFoto: TImage;
    procedure btnVindClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function vindVers(): Boolean;
    function findCattle(): Boolean;
    procedure open();
    procedure close();
    procedure insert();
  end;

var
  frmInentVers: TfrmInentVers;

implementation

uses data, JPEG;

{$R *.dfm}

function TfrmInentVers.vindVers;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCalve.Locate('Cattle_ID', id, SearchOptions);
    vindVers := found;
end;

function TfrmInentVers.findCattle;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCattle.Locate('ID', id, SearchOptions);
    result := found;
end;

procedure TfrmInentVers.FormCreate(Sender: TObject);
begin
  edtDate.DateTime := Now();
end;

procedure TfrmInentVers.open;
begin
  edtId.Enabled := false;
  btnVind.Enabled := false;
  edtTipe.Enabled := true;
  edtDosis.Enabled := true;
  edtRede.Enabled := true;
  edtDate.Enabled := true;
  btnAdd.Enabled := true;
  if not(DataModule1.tbCattlePicture.Value = 'NO PICTURE') then
  begin
    imgFoto.Visible := true;
    imgFoto.Picture.LoadFromFile(DataModule1.tbCattlePicture.Value);
    imgFoto.Proportional := true;
  end;
end;

procedure TfrmInentVers.btnAddClick(Sender: TObject);
begin
  insert;
  close;
  DataModule1.connect;
  ShowMessage('Die Vers se inenting is suksesvol in die stelsel gelaai.');
end;

procedure TfrmInentVers.btnVindClick(Sender: TObject);
begin
  if findCattle then
  begin
    if vindVers then
    begin
      open;
      ShowMessage('Sleutel nou die res van die inligting in en druk die registreer knoppie');
    end
    else
      ShowMessage('Daar is geen Vers met die ID of Tag in die stelsel nie.');
  end
  else
    ShowMessage('Daar is geen bees in die stelsel met die id / tag nie.');
end;

procedure TfrmInentVers.close;
begin
  edtId.Enabled := true;
  edtId.Clear;
  edtId.SetFocus;
  btnVind.Enabled := true;
  edtTipe.Clear;
  edtTipe.Enabled := false;
  edtDosis.Clear;
  edtDosis.Enabled := false;
  edtRede.Clear;
  edtRede.Enabled := false;
  edtDate.Enabled := false;
  btnAdd.Enabled := false;
  imgFoto.Visible := false;
end;

procedure TfrmInentVers.insert;
var tempDate: TDateTime;
  year, month, day: word;
begin
  decodeDate(edtDate.DateTime, year, month, day);
  tempDate := encodeDate(year, month, day);

  DataModule1.tbInent.Insert;
  DataModule1.tbInentDates.Value := tempDate;
  DataModule1.tbInentCattle_ID.Value := edtId.Text;
  DataModule1.tbInentType.Value := edtTipe.Text;
  DataModule1.tbInentDose.Value := edtDosis.Text;
  DataModule1.tbInentReason.Value := edtRede.Text;
  DataModule1.tbInent.Post;
end;

end.
