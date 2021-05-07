USE [_dba]
GO

/****** Object:  Table [dbo].[Procs_View_Functions]    Script Date: 08/12/2020 13:29:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Procs_View_Functions](
	[ROUTINE_CATALOG] [nvarchar](128) NULL,
	[SPECIFIC_SCHEMA] [nvarchar](128) NULL,
	[ROUTINE_NAME] [sysname] NOT NULL,
	[routine_type] [nvarchar](20) NULL,
	[ROUTINE_DEFINITION] [nvarchar](4000) NULL
) ON [PRIMARY]
GO


