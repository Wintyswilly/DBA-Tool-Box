/****** Script for SelectTopNRows command from SSMS  ******/
USE master;
GO
ALTER DATABASE SWTEST3
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE;
ALTER DATABASE SWTEST3
SET MULTI_USER;
GO
go
select 
			a.instanceName
	,		a.DatabaseName
	,		a.state_desc
	,		CASE 
	when a.user_access = 0 then 'MULTI USER'
	when a.user_access = 1 then 'SINGLE USER'
		end
		as User_access
	,		a.synchronization_state_desc
	,		a.synchronization_health_desc
	,		a.is_local

from 
(
select 
			@@SERVERNAME instanceName
	,		d.name DatabaseName
	,		d.state_desc
	,		d.user_access
	,		rs.synchronization_state_desc
	,		rs.synchronization_health_desc
	,		rs.is_local
from sys.databases d
left join  sys.dm_hadr_database_replica_states rs on d.database_id = rs.database_id
) a
where ISNULL(a.is_local,2) in (1,2)

