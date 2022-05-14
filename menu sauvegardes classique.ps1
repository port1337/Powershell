$choix = read-host "Quel type de sauvegarde voulez-vous faire ?"

write-host "

    Quelle type de sauvegarde voulez-vous faire ?

        - [1] Totale
        - [2] Diférentielle
        - [3] Incrémentielle

"

if ($choix -eq "1") {
    $date = get-date -Format yy-MM-dd-HH-mm
    new-item "$env:USERPROFILE/Documents/save/$date/" -type d -force
    robocopy "$env:USERPROFILE/desktop/" "$env:USERPROFILE/Documents/save/$date/" /E /R:2 /W:2 /LOG+:informations.log /ETA
} elseif ($choix -eq "2") {
    $date = get-date -Format yy-MM-dd-HH-mm
    $age = (get-date).AddMonths(-3) -Format yyyyMMdd
    new-item "$env:USERPROFILE/Documents/save/$date/" -type d -force
    robocopy "$env:USERPROFILE/desktop/" "$env:USERPROFILE/Documents/save/$date/" /E /R:2 /W:2 /LOG+:informations.log /ETA /MAXAGE:$age /XO
} elseif ($choix -eq "3") {
    $date = get-date -Format yy-MM-dd-HH-mm
    new-item "$env:USERPROFILE/Documents/save/$date/" -type d -force
    robocopy "$env:USERPROFILE/desktop/" "$env:USERPROFILE/Documents/save/$date/" /E /R:2 /W:2 /LOG+:informations.log /ETA /M
}