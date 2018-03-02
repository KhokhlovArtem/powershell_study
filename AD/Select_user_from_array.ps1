$users = 
"Antohina Natalia",
"Shcherbakova Albina",
"Rychkova Mariya",
"Lipskiy Sergey",
"Fedotkin Aleksey",
"Dubrovina Natalya",
"Gogoleva Viktoriya",
"Rastrigina Anastasia",
"Rozanov Dmitry",
"Grishanova Svetlana",
"Kravtsova Anastasiya",
"Bychkova Evgeniya",
"Gerasimova Olga",
"Artuganova Valentina",
"Karlieva Leila",
"Gudilov Roman",
"Kucherenko Yana",
"Dmitrieva Edita",
"Pleshko Aleksey",
"Kadatsky Ilya",
"Kotova Elena",
"Lebedinskii Oleg",
"Shevtsov Gleb",
"Sokolov Pavel",
"Shcherbina Vladimir",
"Nemaev Vladimir",
"Starostin Konstantin",
"Ivanovskii Stanislav",
"Maksim Prokhorov",
"Pakhomov Sergey",
"Boiko Artem",
"Larionova Iuliia",
"Iliushina Ekaterina",
"Vildanov Maksim",
"Demirova Leila",
"Teplitskii Vadim",
"Pavlushkina Elena",
"Kovalenko Ilia",
"Baimeshova Amina",
"Antonova Svetlana",
"Pavlenko Anastasiia",
"Maksimova Valeriia",
"Vorobev Aleksandr",
"Ivakhnenko Aleksandr",
"Petrova Kseniya",
"Egoreva Serafima",
"Deviatckii Pavel",
"Secretary"

$list = New-Object System.Collections.ArrayList

foreach ($user in $users)
{

$item = get-aduser -filter {displayname -eq $user} -Properties * | select SID,name,login,extensionAttribute1,extensionAttribute2,extensionAttribute3,extensionAttribute4, Company,Department,description,title,manager,DistinguishedName
#| Export-Csv -Path g:\study\ad\Select_user_from_array.csv -Encoding unicode -NoTypeInformation
$list.Add($item)
$item
}

$list | select name, DistinguishedName 
#get-aduser -filter {displayname -eq "Belova Anna"} -Properties * | select SID,name,extensionAttribute1,extensionAttribute2,extensionAttribute3,extensionAttribute4, Company,Department,description,title,manager  | ft name,description 