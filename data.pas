unit data;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDataModule1 = class(TDataModule)
    database: TADOConnection;
    tbCattle: TADOTable;
    tbCow: TADOTable;
    tbBul: TADOTable;
    tbCalve: TADOTable;
    tbSeed: TADOTable;
    tbCowCattle_ID: TWideStringField;
    tbCowDays_In_Milk: TIntegerField;
    tbCowLac_Phase: TIntegerField;
    tbCowTotal_Milk: TFloatField;
    tbBulCattle_ID: TWideStringField;
    tbSeedID: TWideStringField;
    tbSeedNames: TWideStringField;
    tbSeedBirth_Weight: TWideStringField;
    tbSeedNumber_In_Stock: TIntegerField;
    qCow: TADOQuery;
    qBul: TADOQuery;
    qCalve: TADOQuery;
    qKoeiMelkInfo: TADOQuery;
    tbCalveCattle_ID: TWideStringField;
    tbCalveWeight_One: TWideStringField;
    tbCalveDate_One: TWideStringField;
    tbCalveWeight_Two: TWideStringField;
    tbCalveDate_Two: TWideStringField;
    tbCalveWeight_Three: TWideStringField;
    tbCalveDate_Three: TWideStringField;
    tbCalveWeight_Four: TWideStringField;
    tbCalveDate_Four: TWideStringField;
    tbDekking: TADOTable;
    tbInent: TADOTable;
    tbAdmin: TADOTable;
    tbAdminFarm_Name: TWideStringField;
    tbAdminMilk_Name: TWideStringField;
    tbAdminNames: TWideStringField;
    tbAdminSurname: TWideStringField;
    tbAdminPhone: TWideStringField;
    tbAdminKalf_Interval: TIntegerField;
    tbAdminDroog_Datum: TIntegerField;
    tbBirth: TADOTable;
    tbDayTotal: TADOTable;
    tbWeekTotal: TADOTable;
    tbMonthTotal: TADOTable;
    tbYearTotal: TADOTable;
    tbCowDay: TADOTable;
    tbCowWeek: TADOTable;
    tbCowMonth: TADOTable;
    tbCowYear: TADOTable;
    tbCowMelkKwaliteit: TADOTable;
    tbMelkTenkKwaliteit: TADOTable;
    tbLactation: TADOTable;
    tbLactationKoei_ID: TWideStringField;
    tbLactationLak_Fase: TIntegerField;
    tbLactationFase_Een: TFloatField;
    tbLactationFase_Twee: TFloatField;
    tbLactationFase_Drie: TFloatField;
    tbLactationFase_Vier: TFloatField;
    tbLactationFase_Vyf: TFloatField;
    tbLactationFase_Ses: TFloatField;
    tbLactationFase_Sewe: TFloatField;
    tbLactationFase_Agt: TFloatField;
    tbLactationFase_Nege: TFloatField;
    tbLactationFase_Tien: TFloatField;
    tbLactationFase_Elf: TFloatField;
    tbLactationFase_Twaalf: TFloatField;
    tbWeekTotalBegin_Date: TDateTimeField;
    tbWeekTotalEnd_Date: TDateTimeField;
    tbWeekTotalTotal_Melk: TFloatField;
    tbWeekTotalTop_Koei_ID: TWideStringField;
    tbWeekTotalTop_Koei_Total: TFloatField;
    tbMonthTotalBegin_Date: TDateTimeField;
    tbMonthTotalEnd_Date: TDateTimeField;
    tbMonthTotalTotal_Melk: TFloatField;
    tbMonthTotalTop_Koei_ID: TWideStringField;
    tbMonthTotalTop_Koei_Total: TFloatField;
    tbYearTotalBegin_Date: TDateTimeField;
    tbYearTotalEnd_Date: TDateTimeField;
    tbYearTotalTotal_Melk: TFloatField;
    tbYearTotalTop_Koei_ID: TWideStringField;
    tbYearTotalTop_Koei_Total: TFloatField;
    tbCowWeekBegin_Date: TDateTimeField;
    tbCowWeekKoei_ID: TWideStringField;
    tbCowWeekEnd_Date: TDateTimeField;
    tbCowWeekTotal_Melk: TFloatField;
    tbCowMonthBegin_Date: TDateTimeField;
    tbCowMonthKoei_ID: TWideStringField;
    tbCowMonthEnd_Date: TDateTimeField;
    tbCowMonthTotal_Melk: TFloatField;
    tbCowYearBegin_Date: TDateTimeField;
    tbCowYearKoei_ID: TWideStringField;
    tbCowYearEnd_Date: TDateTimeField;
    tbCowYearTotal_Melk: TFloatField;
    tbCowMelkKwaliteitDates: TDateTimeField;
    tbCowMelkKwaliteitKoei_ID: TWideStringField;
    tbCowMelkKwaliteitBotter_Vet: TWideStringField;
    tbCowMelkKwaliteitProteine: TWideStringField;
    tbCowMelkKwaliteitSel_Telling: TWideStringField;
    tbMelkTenkKwaliteitDates: TDateTimeField;
    tbMelkTenkKwaliteitBotter_Vet: TWideStringField;
    tbMelkTenkKwaliteitProteine: TWideStringField;
    tbMelkTenkKwaliteitSel_Telling: TWideStringField;
    tbMelkTenkKwaliteitKiem_Telling: TWideStringField;
    tbDayTotalDates: TDateTimeField;
    tbDayTotalTotal_Melk: TFloatField;
    tbDayTotalKoeie_Gemelk: TIntegerField;
    tbDayTotalTop_Koei_ID: TWideStringField;
    tbDayTotalTop_Koei_Total: TFloatField;
    tbCowDayDates: TDateTimeField;
    tbCowDayKoei_ID: TWideStringField;
    tbCowDayEerste: TFloatField;
    tbCowDayTweede: TFloatField;
    tbCowDayDerde: TFloatField;
    tbCattleID: TWideStringField;
    tbCattleNaam: TWideStringField;
    tbCattleFather: TWideStringField;
    tbCattleMother: TWideStringField;
    tbCattleBirth_Weight: TWideStringField;
    tbCattleBirth_Date: TDateTimeField;
    tbCattleType: TWideStringField;
    tbCattlePicture: TWideStringField;
    qBulCattle_ID: TWideStringField;
    qBulNaam: TWideStringField;
    qBulFather: TWideStringField;
    qBulMother: TWideStringField;
    qBulBirth_Weight: TWideStringField;
    qBulBirth_Date: TDateTimeField;
    qBulType: TWideStringField;
    qBulPicture: TWideStringField;
    qKoeiDekInfo: TADOQuery;
    qKoeiMelkKwalInfo: TADOQuery;
    qKoeiKalfInfo: TADOQuery;
    qKoeiLakInfo: TADOQuery;
    qKoeiInentInfo: TADOQuery;
    qKoeiLakInfoLak_Fase: TIntegerField;
    qKoeiLakInfoFase_Een: TFloatField;
    qKoeiLakInfoFase_Twee: TFloatField;
    qKoeiLakInfoFase_Drie: TFloatField;
    qKoeiLakInfoFase_Vier: TFloatField;
    qKoeiLakInfoFase_Vyf: TFloatField;
    qKoeiLakInfoFase_Ses: TFloatField;
    qKoeiLakInfoFase_Sewe: TFloatField;
    qKoeiLakInfoFase_Agt: TFloatField;
    qKoeiLakInfoFase_Nege: TFloatField;
    qKoeiLakInfoFase_Tien: TFloatField;
    qKoeiLakInfoFase_Elf: TFloatField;
    qKoeiLakInfoFase_Twaalf: TFloatField;
    qKoeiDekInfoDek_Datum: TDateTimeField;
    qKoeiDekInfoBul_ID: TWideStringField;
    qKoeiDekInfoDroog_Datum: TDateTimeField;
    qKoeiDekInfoKalf_Datum: TDateTimeField;
    qKoeiDekInfoStatus: TWideStringField;
    qKoeiKalfInfoDates: TDateTimeField;
    qKoeiKalfInfoType: TWideStringField;
    qKoeiInentInfoDates: TDateTimeField;
    qKoeiInentInfoType: TWideStringField;
    qKoeiInentInfoDose: TWideStringField;
    qKoeiInentInfoReason: TWideStringField;
    qBulDekInfo: TADOQuery;
    qBulDekInfoDek_Datum: TDateTimeField;
    qBulDekInfoKoei_ID: TWideStringField;
    qBulDekInfoDroog_Datum: TDateTimeField;
    qBulDekInfoKalf_Datum: TDateTimeField;
    qBulDekInfoStatus: TWideStringField;
    qMelkKoeiDagInfo: TADOQuery;
    qMelkKoeiWeekInfo: TADOQuery;
    qMelkKoeiWeekInfobegin_date: TDateTimeField;
    qMelkKoeiWeekInfoend_date: TDateTimeField;
    qMelkKoeiWeekInfokoei_id: TWideStringField;
    qMelkKoeiWeekInfototal_melk: TFloatField;
    qMelkKoeiMaandInfo: TADOQuery;
    qMelkKoeiJaarInfo: TADOQuery;
    qMelkDagTotaalInfo: TADOQuery;
    qMelkWeekTotaalInfo: TADOQuery;
    qMelkMaandTotaalInfo: TADOQuery;
    qMelkJaarTotaalInfo: TADOQuery;
    qMelkKoeiMaandInfoBegin_Date: TDateTimeField;
    qMelkKoeiMaandInfoKoei_ID: TWideStringField;
    qMelkKoeiMaandInfoEnd_Date: TDateTimeField;
    qMelkKoeiMaandInfoTotal_Melk: TFloatField;
    qMelkKoeiJaarInfoBegin_Date: TDateTimeField;
    qMelkKoeiJaarInfoKoei_ID: TWideStringField;
    qMelkKoeiJaarInfoEnd_Date: TDateTimeField;
    qMelkKoeiJaarInfoTotal_Melk: TFloatField;
    qMelkDagTotaalInfoDates: TDateTimeField;
    qMelkDagTotaalInfoTotal_Melk: TFloatField;
    qMelkDagTotaalInfoKoeie_Gemelk: TIntegerField;
    qMelkDagTotaalInfoTop_Koei_ID: TWideStringField;
    qMelkDagTotaalInfoTop_Koei_Total: TFloatField;
    qMelkWeekTotaalInfoBegin_Date: TDateTimeField;
    qMelkWeekTotaalInfoEnd_Date: TDateTimeField;
    qMelkWeekTotaalInfoTotal_Melk: TFloatField;
    qMelkWeekTotaalInfoTop_Koei_ID: TWideStringField;
    qMelkWeekTotaalInfoTop_Koei_Total: TFloatField;
    qMelkMaandTotaalInfoBegin_Date: TDateTimeField;
    qMelkMaandTotaalInfoEnd_Date: TDateTimeField;
    qMelkMaandTotaalInfoTotal_Melk: TFloatField;
    qMelkMaandTotaalInfoTop_Koei_ID: TWideStringField;
    qMelkMaandTotaalInfoTop_Koei_Total: TFloatField;
    qMelkJaarTotaalInfoBegin_Date: TDateTimeField;
    qMelkJaarTotaalInfoEnd_Date: TDateTimeField;
    qMelkJaarTotaalInfoTotal_Melk: TFloatField;
    qMelkJaarTotaalInfoTop_Koei_ID: TWideStringField;
    qMelkJaarTotaalInfoTop_Koei_Total: TFloatField;
    qInentKoeiInfo: TADOQuery;
    qInentBulInfo: TADOQuery;
    qInentKoeiInfoID: TWideStringField;
    qInentKoeiInfoDates: TDateTimeField;
    qInentKoeiInfoinentingType: TWideStringField;
    qInentKoeiInfoDose: TWideStringField;
    qInentKoeiInfoReason: TWideStringField;
    qInentBulInfoID: TWideStringField;
    qInentBulInfoDates: TDateTimeField;
    qInentBulInfoinentingType: TWideStringField;
    qInentBulInfoDose: TWideStringField;
    qInentBulInfoReason: TWideStringField;
    qInentVersInfo: TADOQuery;
    qInentVersInfoID: TWideStringField;
    qInentVersInfoDates: TDateTimeField;
    qInentVersInfoinentingType: TWideStringField;
    qInentVersInfoDose: TWideStringField;
    qInentVersInfoReason: TWideStringField;
    qBulInentInfo: TADOQuery;
    qBulInentInfoDates: TDateTimeField;
    qBulInentInfoType: TWideStringField;
    qBulInentInfoDose: TWideStringField;
    qBulInentInfoReason: TWideStringField;
    qVersInentInfo: TADOQuery;
    qVersInentInfoDates: TDateTimeField;
    qVersInentInfoCattle_ID: TWideStringField;
    qVersInentInfoType: TWideStringField;
    qVersInentInfoDose: TWideStringField;
    qVersInentInfoReason: TWideStringField;
    qCowID: TWideStringField;
    qCowNaam: TWideStringField;
    qCowFather: TWideStringField;
    qCowMother: TWideStringField;
    qCowBirth_Weight: TWideStringField;
    qCowBirth_Date: TDateTimeField;
    qCowType: TWideStringField;
    qCowPicture: TWideStringField;
    qCowCattle_ID: TWideStringField;
    qCowDays_In_Milk: TIntegerField;
    qCowLac_Phase: TIntegerField;
    qCowTotal_Milk: TFloatField;
    qCalveID: TWideStringField;
    qCalveNaam: TWideStringField;
    qCalveFather: TWideStringField;
    qCalveMother: TWideStringField;
    qCalveBirth_Weight: TWideStringField;
    qCalveBirth_Date: TDateTimeField;
    qCalveType: TWideStringField;
    qCalvePicture: TWideStringField;
    qCalveCattle_ID: TWideStringField;
    qCalveWeight_One: TWideStringField;
    qCalveDate_One: TWideStringField;
    qCalveWeight_Two: TWideStringField;
    qCalveDate_Two: TWideStringField;
    qCalveWeight_Three: TWideStringField;
    qCalveDate_Three: TWideStringField;
    qCalveWeight_Four: TWideStringField;
    qCalveDate_Four: TWideStringField;
    tbDekkingDek_Datum: TDateTimeField;
    tbDekkingKoei_ID: TWideStringField;
    tbDekkingBul_ID: TWideStringField;
    tbDekkingDroog_Datum: TDateTimeField;
    tbDekkingKalf_Datum: TDateTimeField;
    tbDekkingStatus: TWideStringField;
    tbBirthDates: TDateTimeField;
    tbBirthCow_ID: TWideStringField;
    tbBirthType: TWideStringField;
    tbInentDates: TDateTimeField;
    tbInentCattle_ID: TWideStringField;
    tbInentType: TWideStringField;
    tbInentDose: TWideStringField;
    tbInentReason: TWideStringField;
    qKoeiMelkInfoid: TWideStringField;
    qKoeiMelkInfokoei_id: TWideStringField;
    qKoeiMelkInfodates: TDateTimeField;
    qKoeiMelkInfoeerste: TFloatField;
    qKoeiMelkInfotweede: TFloatField;
    qKoeiMelkInfoderde: TFloatField;
    qKoeiMelkInfototaal: TFloatField;
    tbCowDayKeer_Gemelk: TSmallintField;
    qKoeiMelkKwalInfoDates: TDateTimeField;
    qKoeiMelkKwalInfoKoei_ID: TWideStringField;
    qKoeiMelkKwalInfoBotter_Vet: TWideStringField;
    qKoeiMelkKwalInfoProteine: TWideStringField;
    qKoeiMelkKwalInfoSel_Telling: TWideStringField;
    qKoeiMelkKwalInfoDag: TADOQuery;
    qKoeiMelkKwalInfoDagDates: TDateTimeField;
    qKoeiMelkKwalInfoDagKoei_ID: TWideStringField;
    qKoeiMelkKwalInfoDagBotter_Vet: TWideStringField;
    qKoeiMelkKwalInfoDagProteine: TWideStringField;
    qKoeiMelkKwalInfoDagSel_Telling: TWideStringField;
    qMelkKoeiDagInfoDates: TDateTimeField;
    qMelkKoeiDagInfoKoei_ID: TWideStringField;
    qMelkKoeiDagInfoEerste: TFloatField;
    qMelkKoeiDagInfoTweede: TFloatField;
    qMelkKoeiDagInfoDerde: TFloatField;
    qDroog_Waarskuwing: TADOQuery;
    qKalf_Waarskuwing: TADOQuery;
    qKalf_WaarskuwingDek_Datum: TDateTimeField;
    qKalf_WaarskuwingKoei_ID: TWideStringField;
    qKalf_WaarskuwingBul_ID: TWideStringField;
    qKalf_WaarskuwingDroog_Datum: TDateTimeField;
    qKalf_WaarskuwingKalf_Datum: TDateTimeField;
    qKalf_WaarskuwingStatus: TWideStringField;
    qDroog_WaarskuwingDek_Datum: TDateTimeField;
    qDroog_WaarskuwingKoei_ID: TWideStringField;
    qDroog_WaarskuwingBul_ID: TWideStringField;
    qDroog_WaarskuwingDroog_Datum: TDateTimeField;
    qDroog_WaarskuwingKalf_Datum: TDateTimeField;
    qDroog_WaarskuwingStatus: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure connect();
    function picturePath(filename: String): String;
    procedure activateQueryString(queryName: TADOQuery; value, name: String);
    procedure deleteCattle(id: String);
    procedure cleanTables();
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

