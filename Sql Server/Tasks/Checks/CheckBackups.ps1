# CREATE FUNCTION
Function CheckDbs
{
# IMPORT INSTANCE LIST

clear
$instances1 = Import-CSV "C:\DBAChecks\InstancesLivNetbackupFailOver.csv" 

#$instances1.target_name
##################################################################

# LOOP THROUGH CREATE RESULTS ARRAY
 foreach ($row in $instances1.target_name) { 
 $LastBackup =   Get-DbaLastBackup -SqlInstance $row | Select-Object * | Out-Gridview

 Remove-Variable LastBackup

}


##################################################################

# FORMATING 
$LastBackup | Format-Table

 
######################################################################
# HOUSE KEEPING

Remove-Variable instances1
#Remove-Variable LastBackup
##################################################################REPEAT

}
$confirmation = Read-Host "This script will check all databases and instances? [y/n]"
while($confirmation -ne "n" ) 
{   
CheckDbs
         $confirmation = Read-Host "Check again? [y/n]"
            while ($confirmation -ne 'y') {exit}

}