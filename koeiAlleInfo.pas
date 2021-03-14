unit koeiAlleInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB;

type
  TfrmKoeiAlleInfo = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKoeiAlleInfo: TfrmKoeiAlleInfo;

implementation

uses data;

{$R *.dfm}

procedure TfrmKoeiAlleInfo.FormCreate(Sender: TObject);
begin
  DataModule1.qCow.Active := true;
end;

end.