procedure TDataModule1.connect;
begin
  database.Connected := false;
  database.Connected := true;

  tbCattle.Active := false;
  tbCattle.Active := true;

  tbCow.Active := false;
  tbCow.Active := true;

  tbBul.Active := false;
  tbBul.Active := true;

  tbCalve.Active := false;
  tbCalve.Active := true;

  tbSeed.Active := false;
  tbSeed.Active := true;

  tbDekking.Active := false;
  tbDekking.Active := true;

  tbInent.Active := false;
  tbInent.Active := true;

  tbBirth.Active := false;
  tbBirth.Active := true;

  tbAdmin.Active := false;
  tbAdmin.Active := true;

  tbLactation.Active := false;
  tbLactation.Active := true;

  tbDayTotal.Active := false;
  tbDayTotal.Active := true;

  tbWeekTotal.Active := false;
  tbWeekTotal.Active := true;

  tbMonthTotal.Active := false;
  tbMonthTotal.Active := true;

  tbYearTotal.Active := false;
  tbYearTotal.Active := true;

  tbCowDay.Active := false;
  tbCowDay.Active := true;

  tbCowWeek.Active := false;
  tbCowWeek.Active := true;

  tbCowMonth.Active := false;
  tbCowMonth.Active := true;

  tbCowYear.Active := false;
  tbCowYear.Active := true;

  tbCowMelkKwaliteit.Active := false;
  tbCowMelkKwaliteit.Active := true;

  tbMelkTenkKwaliteit.Active := false;
  tbMelkTenkKwaliteit.Active := true;

  qCow.Active := false;
  qCow.Active := true;

  qBul.Active := false;
  qBul.Active := true;

  qCalve.Active := false;
  qCalve.Active := true;
