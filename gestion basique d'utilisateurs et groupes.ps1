function choix {
    if ($response -eq "1") {
        $users = get-localuser
        write-host "Liste des utilisateurs : $users"
        $username = read-host "Donnez le nom d'utilisateur"
        $password = read-host "Donnez le mot de passe de l'utilisateur" -AsSecureString
        new-localuser -name $username -password $password
    } elseif ($response -eq "2") {
        $groups = get-localgroup
        write-host "Liste des utilisateurs : $groups"
        $groupename = read-host "Donnez le nom du groupe"
        new-localgroup $groupename
    } elseif ($response -eq "3") {
        $users = get-localuser
        write-host "Liste des utilisateurs : $users"
        $username = read-host "Donnez le nom d'utilisateur"
        remove-localuser -name $username
    } elseif ($response -eq "4") {
        $groups = get-localgroup
        write-host "Liste des utilisateurs : $groups"
        $groupename = read-host "Donnez le nom du groupe"
        remove-localgroup $groupename
    } else {
        write-host "Choix invalide !"
        question
    }
}
function question {
$response = read-host "

Quel est votre choix ?

    [1] créer un utilisateur
    [2] créer un groupe
    [3] supprimer un utilisateur
    [4] supprimer un groupe

Choix"
choix
}
question