$utilisateurs = import-csv users.csv -Delimiter ";"

foreach ($getuser in $utilisateurs) {
    if ($getuser.LOGIN -eq "") {
        write-host "ERROR : L'utilisateur " $getuser.NOM " " $getuser.PRENOM " n'a pas de login defini."
    } elseif ($getuser.NOM -eq "") {
        write-host "ERROR : L'utilisateur " $getuser.LOGIN " n'a pas de nom defini."
    } elseif ($getuser.PRENOM -eq "") {
        write-host "ERROR : L'utilisateur " $getuser.LOGIN " n'a pas de prenom defini."
    } elseif ($getuser.PASSWORD -eq "") {
        write-host "ERROR : L'utilisateur " $getuser.LOGIN " n'a pas de mot de passe defini."
    } else {
        $password = (ConvertTo-SecureString -AsPlainText $getuser.PASSWORD -Force)
        $fullname = $getuser.NOM + ' ' + $getuser.PRENOM + '.'
        New-LocalUser $getuser.LOGIN -Password $password -FullName $fullname
        Add-LocalGroupMember -group $getuser.SERVICE -member $getuser.LOGIN
    }
}