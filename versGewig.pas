unit versGewig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, pngimage, ExtCtrls, Data.DB;

type
  TfrmVersGewig = class(TForm)
    Label1: TLabel;
    lblOrder: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    BitBtn1: TBitBtn;
    edtId: TEdit;
    btnVind: TButton;
    btnAdd: TButton;
    edtEersteDatum: TEdit;
    edtEersteGewig: TEdit;
    edtTweedeDatum: TEdit;
    edtDerdeDatum: TEdit;
    edtVierdeDatum: TEdit;
    edtTweedeGewig: TEdit;
    edtDerdeGewig: TEdit;
    edtVierdeGewig: TEdit;
    Image1: TImage;
    DataSource1: TDataSource;
    imgFoto: TImage;
    procedure btnVindClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function findCattle(): Boolean;
    function findVers(): Boolean;
    procedure display();
    procedure edit();
    procedure close();
  end;

var
  frmVersGewig: TfrmVersGewig;

implementation

{$R *.dfm}

uses data, JPEG;

function TfrmVersGewig.findCattle;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCattle.Locate('ID', id, SearchOptions);
    result := found;
end;

function TfrmVersGewig.findVers;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCalve.Locate('Cattle_ID', id, SearchOptions);
    result := found;
end;

procedure TfrmVersGewig.display;
begin
  edtEersteDatum.Enabled := true;
  edtEersteGewig.Enabled := true;
  edtTweedeDatum.Enabled := true;
  edtTweedeGewig.Enabled := true;
  edtDerdeDatum.Enabled := true;
  edtDerdeGewig.Enabled := true;
  edtVierdeDatum.Enabled := true;
  edtVierdeGewig.Enabled := true;
  btnAdd.Enabled := true;

  edtEersteDatum.Text := DataModule1.tbCalveDate_One.Value;
  edtEersteGewig.Text := DataModule1.tbCalveWeight_One.Value;
  edtTweedeDatum.Text := DataModule1.tbCalveDate_Two.Value;
  edtTweedeGewig.Text := DataModule1.tbCalveWeight_Two.Value;
  edtDerdeDatum.Text := DataModule1.tbCalveDate_Three.Value;
  edtDerdeGewig.Text := DataModule1.tbCalveWeight_Three.Value;
  edtVierdeDatum.Text := DataModule1.tbCalveDate_Four.Value;
  edtVierdeGewig.Text := DataModule1.tbCalveWeight_Four.Value;
  if not(DataModule1.tbCattlePicture.Value = 'NO PICTURE') then
  begin
    imgFoto.Picture.LoadFromFile(DataModule1.tbCattlePicture.Value);
    imgFoto.Visible := true;
    imgFoto.Proportional := true;
  end;
end;

procedure TfrmVersGewig.edit;
begin
  DataModule1.tbCalve.Edit;
  DataModule1.tbCalveDate_One.Value := edtEersteDatum.Text;
  DataModule1.tbCalveWeight_One.Value := edtEersteGewig.Text;
  DataModule1.tbCalveDate_Two.Value := edtTweedeDatum.Text;
  DataModule1.tbCalveWeight_Two.Value := edtTweedeGewig.Text;
  DataModule1.tbCalveDate_Three.Value := edtDerdeDatum.Text;
  DataModule1.tbCalveWeight_Three.Value := edtDerdeGewig.Text;
  DataModule1.tbCalveDate_Four.Value := edtVierdeDatum.Text;
  DataModule1.tbCalveWeight_Four.Value := edtVierdeGewig.Text;
  DataModule1.tbCalve.Post;
end;

procedure TfrmVersGewig.btnAddClick(Sender: TObject);
begin
  edit();
  DataModule1.connect;
  ShowMessage('Die Vers se gewig was suksesvol geregistreer.');
  close();
end;

procedure TfrmVersGewig.btnVindClick(Sender: TObject);
begin
  if findCattle then
  begin
    if findVers then
    begin
      display();
      ShowMessage('Sleutel nou die Vers se gewigte in en druk die Registreer knoppie.');
    end
    else
      ShowMessage('Daar is nie n Vers in die stelsel met so n id / tag nie.');
  end
  else
    ShowMessage('Daar is nie n bees met so n id / tag in die stelsel nie.');

end;

procedure TfrmVersGewig.close;
begin
  edtID.Clear;
  edteersteDatum.Text := '0';
  edtEersteDatum.Enabled := false;
  edtEersteGewig.Text := '0.00';
  edtEersteGewig.Enabled := false;
  edtTweedeDatum.Text := '0';
  edtTweedeDatum.Enabled := false;
  edtTweedeGewig.Text := '0.00';
  edtTweedeGewig.Enabled := false;
  edtDerdeDatum.Text := '0';
  edtDerdeDatum.Enabled := false;
  edtDerdeGewig.Text := '0.00';
  edtDerdeGewig.Enabled := false;
  edtVierdeDatum.Text := '0';
  edtVierdeDatum.Enabled := false;
  edtVierdeGewig.Text := '0.00';
  edtVierdeGewig.Enabled := false;
  imgFoto.Visible := false;
  btnAdd.Enabled := false
end;

end.
