$machinename = $env:COMPUTERNAME
$username = $env:USERNAME
$coretype = $env:PROCESSOR_ARCHITECTURE
$corelv = $env:PROCESSOR_LEVEL
new-item informations.txt -type f
set-content informations.txt $machinename,$username,$coretype,$corelv