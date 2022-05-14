$hour = (get-date).hour
$day = (get-date).day
$month = (get-date).month
$year = (get-date).year

$jour = read-host "Quel est le jour de sauvegarde ?"
$mois = read-host "Quel est le mois de sauvegarde ?"

$date = Get-Date -Day $jour -Month $mois -Format yyyyMMdd
$datepath = get-date -Format yy-MM-dd-HH-mm
$date1 = Get-Date -Day $jour -Month $mois
$lastDay = ($date1).AddMonths(1).AddSeconds(-1)

$cheminsource = "$env:USERPROFILE/desktop/"
$chemindestot = "$env:USERPROFILE/Documents/sauvegarde/tot/$datepath/"
$chemindestinc = "$env:USERPROFILE/Documents/sauvegarde/inc/$datepath/"
$chemindestdif = "$env:USERPROFILE/Documents/sauvegarde/dif/$datepath/"

function TOTALE {
new-item $chemindestot -type d -force
robocopy $cheminsource $chemindestot /E /R:2 /W:2 /LOG+:informations.log /ETA
write-host "La sauvegarde totale a bien ete effectue"
}

function DIFERENTIELLE {
new-item $chemindestdif -type d -force
robocopy $cheminsource $chemindestdif /E /R:2 /W:2 /LOG+:informations.log /ETA /MAXAGE:$date /XO
write-host "La sauvegarde diferentielle a bien ete effectue"
}

function INCREMENTIELLE {
new-item $chemindestinc -type d -force
robocopy $cheminsource $chemindestinc /E /R:2 /W:2 /LOG+:informations.log /ETA /M
write-host "La sauvegarde incrementielle a bien ete effectue"
}

Try {
if ($jour -eq 31 -and $mois -eq 12) {

TOTALE

} elseif ($lastDay -eq $jour) {

DIFERENTIELLE

} else {

INCREMENTIELLE

}
} Catch {write-host "Une erreur est survenue !"}