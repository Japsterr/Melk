unit melkKoeiMelkKwaliteit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Data.DB, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmMelkKoeiMelkKwaliteit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblId: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    btnExit: TBitBtn;
    edtBotVet: TEdit;
    edtProt: TEdit;
    edtSst: TEdit;
    btnRegistreer: TButton;
    DataSource1: TDataSource;
    Image1: TImage;
    procedure btnRegistreerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    found: Boolean;
  public
    { Public declarations }
    procedure display();
    procedure insert();
    procedure edit();
  end;

var
  frmMelkKoeiMelkKwaliteit: TfrmMelkKoeiMelkKwaliteit;

implementation

{$R *.dfm}

uses data;


procedure TfrmMelkKoeiMelkKwaliteit.btnRegistreerClick(Sender: TObject);
begin
  if found then
    begin
      edit();
      ShowMessage('Die Koei se melk kwaliteit is suksesvol verander.');
      frmMelkKoeiMelkKwaliteit.Close;
    end
    else
    begin
      insert();
      ShowMessage('Die Koei se melk kwaliteit is suksesvol geregistreer.');
      frmMelkKoeiMelkKwaliteit.Close;
    end;
end;

procedure TfrmMelkKoeiMelkKwaliteit.display;
begin
  lblId.Caption := DataModule1.tbCowCattle_ID.Value;
  if found then
  begin
    edtBotVet.Text := DataModule1.qKoeiMelkKwalInfoDagBotter_Vet.Value;
    edtProt.Text := DataModule1.qKoeiMelkKwalInfoDagProteine.Value;
    edtSst.Text := DataModule1.qKoeiMelkKwalInfoDagSel_Telling.Value;
  end;
end;
procedure TfrmMelkKoeiMelkKwaliteit.insert;
var today: TDate;
begin
  today := date;

  DataModule1.qKoeiMelkKwalInfoDag.Insert;
  DataModule1.qKoeiMelkKwalInfoDagKoei_ID.Value := lblId.Caption;
  DataModule1.qKoeiMelkKwalInfoDagDates.Value := today;
  DataModule1.qKoeiMelkKwalInfoDagBotter_Vet.Value := edtBotVet.Text;
  DataModule1.qKoeiMelkKwalInfoDagProteine.Value :=edtProt.Text;
  DataModule1.qKoeiMelkKwalInfoDagSel_Telling.Value := edtSst.Text;
  DataModule1.qKoeiMelkKwalInfoDag.Post;
end;

procedure TfrmMelkKoeiMelkKwaliteit.edit;
begin
  DataModule1.qKoeiMelkKwalInfoDag.edit;
  DataModule1.qKoeiMelkKwalInfoDagBotter_Vet.Value := edtBotVet.Text;
  DataModule1.qKoeiMelkKwalInfoDagProteine.Value := edtProt.Text;
  DataModule1.qKoeiMelkKwalInfoDagSel_Telling.Value := edtSst.Text;
  DataModule1.qKoeiMelkKwalInfoDag.Post;
end;

procedure TfrmMelkKoeiMelkKwaliteit.FormCreate(Sender: TObject);
begin
  if not(DataModule1.qKoeiMelkKwalInfoDag.IsEmpty) then
  begin
    found := true;
  end
  else
    found := false;

  display();
end;

end.
