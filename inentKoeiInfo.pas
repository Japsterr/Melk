unit inentKoeiInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmInentKoeiInfo = class(TForm)
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
  frmInentKoeiInfo: TfrmInentKoeiInfo;

implementation

{$R *.dfm}

uses data;

procedure TfrmInentKoeiInfo.Button1Click(Sender: TObject);
begin
  setDate;
  DBGrid1.Refresh;
end;

procedure TfrmInentKoeiInfo.FormCreate(Sender: TObject);
begin
  edtDate.Date := Now();
  setDate;
  DBGrid1.Refresh;
end;

procedure TfrmInentKoeiInfo.setDate;
var tempDate: TDateTime;
  day: word;
  month: word;
  year: word;
begin
  decodeDate(edtDate.Date, year, month, day);
  tempDate := encodeDate(year, month, day);
  DataModule1.qInentKoeiInfo.Active := false;
  DataModule1.qInentKoeiInfo.Parameters.ParamByName('date').Value := tempDate;
  DataModule1.qInentKoeiInfo.Active := true;
end;

end.
