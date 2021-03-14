unit melkWeekTotaalInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmMelkWeekTotaalInfo = class(TForm)
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
  frmMelkWeekTotaalInfo: TfrmMelkWeekTotaalInfo;

implementation

{$R *.dfm}

uses data, melkDaagliks;

procedure TfrmMelkWeekTotaalInfo.Button1Click(Sender: TObject);
begin
  setDate();
  DBGrid1.Refresh;
end;

procedure TfrmMelkWeekTotaalInfo.FormCreate(Sender: TObject);
begin
  edtDate.Date := Now();
  setDate;
  DBGrid1.Refresh;
end;

procedure TfrmMelkWeekTotaalInfo.setDate;
var tempDate: TDateTime;
begin
  tempDate := frmMelkDaagliks.firstDayWeek(edtDate.DateTime);

  DataModule1.qMelkWeekTotaalInfo.Active := false;
  DataModule1.qMelkWeekTotaalInfo.Parameters.ParamByName('begin').Value := tempDate;
  DataModule1.qMelkWeekTotaalInfo.Active := true;
end;

end.
