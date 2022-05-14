Foreach ($element in get-childitem C:\*.txt -recurse) {
    write-host "Nom du fichier : $($element.name), Taille : $($element.length) caractères."
    write-content fichiers.txt.txt "Nom du fichier : $($element.name), Taille : $($element.length) caractères."
}
pause