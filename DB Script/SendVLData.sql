USE [LISSyncDB]
GO
/****** Object:  StoredProcedure [dbo].[SendVLData]    Script Date: 10/23/2018 ******/
/******************************
  
** Name:	SendVLData
** Desc:    To save data to VLPatients and VLRequestSamples
** Auth:    War War Phoo
** Date:    23-10-2018
**************************
** Change History
**************************
** PR   Date       Author    Description 
** --   --------   -------   ------------------------------------
** 
*******************************/
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
        DECLARE  @VLRequestSampleId bigint;
		DECLARE  @PatientId bigint;
		DECLARE  @VLARTNumber nvarchar (20)='';
		DECLARE  @VLPatientCode nvarchar(20)='';
		DECLARE  @VLLabNumber nvarchar(50)='';
		DECLARE  @LabCode nvarchar(50)='';
		
		Select @VLARTNumber=ARTNumber , @VLPatientCode=PatientCode,@id=Id , @VLLabNumber =LabNumber,@LabCode= LabCode FROM [LISSyncDB].dbo.VLSummary where Id=@id;
		
		IF (@VLARTNumber <> '' or @VLPatientCode <> '')
		  Begin 
				  Select @PatientId= isnull(Id,0) from [LISDashboard].[dbo].[VLPatients] where 
				  1 = Case when @VLARTNumber = '' Then 1 When VLPatients.ARTNumber  = @VLARTNumber Then 1 END and 
				  1 = Case when @VLPatientCode = '' Then 1 When VLPatients.PatientCode  =  @VLPatientCode  Then 1 END  
				 				 
				  Select @VLRequestSampleId= isnull(Id,0) from [LISDashboard].[dbo].[VLRequestSamples] where 
				  1 = Case when @VLARTNumber = '' Then 1 When VLRequestSamples.ARTNumber  = @VLARTNumber Then 1 END and 
				  1 = Case when @VLPatientCode = '' Then 1 When VLRequestSamples.PatientCode  =  @VLPatientCode  Then 1 END  and
				  1 = Case when @VLLabNumber = '' Then 1 When VLRequestSamples.LabNumber  = @VLLabNumber Then 1 END and 
				  1 = Case when @LabCode = '' Then 1 When VLRequestSamples.LabCode  =  @VLPatientCode  Then 1 END  
				   
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
		  Update VLSummary_synced set synced=1 where Id=@id;
		  
		  End
  		      
		FETCH NEXT FROM @MyCursor 
    INTO @id
    END
   
    CLOSE @MyCursor ;
    DEALLOCATE @MyCursor;
END

END