---
layout: post
title:  "Windows 10 - klucz i kopia sterowników"
date:   2020-02-20 06:40
categories: System
---

Klucz licencyjny Windows 10 jest na ogół zachowany w BIOS.

Dlatego podczas (re)instalacji Windows warto wybierać opcję "Nie mam klucza MS Windows" - opisaną jako właściwy wybór dla klucza przechowywanego w BIOS. A w razie potrzeby posiadany klucz można podać potem.

<small>
Najnowsze wersje systemu Windows 10 bezwzględnie domagają się użycia konta Microsoft do zalogowania do systemu. Jeśli wolimy używać konta lokalnego, to można podać jakiś swój prawdziwy e-mail, bezsensowne hasło (nieprawdziwe) - Win10 pisze, że ma kłopot z zalogowaniem do konta, ale idzie dalej. Potem, w ramach rozwiązywania problemu z kontem można to przekształcić na konto lokalne.
</small>

### 1. Klucz licencyjny Windows 10

Często udaje się odczytać aktualny klucz licencyjny Windows 10 poleceniami:

PowerShell (Administrator)
````powershell
(Get-WmiObject -query 'select * from SoftwareLicensingService').OA3xOriginalProductKey
````

Wiersz polecenia jako administrator
````bat
wmic path softwarelicensingservice get OA3xOriginalProductKey
````

Są też narzędzia na stronie 
<https://www.nirsoft.net/>
choć czasem te programy jako zbyt głęboko grzebiące w systemie są uważane przez programy antywirusowe za niepewne.

Jeśli przenosimy system na sprzęt z nową płyta główną, to [Microsoft radzi używać logowania do Windows za pomocą konta Microsoft](https://support.microsoft.com/pl-pl/windows/ponowne-aktywowanie-systemu-windows-10-po-zmianie-sprz%C4%99towej-2c0e962a-f04c-145b-6ead-fb3fc72b6665) w poprzedniej konfiguracji systemu. Gdy zalogujesz się na to konto w nowej konfiguracji sprzętowej, to jakoś można przekonać system, że to jest właśnie ta konfiguracja, którą ma zaakceptować. (Nie testowałem).

W przypadku używania konta lokalnego użytkownika do logowania Windows: 
1. Jeśli spodziewamy się, że klucz jest w BIOS, to podczas czystej instalacji stwierdzamy "nie mam klucza" i potem sprawa się rozwiązuje automatycznie.
2. Jeśli jednak konieczne jest podawanie klucza to można próbować z tym kluczem odczytanym wcześniej.
3. [Gdy i to się nie powiedzie](https://answers.microsoft.com/pl-pl/windows/forum/windows_7-windows_install-winactivate/brak-po%C5%82%C4%85czenia-z-microsoft-problem-z/9914049e-e874-4987-95d6-942bc510cb20)  to jest metoda z aktywacją przez internet  
Start, wpisz `slui` [Enter], aktywacja przez internet  
lub z automatem telefonicznym: Start, wpisz `slui 4` [Enter]  

````
Wybierz kraj lub region
Polska
---------------------------------------------
(<-) Zadzwoń i podaj identyfikator instalacji

Zadzwoń pod jeden z tych numerów. Automatyczny system telefoniczny poprosi Cię 
o podanie identyfikatora instalacji (IID). W niektórych krajach lub regionach 
operatorzy lokalni mogę naliczać opłaty za połączenia z numerami bezpłatnymi.

Numer bezpłatny:
00 800 121 1654

Numer płatny:
(48) (22) 59419 99

Identyfikator instalacji:
   1       2       3       4       5       6       7       8       9
xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx xxxxxxx

        [Wprowadź id. potwierdzenia]    [Anuluj]
````

Podobnie można aktywować Office:
{: style="font-size: smaller;"}

Otwieramy pusty dokument Word
Manu: Plik \ Konto \ Wymagana aktywacja \ Zmień klucz produktu (25 znaków) [Zainstaluj]
{: style="font-size: smaller;"}

Ponowne uruchomienie  
Kreator aktywacji produktu  
(*) Chcę aktywować oprogramowanie przez telefon [Dalej] [OK] (2x)  
identyfikator instalacji oraz ident. potwierdzenia są jednorazowe  
{: style="font-size: smaller;"}

Można aktywować MS Office prze Internet  
ALBO aktywować przez telefon (działa pomimo komunikatu, [że dla tej wersji usługa nie jest aktywna](https://support.office.com/pl-pl/article/b%C5%82%C4%85d-%E2%80%9Eaktywacja-telefoniczna-nie-jest-ju%C5%BC-obs%C5%82ugiwana-dla-tego-produktu-podczas-aktywowania-pakietu-office-9b016cd2-0811-4cb3-b896-5a6a13177713)):  
Polska (48) (22) 594 19 99 (lub bezpłatne 00 800 121 1654) - czyli powyższe numery  
{: style="font-size: smaller;"}


### 2. Kopia sterowników

Warto sobie gdzieś zgrać aktualnie działające sterowniki. Gdy np. po reinstalacji systemu pojawi się na liście urządzenie z żółtym wykrzyknikiem (tzn. nie znaleziono sterownika) to można powiedzieć, że mam dysk i wskazać folder z tymi zgranymi sterownikami

Są w sieci porady polegające na skopiowaniu foldera:  
`C:\Windows\System32\DriverStore\FileRepository`

Albo za pomocą poleceń - 
[zob. www.drivereasy.com/knowledge/how-to-back-up-your-drivers-in-windows-10-easily](https://www.drivereasy.com/knowledge/how-to-back-up-your-drivers-in-windows-10-easily/):
{: style="font-size: smaller;"}

PowerShell (Administrator)
````powershell
Export-WindowsDriver -Online -Destination "D:\Drivers Backup"
````

Wiersz polecenia jako administrator
````bat
dism /online /export-driver /destination:"D:\Drivers Backup"
````

<style> pre code {font-size: smaller;} </style>

<!-- {% unless jekyll.environment %} -->
<script>

(function() {
  const images = document.getElementsByTagName('img'); 
  for(let i = 0; i < images.length; i++) {
    images[i].src = images[i].src.replace('%7B%7Bsite.baseurl%7D%7D','..');
  } //{{site.baseurl}} - without spaces!  
})();

</script>
<!-- {% endunless %} -->