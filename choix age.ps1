$age = read-host 'Donner votre �ge'

if ($age -ge 18) {
write-host 'Vous �tes majeur !'
} else {
write-host 'Vous �tes mineur !'
}
pause