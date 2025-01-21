---
layout: post
title:  "Windows 10/11 - klucz i kopia sterowników"
date:   2020-02-20 06:40
categories: System
---


_+ 10.04.2024_{: .date} 
[1.Opcja "Nie mam klucza MS Windows"]({{site.url}}{{site.baseurl}}{{page.url}}#1-opcja-nie-mam-klucza-ms-windows) * 
[2.Odczyt klucza lic. Windows 10/11, aktywacja]({{site.url}}{{site.baseurl}}{{page.url}}#2-odczyt-klucza-lic-windows-1011-aktywacja) * 
[3.Gdy wolimy konto lokalne]({{site.url}}{{site.baseurl}}{{page.url}}#3-gdy-wolimy-konto-lokalne) * 
[4.Kopia sterowników]({{site.url}}{{site.baseurl}}{{page.url}}#4-kopia-sterowników) 

<style>.date{font-size: smaller;color:#828282;}</style>

### 1. Opcja "Nie mam klucza MS Windows"

Klucz licencyjny Windows 10/11 jest na ogół zachowany w BIOS.

Dlatego podczas (re)instalacji Windows warto wybierać opcję "Nie mam klucza MS Windows" - opisaną jako właściwy wybór dla klucza przechowywanego w BIOS. A w razie potrzeby posiadany klucz można podać potem.



### 2. Odczyt klucza lic. Windows 10/11, aktywacja 

Często udaje się odczytać aktualny klucz licencyjny Windows 10/11 poleceniami:

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
<small>choć czasem te programy jako zbyt głęboko grzebiące w systemie są uważane przez programy antywirusowe za niepewne</small>.

Zauważyłem, że taki klucz nie działa przy czystej instalacji na zmienionym sprzęcie. Ale raczej działa w przypadku, gdy jest ten sam sam sprzęt i np. pusty dysk (przypadek licencji cyfrowej nie powiązanej z kontem Microsoft). Gdy już mamy aktywowaną licencję cyfrową to można dodać konto Microsoft - jakiekolwiek np. zupełnie nowe - i skorzystać z możliwości zmiany sprzętu, na którym pojawi się poprawna aktywacja. Ponowna instalacja wyższego Windows np. 11 (a było 10) nawet na pustym/nowym dysku, po zalogowaniu na to konto Microsoft także daje poprawną aktywację.

Jeśli przenosimy system na sprzęt z nową płyta główną, to [Microsoft poleca używać logowania do Windows za pomocą **konta Microsoft**](https://support.microsoft.com/pl-pl/windows/ponowne-aktywowanie-systemu-windows-10-po-zmianie-sprz%C4%99towej-2c0e962a-f04c-145b-6ead-fb3fc72b6665) w poprzedniej konfiguracji systemu. Dotyczy to Windows 10 wersja 1607+. 

**Czyli** (testowałem dla przypadku licencji cyfrowej Win 10 z darmowej aktualizacji Win 8):

1. **Przed zmianą sprzętu**, na którym konto administratora jest kontem lokalnym dodaję do niego konto Microsoft (istniejące lub zakładam całkiem nowe), aby "System Windows został aktywowany przy użyciu licencji cyfrowej **połączonej z Twoim kontem Microsoft**." - zob. Ustawienia  > Aktualizacje i zabezpieczenia > Aktywacja. Warto też zadbać, żeby nazwa komputera była konkretna.
2. ![Aktywacja-rozwiazywanie_problemow.png]({{site.baseurl}}/assets/img/Aktywacja-rozwiazywanie_problemow.png "Aktywacja-rozwiazywanie_problemow.png"){: style="float:right;width:67%;margin:0px 0px 10px 10px"} 
Po zmianie sprzętu (i tym samym dysku - tak testowałem, ale może to nieważne) loguję się na to samo konto administratora (e-mail Microsoft). Systemu "nie można aktywować...".  
Wybieram **Rozwiązywanie problemów** - jest propozycja zakupu, 
a poniżej jest też link: "**W tym urządzeniu dokonano niedawno zmiany sprzętu**".
3. ![Aktywacja_ponowna.png]({{site.baseurl}}/assets/img/Aktywacja_ponowna.png "Aktywacja_ponowna.png"){: style="float:right;width:67%;margin:0px 0px 10px 10px"} 
Po wejściu w ten link zdarza się, że pojawia się błąd o niedostępności serwerów Microsoft i trzeba cierpliwie próbować później. Ale gdy już się dostajemy dalej to proces przebiega automatycznie:
    * pojawia się lista zarejestrowanych na to konto komputerów
    * na wybranej pozycji zaznaczam **[x] Używam teraz tego urządzenia**. [Aktywuj]

Uwaga! Gdy poprzedni sprzęt był dość stary, to być może dysk systemowy miał partycjonowanie MBR. Na nowym sprzęcie taki dysk nie będzie w ogóle widziany jako dysk systemowy. Po po wejściu w tryb awaryjny - konsola - można go [bezstratnie przerobić na GPT z pomocą `mbr2gpt.exe`](https://andrzejq.github.io/Office_S_Tips/system/2020/02/20/Backup_dysku_SSD.html#7-bezstratna-konwersja-dysku-z-mbr-na-gpt). To samo można zrobić na wczesnym etapie instalacji nowego Windows (np. na etapie wyboru partycji do instalacji) - po naciśnięciu [Shift + F10], [więcej » ](https://andrzejq.github.io/Office_S_Tips/system/2020/02/20/Backup_dysku_SSD.html#7-bezstratna-konwersja-dysku-z-mbr-na-gpt)


**To chyba dotyczy starszych wersji Windows, np. 7 czy 8**
Jeśli klucz na starszym działającym sprzęcie mamy przenieść na nowszy (np. gdy zmieniamy płytę gł.) to można (być może) przeprowadzić **deaktywację klucza**:
{: style="font-size: smaller;"}

1. [Win+X] wiersz poleceń jako administrator.
2. Odinstalowanie bieżącego klucza produktu z systemu Windows i wprowadzenie go w stan nielicencjonowany:  
`slmgr /upk`
3. Usunięcie klucza produktu z rejestru, jeśli nadal tam jest:  
`slmgr /cpky`
4. Zresetowanie liczników aktywacji systemu Windows, dzięki czemu nowi użytkownicy zostaną poproszeni o aktywację systemu Windows po włożeniu klucza:  
`slmgr /rearm`
{: style="font-size: smaller;"}

* Może się też udać aktualizacja systemu do wyższej wersji np. win 11:  
  <https://key-soft.pl/blog/aktualizacja-systemu-do-nowszej-wersji>  
  (aktualnie w 2024r wygląda na to, że nie można przejść bezpłatnie z Win8.1 na Win10)

.

W przypadku używania **konta lokalnego** użytkownika do logowania Windows: 
1. Jeśli spodziewamy się, że klucz jest w BIOS, to podczas czystej instalacji stwierdzamy "nie mam klucza" i potem sprawa się rozwiązuje automatycznie.
2. Jeśli jednak konieczne jest podawanie klucza to można próbować z tym kluczem odczytanym wcześniej. Ale warto próbować na tym samym sprzęcie (np. płyta główna) -zob. wyżej.
3. [Gdy i to się nie powiedzie](https://answers.microsoft.com/pl-pl/windows/forum/windows_7-windows_install-winactivate/brak-po%C5%82%C4%85czenia-z-microsoft-problem-z/9914049e-e874-4987-95d6-942bc510cb20)  to jest metoda z aktywacją przez internet lub telefon <small> - ale to raczej poniżej Windows 10 - 1607</small>:  
`⊞ Win`, wpisz `slui` [Enter], aktywacja przez internet  
lub z automatem telefonicznym: Start, wpisz `slui 4` [Enter]  
<small>Zdaje się, że od jakiegoś czasu numer `48 22...` nie działa. Na numer `00 800...` udaje się dodzwonić tylko z numeru telefonu stacjonarnego. VoIP nie działa.</small> 

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


### 3. Gdy wolimy konto lokalne

Najnowsze wersje systemu Windows 10/11 bezwzględnie domagają się użycia konta Microsoft do zalogowania do systemu. Jeśli wolimy używać konta lokalnego, to można: 
1. Zalogować się / zarejestrować na jakieś konto Microsoft, a potem dodać kolejnego użytkownika z kontem lokalnym (zwykle jest to opcja "nie znam danych logowania użytkownika).
2. Dawniej można było  
    a) podać jakiś bezsensowny e-mail lub bezsensowne hasło (nieprawdziwe) - ale to już raczej nie działa;  
    b) można było też nie dołączyć się od Internetu (nie podłączać kabla, nie dołączać się do WiFi) - co skutkowało pojawieniem się opcji do wybrania: "Nie mam Internetu".  
    Teraz jeśli powyższe zabiegi nie pomagają, to w momencie, gdy dochodzimy do logowania Microsoft (a może nawet wcześniej - podczas wyboru języka) [wydajemy ciąg poleceń](https://windowsbase.pl/pages/w11_bypassnetsetup.html): 
    * `⇧ Shift + F10` - otwiera się okno terminala.
    * Najpóźniej tu wyłączamy sieć (np. tryb samolotowy z pomocą klawiszy funkcyjnych).
    * W oknie terminala: `oobe\BypassNRO` `↵ Enter` - system zresetuje się i powróci z oknem konfiguracji sieci, ale z dodatkową możliwością "Nie mam Internetu"
    * Dalej "Kontynuuj z ograniczoną konfiguracją" i w "Wprowadź swoje imię" wpisujemy nazwę użytkownika lokalnego (niekoniecznie imię).
3. W przypadku Win 11 czy Win 10 - 1607+ może jednak lepiej używać konta Microsoft, a ewentualnie dodać potem konto lokalne. Jak wspomniałem wyżej - pozwala to też na przenoszenie licencji po dużej zmianie konfiguracji sprzętowej (np. po zmianie płyty głównej na akceptowaną przez Windows 11; sama zmiana dysku systemowego nie jest chyba traktowana jako duża i licencja nie wymaga przenoszenia).

### 4. Kopia sterowników

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