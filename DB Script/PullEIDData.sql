USE [Union]
GO
/****** Object:  StoredProcedure [dbo].[PullEIDData]    Script Date: 11/12/2018 16:33:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PullEIDData]      
@SpecimenId int      
AS
INSERT INTO [LISSyncDB].[dbo].[EIDSummary]
           ([Id]
           ,[PatientCode]
           ,[FirstName]
           ,[MiddleName]
           ,[Surname]
           ,[DateOfBirth]
           ,[Sex]
           ,[MorGFirstName]
           ,[MorGMiddleName]
           ,[MorGSurname]
           ,[MorGTelNumber]
           ,[MorGResidingRegionState]
           ,[MorGResidingGTownShip]
           ,[PatientType]
           ,[PMTCTCode]
           ,[BatchNumber]
           ,[FacilityId]
           ,[Age]
           ,[ageinweeks]
           ,[ReasonTest]
           ,[SpecimenType]
           ,[PreviousLabNumber]
           ,[NameOfNurseOrHEOCollectingDBS]
           ,[MotherHIVStatus]
           ,[FatherHIVStatus]
           ,[ModeOfDelivery]
           ,[MotherARVStatus]
           ,[IfARVStatusOnWeekStarted]
           ,[DifficultBirth]
           ,[VillageBirth]
           ,[MotherARVRegimen]
           ,[TimingIfMotherARVRegimenOther]
           ,[InfantARVStatus]
           ,[TimingIfInfantARVSatusOther]
           ,[ExclusiveBreastFeeding]
           ,[ExclusiveReplacementFeeding]
           ,[IfReplacementYesAgeAtWean]
           ,[MixedFeeding]
           ,[BreastFeedingUnknown]
           ,[Agewhenlastbreastfed]
           ,[AnyPriorHIVTestResult]
           ,[PriorHIVTestResult]
           ,[PriorHIVTestDate]
           ,[PriorTestType]
           ,[RequestFormCreatedDate]
           ,[RequestFormUpdatedDate]
           ,[LabNumber]
           ,[RecievedDate]
           ,[SampleCollectedDate]
           ,[SampleShipmentDate]
           ,[RegistrationDate]
           ,[DBSSpecimenQuality]
           ,[RejectedReasonId]
           ,[SpecimenCreatedDate]
           ,[SpecimenUpdateDate]
           ,[FirstTestDate]
           ,[FirstTestResult]
           ,[RepeatTest]
           ,[RepeatReason]
           ,[SecondTestResult]
           ,[SecondTestDate]
           ,[RepeatSecondTest]
           ,[RepeatReasonSecondTest]
           ,[ThirdTestResult]
           ,[ThirdTestDate]
           ,[FinalReportResult]
           ,[FinalReportDate]
           ,[SecondDBSRequired]
           ,[FirstTestAbsorbanceValue]
           ,[SecondTestAbsorbanceValue]
           ,[ThirdTestAbsorbanceValue]
           ,[Comment]
           ,[TestedBy]
           ,[ResultCreatedDate]
           ,[ResultUpdatedDate]
           ,[LabInstrumentname]
           ,[LabInstrumentId]
           ,[StatusId]
           ,[Status]
           ,[DateChanged]
           ,[Lab]
           ,[LabCode]
           ,[ResultApprovedBy]
           ,[RequestId]
           ,[SpecimenId]
           ,[SpecimenResultId]
           )
     Select
			NEWID()
		   ,Patient.PatientCode
           ,Patient.FirstName
           ,Patient.MiddleName
           ,Patient.Surname
           ,Patient.DateOfBirth
           ,Patient.Sex
          ,Patient.MorGFirstName
           ,Patient.MorGMiddleName
           ,Patient.MorGSurname
           ,Patient.MorGTelNumber          
           ,Patient.MorGResidingRegionState
           ,patient.MorGResidingGTownShip
           ,Patient.PatientType
           ,Patient.PMTCTCode
           ,RequestForm.BatchNumber
           ,RequestForm.FacilityId           
           ,RequestForm.Age
           ,RequestForm.ageinweeks
           ,RequestForm.ReasonTest
           ,RequestForm.SpecimenType
           ,RequestForm.PreviousLabNumber
           ,RequestForm.NameOfNurseOrHEOCollectingDBS
           ,RequestForm.MotherHIVStatus
           ,RequestForm.FatherHIVStatus
           ,RequestForm.ModeOfDelivery
           ,RequestForm.MotherARVStatus
           ,RequestForm.IfARVStatusOnWeekStarted
           ,RequestForm.DifficultBirth
           ,RequestForm.VillageBirth
           ,RequestForm.MotherARVRegimen
           ,RequestForm.TimingIfMotherARVRegimenOther
           ,RequestForm.InfantARVStatus
           ,RequestForm.TimingIfInfantARVSatusOther
           ,RequestForm.ExclusiveBreastFeeding
           ,RequestForm.ExclusiveReplacementFeeding
           ,RequestForm.IfReplacementYesAgeAtWean
           ,RequestForm.MixedFeeding
           ,RequestForm.BreastFeedingUnknown
           ,RequestForm.Agewhenlastbreastfed
           ,RequestForm.AnyPriorHIVTestResult
           ,RequestForm.PriorHIVTestResult
           ,RequestForm.PriorHIVTestDate
           ,RequestForm.PriorTestType
           ,RequestForm.DateCreated
           ,RequestForm.DateUpdated
           ,Specimen.LabNumber
           ,Specimen.RecievedDate
           ,Specimen.SampleCollectedDate
           ,Specimen.SampleShipmentDate
           ,Specimen.RegistrationDate
           ,Specimen.DBSSpecimenQuality           
           ,RequestRejectedReason.RejectedReasonId
           ,Specimen.DateCreated
           ,Specimen.DateUpdated           
           ,SpecimenResult.FirstTestDate
           ,SpecimenResult.FirstTestResult
           ,SpecimenResult.RepeatTest
           ,SpecimenResult.RepeatReason
           ,SpecimenResult.SecondTestResult
           ,SpecimenResult.SecondTestDate
           ,SpecimenResult.RepeatSecondTest
           ,SpecimenResult.RepeatReasonSecondTest
           ,SpecimenResult.ThirdTestResult
           ,SpecimenResult.ThirdTestDate
           ,SpecimenResult.FinalReportResult
           ,SpecimenResult.FinalReportDate
           ,SpecimenResult.SecondDBSRequired
           ,SpecimenResult.FirstTestAbsorbanceValue
           ,SpecimenResult.SecondTestAbsorbanceValue
           ,SpecimenResult.ThirdTestAbsorbanceValue
           ,SpecimenResult.Comment
           ,SpecimenResult.TestedBy           
           ,SpecimenResult.DateCreated
           ,SpecimenResult.DateUpdated
           ,LabInstrument.LabInstrumentname           
           ,LabInstrument.ID
           ,Status.Id
           ,Status.Status
           ,Status.DateChanged
           ,(Select dbo.Laboratory.LaboratoryName from dbo.Laboratory)  as Lab
           ,(Select dbo.Laboratory.LabCode from dbo.Laboratory)  as LabCode
           ,(SpecimenResultUpdatedBy.FirstName  + '' + SpecimenResultUpdatedBy.LastName) AS ResultApprovedBy
           ,RequestForm.Id   
           ,Specimen.Id     
           ,SpecimenResult.Id
			
			From Patient left JOIN
			RequestForm on Patient.Id = RequestForm.PatientId left JOIN
			RequestRejectedReason on RequestForm.Id=RequestRejectedReason.RequestId left JOIN
			Specimen on RequestForm.Id = Specimen.RequestId left JOIN
			SpecimenResult on Specimen.Id = SpecimenResult.SpecimenId left JOIN
			Status on Specimen.Id = Status.SpecimenId left JOIN
			Facility on RequestForm.FacilityId = Facility.Id left JOIN
			LabInstrument On SpecimenResult.LabInstrumentId = LabInstrument.ID left JOIN
			SpecimenType On RequestForm.SpecimenType = SpecimenType.Id  left JOIN
			AppUser As SpecimenResultUpdatedBy ON SpecimenResult.UpdatedById = SpecimenResultUpdatedBy.UserId 
	           
			Where 
			Specimen.Id in (@SpecimenId); 
			  
			  
