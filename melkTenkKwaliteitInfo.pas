unit melkTenkKwaliteitInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmMelkTenkKwaliteitInfo = class(TForm)
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMelkTenkKwaliteitInfo: TfrmMelkTenkKwaliteitInfo;

implementation

{$R *.dfm}

uses data;

end.
