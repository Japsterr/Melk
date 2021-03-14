unit bulDekInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmBulDekInfo = class(TForm)
    btnPrint: TSpeedButton;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBulDekInfo: TfrmBulDekInfo;

implementation

{$R *.dfm}

uses data;

procedure TfrmBulDekInfo.FormCreate(Sender: TObject);
var id: string;
begin
  id := DataModule1.qBulCattle_ID.Value;
  DataModule1.qBulDekInfo.Active := false;
  DataModule1.qBulDekInfo.Parameters.ParamByName('id').Value := id;
  DataModule1.qBulDekInfo.Active := true;
end;

end.
