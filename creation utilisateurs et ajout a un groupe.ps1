write-host "Veuilliez rentrer le login de l'utilisateur que vous voulez creer.\n"
$login = read-host "Réponse"

write-host "Veuillez rentrer le mot de passe de l'utilisateur que vous voulez creer.\n"
$pass = read-host "Réponse" -AsSecureString

write-host "Voulez-vous integrer l'utilisateur que vous venez de creer a un groupe ?\n"

$response = read-host "Réponse (oui/non)"

if ($response -eq "oui" -or $response -eq "Oui") {
write-host "Dans quel groupe voulez-vous ajouter votre utilisateur ?\n"
$choixgroupe = read-host "Réponse (nom du groupe)"
new-localuser $login -password $pass
add-localgroupmember -member $login -group $choixgroupe
write-host "L'utilisateur $login"
} else {
new-localuser $login -password $pass
}