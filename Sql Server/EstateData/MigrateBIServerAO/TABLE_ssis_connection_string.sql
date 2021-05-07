USE [_dba]
GO

/****** Object:  Table [dbo].[ssis_connection_string]    Script Date: 08/12/2020 13:28:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ssis_connection_string](
	[folder_id] [bigint] NOT NULL,
	[Folder_Name] [sysname] NOT NULL,
	[project_id] [bigint] NOT NULL,
	[Project_Name] [sysname] NOT NULL,
	[package_id] [bigint] NOT NULL,
	[Package_Name] [nvarchar](260) NOT NULL,
	[project_version_lsn] [bigint] NOT NULL,
	[parameter_name] [sysname] NOT NULL,
	[design_default_value] [sql_variant] NULL
) ON [PRIMARY]
GO


