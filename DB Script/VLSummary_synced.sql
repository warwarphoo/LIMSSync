USE [LISSyncDB]
GO

/****** Object:  Table [dbo].[VLSummary_synced]    Script Date: 10/23/2018 13:46:46 ******/
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


