# CREATE FUNCTION
Function CheckDbs
{
# IMPORT INSTANCE LIST

clear
$instances1 = Import-CSV "C:\DBAChecks\Servers.csv" 

#$instances1.target_name
##################################################################

# LOOP THROUGH CREATE RESULTS ARRAY
 foreach ($row in $instances1.server_name) { 
 $ServiceStates +=   Get-DbaService -ComputerName $row


}


##################################################################

# FORMATING 
$ServiceStates | Format-Table 

 
######################################################################
# HOUSE KEEPING

Remove-Variable instances1
Remove-Variable ServiceStates
##################################################################REPEAT

}

checkDbs




