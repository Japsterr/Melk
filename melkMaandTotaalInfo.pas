unit melkMaandTotaalInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmMelkMaandTotaalInfo = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edtDate: TDateTimePicker;
    Button1: TButton;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure setDate();
  end;

var
  frmMelkMaandTotaalInfo: TfrmMelkMaandTotaalInfo;

implementation

{$R *.dfm}

uses data, melkDaagliks;

procedure TfrmMelkMaandTotaalInfo.Button1Click(Sender: TObject);
begin
  setDate();
  DBGrid1.Refresh;
end;

procedure TfrmMelkMaandTotaalInfo.FormCreate(Sender: TObject);
begin
  edtDate.Date := Now();
  setDate();
  DBGrid1.Refresh;
end;

procedure TfrmMelkMaandTotaalInfo.setDate;
var beginDate: TDateTime;
begin
  beginDate := frmMelkDaagliks.firstDayMonth(edtDate.Date);

  DataModule1.qMelkMaandTotaalInfo.Active := false;
  DataModule1.qMelkMaandTotaalInfo.Parameters.ParamByName('begin').Value := beginDate;
  DataModule1.qMelkMaandTotaalInfo.Active := true;
end;

end.
