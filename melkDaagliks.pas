unit melkDaagliks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmMelkDaagliks = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    lblOrder: TLabel;
    Label7: TLabel;
    edtId: TEdit;
    gbMelk: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblTotaal: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtEerste: TEdit;
    edtTweede: TEdit;
    edtDerde: TEdit;
    btnVind: TButton;
    btnAdd: TButton;
    BitBtn1: TBitBtn;
    btnKwal: TButton;
    DataSource1: TDataSource;
    Image2: TImage;
    imgFoto: TImage;
    procedure btnKwalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnVindClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
  private
    { Private declarations }
    koeie_Gemelk: integer;
    total_Melk: double;
  public
    { Public declarations }
    function todayDate: TDateTime;
    function firstDayWeek(date: TDateTime): TDateTime;
    function firstDayMonth(date: TDateTime): TDateTime;
    function vindKoei: Boolean;
    function vindLac: Boolean;
    function vindDayTotal: Boolean;
    function vindWeekTotal: Boolean;
    function vindMonthTotal: Boolean;
    function vindYearTotal: Boolean;
    function vindCowDay: Boolean;
    function vindCowWeek: Boolean;
    function vindCowMonth: Boolean;
    function vindCowYear: Boolean;
    function vindCattle: Boolean;
    procedure updateCow(total: double);
    procedure updateLac(total: double);
    procedure showMilkSoFar();
    procedure open();
    procedure insertDayTotal;
    procedure insertCowDay;
    procedure insertCowWeek;
    procedure insertCowMonth;
    procedure insertCowYear;
    procedure insertWeekTotal;
    procedure insertMonthTotal;
    procedure insertYearTotal;
    procedure updateCowDay;
    procedure updateCowWeek;
    procedure updateCowMonth;
    procedure updateCowYear;
    procedure updateDayTotal;
    procedure updateWeekTotal;
    procedure updateMonthTotal;
    procedure updateYearTotal;
    procedure close();
    function verifyValues():Boolean;
    procedure insert();
    procedure queryMelkKwaliteit();
  end;

var
  frmMelkDaagliks: TfrmMelkDaagliks;

implementation

uses melkKoeiMelkKwaliteit, data, JPEG;

{$R *.dfm}

procedure TfrmMelkDaagliks.queryMelkKwaliteit;
begin
  DataModule1.qKoeiMelkKwalInfoDag.Active := false;
  DataModule1.qKoeiMelkKwalInfoDag.Parameters.ParamByName('id').Value := edtId.Text;
  DataModule1.qKoeiMelkKwalInfoDag.Parameters.ParamByName('day').Value := date;
  DataModule1.qKoeiMelkKwalInfoDag.Active := true;
end;

function TfrmMelkDaagliks.todayDate;
var today: TDateTime;
  day: word;
  month: word;
  year: word;
begin
  today := Now;
  decodeDate(today, year, month, day);
  today := encodeDate(year, month, day);
  todayDate := today;
end;

function TfrmMelkDaagliks.vindKoei;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCow.Locate('Cattle_ID', id, SearchOptions);
    vindKoei := found;
end;

function TfrmMelkDaagliks.vindLac;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbLactation.Locate('Koei_ID', id, SearchOptions);
    vindLac := found;
end;

function TfrmMelkDaagliks.vindCattle;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
begin
    id := edtId.text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCattle.Locate('ID', id, SearchOptions);
    result := found;
end;

function TfrmMelkDaagliks.vindDayTotal;
var found : Boolean;
    SearchOptions : TLocateOptions;
    today: TDateTime;
begin
    today := todayDate;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbDayTotal.Locate('Dates', today, SearchOptions);
    vindDayTotal := found;
end;

function TfrmMelkDaagliks.vindWeekTotal;
var found : Boolean;
    SearchOptions : TLocateOptions;
    monday: TDateTime;
begin
    monday := firstDayWeek(todayDate);
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbWeekTotal.Locate('Begin_Date', monday, SearchOptions);
    vindWeekTotal := found;
end;

function TfrmMelkDaagliks.vindMonthTotal;
var found : Boolean;
    SearchOptions : TLocateOptions;
    first: TDateTime;
begin
    first := firstDayMonth(todayDate);
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbMonthTotal.Locate('Begin_Date', first, SearchOptions);
    vindMonthTotal := found;
end;

