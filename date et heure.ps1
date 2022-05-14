$hour = (get-date).hour
$day = (get-date).day
$month = (get-date).month
$year = (get-date).year
$date = get-date -Format yy-MM-dd-HH-mm

$firstDay = Get-Date -Month 1 -Day 1 -Hour 0 -Minute 0 -Second 0
$lastDay = ($firstDay).AddMonths(1).AddSeconds(-1)

$moisdef = 0..12

For ($i=0;$i -lt 12;$i++) {
$mois = Get-Date -Month $($moisdef[$i+1]) -Day 1 -Hour 0 -Minute 0 -Second 0 -Format "MMMM"
$lastDay = [datetime]::DaysInMonth(14,$i+1)
write-host "Le mois de $mois comporte $lastDay jours."
}

$choix = read-host "Quel mois voulez-vous connaitre ?"
$choixmois = Get-Date -Month $choix -Day 1 -Hour 0 -Minute 0 -Second 0 -Format "MMMM"
write-host "Le mois est $choixmois"

Pause