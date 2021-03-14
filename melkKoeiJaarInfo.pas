unit melkKoeiJaarInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmMelkKoeiJaarInfo = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure setDate();
  end;

var
  frmMelkKoeiJaarInfo: TfrmMelkKoeiJaarInfo;

implementation

{$R *.dfm}

uses data;

procedure TfrmMelkKoeiJaarInfo.FormCreate(Sender: TObject);
begin
  setDate();
  DBGrid1.Refresh;
end;

procedure TfrmMelkKoeiJaarInfo.setDate;
var tempDate: TDateTime;
  year: word;
  month: word;
  day: word;
begin
  decodeDate(Now(), year, month, day);
  tempDate := encodeDate(year, 1, 1);

  DataModule1.qMelkKoeiJaarInfo.Active := false;
  DataModule1.qMelkKoeiJaarInfo.Parameters.ParamByName('begin').Value := tempDate;
  DataModule1.qMelkKoeiJaarInfo.Active := true;
end;

end.