function TfrmMelkDaagliks.vindYearTotal;
var found : Boolean;
    SearchOptions : TLocateOptions;
    first: TDateTime;
    day: word;
    month: word;
    year: word;
begin
    first := firstDayWeek(todayDate);
    decodeDate(first, year, month, day);
    first := encodeDate(year, 1, 1);
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbYearTotal.Locate('Begin_Date', first, SearchOptions);
    vindYearTotal := found;
end;

function TfrmMelkDaagliks.vindCowDay;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
    today: TDateTime;
begin
    id := edtId.Text;
    today := todayDate;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCowDay.Locate('Dates;Koei_ID', VarArrayOf([today,id]), SearchOptions);
    vindCowDay := found;
end;

function TfrmMelkDaagliks.vindCowWeek;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
    monday: TDateTime;
begin
    id := edtId.Text;
    monday := firstDayWeek(todayDate);
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCowWeek.Locate('Begin_Date;Koei_ID', VarArrayOf([monday,id]), SearchOptions);
    vindCowWeek := found;
end;

function TfrmMelkDaagliks.vindCowMonth;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
    first: TDateTime;
begin
    id := edtId.Text;
    first := firstDayMonth(todayDate);
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCowMonth.Locate('Begin_Date;Koei_ID', VarArrayOf([first,id]), SearchOptions);
    vindCowMonth := found;
end;

function TfrmMelkDaagliks.vindCowYear;
var id : String;
    found : Boolean;
    SearchOptions : TLocateOptions;
    first: TDateTime;
    day: word;
    month: word;
    year: word;
begin
    first := firstDayWeek(todayDate);
    decodeDate(first, year, month, day);
    first := encodeDate(year, 1, 1);
    id := edtId.Text;
    SearchOptions := [loCaseInsensitive];
    found := DataModule1.tbCowYear.Locate('Begin_Date;Koei_ID', VarArrayOf([first,id]), SearchOptions);
    vindCowYear := found;
end;

procedure TfrmMelkDaagliks.insertDayTotal;
begin
  DataModule1.tbDayTotal.Insert;
  DataModule1.tbDayTotalDates.Value := todayDate;
  DataModule1.tbDayTotalTotal_Melk.Value := total_Melk;
  DataModule1.tbDayTotalKoeie_Gemelk.Value := 1;
  DataModule1.tbDayTotalTop_Koei_ID.Value := edtId.Text;
  DataModule1.tbDayTotalTop_Koei_Total.Value := total_Melk;
  DataModule1.tbDayTotal.Post;
end;

procedure TfrmMelkDaagliks.updateDayTotal;
var total: double;
begin
  total := DataModule1.tbCowDayEerste.Value + DataModule1.tbCowDayTweede.Value + DataModule1.tbCowDayTweede.Value;

  DataModule1.tbDayTotal.Edit;
  DataModule1.tbDayTotalTotal_Melk.Value := total_Melk;
  DataModule1.tbDayTotalKoeie_Gemelk.Value := DataModule1.tbDayTotalKoeie_Gemelk.Value + koeie_gemelk;
  if DataModule1.tbDayTotalTop_Koei_Total.Value < total then
  begin
    DataModule1.tbDayTotalTop_Koei_ID.Value := edtId.Text;
    DataModule1.tbDayTotalTop_Koei_Total.Value := total;
  end;
  DataModule1.tbDayTotal.Post;
end;

procedure TfrmMelkDaagliks.insertWeekTotal;
begin
  DataModule1.tbWeekTotal.Insert;
  DataModule1.tbWeekTotalBegin_Date.Value := firstDayWeek(todayDate);
  DataModule1.tbWeekTotalTop_Koei_ID.Value := edtId.Text;
  DataModule1.tbWeekTotalEnd_Date.Value := todayDate;
  DataModule1.tbWeekTotalTop_Koei_Total.Value := Total_Melk;
  DataModule1.tbWeekTotalTotal_Melk.Value := total_Melk;
  DataModule1.tbWeekTotal.Post;
end;

procedure TfrmMelkDaagliks.updateWeekTotal;
var total: double;
begin
  total := DataModule1.tbCowWeekTotal_Melk.Value;

  DataModule1.tbWeekTotal.Edit;
  DataModule1.tbWeekTotalEnd_Date.Value := todayDate;
  DataModule1.tbWeekTotalTotal_Melk.Value := DataModule1.tbWeekTotalTotal_Melk.Value + Total_Melk;
  if DataModule1.tbWeekTotalTop_Koei_Total.Value < total then
  begin
    DataModule1.tbWeekTotalTop_Koei_Total.Value := Total_Melk;
    DataModule1.tbWeekTotalTop_Koei_ID.Value := edtId.Text;
  end;
  DataModule1.tbWeekTotal.Post;
