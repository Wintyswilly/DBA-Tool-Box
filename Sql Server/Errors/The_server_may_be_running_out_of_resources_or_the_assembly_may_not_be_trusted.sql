/*
Date		09/02/2021 08:58:42
Log		SQL Server (Current - 09/02/2021 08:56:00)

Source		spid189

Message
An error occurred in the Microsoft .NET Framework while trying to load assembly id 65536. The server may be running out of resources, or the assembly may not be trusted. Run the query again, or check documentation to see how to solve the assembly trust issues. For more information about this error: 
System.IO.FileLoadException: Could not load file or assembly 'awssignedurlgeneratorncc, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null' or one of its dependencies. An error relating to security occurred. (Exception from HRESULT: 0x8013150A)
System.IO.FileLoadException: 
   at System.Reflection.RuntimeAssembly._nLoad(AssemblyName fileName, String codeBase, Evidence assemblySecurity, RuntimeAssembly locationHint, StackCrawlMark& stackMark, IntPtr pPrivHostBinder, Boolean throwOnFileNotFound, Boolean forIntrospection, Boolean suppressSecurityChecks)
   at System.Reflection.RuntimeAssembly.InternalLoadAssemblyName(AssemblyName assemblyRef, Evidence assemblySecurity, RuntimeAssembly reqAssembly, StackCrawlMark& stackMark, IntPtr pPrivHostBinder, Boolean throwOnFileNotFound, Boolean forIntrospection, Boolean suppressSecurityChecks)
   at System.Reflection.RuntimeAssembly.InternalLoad(String assemblyString, Evidence assemblySecurity, StackCrawlMark& stackMark, IntPtr pPrivHostBinder, Boolean forIntrospection)
   at System.Reflection.RuntimeAssembly.InternalLoad(String assemblyString, Evidence assemblySecurity, StackCrawlMark& stackMark, Boolean forIntrospection)
   at System.Reflection.Assembly.Load(String assemblyString)
*/




USE [HMOLicencing];
EXEC sp_configure 'clr enabled' ,1
GO

RECONFIGURE
GO
EXEC sp_configure 'clr enabled'   -- make sure it took
GO


ALTER DATABASE [HMOLicencing] SET TRUSTWORTHY ON;
GO
--And change the database owner to ‘sa’

USE [HMOLicencing]
GO

EXEC sp_changedbowner 'sa'
GO