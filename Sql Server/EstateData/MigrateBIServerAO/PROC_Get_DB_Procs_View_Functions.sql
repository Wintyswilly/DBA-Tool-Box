USE [_dba]
GO

/****** Object:  StoredProcedure [dbo].[Get_DB_Procs_View_Functions]    Script Date: 08/12/2020 13:21:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--drop procedure [dbo].[Get_DB_Link_Refs_test]
ALTER procedure [dbo].[Get_DB_Procs_View_Functions]
AS
begin
DECLARE @command varchar(1000) 
SELECT @command = 'USE ? insert into _dba.dbo.Procs_View_Functions select [ROUTINE_CATALOG], [SPECIFIC_SCHEMA],[ROUTINE_NAME],[routine_type],[ROUTINE_DEFINITION]  FROM INFORMATION_SCHEMA.ROUTINES' 
EXEC sp_MSforeachdb @command 
end
begin
DECLARE @command1 varchar(1000) 
SELECT @command1 = 'USE ? insert into _dba.dbo.Procs_View_Functions SELECT  TABLE_CATALOG [ROUTINE_CATALOG] ,	TABLE_SCHEMA [SPECIFIC_SCHEMA] ,	TABLE_NAME [ROUTINE_NAME],	''VIEW'' [routine_type],	VIEW_DEFINITION [ROUTINE_DEFINITION]FROM tempdb.INFORMATION_SCHEMA.VIEWS' 
EXEC sp_MSforeachdb @command1
end
