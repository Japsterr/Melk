unit melkKoeiWeekInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmMelkKoeiWeekInfo = class(TForm)
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
  frmMelkKoeiWeekInfo: TfrmMelkKoeiWeekInfo;

implementation

{$R *.dfm}

uses data, melkDaagliks;

procedure TfrmMelkKoeiWeekInfo.Button1Click(Sender: TObject);
begin
  setDate();
  DBGrid1.Refresh;
end;

procedure TfrmMelkKoeiWeekInfo.FormCreate(Sender: TObject);
begin
  edtDate.Date := Now();
  setDate();
  DBGrid1.Refresh;
end;

procedure TfrmMelkKoeiWeekInfo.setDate;
var tempDate: TDateTime;
begin
  tempDate := frmMelkDaagliks.firstDayWeek(edtDate.DateTime);

  DataModule1.qMelkKoeiWeekInfo.Active := false;
  DataModule1.qMelkKoeiWeekInfo.Parameters.ParamByName('begin').Value := tempDate;
  DataModule1.qMelkKoeiWeekInfo.Active := true;
end;

end.
