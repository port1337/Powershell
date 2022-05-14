$password1 = "Bxl#1090"
$password2 = "Bxl#1060"
$password3 = "Bxl#1080"
$password4 = "Bxl#1020"
$password5 = "Bxl#1030"
new-localuser "user1" -name "Bdorian" -Password $password1 -PasswordNeverExpires
new-localuser "user2" -name "Flaney" -Password $password2 -PasswordNeverExpires
new-localuser "user3" -name "Erodrigo" -Password $password3 -usermaynotchangepassword -PasswordNeverExpires
new-localuser "user4" -name "Amalik" -Password $password4 -usermaynotchangepassword
new-localuser "user5" -name "Rpedri" -Password $password5 -usermaynotchangepassword
new-localgroup "Achats" -description "Groupe dédié aux Achats."
new-localgroup "Secretariat" -description "Groupe pour les Secretaires."
new-localgroup "Production" -description "Groupe pour la Production."
add-localgroupmember -member "user1","user2" -group "Achats"
add-localgroupmember -member "user3", -group "Secretariat"
add-localgroupmember -member "user4","user5" -group "Production"