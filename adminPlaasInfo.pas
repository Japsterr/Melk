unit adminPlaasInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmAdminPlaasInfo = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lblEienaar: TLabel;
    lblPlaas: TLabel;
    lblMelkery: TLabel;
    lblTel: TLabel;
    lblKalf: TLabel;
    lblDroog: TLabel;
    Label15: TLabel;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure display();
  end;

var
  frmAdminPlaasInfo: TfrmAdminPlaasInfo;

implementation

{$R *.dfm}

uses data;

procedure TfrmAdminPlaasInfo.display;
var naam, van, kalf, droog: string;
begin
  naam := DataModule1.tbAdminNames.Value;
  van := Datamodule1.tbAdminSurname.Value;
  lblEienaar.Caption := naam + ' ' + van;
  lblPlaas.Caption := DataModule1.tbAdminFarm_Name.Value;
  lblMelkery.Caption := DataModule1.tbAdminMilk_Name.Value;
  lblTel.Caption := DataModule1.tbAdminPhone.Value;
  kalf := IntToStr(DataModule1.tbAdminKalf_Interval.Value);
  droog := IntToStr(DataModule1.tbAdminDroog_Datum.Value);
  lblKalf.Caption := kalf + ' dae na dekking vir Koei of Vers om te kalf.';
  lblDroog.Caption := droog + ' dae voor Koei of Vers verwagte kalf datum.';
end;

procedure TfrmAdminPlaasInfo.FormCreate(Sender: TObject);
begin
  display();
end;

end.
