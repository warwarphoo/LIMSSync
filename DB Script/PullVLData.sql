USE [Union]
GO
/****** Object:  StoredProcedure [dbo].[PullVLData]    Script Date: 11/12/2018 16:34:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[PullVLData] 
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
           
           --From VLPatient Inner join
           --VLRequestForm on VLPatient.Id = VLRequestForm.PatientId Inner Join
           --VLRequestRejectedReason on  VLRequestForm.Id = VLRequestRejectedReason.RejectedReasonId inner join
           --VLSpecimen on VLRequestForm.Id = VLSpecimen.VLRequestId Inner Join
           --VLSpecimenResult on VLSpecimen.Id = VLSpecimenResult.VLSpecimenId Inner Join          
           --VLStatus on VLSpecimen.Id = VLStatus.VLSpecimenId Inner Join
           ----Province on VLRequestForm.ProvinceId = Province.Id Inner Join
           --Facility on VLRequestForm.FacilityId = Facility.Id Inner Join
           --LLG on Facility.LLGId = LLG.Id Inner Join
           --District on LLG.DistrictId = District.Id left Join
           ----FacilityType on Facility.FacilityTypeId = FacilityType.Id Inner Join
           --LabInstrument On VLSpecimenResult.LabInstrumentId = LabInstrument.ID Inner Join
           --SpecimenType On VLRequestForm.SpecimenType = SpecimenType.Id Inner Join
           --AppUser As VLSpecimenResultUpdatedBy ON VLSpecimenResult.UpdatedById = VLSpecimenResultUpdatedBy.UserId inner Join
           --AppUser As VLSpecimenResultCreatedBy ON VLSpecimenResult.CreatedById = VLSpecimenResultCreatedBy.UserId inner join
           --VLTestReason on VLRequestForm.ReasonTest=VLTestReason.Id
           --VLPatientTherapies On VLRequestForm.Id = VLPatientTherapies.RequestFormId          
           --Where VLStatus.Status = 'Printed' AND
           --VLStatus.Id Not IN (Select statusId from [dbo].[VLSummary]);
             Where VLSpecimen.Id in (@SpecimenId) and (VLPatient.ARTNumber <> '' or VLPatient.PatientCode <>'');
