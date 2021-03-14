unit adminVerander;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.StdCtrls;

type
  TfrmAdminVerander = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtPlaas: TEdit;
    edtMelk: TEdit;
    edtNaam: TEdit;
    edtVan: TEdit;
    edtTelefoon: TEdit;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    edtInterval: TEdit;
    edtDroog: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Button1: TButton;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure display();
    procedure edit();
  end;

var
  frmAdminVerander: TfrmAdminVerander;

implementation

{$R *.dfm}

uses data;

procedure TfrmAdminVerander.Button1Click(Sender: TObject);
begin
  edit;
  ShowMessage('Die plaas informasie is suksesvol verander.');
end;

procedure TfrmAdminVerander.display;
begin
  edtPlaas.Text := DataModule1.tbAdminFarm_Name.Value;
  edtMelk.Text := DataModule1.tbAdminMilk_Name.Value;
  edtNaam.Text := DataModule1.tbAdminNames.Value;
  edtVan.Text := DataModule1.tbAdminSurname.Value;
  edtTelefoon.Text := DataModule1.tbAdminPhone.Value;
  edtInterval.Text := IntToStr(DataModule1.tbAdminKalf_Interval.Value);
  edtDroog.Text := IntToStr(DataModule1.tbAdminDroog_Datum.Value);
  ShowMessage('Verander nou die Plaas besonderhede en druk die verander knoppie.');
end;

procedure TfrmAdminVerander.edit;
var value: integer;
begin
  DataModule1.tbAdmin.Edit;
  DataModule1.tbAdminFarm_Name.Value := edtPlaas.Text;
  DataModule1.tbAdminMilk_Name.Value := edtMelk.Text;
  DataModule1.tbAdminNames.Value := edtNaam.Text;
  DataModule1.tbAdminSurname.Value := edtVan.Text;
  DataModule1.tbAdminPhone.Value := edtTelefoon.Text;
  if tryStrToInt(edtInterval.Text, value) then
  begin
    DataModule1.tbAdminKalf_Interval.Value := value;
    if tryStrToInt(edtDroog.Text, value) then
    begin
      DataModule1.tbAdminDroog_Datum.Value := value;
      DataModule1.tbAdmin.Post;
      DataModule1.connect;
      ShowMessage('Die Plaas informasie is suksesvol verander.');
    end
    else
    begin
      ShowMessage('Die droog datum is nie n geldige getal nie.');
      edtDroog.SetFocus;
    end;
  end
  else
  begin
    ShowMessage('Die Kalf Interval is nie n geldige getal nie.');
    edtInterval.SetFocus;
  end;
end;

procedure TfrmAdminVerander.FormCreate(Sender: TObject);
begin
  display();
end;

end.
