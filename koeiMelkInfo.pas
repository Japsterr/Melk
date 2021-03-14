unit koeiMelkInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Data.DB;

type
  TfrmKoeiMelkInfo = class(TForm)
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
  frmKoeiMelkInfo: TfrmKoeiMelkInfo;

implementation

{$R *.dfm}

uses data;

procedure TfrmKoeiMelkInfo.FormCreate(Sender: TObject);
var value: string;
begin
  value := DataModule1.qCowCattle_ID.Value;
  DataModule1.qKoeiMelkInfo.Active := false;
  DataModule1.qKoeiMelkInfo.Parameters.ParamByName('id').Value := value;
  DataModule1.qKoeiMelkInfo.Active := true;
end;

end.
