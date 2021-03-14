unit bulInentInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmBulInentInfo = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    btnPrint: TSpeedButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBulInentInfo: TfrmBulInentInfo;

implementation

{$R *.dfm}

uses data;

procedure TfrmBulInentInfo.FormCreate(Sender: TObject);
var id: string;
begin
  id := DataModule1.qBulCattle_ID.Value;
  DataModule1.qBulInentInfo.Active := false;
  DataModule1.qBulInentInfo.Parameters.ParamByName('id').Value := id;
  DataModule1.qBulInentInfo.Active := true;

  DBGrid1.Refresh;
end;

end.
