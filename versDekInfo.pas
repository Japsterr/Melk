unit versDekInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Data.DB;

type
  TfrmVersDekInfo = class(TForm)
    Label1: TLabel;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    btnPrint: TSpeedButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVersDekInfo: TfrmVersDekInfo;

implementation

{$R *.dfm}

uses data;

procedure TfrmVersDekInfo.FormCreate(Sender: TObject);
var id: string;
begin
  id := DataModule1.qCalveCattle_ID.Value;
  Datamodule1.qKoeiDekInfo.Active := false;
  DataModule1.qKoeiDekInfo.Parameters.ParamByName('id').Value := id;
  DataModule1.qKoeiDekInfo.Active := true;

end;

end.