end;

procedure TfrmMelkDaagliks.insertMonthTotal;
begin
  DataModule1.tbMonthTotal.Insert;
  DataModule1.tbMonthTotalBegin_Date.Value := firstDayMonth(todayDate);
  DataModule1.tbMonthTotalEnd_Date.Value := todayDate;
  DataModule1.tbMonthTotalTotal_Melk.Value := total_Melk;
  DataModule1.tbMonthTotalTop_Koei_ID.Value := edtId.Text;
  DataModule1.tbMonthTotalTop_Koei_Total.Value := total_Melk;
  DataModule1.tbMonthTotal.Post;
end;

procedure TfrmMelkDaagliks.updateMonthTotal;
var total: double;
begin
  total := DataModule1.tbCowMonthTotal_Melk.Value;
  DataModule1.tbMonthTotal.Edit;
  DataModule1.tbMonthTotalEnd_Date.Value := todayDate;
  DataModule1.tbMonthTotalTotal_Melk.Value := DataModule1.tbMonthTotalTotal_Melk.Value + total_Melk;
  if DataModule1.tbMonthTotalTop_Koei_Total.Value < total then
  begin
  DataModule1.tbMonthTotalTop_Koei_ID.Value := edtId.Text;
  DataModule1.tbMonthTotalTop_Koei_Total.Value := total;
  end;
  DataModule1.tbMonthTotal.Post;
end;

procedure TfrmMelkDaagliks.insertYearTotal;
var first: TDateTime;
  day: word;
  month: word;
  year: word;
begin
  decodeDate(todayDate, year, month, day);
  first := EncodeDate(year, 1, 1);
  DataModule1.tbYearTotal.Insert;
  DataModule1.tbYearTotalBegin_Date.Value := first;
  DataModule1.tbYearTotalEnd_Date.Value := todayDate;
  DataModule1.tbYearTotalTotal_Melk.Value := total_Melk;
  DataModule1.tbYearTotalTop_Koei_ID.Value := edtId.Text;
  DataModule1.tbYearTotalTop_Koei_Total.Value := total_Melk;
  DataModule1.tbYearTotal.Post;
end;

procedure TfrmMelkDaagliks.updateYearTotal;
var total: double;
begin
  total := DataModule1.tbCowYearTotal_Melk.Value;
  DataModule1.tbYearTotal.edit;
  DataModule1.tbYearTotalEnd_Date.Value := todayDate;
  DataModule1.tbYearTotalTotal_Melk.Value := DataModule1.tbYearTotalTotal_Melk.Value + total_Melk;
  if DataModule1.tbYearTotalTop_Koei_Total.Value < total then
  begin
  DataModule1.tbYearTotalTop_Koei_ID.Value := edtId.Text;
  DataModule1.tbYearTotalTop_Koei_Total.Value := total;
  end;
  DataModule1.tbYearTotal.Post;
end;

procedure TfrmMelkDaagliks.insertCowDay;
var gemelk: integer;
  total: Double;
begin
  gemelk := 0;
  total := 0;

  DataModule1.tbCowDay.Insert;
  DataModule1.tbCowDayDates.Value := todayDate;
  DataModule1.tbCowDayKoei_ID.Value := edtId.Text;

  if StrToFloat(edtEerste.Text) > 0.00 then
  begin
    DataModule1.tbCowDayEerste.Value := StrToFloat(edtEerste.Text);
    total := total + DataModule1.tbCowDayEerste.Value;
    gemelk := gemelk + 1;
  end;

  if StrToFloat(edtTweede.Text) > 0.00 then
  begin
    DataModule1.tbCowDayTweede.Value := StrToFloat(edtTweede.Text);
    total := total + DataModule1.tbCowDayTweede.Value;
    gemelk := gemelk + 1;
  end;

  if StrToFloat(edtDerde.Text) > 0.00 then
  begin
    DataModule1.tbCowDayDerde.Value := StrToFloat(edtDerde.Text);
    total := total + DataModule1.tbCowDayDerde.Value;
    gemelk := gemelk + 1;
  end;

  DataModule1.tbCowDayKeer_Gemelk.Value := gemelk;
  DataModule1.tbCowDay.Post;

  koeie_Gemelk := 1;
  total_Melk := total;


  updateCow(total);
  updateLac(total);
