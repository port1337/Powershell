$partage = read-host "Quel est le nom du partage que vous voullez créer"
$chemin = read-host "Donnez le chemin d'access au fichier"
$groups = get-localgroup
write-host "Liste des groupes : $groups"
$groupename = read-host "Quel est le nom du groupe auquel partager"

New-SmbShare -Name $partage -Path $chemin -ChangeAccess $groupename -FullAccess "Administrators"
write-host "Success"
pause