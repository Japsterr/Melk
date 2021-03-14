unit koeiDekInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmKoeiDekInfo = class(TForm)
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
  frmKoeiDekInfo: TfrmKoeiDekInfo;

implementation

{$R *.dfm}

uses data;

procedure TfrmKoeiDekInfo.FormCreate(Sender: TObject);
var id: string;
begin
  id := DataModule1.qCowCattle_ID.Value;
  Datamodule1.qKoeiDekInfo.Active := false;
  DataModule1.qKoeiDekInfo.Parameters.ParamByName('id').Value := id;
  DataModule1.qKoeiDekInfo.Active := true;
end;

end.