end;

procedure TfrmMelkDaagliks.updateCowDay;
var gemelk: integer;
  total: Double;
begin
  total := 0;
  gemelk := 0;
  DataModule1.tbCowDay.Edit;

  if (edtEerste.Enabled = true) AND not(edtEerste.Text = '0.00') then
  begin
    DataModule1.tbCowDayEerste.Value := StrToFloat(edtEerste.Text);
    total := total + StrToFloat(edtEerste.Text);
    gemelk := gemelk + 1;
  end;

  if (edtTweede.Enabled = true) AND not(edtTweede.Text = '0.00') then
  begin
    DataModule1.tbCowDayTweede.Value := StrToFloat(edtTweede.Text);
    total := total + StrToFloat(edtTweede.Text);
    gemelk := gemelk + 1;
  end;

  if (edtDerde.Enabled = true) AND not(edtDerde.Text = '0.00') then
  begin
    DataModule1.tbCowDayDerde.Value := StrToFloat(edtDerde.Text);
    total := total + StrToFloat(edtDerde.Text);
    gemelk := gemelk + 1;
  end;

  DataModule1.tbCowDayKeer_Gemelk.Value := DataModule1.tbCowDayKeer_Gemelk.Value + gemelk;
  DataModule1.tbCowDay.Post;

  koeie_Gemelk := 0;
  total_Melk := total;

  updateCow(total);
  updateCow(total);

end;

procedure TfrmMelkDaagliks.insertCowWeek;
begin
  DataModule1.tbCowWeek.Insert;
  DataModule1.tbCowWeekBegin_Date.Value := firstDayWeek(todayDate);
  DataModule1.tbCowWeekEnd_Date.Value := todayDate;
  DataModule1.tbCowWeekKoei_ID.Value := edtId.Text;
  DataModule1.tbCowWeekTotal_Melk.Value := total_Melk;
  DataModule1.tbCowWeek.Post;
end;

procedure TfrmMelkDaagliks.updateCowWeek;
begin
  DataModule1.tbCowWeek.Edit;
  DataModule1.tbCowWeekEnd_Date.Value := todayDate;
  DataModule1.tbCowWeekTotal_Melk.Value := DataModule1.tbCowWeekTotal_Melk.Value + total_Melk;
  DataModule1.tbCowWeek.Post;
end;

procedure TfrmMelkDaagliks.insertCowMonth;
begin
  DataModule1.tbCowMonth.Insert;
  DataModule1.tbCowMonthBegin_Date.Value := firstDayMonth(todayDate);
  DataModule1.tbCowMonthKoei_ID.Value := edtId.Text;
  DataModule1.tbCowMonthEnd_Date.Value := todayDate;
  DataModule1.tbCowMonthTotal_Melk.Value := total_Melk;
  DataModule1.tbCowMonth.Post;
end;

procedure TfrmMelkDaagliks.updateCowMonth;
begin
  DataModule1.tbCowMonth.Edit;
  DataModule1.tbCowMonthEnd_Date.Value := todayDate;
  DataModule1.tbCowMonthTotal_Melk.Value := DataModule1.tbCowMonthTotal_Melk.Value + total_Melk;
  DataModule1.tbCowMonth.Post;
end;

procedure TfrmMelkDaagliks.insertCowYear;
var first: TDateTime;
 day: word;
 month: word;
 year: word;
begin
  decodeDate(todayDate, year, month, day);
  first := encodeDate(year, 1, 1);
  DataModule1.tbCowYear.Insert;
  DataModule1.tbCowYearBegin_Date.Value := first;
  DataModule1.tbCowYearKoei_ID.Value := edtId.Text;
  DataModule1.tbCowYearEnd_Date.Value := todayDate;
  DataModule1.tbCowYearTotal_Melk.Value := total_Melk;
  DataModule1.tbCowYear.Post;
end;

procedure TfrmMelkDaagliks.updateCowYear;
begin
  DataModule1.tbCowYear.Edit;
  DataModule1.tbCowYearEnd_Date.Value := todayDate;
  DataModule1.tbCowYearTotal_Melk.Value := DataModule1.tbCowYearTotal_Melk.Value + total_Melk;
  DataModule1.tbCowYear.Post;
end;

