USE [LISSyncDB]
GO

/****** Object:  Table [dbo].[EIDSummary_synced]    Script Date: 11/08/2018 14:32:20 ******/
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


