--macfarlaneMIS
USE ITBI_macfarlaneMIS
GO
SELECT file_id, name as [logical_file_name], physical_name
FROM sys.database_files

USE [master];
GO
ALTER DATABASE [originalDatabaseName] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
ALTER DATABASE [originalDatabaseName] MODIFY NAME = [NewDatabaseName] ;
ALTER DATABASE [NewDatabaseName] SET MULTI_USER
Go
