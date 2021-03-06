USE [LIS]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetVLTreatement]    Script Date: 10/11/2018 11:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetVLTreatement](
@Id int=0
)

RETURNS @Temp TABLE(
VLTTreatement varchar(600))
AS

BEGIN

begin
      
DECLARE 
      @TempTable varchar(800)
SELECT @TempTable = COALESCE(@TempTable + ', ', '') + Treatment 
FROM VLPatientTherapies WHERE RequestFormId = @Id 
INSERT INTO @Temp(VLTTreatement) VALUES (@TempTable) 
END   
RETURN 
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetVLDrug]    Script Date: 10/11/2018 11:12:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetVLDrug](
@Id int=0
)

RETURNS @Temp TABLE(
VLDrug varchar(600))
AS

BEGIN

begin
        
DECLARE 
      @TempTable varchar(800)
SELECT @TempTable = COALESCE(@TempTable + ', ', '') + VLTherapies.Drug 
FROM VLPatientTherapies  as VLT INNER JOIN VLTherapies ON VLTherapies.Id = VLT.Drug WHERE RequestFormId = @Id 
INSERT INTO @Temp(VLDrug) VALUES (@TempTable) 
END   
RETURN 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateEIDData]    Script Date: 10/11/2018 11:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateEIDData]