end;

function TDataModule1.picturePath(filename: string): String;
var id, extension, path, value: String;
begin
  id := tbCattleID.Value;
  path := 'c:\Melk\Foto\';
  delete(filename, 1, (Pos('.', filename) - 1));
  value := path + id + filename;
  result := value;
end;

procedure TDataModule1.activateQueryString(queryName: TADOQuery; value, name: string);
begin
  queryName.Active := false;
  queryName.Parameters.ParamByName(name).Value := value;
  queryName.Active := true;
end;

procedure TDataModule1.deleteCattle(id: string);
begin
  tbCowDay.First;
  while not(tbCowDay.Eof) do
  begin
    if tbCowDayKoei_ID.Value = id then
      tbCowDay.Delete
    else
      tbCowDay.Next;
  end;

  tbCowWeek.First;
  while not(tbCowWeek.Eof) do
  begin
    if tbCowWeekKoei_ID.Value = id then
      tbCowWeek.Delete
    else
      tbCowWeek.Next;
  end;

  tbCowMonth.First;
  while not(tbCowMonth.Eof) do
  begin
    if tbCowMonthKoei_ID.Value = id then
      tbCowMonth.Delete
    else
      tbCowMonth.Next;
  end;

  tbCowYear.First;
  while not(tbCowYear.Eof) do
  begin
    if tbCowYearKoei_ID.Value = id then
      tbCowYear.Delete
    else
      tbCowYear.Next;
  end;

  tbCowMelkKwaliteit.First;
  while not(tbCowMelkKwaliteit.Eof) do
  begin
    if tbCowMelkKwaliteitKoei_ID.Value = id then
      tbCowMelkKwaliteit.Delete
    else
      tbCowMelkKwaliteit.Next;
  end;

  tbBirth.First;
  while not(tbBirth.Eof) do
  begin
    if tbBirthCow_ID.Value = id then
     tbBirth.Delete
    else
      tbBirth.Next;
  end;

  tbDekking.First;
  while not(tbDekking.Eof) do
  begin
    if tbDekkingKoei_ID.Value = id then
    begin
      tbDekking.Edit;
      tbDekkingKoei_ID.Value := 'KOEI VERWYDER';
      tbDekking.Post;
    end
    else if tbDekkingBul_ID.Value = id then
    begin
      tbDekking.Edit;
      tbDekkingBul_ID.Value := 'BUL/SAAD VERWYDER';
      tbDekking.Post;
    end;

    tbDekking.Next;
  end;

  tbInent.First;
  while not(tbInent.Eof) do
  begin
    if tbInentCattle_ID.Value = id then
      tbInent.Delete
    else
      tbInent.Next;
  end;

  tbLactation.First;
  while not(tbLActation.Eof) do
  begin
    if tbLactationKoei_ID.Value = id then
      tbLactation.Delete
    else
      tbLactation.Next;
  end;

  tbSeed.First;
  while not(tbSeed.Eof) do
  begin
    if tbSeedID.Value = id then
      tbSeed.Delete
    else
      tbSeed.Next;
  end;

  tbCalve.First;
  while not(tbCalve.Eof) do
  begin
    if tbCalveCattle_ID.Value = id then
      tbCalve.Delete
    else
      tbCalve.Next;
  end;

  tbBul.First;
  while not(tbBul.Eof) do
  begin
    if tbBulCattle_ID.Value = id then
      tbBul.Delete
    else
      tbBul.Next;
  end;

  tbCow.First;
  while not(tbCow.Eof) do
  begin
    if tbCowCattle_ID.Value = id then
      tbCow.Delete
    else
      tbCow.Next;
  end;

  tbCattle.First;
  while not(tbCattle.Eof) do
  begin
    if tbCattleID.Value = id then
      tbCattle.Delete
    else
      tbCattle.Next;
  end;
