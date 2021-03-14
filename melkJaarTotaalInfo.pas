unit melkJaarTotaalInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmMelkJaarTotaalInfo = class(TForm)
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
  frmMelkJaarTotaalInfo: TfrmMelkJaarTotaalInfo;

implementation

{$R *.dfm}

uses data;

procedure TfrmMelkJaarTotaalInfo.FormCreate(Sender: TObject);
begin
  setDate;
  DBGrid1.Refresh;
end;

procedure TfrmMelkJaarTotaalInfo.setDate;
begin
  DataModule1.qMelkJaarTotaalInfo.Active := true;
end;

end.
