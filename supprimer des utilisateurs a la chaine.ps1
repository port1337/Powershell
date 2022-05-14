$utilisateurs = import-csv users.csv -Delimiter ";"

foreach ($getuser in $utilisateurs) {
    if ($getuser.LOGIN -eq "") {
        Write-Host "L'utilisateur n'existe pas !"
    } else {
        Remove-LocalUser $getuser.LOGIN
    }
}