end;

procedure TDataModule1.cleanTables;
begin
  tbCattle.First;
  while (not(tbCattle.Eof)) OR (not(tbCattle.IsEmpty)) do
  begin
      tbCattle.Delete;
      tbCattle.First;
  end;

  tbCow.First;
  while not(tbCow.Eof) OR not(tbCow.IsEmpty) do
  begin
    tbCow.Delete;
    tbCow.First;
  end;

  tbBul.First;
  while not(tbBul.Eof) OR not(tbBul.IsEmpty) do
  begin
    tbBul.Delete;
    tbBul.First;
  end;

  tbCalve.First;
  while not(tbCalve.Eof) OR not(tbCalve.IsEmpty) do
  begin
    tbCalve.Delete;
    tbCalve.First;
  end;

  tbSeed.First;
  while not(tbSeed.Eof) OR not(tbSeed.IsEmpty) do
  begin
    tbSeed.Delete;
    tbSeed.First;
  end;

  tbLactation.First;
  while not(tbLactation.Eof) OR  not(tbLactation.IsEmpty) do
  begin
    tbLactation.Delete;
    tbLactation.First;
  end;

  tbInent.First;
  while not(tbInent.Eof) OR not(tbInent.IsEmpty) do
  begin
    tbinent.Delete;
    tbInent.First;
  end;

  tbDekking.First;
  while not(tbDekking.Eof) OR not(tbDekking.IsEmpty) do
  begin
    tbDekking.Delete;
    tbDekking.First;
  end;

  tbBirth.First;
  while not(tbBirth.Eof) OR not(tbBirth.IsEmpty) do
  begin
    tbBirth.Delete;
    tbBirth.First;
  end;

  tbDayTotal.First;
  while not(tbDayTotal.Eof) OR not(tbDayTotal.IsEmpty) do
  begin
    tbDayTotal.Delete;
    tbDayTotal.First;
  end;

  tbWeekTotal.First;
  while not(tbWeekTotal.Eof) OR not(tbWeekTotal.IsEmpty) do
  begin
    tbWeekTotal.Delete;
    tbWeekTotal.First;
  end;

  tbMonthTotal.First;
  while not(tbMonthTotal.Eof) OR not(tbMonthTotal.IsEmpty) do
  begin
    tbMonthTotal.Delete;
    tbMonthTotal.First;
  end;

  tbYearTotal.First;
  while not(tbYearTotal.Eof) OR not(tbYearTotal.IsEmpty) do
  begin
    tbYearTotal.Delete;
    tbYearTotal.First;
  end;

  tbCowDay.First;
  while not(tbCowDay.Eof) OR not(tbCowDay.IsEmpty) do
  begin
    tbCowDay.Delete;
    tbCowDay.First;
  end;

  tbCowWeek.First;
  while not(tbCowWeek.Eof) OR not(tbCowWeek.IsEmpty) do
  begin
    tbCowWeek.Delete;
    tbCowWeek.First;
  end;

  tbCowMonth.First;
  while not(tbCowMonth.Eof) OR not(tbCowMonth.IsEmpty) do
  begin
    tbCowMonth.Delete;
    tbCowMonth.First;
  end;

  tbCowYear.First;
  while not(tbCowYear.Eof) OR not(tbCowYear.IsEmpty) do
  begin
    tbCowYear.Delete;
    tbCowYear.First;
  end;

  tbCowMelkKwaliteit.First;
  while not(tbCowMelkKwaliteit.Eof) OR not(tbCowMelkKwaliteit.IsEmpty) do
  begin
    tbCowMelkKwaliteit.Delete;
    tbCowMelkKwaliteit.First;
  end;

  tbMelkTenkKwaliteit.First;
  while not(tbMelkTenkKwaliteit.Eof) OR not(tbMelkTenkKwaliteit.IsEmpty) do
  begin
    tbMelkTenkKwaliteit.Delete;
    tbMelkTenkKwaliteit.First;
  end;
end;

end.
