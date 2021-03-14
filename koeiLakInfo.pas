unit koeiLakInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmKoeiLakInfo = class(TForm)
    DBGrid1: TDBGrid;
    btnPrint: TSpeedButton;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKoeiLakInfo: TfrmKoeiLakInfo;

implementation

{$R *.dfm}

uses data;

procedure TfrmKoeiLakInfo.FormCreate(Sender: TObject);
var id: string;
begin
  id := DataModule1.qCowCattle_ID.Value;
  Datamodule1.qKoeiLakInfo.Active := false;
  DataModule1.qKoeiLakInfo.Parameters.ParamByName('id').Value := id;
  DataModule1.qKoeiLakInfo.Active := true;
end;

end.
