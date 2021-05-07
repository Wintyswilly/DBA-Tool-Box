USE [_dba]
GO

/****** Object:  StoredProcedure [dbo].[Get_SSIS_Connection_Strings]    Script Date: 08/12/2020 13:22:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Get_SSIS_Connection_Strings]
as
insert into _dba.dbo.ssis_connection_string 
Select 
			f.folder_id
		,	f.name Folder_Name
		,	p.project_id
		,	p.name Project_Name
		,	pa.package_id
		,   pa.name Package_Name
		,   op.project_version_lsn
		,	op.parameter_name
	 	,   op.design_default_value
	
from SSISDB.internal.folders f
join SSISDB.internal.projects p on f.folder_id = p.folder_id
join SSISDB.internal.packages pa on p.object_version_lsn = pa.project_version_lsn
join SSISDB.internal.object_parameters op on op.project_id = p.project_id and p.object_version_lsn = op.project_version_lsn
WHERE  op.parameter_name like '%ConnectionString%'
GO


