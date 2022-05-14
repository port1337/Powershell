$age = read-host 'Donner votre âge'

if ($age -ge 18) {
write-host 'Vous êtes majeur !'
} else {
write-host 'Vous êtes mineur !'
}
pause