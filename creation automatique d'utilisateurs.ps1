$utilisateurs = import-csv users.csv -Delimiter ";"

foreach ($getuser in $utilisateurs)
{
    $password = (ConvertTo-SecureString -AsPlainText $getuser.PASSWORD -Force)
    $fullname = $getuser.NOM + ' ' + $getuser.PRENOM + '.'
    New-LocalUser $getuser.LOGIN -Password $password -FullName $fullname -Description "Auto create."
    Add-LocalGroupMember -group $getuser.SERVICE -member $getuser.LOGIN
}