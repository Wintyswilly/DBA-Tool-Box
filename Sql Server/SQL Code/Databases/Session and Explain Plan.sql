SET QUOTED_IDENTIFIER ON
GO
--DROP TABLE [dbo].[sessions_and_explain_plan]
CREATE TABLE [dbo].[sessions_and_explain_plan](
	[session_id] [smallint] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[program_name] [nvarchar](128) NULL,
	[login_name] [nvarchar](128) NOT NULL,
	[login_time] [datetime] NOT NULL,
	[plan_handle] [varbinary](64) NULL,
	[text] [nvarchar](max) NULL,
	[query_plan] [xml] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


CREATE PROCEDURE dbo.Pk_sessions_and_explain_plan
AS

/*
----------------------------------------------------------------------------
-- Object Name: dbo.Pk_sessions_and_explain_plan
-- Project: RHE Monitor Sessions
-- Business Process: Monitor Sessions
-- Purpose: Insert a record into a table
-- Detailed Description: Insert a record into the dbo.Pk_sessions_and_explain_plan table
-- Database: _DBA
-- Dependent Objects: None
-- Called By: John Green
-- Upstream Systems: N\A
-- Downstream Systems: N\A
*/

SET NOCOUNT ON
insert into sessions_and_explain_plan
		select 
				s.session_id
			,   getdate() TimeStamp
			,	s.program_name
			,	s.login_name
			,	s.login_time
			,	r.plan_handle
			,	t.text
			,   p.query_plan
		from
			sys.dm_exec_sessions as s
				join sys.dm_exec_requests as r
		on s.session_id = r.session_id
				cross apply sys.dm_exec_sql_text (r.sql_handle) as t
				cross apply sys.dm_exec_query_plan(r.plan_handle) as p
			where s.is_user_process = 1;
/****** Object:  Table [dbo].[sessions_and_explain_plan]    Script Date: 15/04/2020 11:45:07 ******/
SET ANSI_NULLS ON
GO