procedure TfrmMelkDaagliks.updateCow(total: double);
begin
  DataModule1.tbCow.Edit;
  DataModule1.tbCowTotal_Milk.Value := DataModule1.tbCowTotal_Milk.Value + total;
  DataModule1.tbCow.Post;
end;

procedure TfrmMelkDaagliks.updateLac(total: double);
var lakFase: Integer;
begin
  lakFase := DataModule1.tbLactationLak_Fase.Value;


  DataModule1.tbLactation.Edit;

  if lakFase = 1 then
    DataModule1.tbLactationFase_Een.Value := DataModule1.tbLactationFase_Een.Value + total
  else if lakFase = 2 then
    DataModule1.tbLactationFase_Twee.Value := DataModule1.tbLactationFase_Twee.Value + total
  else if lakFase = 3 then
    DataModule1.tbLactationFase_Drie.Value := DataModule1.tbLactationFase_Drie.Value + total
  else if lakFase = 4 then
    DataModule1.tbLactationFase_Vier.Value := DataModule1.tbLactationFase_Vier.Value + total
  else if lakFase = 5 then
    DataModule1.tbLactationFase_Vyf.Value := DataModule1.tbLactationFase_Vyf.Value + total
  else if lakFase = 6 then
    DataModule1.tbLactationFase_Ses.Value := DataModule1.tbLactationFase_Ses.Value + total
  else if lakFase = 7 then
    DataModule1.tbLactationFase_Sewe.Value := DataModule1.tbLactationFase_Sewe.Value + total
  else if lakFase = 8 then
    DataModule1.tbLactationFase_Agt.Value := DataModule1.tbLactationFase_Agt.Value + total
  else if lakFase = 9 then
    DataModule1.tbLactationFase_Nege.Value := DataModule1.tbLactationFase_Nege.Value + total
  else if lakFase = 10 then
    DataModule1.tbLactationFase_Tien.Value := DataModule1.tbLactationFase_Tien.Value + total
  else if lakFase = 11 then
    DataModule1.tbLactationFase_Elf.Value := DataModule1.tbLactationFase_Elf.Value + total
  else
    DataModule1.tbLactationFase_Twaalf.Value := DataModule1.tbLactationFase_Twaalf.Value + total;

  DataModule1.tbLactation.Post;
end;

procedure TfrmMelkDaagliks.btnAddClick(Sender: TObject);
begin
  insert();
  close();
  DataModule1.connect;
end;

procedure TfrmMelkDaagliks.btnKwalClick(Sender: TObject);
begin
  queryMelkKwaliteit;
  frmMelkKoeiMelkKwaliteit := TfrmMelkKoeiMelkKwaliteit.Create(self);
  frmMelkKoeiMelkKwaliteit.ShowModal;
  frmMelkKoeiMelkKwaliteit.Free;
end;

function TfrmMelkDaagliks.firstDayWeek(date: TDateTime): TDateTime;
var monday: TDateTime;
  dayNum: Integer;
  year, month, day: word;
begin

  dayNum := DayOfWeek(date);
  if dayNum = 1 then
    monday := date - 6
  else if dayNum = 2 then
    monday := date
  else if dayNum = 3 then
    monday := date - 1
  else if dayNum = 4 then
    monday := date - 2
  else if dayNum = 5 then
    monday := date - 3
  else if dayNum = 6 then
    monday := date - 4
  else if dayNum = 7 then
    monday := date - 5;

  decodeDate(monday, year, month, day);
  monday := encodeDate(year, month, day);
  result := monday;
end;

procedure TfrmMelkDaagliks.FormCreate(Sender: TObject);
begin
  koeie_Gemelk := 0;
end;

function TfrmMelkDaagliks.firstDayMonth(date: TDateTime): TDateTime;
var first: TDateTime;
  day: word;
  month: word;
  year: word;
begin
  DecodeDate(date, year, month, day);
  first := EncodeDate(year, month, 1);

  result := first;
end;

