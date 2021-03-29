/*
-------------------------------------------------------------------
Step 1 log direct onto the server
Step 2 in system DNS create a new entery
Step 3 choose the type ODBC DLL you wish to use
Step 4 Run the below code alter it to suit your needs
-------------------------------------------------------------------

*/

USE master
go
GRANT EXECUTE ON SYS.XP_PROP_OLEDB_PROVIDER TO [LOGIN]
go
GRANT EXECUTE ON SYS.XP_PROP_OLEDB_PROVIDER TO [LOGIN]


USE [master]
GO


/****** Object:  LinkedServer [ODBC_DBLINKNAME]    Script Date: 3/25/2021 2:10:08 PM ******/
EXEC master.dbo.sp_addlinkedserver @server = N'ODBC_DBLINKNAME', @srvproduct=N'', @provider=N'MSDASQL', @datasrc=N'ODBC_DBLINKNAME'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'ODBC_DBLINKNAME',@useself=N'True',@locallogin=NULL,@rmtuser=NULL,@rmtpassword=NULL
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'ODBC_DBLINKNAME',@useself=N'False',@locallogin=N'LOGIN',@rmtuser=N'ODBCLOGIN',@rmtpassword='ODBCPASSWORD'
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'ODBC_DBLINKNAME',@useself=N'False',@locallogin=N'LOGIN',@rmtuser=N'ODBCLOGIN',@rmtpassword='ODBCPASSWORD'
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'ODBC_DBLINKNAME',@useself=N'False',@locallogin=N'LOGIN',@rmtuser=N'ODBCLOGIN',@rmtpassword='ODBCPASSWORD'
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'ODBC_DBLINKNAME',@useself=N'False',@locallogin=N'LOGIN',@rmtuser=N'ODBCLOGIN',@rmtpassword='ODBCPASSWORD'

GO

EXEC master.dbo.sp_serveroption @server=N'ODBC_DBLINKNAME', @optname=N'collation compatible', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'ODBC_DBLINKNAME', @optname=N'data access', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'ODBC_DBLINKNAME', @optname=N'dist', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'ODBC_DBLINKNAME', @optname=N'pub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'ODBC_DBLINKNAME', @optname=N'rpc', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'ODBC_DBLINKNAME', @optname=N'rpc out', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'ODBC_DBLINKNAME', @optname=N'sub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'ODBC_DBLINKNAME', @optname=N'connect timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'ODBC_DBLINKNAME', @optname=N'collation name', @optvalue=null
GO

EXEC master.dbo.sp_serveroption @server=N'ODBC_DBLINKNAME', @optname=N'lazy schema validation', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'ODBC_DBLINKNAME', @optname=N'query timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'ODBC_DBLINKNAME', @optname=N'use remote collation', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'ODBC_DBLINKNAME', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO


