SELECT [Database Name] = DB_NAME(database_id),

       [Type] = CASE WHEN Type_Desc = 'ROWS' THEN 'Data File(s)'

                     WHEN Type_Desc = 'LOG'  THEN 'Log File(s)'

                     ELSE Type_Desc END,

       [Size in MB] = CAST( ((SUM(Size)* 8) / 1024.0) AS DECIMAL(18,2) )	,
	   getdate() checkdate

FROM   sys.master_files
where database_id not in (
								DB_ID('_DBA')
							,	DB_ID('master')
							,	DB_ID('model')
							,	DB_ID('msdb')
							,	DB_ID('SSISDB')
							,	DB_ID('ReportServer')
							,	DB_ID('tempdb')
							,	DB_ID('ReportServerTempDB')
						)

GROUP BY      GROUPING SETS

              (

                     (DB_NAME(database_id), Type_Desc),

                     (DB_NAME(database_id))

              )

ORDER BY      DB_NAME(database_id), Type_Desc DESC

GO