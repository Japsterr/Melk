unit melkKoeiDagInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TfrmMelkKoeiDagInfo = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edtDate: TDateTimePicker;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure setDate();
  end;

var
  frmMelkKoeiDagInfo: TfrmMelkKoeiDagInfo;

implementation

{$R *.dfm}

uses data;

procedure TfrmMelkKoeiDagInfo.Button1Click(Sender: TObject);
begin
  setDate;
end;

procedure TfrmMelkKoeiDagInfo.FormCreate(Sender: TObject);
begin
  edtDate.DateTime := date;
  setDate;
end;

procedure TfrmMelkKoeiDagInfo.setDate;
var tempDay: TDate;
begin
  tempDay := edtDate.Date;

  DataModule1.qMelkKoeiDagInfo.Active := false;
  DataModule1.qMelkKoeiDagInfo.Parameters.ParamByName('day').Value := tempDay;
  DataModule1.qMelkKoeiDagInfo.Active := true;

  DBGrid1.Refresh;
end;

end.
