USE [_DBA]
GO
CREATE USER [test] FOR LOGIN [test]
GO
use _dba
exec sp_msforeachtable "DENY SELECT ON ? TO [test];"
GO

GRANT SELECT ON [dbo].[backuplogs] to [test]
Go 