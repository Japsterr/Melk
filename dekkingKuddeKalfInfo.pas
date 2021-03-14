unit dekkingKuddeKalfInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, Data.DB;

type
  TfrmDekkingKuddeKalfInfo = class(TForm)
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
  frmDekkingKuddeKalfInfo: TfrmDekkingKuddeKalfInfo;

implementation

{$R *.dfm}

uses data;

end.