AS
Update LISSyncDB.dbo.[EIDSummary]
       set  [PatientCode]	=Patient.PatientCode
           ,[FirstName]	=Patient.FirstName
           ,[MiddleName]	=Patient.MiddleName
           ,[Surname]	=Patient.Surname
           ,[DateOfBirth]	=Patient.DateOfBirth
           ,[Sex]	=Patient.Sex
           ,[MorGFirstName]	=Patient.MorGFirstName
           ,[MorGMiddleName]	=Patient.MorGMiddleName
           ,[MorGSurname]	=Patient.MorGSurname
           ,[MorGTelNumber]	=Patient.MorGTelNumber          
           ,[MorGResidingRegionState]	=Patient.MorGResidingRegionState
           ,[MorGResidingGTownShip]	=patient.MorGResidingGTownShip
           ,[PatientType]	=Patient.PatientType
           ,[PMTCTCode]	=Patient.PMTCTCode
           ,[BatchNumber]	=RequestForm.BatchNumber
           ,[FacilityId]	=RequestForm.FacilityId           
           ,[Age]	=RequestForm.Age
           ,[ageinweeks]	=RequestForm.ageinweeks
           ,[ReasonTest]	=RequestForm.ReasonTest
           ,[SpecimenType]	=RequestForm.SpecimenType
           ,[PreviousLabNumber]	=RequestForm.PreviousLabNumber
           ,[NameOfNurseOrHEOCollectingDBS]	=RequestForm.NameOfNurseOrHEOCollectingDBS
           ,[MotherHIVStatus]	=RequestForm.MotherHIVStatus
           ,[FatherHIVStatus]	=RequestForm.FatherHIVStatus
           ,[ModeOfDelivery]	=RequestForm.ModeOfDelivery
           ,[MotherARVStatus]	=RequestForm.MotherARVStatus
           ,[IfARVStatusOnWeekStarted]	=RequestForm.IfARVStatusOnWeekStarted
           ,[DifficultBirth]	=RequestForm.DifficultBirth
           ,[VillageBirth]	=RequestForm.VillageBirth
           ,[MotherARVRegimen]	=RequestForm.MotherARVRegimen
           ,[TimingIfMotherARVRegimenOther]	=RequestForm.TimingIfMotherARVRegimenOther
           ,[InfantARVStatus]	=RequestForm.InfantARVStatus
           ,[TimingIfInfantARVSatusOther]	=RequestForm.TimingIfInfantARVSatusOther
           ,[ExclusiveBreastFeeding]	=RequestForm.ExclusiveBreastFeeding
           ,[ExclusiveReplacementFeeding]	=RequestForm.ExclusiveReplacementFeeding
           ,[IfReplacementYesAgeAtWean]	=RequestForm.IfReplacementYesAgeAtWean
           ,[MixedFeeding]	=RequestForm.MixedFeeding
           ,[BreastFeedingUnknown]	=RequestForm.BreastFeedingUnknown
           ,[Agewhenlastbreastfed]	=RequestForm.Agewhenlastbreastfed
           ,[AnyPriorHIVTestResult]	=RequestForm.AnyPriorHIVTestResult
           ,[PriorHIVTestResult]	=RequestForm.PriorHIVTestResult
           ,[PriorHIVTestDate]	=RequestForm.PriorHIVTestDate
           ,[PriorTestType]	=RequestForm.PriorTestType
           ,[RequestFormCreatedDate]	=RequestForm.DateCreated
           ,[RequestFormUpdatedDate]	=RequestForm.DateUpdated
           ,[LabNumber]	=Specimen.LabNumber
           ,[RecievedDate]	=Specimen.RecievedDate
           ,[SampleCollectedDate]	=Specimen.SampleCollectedDate
           ,[SampleShipmentDate]	=Specimen.SampleShipmentDate
           ,[RegistrationDate]	=Specimen.RegistrationDate
           ,[DBSSpecimenQuality]	=Specimen.DBSSpecimenQuality           
           ,[RejectedReasonId]	= RequestRejectedReason.RejectedReasonId
           ,[SpecimenCreatedDate]	=Specimen.DateCreated
           ,[SpecimenUpdateDate]	=Specimen.DateUpdated           
           ,[FirstTestDate]	=SpecimenResult.FirstTestDate
           ,[FirstTestResult]	=SpecimenResult.FirstTestResult
           ,[RepeatTest]	=SpecimenResult.RepeatTest
           ,[RepeatReason]	=SpecimenResult.RepeatReason
           ,[SecondTestResult]	=SpecimenResult.SecondTestResult
           ,[SecondTestDate]	=SpecimenResult.SecondTestDate
           ,[RepeatSecondTest]	=SpecimenResult.RepeatSecondTest
           ,[RepeatReasonSecondTest]	=SpecimenResult.RepeatReasonSecondTest
           ,[ThirdTestResult]	=SpecimenResult.ThirdTestResult
           ,[ThirdTestDate]	=SpecimenResult.ThirdTestDate
           ,[FinalReportResult]	=SpecimenResult.FinalReportResult
           ,[FinalReportDate]	=SpecimenResult.FinalReportDate
           ,[SecondDBSRequired]	=SpecimenResult.SecondDBSRequired
           ,[FirstTestAbsorbanceValue]	=SpecimenResult.FirstTestAbsorbanceValue
           ,[SecondTestAbsorbanceValue]	=SpecimenResult.SecondTestAbsorbanceValue
           ,[ThirdTestAbsorbanceValue]	=SpecimenResult.ThirdTestAbsorbanceValue
           ,[Comment]	=SpecimenResult.Comment
           ,[TestedBy]	=SpecimenResult.TestedBy           
           ,[ResultCreatedDate]	=SpecimenResult.DateCreated
           ,[ResultUpdatedDate] =SpecimenResult.DateUpdated
           ,[LabInstrumentname]  =LabInstrument.LabInstrumentname           
           ,[LabInstrumentId] =LabInstrument.ID
           ,[StatusId] =Status.Id
           ,[Status]  =Status.Status
           ,[DateChanged]=Status.DateChanged
           ,[Lab]  =(Select dbo.Laboratory.LaboratoryName from dbo.Laboratory) 
           ,[LabCode]=(Select dbo.Laboratory.LabCode from dbo.Laboratory) 
           ,[ResultApprovedBy]=(SpecimenResultUpdatedBy.FirstName  + '' + SpecimenResultUpdatedBy.LastName) 
           ,[RequestId]=RequestForm.Id   
           ,[SpecimenId]=Specimen.Id     
           ,[SpecimenResultId]=SpecimenResult.Id
            From Patient Inner join
           RequestForm on Patient.Id = RequestForm.PatientId Inner Join
           RequestRejectedReason on RequestForm.Id=RequestRejectedReason.RequestId Inner Join
           Specimen on RequestForm.Id = Specimen.RequestId Inner Join
           SpecimenResult on Specimen.Id = SpecimenResult.SpecimenId Inner Join
           Status on Specimen.Id = Status.SpecimenId Inner Join
           Province on RequestForm.ProvinceId = Province.Id Inner Join
           Facility on RequestForm.FacilityId = Facility.Id Inner Join
           LLG on Facility.LLGId = LLG.Id Inner Join
           District on LLG.DistrictId = District.Id left Join
           FacilityType on Facility.FacilityTypeId = FacilityType.Id Inner Join
           LabInstrument On SpecimenResult.LabInstrumentId = LabInstrument.ID Inner Join
           SpecimenType On RequestForm.SpecimenType = SpecimenType.Id  Inner Join
           AppUser As SpecimenResultUpdatedBy ON SpecimenResult.UpdatedById = SpecimenResultUpdatedBy.UserId           
           Where Status.Status = 'Printed' AND           (
           --((EIDSummary.PatientUpdatedDate< Patient.DateUpdated )AND (Summery.PatientId = Patient.Id)) OR
           (( LISSyncDB.dbo.EIDSummary.RequestFormUpdatedDate< RequestForm.DateUpdated )AND (LISSyncDB.dbo.EIDSummary.RequestId = RequestForm.Id)) OR
          ((LISSyncDB.dbo.EIDSummary.SpecimenUpdateDate < Specimen.DateUpdated) AND (LISSyncDB.dbo.EIDSummary.SpecimenId=Specimen.Id))OR
          ((LISSyncDB.dbo.EIDSummary.ResultUpdatedDate< SpecimenResult.DateUpdated) AND (LISSyncDB.dbo.EIDSummary.SpecimenResultId=SpecimenResult.Id)))
