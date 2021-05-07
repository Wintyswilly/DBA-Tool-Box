USE [_dba]
GO

/****** Object:  Table [dbo].[links_in_Procs]    Script Date: 08/12/2020 13:31:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[links_in_Procs](
	[ROUTINE_CATALOG] [nvarchar](128) NULL,
	[SPECIFIC_SCHEMA] [nvarchar](128) NULL,
	[ROUTINE_NAME] [sysname] NOT NULL,
	[ROUTINE_DEFINITION] [nvarchar](4000) NULL,
	[LINKED_SERVER] [varchar](125) NULL
) ON [PRIMARY]
GO


