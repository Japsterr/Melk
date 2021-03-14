object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 572
  Width = 819
  object database: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Melk\Database;Pe' +
      'rsist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 48
    Top = 24
  end
  object tbCattle: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'Cattle'
    Left = 120
    Top = 24
    object tbCattleID: TWideStringField
      FieldName = 'ID'
      Size = 25
    end
    object tbCattleNaam: TWideStringField
      FieldName = 'Naam'
      Size = 25
    end
    object tbCattleFather: TWideStringField
      FieldName = 'Father'
      Size = 25
    end
    object tbCattleMother: TWideStringField
      FieldName = 'Mother'
      Size = 25
    end
    object tbCattleBirth_Weight: TWideStringField
      FieldName = 'Birth_Weight'
      Size = 6
    end
    object tbCattleBirth_Date: TDateTimeField
      FieldName = 'Birth_Date'
    end
    object tbCattleType: TWideStringField
      FieldName = 'Type'
      Size = 10
    end
    object tbCattlePicture: TWideStringField
      FieldName = 'Picture'
      Size = 50
    end
  end
  object tbCow: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'Cow'
    Left = 120
    Top = 80
    object tbCowCattle_ID: TWideStringField
      FieldName = 'Cattle_ID'
      Size = 25
    end
    object tbCowDays_In_Milk: TIntegerField
      FieldName = 'Days_In_Milk'
    end
    object tbCowLac_Phase: TIntegerField
      FieldName = 'Lac_Phase'
    end
    object tbCowTotal_Milk: TFloatField
      FieldName = 'Total_Milk'
    end
  end
  object tbBul: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'Bul'
    Left = 120
    Top = 136
    object tbBulCattle_ID: TWideStringField
      FieldName = 'Cattle_ID'
      Size = 25
    end
  end
  object tbCalve: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'Calve'
    Left = 120
    Top = 192
    object tbCalveCattle_ID: TWideStringField
      FieldName = 'Cattle_ID'
      Size = 25
    end
    object tbCalveWeight_One: TWideStringField
      FieldName = 'Weight_One'
      Size = 6
    end
    object tbCalveDate_One: TWideStringField
      FieldName = 'Date_One'
      Size = 3
    end
    object tbCalveWeight_Two: TWideStringField
      FieldName = 'Weight_Two'
      Size = 6
    end
    object tbCalveDate_Two: TWideStringField
      FieldName = 'Date_Two'
      Size = 3
    end
    object tbCalveWeight_Three: TWideStringField
      FieldName = 'Weight_Three'
      Size = 6
    end
    object tbCalveDate_Three: TWideStringField
      FieldName = 'Date_Three'
      Size = 3
    end
    object tbCalveWeight_Four: TWideStringField
      FieldName = 'Weight_Four'
      Size = 6
    end
    object tbCalveDate_Four: TWideStringField
      FieldName = 'Date_Four'
      Size = 3
    end
  end
  object tbSeed: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'Seed'
    Left = 120
    Top = 240
    object tbSeedID: TWideStringField
      FieldName = 'ID'
      Size = 25
    end
    object tbSeedNames: TWideStringField
      FieldName = 'Names'
      Size = 25
    end
    object tbSeedBirth_Weight: TWideStringField
      FieldName = 'Birth_Weight'
      Size = 6
    end
    object tbSeedNumber_In_Stock: TIntegerField
      FieldName = 'Number_In_Stock'
    end
  end
  object qCow: TADOQuery
    Active = True
    Connection = database
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Cattle, Cow'
      'WHERE Cattle.ID = Cow.Cattle_ID'
      'ORDER BY cattle.id;')
    Left = 696
    Top = 16
    object qCowID: TWideStringField
      FieldName = 'ID'
      Size = 25
    end
    object qCowNaam: TWideStringField
      FieldName = 'Naam'
      Size = 25
    end
    object qCowFather: TWideStringField
      FieldName = 'Father'
      Size = 25
    end
    object qCowMother: TWideStringField
      FieldName = 'Mother'
      Size = 25
    end
    object qCowBirth_Weight: TWideStringField
      FieldName = 'Birth_Weight'
      Size = 6
    end
    object qCowBirth_Date: TDateTimeField
      FieldName = 'Birth_Date'
    end
    object qCowType: TWideStringField
      FieldName = 'Type'
      Size = 10
    end
    object qCowPicture: TWideStringField
      FieldName = 'Picture'
      Size = 50
    end
    object qCowCattle_ID: TWideStringField
      FieldName = 'Cattle_ID'
      Size = 25
    end
    object qCowDays_In_Milk: TIntegerField
      FieldName = 'Days_In_Milk'
    end
    object qCowLac_Phase: TIntegerField
      FieldName = 'Lac_Phase'
    end
    object qCowTotal_Milk: TFloatField
      FieldName = 'Total_Milk'
    end
  end
  object qBul: TADOQuery
    Active = True
    Connection = database
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Bul, Cattle'
      'WHERE Cattle.ID = Bul.Cattle_ID'
      'ORDER BY cattle.id;')
    Left = 696
    Top = 72
    object qBulCattle_ID: TWideStringField
      FieldName = 'Cattle_ID'
      Size = 25
    end
    object qBulNaam: TWideStringField
      FieldName = 'Naam'
      Size = 25
    end
    object qBulFather: TWideStringField
      FieldName = 'Father'
      Size = 25
    end
    object qBulMother: TWideStringField
      FieldName = 'Mother'
      Size = 25
    end
    object qBulBirth_Weight: TWideStringField
      FieldName = 'Birth_Weight'
      Size = 6
    end
    object qBulBirth_Date: TDateTimeField
      FieldName = 'Birth_Date'
    end
    object qBulType: TWideStringField
      FieldName = 'Type'
      Size = 10
    end
    object qBulPicture: TWideStringField
      FieldName = 'Picture'
      Size = 50
    end
  end
  object qCalve: TADOQuery
    Active = True
    Connection = database
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Cattle, Calve'
      'WHERE calve.Cattle_ID = cattle.ID'
      'ORDER BY cattle.id;')
    Left = 696
    Top = 136
    object qCalveID: TWideStringField
      FieldName = 'ID'
      Size = 25
    end
    object qCalveNaam: TWideStringField
      FieldName = 'Naam'
      Size = 25
    end
    object qCalveFather: TWideStringField
      FieldName = 'Father'
      Size = 25
    end
    object qCalveMother: TWideStringField
      FieldName = 'Mother'
      Size = 25
    end
    object qCalveBirth_Weight: TWideStringField
      FieldName = 'Birth_Weight'
      Size = 6
    end
    object qCalveBirth_Date: TDateTimeField
      FieldName = 'Birth_Date'
    end
    object qCalveType: TWideStringField
      FieldName = 'Type'
      Size = 10
    end
    object qCalvePicture: TWideStringField
      FieldName = 'Picture'
      Size = 50
    end
    object qCalveCattle_ID: TWideStringField
      FieldName = 'Cattle_ID'
      Size = 25
    end
    object qCalveWeight_One: TWideStringField
      FieldName = 'Weight_One'
      Size = 6
    end
    object qCalveDate_One: TWideStringField
      FieldName = 'Date_One'
      Size = 3
    end
    object qCalveWeight_Two: TWideStringField
      FieldName = 'Weight_Two'
      Size = 6
    end
    object qCalveDate_Two: TWideStringField
      FieldName = 'Date_Two'
      Size = 3
    end
    object qCalveWeight_Three: TWideStringField
      FieldName = 'Weight_Three'
      Size = 6
    end
    object qCalveDate_Three: TWideStringField
      FieldName = 'Date_Three'
      Size = 3
    end
    object qCalveWeight_Four: TWideStringField
      FieldName = 'Weight_Four'
      Size = 6
    end
    object qCalveDate_Four: TWideStringField
      FieldName = 'Date_Four'
      Size = 3
    end
  end
  object qKoeiMelkInfo: TADOQuery
    Connection = database
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT cattle.id, cowday.koei_id, cowday.dates, cowday.eerste, c' +
        'owday.tweede, cowday.derde,'
      'cowday.eerste + cowday.tweede + cowday.derde AS totaal'
      'FROM cowday, cattle'
      'WHERE cattle.id = cowday.koei_id'
      'AND cattle.id = :id;')
    Left = 608
    Top = 376
    object qKoeiMelkInfoid: TWideStringField
      FieldName = 'id'
      Size = 25
    end
    object qKoeiMelkInfokoei_id: TWideStringField
      FieldName = 'koei_id'
      Size = 25
    end
    object qKoeiMelkInfodates: TDateTimeField
      FieldName = 'dates'
    end
    object qKoeiMelkInfoeerste: TFloatField
      FieldName = 'eerste'
    end
    object qKoeiMelkInfotweede: TFloatField
      FieldName = 'tweede'
    end
    object qKoeiMelkInfoderde: TFloatField
      FieldName = 'derde'
    end
    object qKoeiMelkInfototaal: TFloatField
      FieldName = 'totaal'
      ReadOnly = True
    end
  end
  object tbDekking: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'Dekking'
    Left = 312
    Top = 24
    object tbDekkingDek_Datum: TDateTimeField
      FieldName = 'Dek_Datum'
    end
    object tbDekkingKoei_ID: TWideStringField
      FieldName = 'Koei_ID'
      Size = 25
    end
    object tbDekkingBul_ID: TWideStringField
      FieldName = 'Bul_ID'
      Size = 25
    end
    object tbDekkingDroog_Datum: TDateTimeField
      FieldName = 'Droog_Datum'
    end
    object tbDekkingKalf_Datum: TDateTimeField
      FieldName = 'Kalf_Datum'
    end
    object tbDekkingStatus: TWideStringField
      FieldName = 'Status'
      Size = 6
    end
  end
  object tbInent: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'Inenting'
    Left = 248
    Top = 24
    object tbInentDates: TDateTimeField
      FieldName = 'Dates'
    end
    object tbInentCattle_ID: TWideStringField
      FieldName = 'Cattle_ID'
      Size = 25
    end
    object tbInentType: TWideStringField
      FieldName = 'Type'
      Size = 25
    end
    object tbInentDose: TWideStringField
      FieldName = 'Dose'
      Size = 6
    end
    object tbInentReason: TWideStringField
      FieldName = 'Reason'
      Size = 50
    end
  end
  object tbAdmin: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'Admin'
    Left = 384
    Top = 24
    object tbAdminFarm_Name: TWideStringField
      FieldName = 'Farm_Name'
      Size = 50
    end
    object tbAdminMilk_Name: TWideStringField
      FieldName = 'Milk_Name'
      Size = 50
    end
    object tbAdminNames: TWideStringField
      FieldName = 'Names'
      Size = 25
    end
    object tbAdminSurname: TWideStringField
      FieldName = 'Surname'
      Size = 25
    end
    object tbAdminPhone: TWideStringField
      FieldName = 'Phone'
      Size = 13
    end
    object tbAdminKalf_Interval: TIntegerField
      FieldName = 'Kalf_Interval'
    end
    object tbAdminDroog_Datum: TIntegerField
      FieldName = 'Droog_Datum'
    end
  end
  object tbBirth: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'Birth'
    Left = 312
    Top = 80
    object tbBirthDates: TDateTimeField
      FieldName = 'Dates'
    end
    object tbBirthCow_ID: TWideStringField
      FieldName = 'Cow_ID'
      Size = 25
    end
    object tbBirthType: TWideStringField
      FieldName = 'Type'
      Size = 15
    end
  end
  object tbDayTotal: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'DayTotal'
    Left = 456
    Top = 24
    object tbDayTotalDates: TDateTimeField
      FieldName = 'Dates'
    end
    object tbDayTotalTotal_Melk: TFloatField
      FieldName = 'Total_Melk'
    end
    object tbDayTotalKoeie_Gemelk: TIntegerField
      FieldName = 'Koeie_Gemelk'
    end
    object tbDayTotalTop_Koei_ID: TWideStringField
      FieldName = 'Top_Koei_ID'
      Size = 25
    end
    object tbDayTotalTop_Koei_Total: TFloatField
      FieldName = 'Top_Koei_Total'
    end
  end
  object tbWeekTotal: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'WeekTotal'
    Left = 456
    Top = 88
    object tbWeekTotalBegin_Date: TDateTimeField
      FieldName = 'Begin_Date'
    end
    object tbWeekTotalEnd_Date: TDateTimeField
      FieldName = 'End_Date'
    end
    object tbWeekTotalTotal_Melk: TFloatField
      FieldName = 'Total_Melk'
    end
    object tbWeekTotalTop_Koei_ID: TWideStringField
      FieldName = 'Top_Koei_ID'
      Size = 25
    end
    object tbWeekTotalTop_Koei_Total: TFloatField
      FieldName = 'Top_Koei_Total'
    end
  end
  object tbMonthTotal: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'MonthTotal'
    Left = 456
    Top = 144
    object tbMonthTotalBegin_Date: TDateTimeField
      FieldName = 'Begin_Date'
    end
    object tbMonthTotalEnd_Date: TDateTimeField
      FieldName = 'End_Date'
    end
    object tbMonthTotalTotal_Melk: TFloatField
      FieldName = 'Total_Melk'
    end
    object tbMonthTotalTop_Koei_ID: TWideStringField
      FieldName = 'Top_Koei_ID'
      Size = 25
    end
    object tbMonthTotalTop_Koei_Total: TFloatField
      FieldName = 'Top_Koei_Total'
    end
  end
  object tbYearTotal: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'YearTotal'
    Left = 456
    Top = 200
    object tbYearTotalBegin_Date: TDateTimeField
      FieldName = 'Begin_Date'
    end
    object tbYearTotalEnd_Date: TDateTimeField
      FieldName = 'End_Date'
    end
    object tbYearTotalTotal_Melk: TFloatField
      FieldName = 'Total_Melk'
    end
    object tbYearTotalTop_Koei_ID: TWideStringField
      FieldName = 'Top_Koei_ID'
      Size = 25
    end
    object tbYearTotalTop_Koei_Total: TFloatField
      FieldName = 'Top_Koei_Total'
    end
  end
  object tbCowDay: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'CowDay'
    Left = 528
    Top = 24
    object tbCowDayDates: TDateTimeField
      FieldName = 'Dates'
    end
    object tbCowDayKoei_ID: TWideStringField
      FieldName = 'Koei_ID'
      Size = 25
    end
    object tbCowDayEerste: TFloatField
      FieldName = 'Eerste'
    end
    object tbCowDayTweede: TFloatField
      FieldName = 'Tweede'
    end
    object tbCowDayDerde: TFloatField
      FieldName = 'Derde'
    end
    object tbCowDayKeer_Gemelk: TSmallintField
      FieldName = 'Keer_Gemelk'
    end
  end
  object tbCowWeek: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'CowWeek'
    Left = 520
    Top = 88
    object tbCowWeekBegin_Date: TDateTimeField
      FieldName = 'Begin_Date'
    end
    object tbCowWeekEnd_Date: TDateTimeField
      FieldName = 'End_Date'
    end
    object tbCowWeekKoei_ID: TWideStringField
      FieldName = 'Koei_ID'
      Size = 25
    end
    object tbCowWeekTotal_Melk: TFloatField
      FieldName = 'Total_Melk'
    end
  end
  object tbCowMonth: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'CowMonth'
    Left = 528
    Top = 144
    object tbCowMonthBegin_Date: TDateTimeField
      FieldName = 'Begin_Date'
    end
    object tbCowMonthKoei_ID: TWideStringField
      FieldName = 'Koei_ID'
      Size = 25
    end
    object tbCowMonthEnd_Date: TDateTimeField
      FieldName = 'End_Date'
    end
    object tbCowMonthTotal_Melk: TFloatField
      FieldName = 'Total_Melk'
    end
  end
  object tbCowYear: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'CowYear'
    Left = 528
    Top = 200
    object tbCowYearBegin_Date: TDateTimeField
      FieldName = 'Begin_Date'
    end
    object tbCowYearKoei_ID: TWideStringField
      FieldName = 'Koei_ID'
      Size = 25
    end
    object tbCowYearEnd_Date: TDateTimeField
      FieldName = 'End_Date'
    end
    object tbCowYearTotal_Melk: TFloatField
      FieldName = 'Total_Melk'
    end
  end
  object tbCowMelkKwaliteit: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'CowMelkKwaliteit'
    Left = 600
    Top = 24
    object tbCowMelkKwaliteitDates: TDateTimeField
      FieldName = 'Dates'
    end
    object tbCowMelkKwaliteitKoei_ID: TWideStringField
      FieldName = 'Koei_ID'
      Size = 25
    end
    object tbCowMelkKwaliteitBotter_Vet: TWideStringField
      FieldName = 'Botter_Vet'
      Size = 10
    end
    object tbCowMelkKwaliteitProteine: TWideStringField
      FieldName = 'Proteine'
      Size = 10
    end
    object tbCowMelkKwaliteitSel_Telling: TWideStringField
      FieldName = 'Sel_Telling'
      Size = 10
    end
  end
  object tbMelkTenkKwaliteit: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'MelkTenkKwaliteit'
    Left = 600
    Top = 88
    object tbMelkTenkKwaliteitDates: TDateTimeField
      FieldName = 'Dates'
    end
    object tbMelkTenkKwaliteitBotter_Vet: TWideStringField
      FieldName = 'Botter_Vet'
      Size = 10
    end
    object tbMelkTenkKwaliteitProteine: TWideStringField
      FieldName = 'Proteine'
      Size = 10
    end
    object tbMelkTenkKwaliteitSel_Telling: TWideStringField
      FieldName = 'Sel_Telling'
      Size = 10
    end
    object tbMelkTenkKwaliteitKiem_Telling: TWideStringField
      FieldName = 'Kiem_Telling'
      Size = 10
    end
  end
  object tbLactation: TADOTable
    Active = True
    Connection = database
    CursorType = ctStatic
    TableName = 'Lactation'
    Left = 184
    Top = 24
    object tbLactationKoei_ID: TWideStringField
      FieldName = 'Koei_ID'
      Size = 25
    end
    object tbLactationLak_Fase: TIntegerField
      FieldName = 'Lak_Fase'
    end
    object tbLactationFase_Een: TFloatField
      FieldName = 'Fase_Een'
    end
    object tbLactationFase_Twee: TFloatField
      FieldName = 'Fase_Twee'
    end
    object tbLactationFase_Drie: TFloatField
      FieldName = 'Fase_Drie'
    end
    object tbLactationFase_Vier: TFloatField
      FieldName = 'Fase_Vier'
    end
    object tbLactationFase_Vyf: TFloatField
      FieldName = 'Fase_Vyf'
    end
    object tbLactationFase_Ses: TFloatField
      FieldName = 'Fase_Ses'
    end
    object tbLactationFase_Sewe: TFloatField
      FieldName = 'Fase_Sewe'
    end
    object tbLactationFase_Agt: TFloatField
      FieldName = 'Fase_Agt'
    end
    object tbLactationFase_Nege: TFloatField
      FieldName = 'Fase_Nege'
    end
    object tbLactationFase_Tien: TFloatField
      FieldName = 'Fase_Tien'
    end
    object tbLactationFase_Elf: TFloatField
      FieldName = 'Fase_Elf'
    end
    object tbLactationFase_Twaalf: TFloatField
      FieldName = 'Fase_Twaalf'
    end
  end
  object qKoeiDekInfo: TADOQuery
    Connection = database
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROm dekking'
      'WHERE koei_id = :id'
      'ORDER BY dekking.dek_datum;')
    Left = 688
    Top = 376
    object qKoeiDekInfoDek_Datum: TDateTimeField
      FieldName = 'Dek_Datum'
    end
    object qKoeiDekInfoBul_ID: TWideStringField
      FieldName = 'Bul_ID'
      Size = 25
    end
    object qKoeiDekInfoDroog_Datum: TDateTimeField
      FieldName = 'Droog_Datum'
    end
    object qKoeiDekInfoKalf_Datum: TDateTimeField
      FieldName = 'Kalf_Datum'
    end
    object qKoeiDekInfoStatus: TWideStringField
      FieldName = 'Status'
      Size = 6
    end
  end
  object qKoeiMelkKwalInfo: TADOQuery
    Connection = database
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM cowmelkkwaliteit'
      'WHERE koei_id = :id;')
    Left = 608
    Top = 440
    object qKoeiMelkKwalInfoDates: TDateTimeField
      FieldName = 'Dates'
    end
    object qKoeiMelkKwalInfoKoei_ID: TWideStringField
      FieldName = 'Koei_ID'
      Size = 25
    end
    object qKoeiMelkKwalInfoBotter_Vet: TWideStringField
      FieldName = 'Botter_Vet'
      Size = 10
    end
    object qKoeiMelkKwalInfoProteine: TWideStringField
      FieldName = 'Proteine'
      Size = 10
    end
    object qKoeiMelkKwalInfoSel_Telling: TWideStringField
      FieldName = 'Sel_Telling'
      Size = 10
    end
  end
  object qKoeiKalfInfo: TADOQuery
    Connection = database
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM birth'
      'WHERE cow_id = :id'
      'ORDER BY birth.dates;')
    Left = 688
    Top = 440
    object qKoeiKalfInfoDates: TDateTimeField
      FieldName = 'Dates'
    end
    object qKoeiKalfInfoType: TWideStringField
      FieldName = 'Type'
      Size = 15
    end
  end
  object qKoeiLakInfo: TADOQuery
    Connection = database
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * '
      'FROM lactation'
      'WHERE koei_id = :id;')
    Left = 608
    Top = 512
    object qKoeiLakInfoLak_Fase: TIntegerField
      FieldName = 'Lak_Fase'
    end
    object qKoeiLakInfoFase_Een: TFloatField
      FieldName = 'Fase_Een'
    end
    object qKoeiLakInfoFase_Twee: TFloatField
      FieldName = 'Fase_Twee'
    end
    object qKoeiLakInfoFase_Drie: TFloatField
      FieldName = 'Fase_Drie'
    end
    object qKoeiLakInfoFase_Vier: TFloatField
      FieldName = 'Fase_Vier'
    end
    object qKoeiLakInfoFase_Vyf: TFloatField
      FieldName = 'Fase_Vyf'
    end
    object qKoeiLakInfoFase_Ses: TFloatField
      FieldName = 'Fase_Ses'
    end
    object qKoeiLakInfoFase_Sewe: TFloatField
      FieldName = 'Fase_Sewe'
    end
    object qKoeiLakInfoFase_Agt: TFloatField
      FieldName = 'Fase_Agt'
    end
    object qKoeiLakInfoFase_Nege: TFloatField
      FieldName = 'Fase_Nege'
    end
    object qKoeiLakInfoFase_Tien: TFloatField
      FieldName = 'Fase_Tien'
    end
    object qKoeiLakInfoFase_Elf: TFloatField
      FieldName = 'Fase_Elf'
    end
    object qKoeiLakInfoFase_Twaalf: TFloatField
      FieldName = 'Fase_Twaalf'
    end
  end
  object qKoeiInentInfo: TADOQuery
    Connection = database
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * '
      'FROM inenting'
      'WHERE cattle_id = :id'
      'ORDER BY inenting.dates;'
      '')
    Left = 688
    Top = 512
    object qKoeiInentInfoDates: TDateTimeField
      FieldName = 'Dates'
    end
    object qKoeiInentInfoType: TWideStringField
      FieldName = 'Type'
      Size = 25
    end
    object qKoeiInentInfoDose: TWideStringField
      FieldName = 'Dose'
      Size = 6
    end
    object qKoeiInentInfoReason: TWideStringField
      FieldName = 'Reason'
      Size = 50
    end
  end
  object qBulDekInfo: TADOQuery
    Connection = database
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM dekking'
      'WHERE bul_id = :id'
      'ORDER BY dekking.dek_datum;')
    Left = 432
    Top = 400
    object qBulDekInfoDek_Datum: TDateTimeField
      FieldName = 'Dek_Datum'
    end
    object qBulDekInfoKoei_ID: TWideStringField
      FieldName = 'Koei_ID'
      Size = 25
    end
    object qBulDekInfoDroog_Datum: TDateTimeField
      FieldName = 'Droog_Datum'
    end
    object qBulDekInfoKalf_Datum: TDateTimeField
      FieldName = 'Kalf_Datum'
    end
    object qBulDekInfoStatus: TWideStringField
      FieldName = 'Status'
      Size = 6
    end
  end
  object qMelkKoeiDagInfo: TADOQuery
    Connection = database
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'day'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT*'
      'FROM cowday'
      'WHERE dates = :day;')
    Left = 80
    Top = 336
    object qMelkKoeiDagInfoDates: TDateTimeField
      FieldName = 'Dates'
    end
    object qMelkKoeiDagInfoKoei_ID: TWideStringField
      FieldName = 'Koei_ID'
      Size = 25
    end
    object qMelkKoeiDagInfoEerste: TFloatField
      FieldName = 'Eerste'
    end
    object qMelkKoeiDagInfoTweede: TFloatField
      FieldName = 'Tweede'
    end
    object qMelkKoeiDagInfoDerde: TFloatField
      FieldName = 'Derde'
    end
  end
  object qMelkKoeiWeekInfo: TADOQuery
    Connection = database
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'begin'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT  cowweek.begin_date, cowweek.end_date, cowweek.koei_id, c' +
        'owweek.total_melk'
      'FROM cowweek'
      'WHERE cowweek.begin_date = :begin'
      'ORDER BY cowweek.koei_id;')
    Left = 40
    Top = 400
    object qMelkKoeiWeekInfobegin_date: TDateTimeField
      FieldName = 'begin_date'
    end
    object qMelkKoeiWeekInfoend_date: TDateTimeField
      FieldName = 'end_date'
    end
    object qMelkKoeiWeekInfokoei_id: TWideStringField
      FieldName = 'koei_id'
      Size = 25
    end
    object qMelkKoeiWeekInfototal_melk: TFloatField
      FieldName = 'total_melk'
    end
  end
  object qMelkKoeiMaandInfo: TADOQuery
    Connection = database
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'begin'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM cowmonth'
      'WHERE cowmonth.begin_date = :begin'
      'ORDER BY cowmonth.koei_id;')
    Left = 32
    Top = 456
    object qMelkKoeiMaandInfoBegin_Date: TDateTimeField
      FieldName = 'Begin_Date'
    end
    object qMelkKoeiMaandInfoKoei_ID: TWideStringField
      FieldName = 'Koei_ID'
      Size = 25
    end
    object qMelkKoeiMaandInfoEnd_Date: TDateTimeField
      FieldName = 'End_Date'
    end
    object qMelkKoeiMaandInfoTotal_Melk: TFloatField
      FieldName = 'Total_Melk'
    end
  end
  object qMelkKoeiJaarInfo: TADOQuery
    Connection = database
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'begin'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM cowyear'
      'WHERE cowyear.begin_date = :begin'
      'ORDER BY cowyear.Koei_id;')
    Left = 32
    Top = 512
    object qMelkKoeiJaarInfoBegin_Date: TDateTimeField
      FieldName = 'Begin_Date'
    end
    object qMelkKoeiJaarInfoKoei_ID: TWideStringField
      FieldName = 'Koei_ID'
      Size = 25
    end
    object qMelkKoeiJaarInfoEnd_Date: TDateTimeField
      FieldName = 'End_Date'
    end
    object qMelkKoeiJaarInfoTotal_Melk: TFloatField
      FieldName = 'Total_Melk'
    end
  end
  object qMelkDagTotaalInfo: TADOQuery
    Connection = database
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'begin'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'end'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM daytotal'
      'WHERE dates >= :begin'
      'AND dates <= :end;')
    Left = 216
    Top = 360
    object qMelkDagTotaalInfoDates: TDateTimeField
      FieldName = 'Dates'
    end
    object qMelkDagTotaalInfoTotal_Melk: TFloatField
      FieldName = 'Total_Melk'
    end
    object qMelkDagTotaalInfoKoeie_Gemelk: TIntegerField
      FieldName = 'Koeie_Gemelk'
    end
    object qMelkDagTotaalInfoTop_Koei_ID: TWideStringField
      FieldName = 'Top_Koei_ID'
      Size = 25
    end
    object qMelkDagTotaalInfoTop_Koei_Total: TFloatField
      FieldName = 'Top_Koei_Total'
    end
  end
  object qMelkWeekTotaalInfo: TADOQuery
    Connection = database
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'begin'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM weektotal'
      'WHERE weektotal.begin_date  = :begin;')
    Left = 216
    Top = 432
    object qMelkWeekTotaalInfoBegin_Date: TDateTimeField
      FieldName = 'Begin_Date'
    end
    object qMelkWeekTotaalInfoEnd_Date: TDateTimeField
      FieldName = 'End_Date'
    end
    object qMelkWeekTotaalInfoTotal_Melk: TFloatField
      FieldName = 'Total_Melk'
    end
    object qMelkWeekTotaalInfoTop_Koei_ID: TWideStringField
      FieldName = 'Top_Koei_ID'
      Size = 25
    end
    object qMelkWeekTotaalInfoTop_Koei_Total: TFloatField
      FieldName = 'Top_Koei_Total'
    end
  end
  object qMelkMaandTotaalInfo: TADOQuery
    Connection = database
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'begin'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM monthtotal'
      'WHERE monthtotal.begin_date = :begin;')
    Left = 224
    Top = 488
    object qMelkMaandTotaalInfoBegin_Date: TDateTimeField
      FieldName = 'Begin_Date'
    end
    object qMelkMaandTotaalInfoEnd_Date: TDateTimeField
      FieldName = 'End_Date'
    end
    object qMelkMaandTotaalInfoTotal_Melk: TFloatField
      FieldName = 'Total_Melk'
    end
    object qMelkMaandTotaalInfoTop_Koei_ID: TWideStringField
      FieldName = 'Top_Koei_ID'
      Size = 25
    end
    object qMelkMaandTotaalInfoTop_Koei_Total: TFloatField
      FieldName = 'Top_Koei_Total'
    end
  end
  object qMelkJaarTotaalInfo: TADOQuery
    Connection = database
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM yeartotal;'
      '')
    Left = 344
    Top = 504
    object qMelkJaarTotaalInfoBegin_Date: TDateTimeField
      FieldName = 'Begin_Date'
    end
    object qMelkJaarTotaalInfoEnd_Date: TDateTimeField
      FieldName = 'End_Date'
    end
    object qMelkJaarTotaalInfoTotal_Melk: TFloatField
      FieldName = 'Total_Melk'
    end
    object qMelkJaarTotaalInfoTop_Koei_ID: TWideStringField
      FieldName = 'Top_Koei_ID'
      Size = 25
    end
    object qMelkJaarTotaalInfoTop_Koei_Total: TFloatField
      FieldName = 'Top_Koei_Total'
    end
  end
  object qInentKoeiInfo: TADOQuery
    Connection = database
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'date'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM cattle, inenting'
      'WHERE cattle.id = inenting.cattle_id'
      'AND cattle.type = '#39'Cow'#39
      'AND inenting.dates = :date;')
    Left = 280
    Top = 304
    object qInentKoeiInfoDates: TDateTimeField
      FieldName = 'Dates'
    end
    object qInentKoeiInfoID: TWideStringField
      FieldName = 'ID'
      Size = 25
    end
    object qInentKoeiInfoinentingType: TWideStringField
      FieldName = 'inenting.Type'
      Size = 25
    end
    object qInentKoeiInfoDose: TWideStringField
      FieldName = 'Dose'
      Size = 6
    end
    object qInentKoeiInfoReason: TWideStringField
      FieldName = 'Reason'
      Size = 50
    end
  end
  object qInentBulInfo: TADOQuery
    Connection = database
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'date'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM cattle, inenting'
      'WHERE cattle.id = inenting.cattle_id'
      'AND cattle.type = '#39'Bul'#39
      'AND inenting.dates = :date;'
      ''
      '')
    Left = 352
    Top = 304
    object qInentBulInfoDates: TDateTimeField
      FieldName = 'Dates'
    end
    object qInentBulInfoID: TWideStringField
      FieldName = 'ID'
      Size = 25
    end
    object qInentBulInfoinentingType: TWideStringField
      FieldName = 'inenting.Type'
      Size = 25
    end
    object qInentBulInfoDose: TWideStringField
      FieldName = 'Dose'
      Size = 6
    end
    object qInentBulInfoReason: TWideStringField
      FieldName = 'Reason'
      Size = 50
    end
  end
  object qInentVersInfo: TADOQuery
    Connection = database
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'date'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM cattle, inenting'
      'WHERE cattle.id = inenting.cattle_id'
      'AND cattle.type = '#39'Vers'#39
      'AND inenting.dates = :date;')
    Left = 424
    Top = 304
    object qInentVersInfoDates: TDateTimeField
      FieldName = 'Dates'
    end
    object qInentVersInfoID: TWideStringField
      FieldName = 'ID'
      Size = 25
    end
    object qInentVersInfoinentingType: TWideStringField
      FieldName = 'inenting.Type'
      Size = 25
    end
    object qInentVersInfoDose: TWideStringField
      FieldName = 'Dose'
      Size = 6
    end
    object qInentVersInfoReason: TWideStringField
      FieldName = 'Reason'
      Size = 50
    end
  end
  object qBulInentInfo: TADOQuery
    Connection = database
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT*'
      'FROM inenting'
      'WHERE cattle_id = :id'
      'ORDER By inenting.dates;')
    Left = 672
    Top = 264
    object qBulInentInfoDates: TDateTimeField
      FieldName = 'Dates'
    end
    object qBulInentInfoType: TWideStringField
      FieldName = 'Type'
      Size = 25
    end
    object qBulInentInfoDose: TWideStringField
      FieldName = 'Dose'
      Size = 6
    end
    object qBulInentInfoReason: TWideStringField
      FieldName = 'Reason'
      Size = 50
    end
  end
  object qVersInentInfo: TADOQuery
    Connection = database
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT*'
      'FROM inenting'
      'WHERE cattle_id = :id'
      'ORDER BY inenting.dates;')
    Left = 672
    Top = 320
    object qVersInentInfoDates: TDateTimeField
      FieldName = 'Dates'
    end
    object qVersInentInfoCattle_ID: TWideStringField
      FieldName = 'Cattle_ID'
      Size = 25
    end
    object qVersInentInfoType: TWideStringField
      FieldName = 'Type'
      Size = 25
    end
    object qVersInentInfoDose: TWideStringField
      FieldName = 'Dose'
      Size = 6
    end
    object qVersInentInfoReason: TWideStringField
      FieldName = 'Reason'
      Size = 50
    end
  end
  object qKoeiMelkKwalInfoDag: TADOQuery
    Connection = database
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'day'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM cowmelkkwaliteit'
      'WHERE koei_id = :id'
      'AND dates = :day;')
    Left = 472
    Top = 488
    object qKoeiMelkKwalInfoDagDates: TDateTimeField
      FieldName = 'Dates'
    end
    object qKoeiMelkKwalInfoDagKoei_ID: TWideStringField
      FieldName = 'Koei_ID'
      Size = 25
    end
    object qKoeiMelkKwalInfoDagBotter_Vet: TWideStringField
      FieldName = 'Botter_Vet'
      Size = 10
    end
    object qKoeiMelkKwalInfoDagProteine: TWideStringField
      FieldName = 'Proteine'
      Size = 10
    end
    object qKoeiMelkKwalInfoDagSel_Telling: TWideStringField
      FieldName = 'Sel_Telling'
      Size = 10
    end
  end
  object qDroog_Waarskuwing: TADOQuery
    Connection = database
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'vandag'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'later'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT*'
      'FROM dekking'
      'WHERE droog_datum >= :vandag'
      'AND droog_datum <= :later'
      'AND status = '#39'gedek'#39';')
    Left = 216
    Top = 152
    object qDroog_WaarskuwingDek_Datum: TDateTimeField
      FieldName = 'Dek_Datum'
    end
    object qDroog_WaarskuwingKoei_ID: TWideStringField
      FieldName = 'Koei_ID'
      Size = 25
    end
    object qDroog_WaarskuwingBul_ID: TWideStringField
      FieldName = 'Bul_ID'
      Size = 25
    end
    object qDroog_WaarskuwingDroog_Datum: TDateTimeField
      FieldName = 'Droog_Datum'
    end
    object qDroog_WaarskuwingKalf_Datum: TDateTimeField
      FieldName = 'Kalf_Datum'
    end
    object qDroog_WaarskuwingStatus: TWideStringField
      FieldName = 'Status'
      Size = 10
    end
  end
  object qKalf_Waarskuwing: TADOQuery
    Connection = database
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'vandag'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'later'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT*'
      'FROM dekking'
      'WHERE kalf_datum >= :vandag'
      'AND kalf_datum <= :later'
      'AND status = '#39'gedek'#39';')
    Left = 328
    Top = 152
    object qKalf_WaarskuwingDek_Datum: TDateTimeField
      FieldName = 'Dek_Datum'
    end
    object qKalf_WaarskuwingKoei_ID: TWideStringField
      FieldName = 'Koei_ID'
      Size = 25
    end
    object qKalf_WaarskuwingBul_ID: TWideStringField
      FieldName = 'Bul_ID'
      Size = 25
    end
    object qKalf_WaarskuwingDroog_Datum: TDateTimeField
      FieldName = 'Droog_Datum'
    end
    object qKalf_WaarskuwingKalf_Datum: TDateTimeField
      FieldName = 'Kalf_Datum'
    end
    object qKalf_WaarskuwingStatus: TWideStringField
      FieldName = 'Status'
      Size = 10
    end
  end
end