GO
/****** Object:  StoredProcedure [dbo].[PullEIDData]    Script Date: 10/11/2018 11:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PullEIDData]      
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
				
				From Patient Inner join
			   RequestForm on Patient.Id = RequestForm.PatientId Inner Join
			   RequestRejectedReason on RequestForm.Id=RequestRejectedReason.RequestId Inner Join
			   Specimen on RequestForm.Id = Specimen.RequestId Inner Join
			   SpecimenResult on Specimen.Id = SpecimenResult.SpecimenId Inner Join
			   Status on Specimen.Id = Status.SpecimenId Inner Join
			   Province on RequestForm.ProvinceId = Province.Id Inner Join
			   Facility on RequestForm.FacilityId = Facility.Id Inner Join
			   LLG on Facility.LLGId = LLG.Id Inner Join
			   District on LLG.DistrictId = District.Id Inner Join
			   FacilityType on Facility.FacilityTypeId = FacilityType.Id Inner Join
			   LabInstrument On SpecimenResult.LabInstrumentId = LabInstrument.ID Inner Join
			   SpecimenType On RequestForm.SpecimenType = SpecimenType.Id  Inner Join
			   AppUser As SpecimenResultUpdatedBy ON SpecimenResult.UpdatedById = SpecimenResultUpdatedBy.UserId 
	           
			   Where Status.Status = 'Printed' AND
			   Status.Id Not IN (Select statusId from [dbo].[EIDSummary]);
GO
/****** Object:  StoredProcedure [dbo].[PullVLData]    Script Date: 10/11/2018 11:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PullVLData] 
@SpecimenId int      
AS
INSERT INTO [LISSyncDB].[dbo].[VLSummary]
           ([Id]
           ,[Fullname]
           ,[PatientCode]
           ,[PatientType]
           ,[ARTNumber]
           ,[Sex]
           ,[DateOfBirth]
           ,[ResidingRegionState]
           ,[ResidingGTownShip]
           ,[RegistrationNo]
           ,[BatchNumber]
           ,[FacilitytId]
           ,[Age]
           ,[Age_Month]
           ,[CurrentRegimen]
           ,[ARVRegimen]
           ,[ageinweeks]
           ,[ReasonTestId]
           ,[ReasonfortestOther]
           ,[SpecimenTypeId]
           ,[PreviousLabNumber]
           ,[NameOfNurseOrHEOCollectingDBS]
           ,[Adherence]
           ,[PrevVLcopiesml]
           ,[PrevVLLog]
           ,[Mostrecentviralload]
           ,[MostrecentviralloadLog]
           ,[Mostrecentviralloadresult]
           ,[Daterecentviralload]
           ,[BaselineCD4count]
           ,[MostrecentCD4count]
           ,[DateCD4Test]
           ,[Patientontherapy]
           ,[ARTStaringDate]
           ,[SecondLineARTStartingDate]
           ,[Patientevertherapy]
           ,[SampleStored]
           ,[Temperature]
           ,[Duration]
           ,[RequestCreatedDate]
           ,[RequestUpdatedDate]
           ,[LabNumber]
           ,[CreatedDate]
           ,[RecievedDate]
           ,[SampleCollectedDate]
           ,[SampleShipmentDate]
           ,[specimencollectionTime]
           ,[RegistrationDate]
           ,[SpecimenQuality]
           ,[RejectedReasonId]
           ,[FinalReportResult]
           ,[FinalReportDate]
           ,[Comment]
           ,[Copies_ml]
           ,[LogCopies]
           ,[ResultCreatedDate]
           ,[ResultUpdatedDate]
           ,[Reasonfortest]
           ,[LabInstrumentname]
           ,[LabInstrumentId]
           ,[ResultCreatedBy]
           ,[ResultApprovedBy]
           ,[TestedBy]
           ,[StatusId]
           ,[Status]
           ,[DateChanged]
           ,[Lab]
           ,[LabCode]
           ,[Treatment]
           ,[Drug]
           ,[RequestId]
           ,[SpecimenId]
           ,[SpecimenResultId]
           ,[PatientId])
          
      Select
            NEWID()
           ,VLPatient.Fullname
           ,VLPatient.PatientCode
           ,VLPatient.PatientType
           ,VLPatient.ARTNumber
           ,VLPatient.Sex
           ,VLPatient.DateOfBirth
           ,VLPatient.ResidingRegionState
           ,VLPatient.ResidingGTownShip
           ,VLRequestForm.RegistrationNo
           ,VLRequestForm.BatchNumber
           ,Facility.Id
           ,VLRequestForm.Age
           ,VLRequestForm.Age_Month
           ,VLRequestForm.CurrentRegimen
           ,VLRequestForm.ARVRegimenName
           ,VLRequestForm.ageinweeks
           ,VLTestReason.Id
           ,VLRequestForm.ReasonfortestOther
           ,SpecimenType.Id
           ,VLRequestForm.PreviousLabNumber
           ,VLRequestForm.NameOfNurseOrHEOCollectingDBS
           ,VLRequestForm.Adherence
           ,VLRequestForm.PrevVLcopiesml
           ,VLRequestForm.PrevVLLog
           ,VLRequestForm.Mostrecentviralload
           ,VLRequestForm.MostrecentviralloadLog
           ,VLRequestForm.Mostrecentviralloadresult
           ,VLRequestForm.Daterecentviralload
           ,VLRequestForm.BaselineCD4count
           ,VLRequestForm.MostrecentCD4count
           ,VLRequestForm.DateCD4Test
           ,VLRequestForm.Patientontherapy
           ,VLRequestForm.ARTStaringDate
           ,VLRequestForm.SecondLineARTStartingDate
           ,VLRequestForm.Patientevertherapy
           ,VLRequestForm.SampleStored
           ,VLRequestForm.Temperature
           ,VLRequestForm.Duration
           ,VLRequestForm.Datecreated
           ,VLRequestForm.Dateupdated
           ,VLSpecimen.LabNumber
         ,VLSpecimen.DateUpdated
           ,VLSpecimen.RecievedDate
           ,VLSpecimen.SampleCollectedDate
           ,VLSpecimen.SampleShipmentDate
           ,VLSpecimen.specimencollectionTime
           ,VLSpecimen.RegistrationDate
           ,VLSpecimen.SpecimenQuality
           ,VLRequestRejectedReason.Id
           ,VLSpecimenResult.FinalReportResult
           ,VLSpecimenResult.FinalReportDate
           ,VLSpecimenResult.Comment
           ,VLSpecimenResult.Copies_ml
           ,VLSpecimenResult.LogCopies
           ,VLSpecimenResult.DateCreated
           ,VLSpecimenResult.DateUpdated 
           ,VLTestReason.Reasonfortest  
            ,LabInstrument.LabInstrumentname
           ,LabInstrument.ID
           ,(VLSpecimenResultCreatedBy.FirstName  + '' + VLSpecimenResultCreatedBy.LastName) AS ResultCreatedBy
           ,(VLSpecimenResultUpdatedBy.FirstName  + '' + VLSpecimenResultUpdatedBy.LastName) AS ResultApprovedBy
           ,VLSpecimenResult.TestedBy
           ,VLStatus.Id
           ,VLStatus.Status
           ,VLStatus.DateChanged
           ,(Select dbo.Laboratory.LaboratoryName from dbo.Laboratory)  as Lab
           ,(Select dbo.Laboratory.LabCode from dbo.Laboratory)  as LabCode
           ,(Select t.VLTTreatement from fnGetVLTreatement(VLRequestForm.Id)as t)
           ,(Select t.VLDrug from fnGetVLDrug(VLRequestForm.Id)as t)
           ,VLRequestForm.Id  
           ,VLSpecimen.Id   
           ,VLSpecimenResult.Id
           ,VLPatient.Id
           from  dbo.VLSpecimen LEFT OUTER JOIN
                      dbo.VLRequestForm ON dbo.VLRequestForm.Id = dbo.VLSpecimen.VLRequestId LEFT OUTER JOIN  
                      dbo.VLRequestRejectedReason on  VLRequestForm.Id = VLRequestRejectedReason.RejectedReasonId LEFT OUTER JOIN                 
                      dbo.VLPatient ON dbo.VLRequestForm.PatientId = dbo.VLPatient.Id LEFT OUTER JOIN
                      dbo.Facility ON dbo.VLRequestForm.FacilityId = dbo.Facility.Id LEFT OUTER JOIN                   
                      dbo.VLTestReason ON dbo.VLTestReason.Id = dbo.VLRequestForm.ReasonTest LEFT OUTER JOIN
                      dbo.SpecimenType ON dbo.SpecimenType.Id = dbo.VLRequestForm.SpecimenType LEFT OUTER JOIN                 
                      dbo.VLStatus ON dbo.VLStatus.VLSpecimenId = dbo.VLSpecimen.Id LEFT OUTER JOIN
                      dbo.VLSpecimenResult ON dbo.VLSpecimenResult.VLSpecimenId = dbo.VLSpecimen.Id LEFT OUTER JOIN
                      dbo.LabInstrument ON dbo.VLSpecimenResult.LabInstrumentId = dbo.LabInstrument.ID LEFT OUTER JOIN
                      dbo.AppUser As VLSpecimenResultUpdatedBy ON VLSpecimenResult.UpdatedById = VLSpecimenResultUpdatedBy.UserId LEFT OUTER JOIN
                      dbo.AppUser As VLSpecimenResultCreatedBy ON VLSpecimenResult.CreatedById = VLSpecimenResultCreatedBy.UserId 
           
           -- From VLPatient Inner join
           --VLRequestForm on VLPatient.Id = VLRequestForm.PatientId Inner Join
           --VLRequestRejectedReason on  VLRequestForm.Id = VLRequestRejectedReason.RejectedReasonId inner join
           --VLSpecimen on VLRequestForm.Id = VLSpecimen.VLRequestId Inner Join
           --VLSpecimenResult on VLSpecimen.Id = VLSpecimenResult.VLSpecimenId Inner Join          
           --VLStatus on VLSpecimen.Id = VLStatus.VLSpecimenId Inner Join
           ----Province on VLRequestForm.ProvinceId = Province.Id Inner Join
           --Facility on VLRequestForm.FacilityId = Facility.Id Inner Join
           ----LLG on Facility.LLGId = LLG.Id Inner Join
           ----District on LLG.DistrictId = District.Id left Join
           ----FacilityType on Facility.FacilityTypeId = FacilityType.Id Inner Join
           --LabInstrument On VLSpecimenResult.LabInstrumentId = LabInstrument.ID Inner Join
           --SpecimenType On VLRequestForm.SpecimenType = SpecimenType.Id Inner Join
           --AppUser As VLSpecimenResultUpdatedBy ON VLSpecimenResult.UpdatedById = VLSpecimenResultUpdatedBy.UserId inner Join
           --AppUser As VLSpecimenResultCreatedBy ON VLSpecimenResult.CreatedById = VLSpecimenResultCreatedBy.UserId inner join
           --VLTestReason on VLRequestForm.ReasonTest=VLTestReason.Id
           --VLPatientTherapies On VLRequestForm.Id = VLPatientTherapies.RequestFormId          
           ----Where VLStatus.Status = 'Printed' AND
           ----VLStatus.Id Not IN (Select statusId from [dbo].[VLSummary]);
             Where VLSpecimen.Id in (@SpecimenId) ;
GO
/****** Object:  StoredProcedure [dbo].[UpdateVLData]    Script Date: 10/11/2018 11:12:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateVLData]
      
AS
update LISSYNCDB.dbo.[VLSummary]
       set  [Fullname]=VLPatient.Fullname
           ,[PatientCode]=VLPatient.PatientCode
           ,[PatientType]=VLPatient.PatientType
           ,[ARTNumber]=VLPatient.ARTNumber
           ,[Sex]=VLPatient.Sex
           ,[DateOfBirth]=VLPatient.DateOfBirth
           ,[ResidingRegionState]=VLPatient.ResidingRegionState
           ,[ResidingGTownShip]=VLPatient.ResidingGTownShip
           ,[RegistrationNo]=VLRequestForm.RegistrationNo
           ,[BatchNumber]=VLRequestForm.BatchNumber
           ,[FacilitytId]=Facility.Id
           ,[Age]=VLRequestForm.Age
           ,[Age_Month]=VLRequestForm.Age_Month
           ,[CurrentRegimen]=VLRequestForm.CurrentRegimen
           ,[ARVRegimen]=VLRequestForm.ARVRegimenName
           ,[ageinweeks]=VLRequestForm.ageinweeks
           ,[ReasonTestId]=VLTestReason.Id
           ,[ReasonfortestOther]=VLRequestForm.ReasonfortestOther
           ,[SpecimenTypeId]=SpecimenType.Id
           ,[PreviousLabNumber]=VLRequestForm.PreviousLabNumber
           ,[NameOfNurseOrHEOCollectingDBS]=VLRequestForm.NameOfNurseOrHEOCollectingDBS
           ,[Adherence]=VLRequestForm.Adherence
           ,[PrevVLcopiesml]=VLRequestForm.PrevVLcopiesml
           ,[PrevVLLog]=VLRequestForm.PrevVLLog
           ,[Mostrecentviralload]=VLRequestForm.Mostrecentviralload
           ,[MostrecentviralloadLog]=VLRequestForm.MostrecentviralloadLog
           ,[Mostrecentviralloadresult]=VLRequestForm.Mostrecentviralloadresult
           ,[Daterecentviralload]=VLRequestForm.Daterecentviralload
           ,[BaselineCD4count]=VLRequestForm.BaselineCD4count
           ,[MostrecentCD4count]=VLRequestForm.MostrecentCD4count
           ,[DateCD4Test]=VLRequestForm.DateCD4Test
           ,[Patientontherapy]=VLRequestForm.Patientontherapy
           ,[ARTStaringDate]=VLRequestForm.ARTStaringDate
           ,[SecondLineARTStartingDate]=VLRequestForm.SecondLineARTStartingDate
           ,[Patientevertherapy]=VLRequestForm.Patientevertherapy
           ,[SampleStored]=VLRequestForm.SampleStored
           ,[Temperature]=VLRequestForm.Temperature
           ,[Duration]=VLRequestForm.Duration
           ,[RequestCreatedDate]=VLRequestForm.Datecreated
           ,[RequestUpdatedDate]=VLRequestForm.Dateupdated
           ,[LabNumber]=VLSpecimen.LabNumber
           ,[CreatedDate]= VLSpecimen.DateUpdated
           ,[RecievedDate]=VLSpecimen.RecievedDate
           ,[SampleCollectedDate]=VLSpecimen.SampleCollectedDate
           ,[SampleShipmentDate]=VLSpecimen.SampleShipmentDate
           ,[specimencollectionTime]=VLSpecimen.specimencollectionTime
           ,[RegistrationDate]=VLSpecimen.RegistrationDate
           ,[SpecimenQuality]=VLSpecimen.SpecimenQuality
           ,[RejectedReasonId]=VLRequestRejectedReason.Id
           ,[FinalReportResult]=VLSpecimenResult.FinalReportResult
           ,[FinalReportDate]=VLSpecimenResult.FinalReportDate
           ,[Comment]=VLSpecimenResult.Comment
           ,[Copies_ml]=VLSpecimenResult.Copies_ml
           ,[LogCopies]=VLSpecimenResult.LogCopies
           ,[ResultCreatedDate]=VLSpecimenResult.DateCreated
           ,[ResultUpdatedDate]=VLSpecimenResult.DateUpdated 
           ,[Reasonfortest]=VLTestReason.Reasonfortest  
           ,[LabInstrumentname]=LabInstrument.LabInstrumentname
           ,[LabInstrumentId]=LabInstrument.ID
           ,[ResultCreatedBy]=(VLSpecimenResultCreatedBy.FirstName  + '' + VLSpecimenResultCreatedBy.LastName) 
           ,[ResultApprovedBy]=(VLSpecimenResultUpdatedBy.FirstName  + '' + VLSpecimenResultUpdatedBy.LastName) 
           ,[TestedBy]=VLSpecimenResult.TestedBy
           ,[StatusId]=VLStatus.Id
           ,[Status]=VLStatus.Status
           ,[DateChanged]=VLStatus.DateChanged
           ,[Lab]=(Select dbo.Laboratory.LaboratoryName from dbo.Laboratory)  
           ,[LabCode]=(Select dbo.Laboratory.LabCode from dbo.Laboratory) 
           ,[Treatment]=(Select t.VLTTreatement from fnGetVLTreatement(VLRequestForm.Id)as t)
           ,[Drug]=(Select t.VLDrug from fnGetVLDrug(VLRequestForm.Id)as t)
           ,[RequestId]=VLRequestForm.Id  
           ,[SpecimenId]=VLSpecimen.Id   
           ,[SpecimenResultId]=VLSpecimenResult.Id
           ,[PatientId]=VLPatient.Id
          
          From VLPatient Inner join
           VLRequestForm on VLPatient.Id = VLRequestForm.PatientId Inner Join
           VLRequestRejectedReason on  VLRequestForm.Id = VLRequestRejectedReason.RejectedReasonId inner join
           VLSpecimen on VLRequestForm.Id = VLSpecimen.VLRequestId Inner Join
           VLSpecimenResult on VLSpecimen.Id = VLSpecimenResult.VLSpecimenId Inner Join
           VLStatus on VLSpecimen.Id = VLStatus.VLSpecimenId Inner Join
           Province on VLRequestForm.ProvinceId = Province.Id Inner Join
           Facility on VLRequestForm.FacilityId = Facility.Id Inner Join
           LLG on Facility.LLGId = LLG.Id Inner Join
           District on LLG.DistrictId = District.Id left Join
           FacilityType on Facility.FacilityTypeId = FacilityType.Id Inner Join
           LabInstrument On VLSpecimenResult.LabInstrumentId = LabInstrument.ID Inner Join
           SpecimenType On VLRequestForm.SpecimenType = SpecimenType.Id Inner Join
           AppUser As VLSpecimenResultUpdatedBy ON VLSpecimenResult.UpdatedById = VLSpecimenResultUpdatedBy.UserId inner Join
           AppUser As VLSpecimenResultCreatedBy ON VLSpecimenResult.CreatedById = VLSpecimenResultCreatedBy.UserId inner join
           VLTestReason on VLRequestForm.ReasonTest=VLTestReason.Id
           
           Where VLStatus.Status = 'Printed' AND 
           (((LISSyncDB.dbo.VLSummary.RequestUpdatedDate< VLRequestForm.DateUpdated )AND (LISSyncDB.dbo.VLSummary.RequestId = VLRequestForm.Id)) OR
          ((LISSyncDB.dbo.VLSummary.CreatedDate< VLSpecimen.DateUpdated) AND (LISSyncDB.dbo.VLSummary.SpecimenId=VLSpecimen.Id))OR
          ((LISSyncDB.dbo.VLSummary.ResultUpdatedDate< VLSpecimenResult.DateUpdated) AND (LISSyncDB.dbo.VLSummary.SpecimenResultId=VLSpecimenResult.Id)))
GO
