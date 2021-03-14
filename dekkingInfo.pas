unit dekkingInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, Data.DB;

type
  TfrmDekkingInfo = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    SpeedButton1: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDekkingInfo: TfrmDekkingInfo;

implementation

{$R *.dfm}

uses data;

end.