procedure TfrmMelkDaagliks.showMilkSoFar;
var total: double;
begin
  total := 0.00;

  if DataModule1.tbCowDayEerste.Value > 0.00 then
  begin
    edtEerste.Text := FloatToStr(DataModule1.tbCowDayEerste.Value);
    total := DataModule1.tbCowDayEerste.Value;
    edtEerste.Enabled := false;
  end
  else
    edtEerste.Text := FloatToStr(DataModule1.tbCowDayEerste.Value);

  if DataModule1.tbCowDayTweede.Value > 0.00 then
  begin
    edtTweede.Text := FloatToStr(DataModule1.tbCowDayTweede.Value);
    total := total + DataModule1.tbCowDayTweede.Value;
    edtTweede.Enabled := false;
  end
  else
    edtTweede.Text := FloatToStr(DataModule1.tbCowDayTweede.Value);

  if DataModule1.tbCowDayDerde.Value > 0.00 then
  begin
    edtDerde.Text := FloatToStr(DataModule1.tbCowDayDerde.Value);
    total := total + DataModule1.tbCowDayDerde.Value;
    edtDerde.Enabled := false;
  end
  else
    edtDerde.Text := FloatToStr(DataModule1.tbCowDayDerde.Value);

  lblTotaal.Caption := FloatToStr(total);

end;

procedure TfrmMelkDaagliks.open;
begin
  gbMelk.Enabled := true;
	btnKwal.Enabled := true;
	btnAdd.Enabled := true;
	lblOrder.Visible := true;
	edtId.Enabled := false;
	btnVind.Enabled := false;
  if not(DataModule1.tbCattlePicture.Value = 'NO PICTURE') then
  begin
    imgFoto.Picture.LoadFromFile(DataModule1.tbCattlePicture.Value);
    imgFoto.Visible := true;
    imgFoto.Proportional := true;
  end;
  ShowMessage('Sleutel nou die getal melk gelewer deur die koei en druk die Registereer Melk Total knoppie');
end;

procedure TfrmMelkDaagliks.btnVindClick(Sender: TObject);
begin
  if vindCattle then
  begin
    if (vindKoei) AND (vindLac) then
    begin
      open();
      if vindCowDay then
        showMilkSoFar;
    end
    else
      ShowMessage('Daar is nie n koei met daai ID / Tag in die stelsel nie,');
  end
  else
    ShowMessage('Daar is geen bees met die id / tag in die stelsel.');
end;

procedure TfrmMelkDaagliks.close;
begin
  edtID.Enabled := true;
  edtID.Clear;
  edtID.SetFocus;
  btnVind.Enabled := true;
  edtEerste.Enabled := true;
  edtEerste.Clear;
  edtEerste.Text := '0.00';
  edtTweede.Enabled := true;
  edtTweede.Clear;
  edtTweede.Text := '0.00';
  edtDerde.Enabled := true;
  edtDerde.Clear;
  edtDerde.Text := '0.00';
  gbMelk.Enabled := false;
  btnKwal.Enabled := false;
  btnAdd.Enabled := false;
  imgFoto.Visible := false;
  koeie_gemelk := 0;
  total_melk := 0.00;
  lblTotaal.Caption := '0.00';
end;

function TfrmMelkDaagliks.verifyValues;
var value: double;
begin
  if (edtEerste.Enabled) AND not(tryStrToFloat(edtEerste.Text, value)) then
  begin
    ShowMessage('U het nie n geldige waarde in gesit nie.');
    edtEerste.SetFocus;
    result := false;
  end
  else
  if (edtTweede.Enabled) AND not(tryStrToFloat(edtTweede.Text, value)) then
  begin
    ShowMessage('U het nie n geldige waarde in gesit nie.');
    edtTweede.SetFocus;
    result := false;
  end
  else
  if (edtDerde.Enabled) AND not(tryStrToFloat(edtDerde.Text, value)) then
  begin
    ShowMessage('U het nie n geldige waarde in gesit nie.');
    edtDerde.SetFocus;
    result := false;
  end
  else
    result:= true;

end;

procedure TfrmMelkDaagliks.insert;
begin
  if vindCowDay then
    updateCowDay
  else
    insertCowDay;

  if vindCowWeek then
    updateCowWeek
  else
    insertCowWeek;

  if vindCowMonth then
    updateCowMonth
  else
    insertCowMonth;

  if vindCowYear then
    updateCowYear
  else
    insertCowYear;

  if vindDayTotal then
    updateDayTotal
  else
    insertDayTotal;

  if vindWeekTotal then
    updateWeekTotal
  else
    insertWeekTotal;

  if vindMonthTotal then
    updateMonthTotal
  else
    insertMonthTotal;

  if vindYearTotal then
    updateYearTotal
  else
    insertYearTotal;

  ShowMessage('Die koeie se melk is suksesvol in die stelsel geregistreer.');
end;

end.
