/****Server*******************/
USE [LISSyncDB]
GO

/****** Object:  Table [dbo].[VLSummary_synced]    Script Date: 11/15/2018 14:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VLSummary_synced](
	[Id] [uniqueidentifier] NULL,
	[last_change_datetime] [datetime] NULL,
	[synced] [bit] NULL,
	[LabCode] [nvarchar](50) NULL
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[EIDSummary_synced]    Script Date: 11/15/2018 14:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EIDSummary_synced](
	[Id] [uniqueidentifier] NULL,
	[last_change_datetime] [datetime] NULL,
	[synced] [bit] NULL,
	[LabCode] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EIDSummary]    Script Date: 11/15/2018 14:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EIDSummary](
	[Id] [uniqueidentifier] NOT NULL,
	[PatientCode] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[DateOfBirth] [datetime] NULL,
	[Sex] [nvarchar](20) NULL,
	[MorGFirstName] [nvarchar](50) NULL,
	[MorGMiddleName] [nvarchar](50) NULL,
	[MorGSurname] [nvarchar](50) NULL,
	[MorGTelNumber] [nvarchar](50) NULL,
	[MorGResidingRegionState] [nvarchar](50) NULL,
	[MorGResidingGTownShip] [nvarchar](50) NULL,
	[PatientType] [nvarchar](50) NULL,
	[PMTCTCode] [nvarchar](50) NULL,
	[BatchNumber] [nvarchar](50) NULL,
	[FacilityId] [int] NULL,
	[Age] [int] NULL,
	[ageinweeks] [int] NULL,
	[ReasonTest] [nvarchar](50) NULL,
	[SpecimenType] [nvarchar](50) NULL,
	[PreviousLabNumber] [nvarchar](50) NULL,
	[NameOfNurseOrHEOCollectingDBS] [nvarchar](50) NULL,
	[MotherHIVStatus] [nvarchar](50) NULL,
	[FatherHIVStatus] [nvarchar](50) NULL,
	[ModeOfDelivery] [nvarchar](50) NULL,
	[MotherARVStatus] [nvarchar](50) NULL,
	[IfARVStatusOnWeekStarted] [nvarchar](50) NULL,
	[DifficultBirth] [nvarchar](50) NULL,
	[VillageBirth] [nvarchar](50) NULL,
	[MotherARVRegimen] [nvarchar](50) NULL,
	[TimingIfMotherARVRegimenOther] [nvarchar](50) NULL,
	[InfantARVStatus] [nvarchar](50) NULL,
	[TimingIfInfantARVSatusOther] [nvarchar](50) NULL,
	[ExclusiveBreastFeeding] [nvarchar](50) NULL,
	[ExclusiveReplacementFeeding] [nvarchar](50) NULL,
	[IfReplacementYesAgeAtWean] [nvarchar](50) NULL,
	[MixedFeeding] [nvarchar](50) NULL,
	[BreastFeedingUnknown] [nvarchar](50) NULL,
	[Agewhenlastbreastfed] [int] NULL,
	[AnyPriorHIVTestResult] [nvarchar](50) NULL,
	[PriorHIVTestResult] [nvarchar](50) NULL,
	[PriorHIVTestDate] [datetime] NULL,
	[PriorTestType] [nvarchar](50) NULL,
	[RequestFormCreatedDate] [datetime] NULL,
	[RequestFormUpdatedDate] [datetime] NULL,
	[LabNumber] [nvarchar](50) NULL,
	[RecievedDate] [datetime] NULL,
	[SampleCollectedDate] [datetime] NULL,
	[SampleShipmentDate] [datetime] NULL,
	[RegistrationDate] [datetime] NULL,
	[DBSSpecimenQuality] [nvarchar](50) NULL,
	[RejectedReasonId] [int] NULL,
	[SpecimenCreatedDate] [datetime] NULL,
	[SpecimenUpdateDate] [datetime] NULL,
	[FirstTestDate] [datetime] NULL,
	[FirstTestResult] [nvarchar](50) NULL,
	[RepeatTest] [bit] NULL,
	[RepeatReason] [nvarchar](300) NULL,
	[SecondTestResult] [nvarchar](50) NULL,
	[SecondTestDate] [datetime] NULL,
	[RepeatSecondTest] [bit] NULL,
	[RepeatReasonSecondTest] [nvarchar](300) NULL,
	[ThirdTestResult] [nvarchar](50) NULL,
	[ThirdTestDate] [datetime] NULL,
	[FinalReportResult] [nvarchar](50) NULL,
	[FinalReportDate] [datetime] NULL,
	[SecondDBSRequired] [nvarchar](50) NULL,
	[FirstTestAbsorbanceValue] [float] NULL,
	[SecondTestAbsorbanceValue] [float] NULL,
	[ThirdTestAbsorbanceValue] [float] NULL,
	[Comment] [nvarchar](50) NULL,
	[TestedBy] [nvarchar](50) NULL,
	[ResultCreatedDate] [datetime] NULL,
	[ResultUpdatedDate] [datetime] NULL,
	[LabInstrumentname] [nvarchar](50) NULL,
	[LabInstrumentId] [int] NULL,
	[StatusId] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[DateChanged] [datetime] NULL,
	[Lab] [nvarchar](50) NULL,
	[LabCode] [nvarchar](50) NULL,
	[ResultApprovedBy] [nvarchar](50) NULL,
	[RequestId] [int] NULL,
	[SpecimenId] [int] NULL,
	[SpecimenResultId] [int] NULL,
	[DataElement1] [nvarchar](50) NULL,
	[DataElement2] [nvarchar](50) NULL,
	[DataElement3] [nvarchar](50) NULL,
	[DataElement4] [nvarchar](50) NULL,
	[DataElement5] [nvarchar](50) NULL,
	[DataElement6] [nvarchar](50) NULL,
	[DataElement7] [nvarchar](50) NULL,
 CONSTRAINT [PK_EIDSummery_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VLSummary]    Script Date: 11/15/2018 14:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VLSummary](
	[Id] [uniqueidentifier] NOT NULL,
	[Fullname] [nvarchar](50) NULL,
	[PatientCode] [nvarchar](50) NULL,
	[PatientType] [nvarchar](50) NULL,
	[ARTNumber] [nvarchar](50) NULL,
	[Sex] [nvarchar](10) NULL,
	[DateOfBirth] [datetime] NULL,
	[ResidingRegionState] [int] NULL,
	[ResidingGTownShip] [int] NULL,
	[RegistrationNo] [nvarchar](100) NULL,
	[BatchNumber] [nvarchar](50) NULL,
	[FacilitytId] [int] NULL,
	[Age] [int] NULL,
	[Age_Month] [int] NULL,
	[CurrentRegimen] [nvarchar](50) NULL,
	[ARVRegimen] [nvarchar](50) NULL,
	[ageinweeks] [int] NULL,
	[ReasonTestId] [int] NULL,
	[ReasonfortestOther] [nvarchar](100) NULL,
	[SpecimenTypeId] [int] NULL,
	[PreviousLabNumber] [nvarchar](50) NULL,
	[NameOfNurseOrHEOCollectingDBS] [nvarchar](100) NULL,
	[Adherence] [nvarchar](200) NULL,
	[PrevVLcopiesml] [decimal](18, 2) NULL,
	[PrevVLLog] [decimal](18, 2) NULL,
	[Mostrecentviralload] [decimal](18, 2) NULL,
	[MostrecentviralloadLog] [decimal](18, 2) NULL,
	[Mostrecentviralloadresult] [nvarchar](50) NULL,
	[Daterecentviralload] [datetime] NULL,
	[BaselineCD4count] [int] NULL,
	[MostrecentCD4count] [int] NULL,
	[DateCD4Test] [datetime] NULL,
	[Patientontherapy] [bit] NULL,
	[ARTStaringDate] [datetime] NULL,
	[SecondLineARTStartingDate] [datetime] NULL,
	[Patientevertherapy] [bit] NULL,
	[SampleStored] [bit] NULL,
	[Temperature] [decimal](18, 2) NULL,
	[Duration] [nvarchar](50) NULL,
	[RequestCreatedDate] [datetime] NULL,
	[RequestUpdatedDate] [datetime] NULL,
	[LabNumber] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[RecievedDate] [datetime] NULL,
	[SampleCollectedDate] [datetime] NULL,
	[SampleShipmentDate] [datetime] NULL,
	[specimencollectionTime] [nvarchar](50) NULL,
	[RegistrationDate] [datetime] NULL,
	[SpecimenQuality] [nvarchar](50) NULL,
	[RejectedReasonId] [int] NULL,
	[FinalReportResult] [nvarchar](50) NULL,
	[FinalReportDate] [datetime] NULL,
	[Comment] [nvarchar](50) NULL,
	[Copies_ml] [decimal](18, 2) NULL,
	[LogCopies] [decimal](18, 2) NULL,
	[ResultCreatedDate] [datetime] NULL,
	[ResultUpdatedDate] [datetime] NULL,
	[Reasonfortest] [nvarchar](50) NULL,
	[LabInstrumentname] [nvarchar](50) NULL,
	[LabInstrumentId] [int] NULL,
	[ResultCreatedBy] [nvarchar](100) NULL,
	[ResultApprovedBy] [nvarchar](100) NULL,
	[TestedBy] [nvarchar](50) NULL,
	[StatusId] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[DateChanged] [datetime] NULL,
	[Lab] [nvarchar](50) NULL,
	[LabCode] [nvarchar](50) NULL,
	[Treatment] [nvarchar](max) NULL,
	[Drug] [nvarchar](max) NULL,
	[RequestId] [int] NULL,
	[SpecimenId] [int] NULL,
	[SpecimenResultId] [int] NULL,
	[PatientId] [int] NULL,
	[DataElement1] [nvarchar](50) NULL,
	[DataElement2] [nvarchar](50) NULL,
	[DataElement3] [nvarchar](50) NULL,
	[DataElement4] [nvarchar](50) NULL,
	[DataElement5] [nvarchar](50) NULL,
	[DataElement6] [nvarchar](50) NULL,
	[DataElement7] [nvarchar](50) NULL,
 CONSTRAINT [PK_VLSummery_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SendVLData]    Script Date: 11/15/2018 14:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SendVLData]
AS
BEGIN

DECLARE  @id uniqueidentifier;

DECLARE @VLSummary_synced TABLE ([Id] uniqueidentifier ,
								[last_change_datetime] datetime ,
								[synced] bit ,
								[LabCode] nvarchar(50))
							
Insert @VLSummary_synced ([Id],[last_change_datetime],[synced],[LabCode])
Select [Id],[last_change_datetime],[synced],[LabCode] from [LISSyncDB].dbo.VLSummary_synced where synced = 0;

DECLARE @MyCursor CURSOR;
DECLARE @RequestFormId int;

BEGIN
SET @MyCursor = CURSOR FOR
    select [Id] from @VLSummary_synced     

    OPEN @MyCursor 
    FETCH NEXT FROM @MyCursor 
    INTO @id

    WHILE @@FETCH_STATUS = 0
    BEGIN    
        DECLARE  @VLRequestSampleId bigint=0;
		DECLARE  @PatientId bigint=0;
		DECLARE  @VLARTNumber nvarchar (20)='';
		DECLARE  @VLPatientCode nvarchar(20)='';
		DECLARE  @VLLabNumber nvarchar(50)='';
		DECLARE  @LabCode nvarchar(50)='';
		
		Select @VLARTNumber=ARTNumber , @VLPatientCode=PatientCode,@id=Id , @VLLabNumber =LabNumber,@LabCode= LabCode FROM [LISSyncDB].dbo.VLSummary where Id=@id;
		
		IF (@VLARTNumber <> '')
		  Begin 
				  Select @PatientId= isnull(Id,0) from [LISDashboard].[dbo].[VLPatients] where VLPatients.ARTNumber  = @VLARTNumber 
				 				 
				  Select @VLRequestSampleId= isnull(Id,0) from [LISDashboard].[dbo].[VLRequestSamples] where 
				  VLRequestSamples.ARTNumber  = @VLARTNumber and VLRequestSamples.LabNumber  = @VLLabNumber 
				  and  VLRequestSamples.LabCode  =  @LabCode  
				   
				 IF  (@PatientId >  0)
				 Begin
				   UPDATE  [LISDashboard].[dbo].[VLPatients] 
					 SET  [Fullname] = I.Fullname     
						  ,[PatientType] =I.PatientType     
						  ,[Sex] = I.Sex
						  ,[DateOfBirth] = I.DateOfBirth
						  ,[ResidingRegionState] = I.ResidingRegionState
						  ,[ResidingGTownShip] = I.ResidingGTownShip
						  ,[Facilityt_Id] = I.FacilitytId FROM  (select * from VLSummary where Id=@id) I WHERE  [LISDashboard].[dbo].[VLPatients].Id = @PatientId
				 end
				 ELSE
				 Begin
						  INSERT INTO [LISDashboard].[dbo].[VLPatients]
							   (
							   [Fullname]
							   ,[PatientCode]
							   ,[PatientType]
							   ,[ARTNumber]
							   ,[Sex]
							   ,[DateOfBirth]
							   ,[ResidingRegionState]
							   ,[ResidingGTownShip]
							   ,[Facilityt_Id]           
							   ,[LabCode])         
					          
						  Select
								I.Fullname
							   ,I.PatientCode
							   ,I.PatientType
							   ,I.ARTNumber
							   ,I.Sex
							   ,I.DateOfBirth
							   ,I.ResidingRegionState
							   ,I.ResidingGTownShip
							   ,I.FacilitytId
							   ,I.LabCode
								FROM VLSummary I where Id=@id;							
								
						 select @PatientId =MAX(id) from [LISDashboard].[dbo].[VLPatients];
				 END
				 
				 IF  (@VLRequestSampleId >  0) 
				 Begin
					 UPDATE  [LISDashboard].[dbo].[VLRequestSamples] 
					 SET 
						BatchNumber=I.BatchNumber,
						Facilityt_Id=I.FacilitytId,
						RegistrationNo=I.RegistrationNo,
						Age=I.Age,
						Age_Month=I.Age_Month,
						CurrentRegimen=I.CurrentRegimen,
						ARVRegimen=I.ARVRegimen,
						ageinweeks=I.ageinweeks,
						ReasonTestId=I.ReasonTestId,
						ReasonfortestOther=I.ReasonfortestOther,
						SpecimenType_Id=I.SpecimenTypeId,
						PreviousLabNumber=I.PreviousLabNumber,
						NameOfNurseOrHEOCollectingDBS=I.NameOfNurseOrHEOCollectingDBS,
						Adherence=I.Adherence,
						PrevVLcopiesml=I.PrevVLcopiesml,
						PrevVLLog=I.PrevVLLog,
						Mostrecentviralload=I.Mostrecentviralload,
						MostrecentviralloadLog=I.MostrecentviralloadLog,
						Mostrecentviralloadresult=I.Mostrecentviralloadresult,
						Daterecentviralload=I.Daterecentviralload,
						BaselineCD4count=I.BaselineCD4count,
						MostrecentCD4count=I.MostrecentCD4count,
						DateCD4Test=I.DateCD4Test,
						Patientontherapy=I.Patientontherapy,
						ARTStaringDate=I.ARTStaringDate,
						SecondLineARTStartingDate=I.SecondLineARTStartingDate,
						Patientevertherapy=I.Patientevertherapy,
						SampleStored=I.SampleStored,
						Temperature=I.Temperature,
						Duration=I.Duration,
						RequestCreatedDate=I.RequestCreatedDate,
						RequestUpdatedDate=I.RequestUpdatedDate,		
						CreatedDate=I.CreatedDate,
						RecievedDate=I.RecievedDate,
						SampleCollectedDate=I.SampleCollectedDate,
						SampleShipmentDate=I.SampleShipmentDate,
						specimencollectionTime=I.specimencollectionTime,
						RegistrationDate=I.RegistrationDate,
						SpecimenQuality=I.SpecimenQuality,
						RejectedReason_Id=I.RejectedReasonId,
						FinalReportResult=I.FinalReportResult,
						FinalReportDate=I.FinalReportDate,
						Comment=I.Comment,
						Copies_ml=I.Copies_ml,
						LogCopies=I.LogCopies,
						ResultCreatedDate=I.ResultCreatedDate,
						ResultUpdatedDate=I.ResultUpdatedDate,
						Reasonfortest=I.Reasonfortest,
						LabInstrumentname=I.LabInstrumentname,
						LabInstrument_Id=I.LabInstrumentId,
						ResultCreatedBy=I.ResultCreatedBy,
						ResultApprovedBy=I.ResultApprovedBy,
						TestedBy=I.TestedBy,
						StatusId=I.StatusId,
						Status=I.Status,
						DateChanged=I.DateChanged,
						Lab=I.Lab,	
						Treatment=I.Treatment,
						Drug=I.Drug
						FROM  (select * from VLSummary where Id=@id) I WHERE [LISDashboard].[dbo].[VLRequestSamples].Id = @VLRequestSampleId
				 End
				ELSE
				Begin
					INSERT INTO [LISDashboard].[dbo].[VLRequestSamples]
						   (VLPatient_Id,
							BatchNumber,
							Facilityt_Id,
							RegistrationNo,
							ARTNumber,
							PatientCode,
							Age,
							Age_Month,
							CurrentRegimen,
							ARVRegimen,
							ageinweeks,
							ReasonTestId,
							ReasonfortestOther,
							SpecimenType_Id,
							PreviousLabNumber,
							NameOfNurseOrHEOCollectingDBS,
							Adherence,
							PrevVLcopiesml,
							PrevVLLog,
							Mostrecentviralload,
							MostrecentviralloadLog,
							Mostrecentviralloadresult,
							Daterecentviralload,
							BaselineCD4count,
							MostrecentCD4count,
							DateCD4Test,
							Patientontherapy,
							ARTStaringDate,
							SecondLineARTStartingDate,
							Patientevertherapy,
							SampleStored,
							Temperature,
							Duration,
							RequestCreatedDate,
							RequestUpdatedDate,
							LabNumber,
							CreatedDate,
							RecievedDate,
							SampleCollectedDate,
							SampleShipmentDate,
							specimencollectionTime,
							RegistrationDate,
							SpecimenQuality,
							RejectedReason_Id,
							FinalReportResult,
							FinalReportDate,
							Comment,
							Copies_ml,
							LogCopies,
							ResultCreatedDate,
							ResultUpdatedDate,
							Reasonfortest,
							LabInstrumentname,
							LabInstrument_Id,
							ResultCreatedBy,
							ResultApprovedBy,
							TestedBy,
							StatusId,
							Status,
							DateChanged,
							Lab,
							LabCode,
							Treatment,
							Drug)
				          
					  Select
				           
							 @PatientId,
							I.BatchNumber,
							I.FacilitytId,
							I.RegistrationNo,
							I.ARTNumber,
							I.PatientCode,
							I.Age,
							I.Age_Month,
							I.CurrentRegimen,
							I.ARVRegimen,
							I.ageinweeks,
							I.ReasonTestId,
							I.ReasonfortestOther,
							I.SpecimenTypeId,
							I.PreviousLabNumber,
							I.NameOfNurseOrHEOCollectingDBS,
							I.Adherence,
							I.PrevVLcopiesml,
							I.PrevVLLog,
							I.Mostrecentviralload,
							I.MostrecentviralloadLog,
							I.Mostrecentviralloadresult,
							I.Daterecentviralload,
							I.BaselineCD4count,
							I.MostrecentCD4count,
							I.DateCD4Test,
							I.Patientontherapy,
							I.ARTStaringDate,
							I.SecondLineARTStartingDate,
							I.Patientevertherapy,
							I.SampleStored,
							I.Temperature,
							I.Duration,
							I.RequestCreatedDate,
							I.RequestUpdatedDate,
							I.LabNumber,
							I.CreatedDate,
							I.RecievedDate,
							I.SampleCollectedDate,
							I.SampleShipmentDate,
							I.specimencollectionTime,
							I.RegistrationDate,
							I.SpecimenQuality,
							I.RejectedReasonId,
							I.FinalReportResult,
							I.FinalReportDate,
							I.Comment,
							I.Copies_ml,
							I.LogCopies,
							I.ResultCreatedDate,
							I.ResultUpdatedDate,
							I.Reasonfortest,
							I.LabInstrumentname,
							I.LabInstrumentId,
							I.ResultCreatedBy,
							I.ResultApprovedBy,
							I.TestedBy,
							I.StatusId,
							I.Status,
							I.DateChanged,
							I.Lab,
							I.LabCode,
							I.Treatment,
							I.Drug           
						  FROM VLSummary I where Id=@id;
				End
		  Update VLSummary_synced set synced=1,last_change_datetime=GETDATE() where Id=@id;
		  
		  End
  		      
		FETCH NEXT FROM @MyCursor 
    INTO @id
    END
   
    CLOSE @MyCursor ;
    DEALLOCATE @MyCursor;
END

END
GO
/****** Object:  StoredProcedure [dbo].[SendEIDData]    Script Date: 11/15/2018 14:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SendEIDData]
AS
BEGIN

DECLARE  @id uniqueidentifier;

DECLARE @EIDSummary_synced TABLE ([Id] uniqueidentifier ,
								[last_change_datetime] datetime ,
								[synced] bit ,
								[LabCode] nvarchar(50))
							
Insert @EIDSummary_synced ([Id],[last_change_datetime],[synced],[LabCode])
Select [Id],[last_change_datetime],[synced],[LabCode] from [LISSyncDB].dbo.EIDSummary_synced where synced = 0;

DECLARE @MyCursor CURSOR;
DECLARE @RequestFormId int;

BEGIN
SET @MyCursor = CURSOR FOR
    select [Id] from @EIDSummary_synced     

    OPEN @MyCursor 
    FETCH NEXT FROM @MyCursor 
    INTO @id

    WHILE @@FETCH_STATUS = 0
    BEGIN    
        DECLARE  @RequestSampleId  bigint=0;
		DECLARE  @PatientId bigint=0;
		DECLARE  @DateOfBirth datetime;
		DECLARE  @FirstName nvarchar(20)='';
		DECLARE  @Sex nvarchar(50)='';
		DECLARE  @LabNumber nvarchar(50)='';
		DECLARE  @LabCode nvarchar(50)='';
				
		Select @DateOfBirth=DateOfBirth, @FirstName=FirstName,@Sex=Sex, @LabNumber =LabNumber, @LabCode= LabCode FROM 
		[LISSyncDB].dbo.EIDSummary where Id=@id;
		
		IF (@DateOfBirth <> '' and @FirstName <> '' and @Sex <> '' )
		  Begin 
				  Select @PatientId= isnull(Id,0) from [LISDashboard].[dbo].[Patients] where Patients.DateOfBirth  = @DateOfBirth 
				  and Patients.FirstName=@FirstName and Patients.Sex=@Sex				 				 
				  
				  Select @RequestSampleId = isnull(Id,0) from [LISDashboard].[dbo].[RequestSamples] where 
				  RequestSamples.Patient_Id  = @PatientId and RequestSamples.LabNumber  = @LabNumber 
				  and  RequestSamples.LabCode  =  @LabCode  
				   
				 IF  (@PatientId >  0)
				 Begin
				   UPDATE  [LISDashboard].[dbo].[Patients] 
					 SET	
							PatientCode = I.PatientCode,							
							MiddleName = I.MiddleName,
							Surname = I.Surname,					
							MorGFirstName = I.MorGFirstName,
							MorGMiddleName = I.MorGMiddleName,
							MorGSurname = I.MorGSurname,
							MorGTelNumber = I.MorGTelNumber,
							MorGResidingRegionState = I.MorGResidingRegionState,
							MorGResidingGTownShip = I.MorGResidingGTownShip,
							PatientType = I.PatientType,
							PMTCTCode = I.PMTCTCode,
							Facility_Id = I.FacilityId,
							LabCode = I.LabCode
							FROM  (select * from EIDSummary where Id=@id) I WHERE  [LISDashboard].[dbo].[Patients].Id = @PatientId
					
				 end
				 ELSE
				 Begin
						  INSERT INTO [LISDashboard].[dbo].[Patients]
							   (
								PatientCode ,
								FirstName ,
								MiddleName ,
								Surname ,
								DateOfBirth ,
								Sex ,
								MorGFirstName ,
								MorGMiddleName ,
								MorGSurname ,
								MorGTelNumber ,
								MorGResidingRegionState ,
								MorGResidingGTownShip ,
								PatientType ,
								PMTCTCode ,
								Facility_Id ,
								LabCode)         
					          
						  Select
								PatientCode,
								FirstName,
								MiddleName,
								Surname,
								DateOfBirth,
								Sex,
								MorGFirstName,
								MorGMiddleName,
								MorGSurname,
								MorGTelNumber,
								MorGResidingRegionState,
								MorGResidingGTownShip,
								PatientType,
								PMTCTCode,
								FacilityId,
								LabCode
								FROM EIDSummary I where Id=@id;							
								
						 select @PatientId =MAX(id) from [LISDashboard].[dbo].[Patients];
				 END
				 
				 IF  (@RequestSampleId >  0) 
				 Begin
					 UPDATE  [LISDashboard].[dbo].[RequestSamples] 
					 SET 
							PMTCTCode=I.PMTCTCode,
							BatchNumber=I.BatchNumber,
							Facility_Id=I.FacilityId,
							Age=I.Age,
							ageinweeks=I.ageinweeks,
							ReasonTest=I.ReasonTest,
							SpecimenType=I.SpecimenType,
							PreviousLabNumber=I.PreviousLabNumber,
							NameOfNurseOrHEOCollectingDBS=I.NameOfNurseOrHEOCollectingDBS,
							MotherHIVStatus=I.MotherHIVStatus,
							FatherHIVStatus=I.FatherHIVStatus,
							ModeOfDelivery=I.ModeOfDelivery,
							MotherARVStatus=I.MotherARVStatus,
							IfARVStatusOnWeekStarted=I.IfARVStatusOnWeekStarted,
							DifficultBirth=I.DifficultBirth,
							VillageBirth=I.VillageBirth,
							MotherARVRegimen=I.MotherARVRegimen,
							TimingIfMotherARVRegimenOther=I.TimingIfMotherARVRegimenOther,
							InfantARVStatus=I.InfantARVStatus,
							TimingIfInfantARVSatusOther=I.TimingIfInfantARVSatusOther,
							ExclusiveBreastFeeding=I.ExclusiveBreastFeeding,
							ExclusiveReplacementFeeding=I.ExclusiveReplacementFeeding,
							IfReplacementYesAgeAtWean=I.IfReplacementYesAgeAtWean,
							MixedFeeding=I.MixedFeeding,
							BreastFeedingUnknown=I.BreastFeedingUnknown,
							Agewhenlastbreastfed=I.Agewhenlastbreastfed,
							AnyPriorHIVTestResult=I.AnyPriorHIVTestResult,
							PriorHIVTestResult=I.PriorHIVTestResult,
							PriorHIVTestDate=I.PriorHIVTestDate,
							PriorTestType=I.PriorTestType,
							RequestFormCreatedDate=I.RequestFormCreatedDate,
							RequestFormUpdatedDate=I.RequestFormUpdatedDate,
							LabNumber=I.LabNumber,
							RecievedDate=I.RecievedDate,
							SampleCollectedDate=I.SampleCollectedDate,
							SampleShipmentDate=I.SampleShipmentDate,
							RegistrationDate=I.RegistrationDate,
							DBSSpecimenQuality=I.DBSSpecimenQuality,
							RejectedReason_Id=I.RejectedReasonId,
							SpecimenCreatedDate=I.SpecimenCreatedDate,
							SpecimenUpdateDate=I.SpecimenUpdateDate,
							FirstTestDate=I.FirstTestDate,
							FirstTestResult=I.FirstTestResult,
							RepeatTest=I.RepeatTest,
							RepeatReason=I.RepeatReason,
							SecondTestResult=I.SecondTestResult,
							SecondTestDate=I.SecondTestDate,
							RepeatSecondTest=I.RepeatSecondTest,
							RepeatReasonSecondTest=I.RepeatReasonSecondTest,
							ThirdTestResult=I.ThirdTestResult,
							ThirdTestDate=I.ThirdTestDate,
							FinalReportResult=I.FinalReportResult,
							FinalReportDate=I.FinalReportDate,
							SecondDBSRequired=I.SecondDBSRequired,
							FirstTestAbsorbanceValue=I.FirstTestAbsorbanceValue,
							SecondTestAbsorbanceValue=I.SecondTestAbsorbanceValue,
							ThirdTestAbsorbanceValue=I.ThirdTestAbsorbanceValue,
							Comment=I.Comment,
							TestedBy=I.TestedBy,
							ResultCreatedDate=I.ResultCreatedDate,
							ResultUpdatedDate=I.ResultUpdatedDate,
							LabInstrumentname=I.LabInstrumentname,
							LabInstrument_Id=I.LabInstrumentId,
							StatusId=I.StatusId,
							Status=I.Status,
							DateChanged=I.DateChanged,
							Lab=I.Lab,
							LabCode=I.LabCode,
							ResultApprovedBy=I.ResultApprovedBy
						FROM  (select * from EIDSummary where Id=@id) I WHERE [LISDashboard].[dbo].[RequestSamples].Id = @RequestSampleid
				 End
				ELSE
				Begin
					INSERT INTO [LISDashboard].[dbo].[RequestSamples]
						   (
							Patient_Id,
							PMTCTCode,
							BatchNumber,
							Facility_Id,
							Age,
							ageinweeks,
							ReasonTest,
							SpecimenType,
							PreviousLabNumber,
							NameOfNurseOrHEOCollectingDBS,
							MotherHIVStatus,
							FatherHIVStatus,
							ModeOfDelivery,
							MotherARVStatus,
							IfARVStatusOnWeekStarted,
							DifficultBirth,
							VillageBirth,
							MotherARVRegimen,
							TimingIfMotherARVRegimenOther,
							InfantARVStatus,
							TimingIfInfantARVSatusOther,
							ExclusiveBreastFeeding,
							ExclusiveReplacementFeeding,
							IfReplacementYesAgeAtWean,
							MixedFeeding,
							BreastFeedingUnknown,
							Agewhenlastbreastfed,
							AnyPriorHIVTestResult,
							PriorHIVTestResult,
							PriorHIVTestDate,
							PriorTestType,
							RequestFormCreatedDate,
							RequestFormUpdatedDate,
							LabNumber,
							RecievedDate,
							SampleCollectedDate,
							SampleShipmentDate,
							RegistrationDate,
							DBSSpecimenQuality,
							RejectedReason_Id,
							SpecimenCreatedDate,
							SpecimenUpdateDate,
							FirstTestDate,
							FirstTestResult,
							RepeatTest,
							RepeatReason,
							SecondTestResult,
							SecondTestDate,
							RepeatSecondTest,
							RepeatReasonSecondTest,
							ThirdTestResult,
							ThirdTestDate,
							FinalReportResult,
							FinalReportDate,
							SecondDBSRequired,
							FirstTestAbsorbanceValue,
							SecondTestAbsorbanceValue,
							ThirdTestAbsorbanceValue,
							Comment,
							TestedBy,
							ResultCreatedDate,
							ResultUpdatedDate,
							LabInstrumentname,
							LabInstrument_Id,
							StatusId,
							Status,
							DateChanged,
							Lab,
							LabCode,
							ResultApprovedBy)
				          
					  Select
				           
							 @PatientId,
							PMTCTCode,
							BatchNumber,
							FacilityId,
							Age,
							ageinweeks,
							ReasonTest,
							SpecimenType,
							PreviousLabNumber,
							NameOfNurseOrHEOCollectingDBS,
							MotherHIVStatus,
							FatherHIVStatus,
							ModeOfDelivery,
							MotherARVStatus,
							IfARVStatusOnWeekStarted,
							DifficultBirth,
							VillageBirth,
							MotherARVRegimen,
							TimingIfMotherARVRegimenOther,
							InfantARVStatus,
							TimingIfInfantARVSatusOther,
							ExclusiveBreastFeeding,
							ExclusiveReplacementFeeding,
							IfReplacementYesAgeAtWean,
							MixedFeeding,
							BreastFeedingUnknown,
							Agewhenlastbreastfed,
							AnyPriorHIVTestResult,
							PriorHIVTestResult,
							PriorHIVTestDate,
							PriorTestType,
							RequestFormCreatedDate,
							RequestFormUpdatedDate,
							LabNumber,
							RecievedDate,
							SampleCollectedDate,
							SampleShipmentDate,
							RegistrationDate,
							DBSSpecimenQuality,
							RejectedReasonId,
							SpecimenCreatedDate,
							SpecimenUpdateDate,
							FirstTestDate,
							FirstTestResult,
							RepeatTest,
							RepeatReason,
							SecondTestResult,
							SecondTestDate,
							RepeatSecondTest,
							RepeatReasonSecondTest,
							ThirdTestResult,
							ThirdTestDate,
							FinalReportResult,
							FinalReportDate,
							SecondDBSRequired,
							FirstTestAbsorbanceValue,
							SecondTestAbsorbanceValue,
							ThirdTestAbsorbanceValue,
							Comment,
							TestedBy,
							ResultCreatedDate,
							ResultUpdatedDate,
							LabInstrumentname,
							LabInstrumentId,
							StatusId,
							Status,
							DateChanged,
							Lab,
							LabCode,
							ResultApprovedBy          
						  FROM EIDSummary I where Id=@id;
				End
		  Update EIDSummary_synced set synced=1,last_change_datetime=GETDATE() where Id=@id;
		  
		  End
  		      
		FETCH NEXT FROM @MyCursor 
    INTO @id
    END
   
    CLOSE @MyCursor ;
    DEALLOCATE @MyCursor;
END

END
GO
