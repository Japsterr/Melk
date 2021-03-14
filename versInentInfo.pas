unit versInentInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmVersInentInfo = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    btnPrint: TSpeedButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVersInentInfo: TfrmVersInentInfo;

implementation

{$R *.dfm}

uses data;

procedure TfrmVersInentInfo.FormCreate(Sender: TObject);
var id: string;
begin
  id := DataModule1.qCalveCattle_ID.Value;
  DataModule1.qVersInentInfo.Active := false;
  DataModule1.qVersInentInfo.Parameters.ParamByName('id').Value := id;
  DataModule1.qVersInentInfo.Active := true;

  DBGrid1.Refresh;

end;

end.
