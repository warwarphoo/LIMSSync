USE [LISSyncDB]
GO
/****** Object:  StoredProcedure [dbo].[SendData]    Script Date: 11/08/2018 13:17:06 ******/
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
		  Update EIDSummary_synced set synced=1 where Id=@id;
		  
		  End
  		      
		FETCH NEXT FROM @MyCursor 
    INTO @id
    END
   
    CLOSE @MyCursor ;
    DEALLOCATE @MyCursor;
END

END