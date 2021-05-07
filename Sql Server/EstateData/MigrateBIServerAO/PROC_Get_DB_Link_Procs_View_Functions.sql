USE [_dba]
GO
/****** Object:  StoredProcedure [dbo].[Get_DB_Link_Procs_View_Functions]    Script Date: 08/12/2020 13:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--drop procedure [dbo].[Get_DB_Link_Refs_test]
--CREATE procedure [dbo].[Get_DB_Link_Procs_View_Functions]
--AS
Declare
		@vLinkServer varchar(128) ,
		@vCntRow int
create table #tServer 
(tLink_Server varchar(128))
insert into #tServer select convert(varchar(128),Link_Name) Link_Name from _dba.dbo.link_servers_tbl
select @vCntRow = COUNT(1) from #tServer
select top 1 @vLinkServer = tLink_Server from #tServer
truncate table _dba.dbo.links_in_Procs_View_Functions
while @vCntRow > 0
begin
DECLARE @command varchar(1000) 
SELECT @command = 'USE ? select [ROUTINE_CATALOG], [SPECIFIC_SCHEMA],[ROUTINE_NAME],[routine_type],[ROUTINE_DEFINITION], ''' + @vLinkServer +
   ''' FROM tempdb.INFORMATION_SCHEMA.ROUTINES where lower(ROUTINE_DEFINITION) like lower(''%'+ @vLinkServer +'%'')'
--insert into _dba.dbo.links_in_Procs_View_Functions 
select @command
EXEC sp_MSforeachdb @command 
DECLARE @command1 varchar(1000) 
SELECT @command1 = 'USE ? SELECT  TABLE_CATALOG [ROUTINE_CATALOG] ,	TABLE_SCHEMA [SPECIFIC_SCHEMA] ,	TABLE_NAME [ROUTINE_NAME],	''VIEW'' [routine_type],	VIEW_DEFINITION [ROUTINE_DEFINITION], ''' 
				+ @vLinkServer + ''' [LINKED_SERVER] FROM INFORMATION_SCHEMA.VIEWS where lower(VIEW_DEFINITION) like lower(''%'''+ @vLinkServer +'%'')'
--insert into _dba.dbo.links_in_Procs_View_Functions 
select @command1
EXEC sp_MSforeachdb @command1



			
	delete from #tServer where tLink_Server = @vLinkServer		
	select top 1 @vLinkServer = tLink_Server from #tServer	
	set @vCntRow = @vCntRow - 1
end

drop table #tServer
GO


