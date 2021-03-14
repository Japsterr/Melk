unit koeiKalfInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmKoeiKalfInfo = class(TForm)
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
  frmKoeiKalfInfo: TfrmKoeiKalfInfo;

implementation

{$R *.dfm}

uses data;

procedure TfrmKoeiKalfInfo.FormCreate(Sender: TObject);
var id: string;
begin
  id := DataModule1.qCowCattle_ID.Value;
  Datamodule1.qKoeiKalfInfo.Active := false;
  DataModule1.qKoeiKalfInfo.Parameters.ParamByName('id').Value := id;
  DataModule1.qKoeiKalfInfo.Active := true;
end;

end.
