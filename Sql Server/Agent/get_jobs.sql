
use msdb

select 
		@@SERVERNAME InstanceName , 
		j.name JobName,
		j.job_id,
		j.description JobDescription,
		sl.loginname,
		j.date_created,
		j.date_modified,
		sh.last_run_date,
		j.enabled,
		sh.run_status run_status_id,
	CASE	sh.run_status
	WHEN 0 THEN 'Failed'
	WHEN 1 THEN 'Success'
	WHEN 2 THEN 'Retry'
	WHEN 3 THEN 'Cancelled'
	WHEN 4 THEN 'In Progress'
	END AS Run_Status,
		j.version_number, 
		j.category_id,
		c.name category

	from dbo.sysjobs j
	join dbo.syscategories c on j.category_id = c.category_id
	left join sys.syslogins sl on j.owner_sid = sl.sid 
	left join (select distinct  job_id,  max(instance_id) last_run_id from dbo.sysjobhistory
where step_id = 0
group by job_id, step_name) mxJ on j.job_id = mxJ.job_id
Left join (select distinct instance_id, run_status,  max(run_date) last_run_date from dbo.sysjobhistory where step_id = 0
		group by instance_id, run_status) sh on  mxJ.last_run_id = sh.instance_id
--where j.name = 'checkbackups'
order by JobName
;
select distinct  job_id,  max(instance_id) last_run_id from dbo.sysjobhistory
where step_id = 0
group by job_id, step_name
