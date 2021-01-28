# CREATE FUNCTION
Function CheckBackups
{
# IMPORT INSTANCE LIST


# list from CSV
clear
$instances1 = Import-CSV "C:\DBAChecks\SIngle\RHEBIW2K161_RHESQLBI01.csv" 

##################################################################

# LOOP THROUGH CREATE RESULTS ARRAY
 foreach ($row in $instances1.target_name) { 
 $LastBackup =   Get-DbaLastBackup -SqlInstance $row | Select-Object * | Out-Gridview

 Remove-Variable LastBackup

}


##################################################################

# FORMATING 
#$LastBackup | Format-Table

 
######################################################################
# HOUSE KEEPING

Remove-Variable instances1
#Remove-Variable LastBackup
##################################################################REPEATy

}
$confirmation = Read-Host "This script will check all databases and instances in your list? [y/n]"
while($confirmation -ne "n" ) 
{   
CheckBackups
         $confirmation = Read-Host "Check again? [y/n]"
            while ($confirmation -ne 'y') {exit}

}