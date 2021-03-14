unit melkDagTotaalInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmMelkDagTotaalInfo = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edtDate: TDateTimePicker;
    Button1: TButton;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure setDate();
  end;

var
  frmMelkDagTotaalInfo: TfrmMelkDagTotaalInfo;

implementation

{$R *.dfm}

uses data, melkDaagliks;

procedure TfrmMelkDagTotaalInfo.Button1Click(Sender: TObject);
begin
  setDate();
  DBGrid1.Refresh;
end;

procedure TfrmMelkDagTotaalInfo.FormCreate(Sender: TObject);
begin
  edtDate.Date := date;
  setDate();
  DBGrid1.Refresh;
end;

procedure TfrmMelkDagTotaalInfo.setDate;
var beginDate, endDate: TDateTime;
  year: word;
  month: word;
  day: word;
begin
  decodeDate(frmMelkDaagliks.firstDayMonth(edtDate.Date), year, month, day);
  beginDate := encodeDate(year, month, day);
  endDate := encodeDate(year, month + 1, 1);

  DataModule1.qMelkDagTotaalInfo.Active := false;
  DataModule1.qMelkDagTotaalInfo.Parameters.ParamByName('begin').Value := beginDate;
  DataModule1.qMelkDagTotaalInfo.Parameters.ParamByName('end').Value := endDate - 1;
  DataModule1.qMelkDagTotaalInfo.Active := true;
end;

end.
