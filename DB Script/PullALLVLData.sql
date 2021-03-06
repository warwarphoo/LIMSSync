USE [Union]
GO
/****** Object:  StoredProcedure [dbo].[PullVLData]    Script Date: 10/26/2018 15:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Alter PROCEDURE [dbo].[PullALLVLData] 

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
           Where VLStatus.Status = 'Printed' AND
           VLSpecimen.Id Not IN (Select SpecimenId from LISSYncDB.[dbo].[VLSummary]);
           
