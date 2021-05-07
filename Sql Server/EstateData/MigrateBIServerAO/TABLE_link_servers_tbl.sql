USE [_dba]
GO

/****** Object:  Table [dbo].[link_servers_tbl]    Script Date: 08/12/2020 13:34:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[link_servers_tbl](
	[server_id] [int] NOT NULL,
	[Link_Name] [sysname] NOT NULL,
	[product] [sysname] NOT NULL,
	[provider] [sysname] NOT NULL,
	[data_source] [nvarchar](4000) NULL,
	[remote_name] [sysname] NULL,
	[uses_self_credential] [bit] NULL,
	[modify_date] [datetime] NULL
) ON [PRIMARY]
GO


