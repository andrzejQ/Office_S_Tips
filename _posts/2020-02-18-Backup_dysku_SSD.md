---
layout: post
title:  "Backup dysku SSD i kopia ważnych plików"
date:   2020-02-20 06:41
categories: System
---

Przegląd kilku systemów backupu. <br/>
[1.&nbsp;Veeam Agent FREE]({{site.url}}{{site.baseurl}}{{page.url}}#1-veeam-agent-free) &nbsp; 
[2.&nbsp;Acronis True Image]({{site.url}}{{site.baseurl}}{{page.url}}#2-acronis-true-image) &nbsp; 
[3.&nbsp;Seagate Toolkit]({{site.url}}{{site.baseurl}}{{page.url}}#3-seagate-toolkit) &nbsp; 
[4.&nbsp;EasyUS]({{site.url}}{{site.baseurl}}{{page.url}}#4-easyus) &nbsp; 
[5.&nbsp;MS Windows 10]({{site.url}}{{site.baseurl}}{{page.url}}#5-ms-windows-10) &nbsp; 
[6.&nbsp;Robocopy (Robust File Copy)]({{site.url}}{{site.baseurl}}{{page.url}}#6-robocopy-robust-file-copy) &nbsp; 
[7.&nbsp;Bezstratna konwersja dysku z MBR na GPT]({{site.url}}{{site.baseurl}}{{page.url}}#7-bezstratna-konwersja-dysku-z-mbr-na-gpt) &nbsp; 
[8.&nbsp;Uwagi]({{site.url}}{{site.baseurl}}{{page.url}}#8-uwagi) &nbsp; 

To nie jest profesjonalne porównanie. Raczej jest to coś co wypróbowałem i oceniałem pod kątem łatwości odtwarzania i przeglądania historycznych plików. Także istotne jest dla mnie poprawne odtwarzanie plików zaszyfrowanych EFS - tak, że są zakryte dla nie-właściciela, a deszyfrowalne dla właściciela, również w historii plików (uwaga - backup z plikami EFS testowałem tylko dla partycji docelowej NTFS i backupu całych partycji; w innych przypadkach może to działać inaczej). W domowych zastosowaniach backup zaszyfrowanych plików może nie być istotny (a w Windows Home szyfrowanie EFS jest w ogóle niedostępne).

![VeeamBackupJob.png]({{site.baseurl}}/assets/img/VeeamBackupJob.png "VeeamBackupJob.png"){: style="float:right;width:60%;"}
### 1. Veeam Agent FRE

* [Autonomiczne narzędzie **Veeam Agent for Microsoft Windows FREE** - download](https://www.veeam.com/products/free/microsoft-windows-download.html) (trzeba się najpierw zarejestrować / zalogować)
* Edycja Free nie wymaga kupowania licencji (gdy jest pytanie czy instalowć licencję, to odpowiadamy "Nie").
![veeamAgLicNo.png]({{site.baseurl}}/assets/img/veeamAgLicNo.png "veeamAgLicNo.png"){: style="float:right;width:37%;"} 
* Można robić kopię zapasową całych partycji i/albo wybranych folderów - "albo" dotyczy edycji Free, bo można w tej wersji mieć tylko 1 zadanie. Korzystnie jest od razu robić kopię dysku systemowego + partycja z danymi, jeśli jest na innym dysku. Do kopii wybranych danych można użyć [Historii plików MS Windows - zob. niżej](#5-ms-windows-10). (Można też użyć Acronis True Image OEM do kopii całego dysku SSD, a Veeam Agent Free do wybranych folderów na innym dysku)
* Podczas kopiowania całych partycji działa bardzo szybko (np. 5 minut dla dysku SSD 240GB), nie wymaga przerywania pracy na komputerze (VSS-Volume Snapshot Service/[Volume Shadow Copy Service](https://docs.microsoft.com/en-us/windows-server/storage/file-server/volume-shadow-copy-service)), tworzy kopie przyrostowe (w czasie pojedynczych minut).
* Pozwala na wygodne przeglądanie folderów/plików w kopii zapasowej całej partycji (także tej przyrostowej) i wyciąganie pojedynczych plików, w tym zaszyfrowanych plików EFS różnych użytkowników (każdy widzi zawartość tylko swoich plików EFS).
* Tworzy dysk ratunkowy z dołączonymi sterownikami (co najmniej warto sobie zrobić plik ISO na zewnętrznym dysku, żeby się było jak ratować, gdy komputer nie startuje)
* Chyba nie ma wersji językowej polskiej.
* Co jakiś czas warto wykonać "Active Full Backup", względem którego będą wykonywane kolejne kopie przyrostowe. <small>"Standalone Full Backup" to pełna kopia zapasowa, która nie ma związku z łańcuchem kopii przyrostowych. Można ją zapamiętać w osobnym miejscu.</small>

* [BitLocker Encrypted Volumes Support](https://helpcenter.veeam.com/docs/agentforwindows/userguide/bitlocker.html?ver=40)


.


### 2. Acronis True Image

#### Acronis True Image OEM

* W wersji bez opłaty pozawala na klonowanie dysku i kopię bezpieczeństwa całych partycji czy dysków.
* Działa bardzo szybko (klika minut dla dysku 240GB), nie wymaga przerywania pracy (VSS-Volume Snapshot Service/[Volume Shadow Copy Service](https://docs.microsoft.com/en-us/windows-server/storage/file-server/volume-shadow-copy-service)), tworzy kopie przyrostowe.
* Pozwala na wygodne przeglądanie folderów/plików na kopii zapasowej partycji *.tib (także tej przyrostowej) i wyciąganie pojedynczych plików.
* [Bywa dołączane](https://kb.acronis.com/content/2201) do dysków SSD,  i zewnętrznych dysków USB, np. 
[ADATA (?)](https://www.adata.com/us/support/online?tab=downloads), [Western Digital](https://support.wdc.com/downloads.aspx?lang=pl), [Seagate](https://www.seagate.com/support/downloads/discwizard/), [Kingston](https://www.kingston.com/en/support/technical/acronis-download), [Crucial](http://www.crucial.com/clone), [OCZ (Toshiba)](https://ssd.toshiba-memory.com/en-amer/download/acronis), [SanDisk](https://kb.sandisk.com/app/answers/detail/a_id/19869/~/acronis-true-image-support-information), [PNY](http://www.pny.com/qr/acronis-install).
* Czasem potrzebny jest 16-znakowy klucz (Kingston, Adata), a czasem wystarczy, że dołączony jest odpowiedni dysk danej marki (przynajmniej jeden).
* Wersja OEM ma ograniczoną funkcjonalność w stosunku do wersji pełnej Acronis True Image. Brakujące moduły są wyszarzone.
* Dobrze sobie radzi z zaszyfrowanymi plikami EFS różnych użytkowników.
* Po uruchomieniu backupu wrzuca do systemu kilka programów działających automatycznie i kilka automatycznie uruchamianych serwisów - nie widać spowalniania, ale ciągle coś działa.
* Nośnik startowy Acronis (warto sobie zrobić), np. na DVD lub pendrive, pozwala też na klonowanie dysków. Nośnik ratunkowy oparty na systemie Linux radzi sobie z plikami zablokowanymi w Windows. <small> Choć podobno nośnik z WinPE działa szybciej.</small> Uwaga: Nośnik ratunkowy musi być uruchomiony w trybie BIOS takim samym jak tryb dysku systemowego - np. UEFI BIOS (a nie starszy MBR/BIOS) - w tym celu należy podczas uruchamiania włączyć [menu bootowania (np. F8, F10, F12, F2, Esc itp.)](https://techofide.com/blogs/boot-menu-option-keys-for-all-computers-and-laptops-updated-list-2021-techofide/).


![Seagate_DiscWizart.png]({{site.baseurl}}/assets/img/Seagate_DiscWizart.png "Seagate_DiscWizart.png"){: style="float:right;width:60%;"}
**Przykład:**

#### Seagate DiscWizart <br>(=Acronis True Image OEM)

**Instalacja**

W niektórych systemach pojawia się ostrzeżenie, że nie można uruchomić harmonogramu zadań i proponowany jest restart komputera
- Restart

Po instalacji odinstalowuję program
- Bonjur 

jeśli zainstalował się razem z Acronis. Program wydaje mi się zbędny. Wyłączam też programy Acronis z autostartu, ale i tak ciągle działa kilka serwisów Acronis.

Po starcie Seagate DiscWizart:
1. Backup
2. Wpisuję nazwę sugerującą, że to backup dysku C.
3. Źródło: [Disk and partitions] (Tu widać, że "Files and Folders" jest zablokowane w tej wersji) Wybrać cały dysk SSD z C.
4. Cel: Albo dysk zewnętrzny, albo [Browse...] \ Mój komputer \ Dysk zewnętrzny \ Folder z moją nazwą.
5. Backup Now (ma też opcje "Za godzinę", ...).


Dodatkowo warto sobie utworzyć zewnętrzny nośnik startowy, a co najmniej zapisać plik ISO na zewnętrznym nośniku, aby w razie potrzeby w przyszłości nagrać płytę lub dysk USB:
- Tools \ Rescue Media Builder


.

![ToolkitIcon.jpg]({{site.baseurl}}/assets/img/ToolkitIcon.jpg "ToolkitIcon.jpg"){: style="float:right;width:12%;"}
### 3. Seagate Toolkit

Narzędzie dołączane do zewn. dysków USB Seagate. Pozwala na backup wybranych folderów/plików. Po uruchomieniu siedzi w zasobniku obok zegara. (Być może podobne aplikacje są dostarczane z dyskami innych producentów).

Jest instrukcja po polsku: <https://www.seagate.com/pl/pl/support/software/toolkit/>, 
ale chyba nie ma języka polskiego w aplikacji.

##### [Backup]

Gdy chcemy sami zdecydować co zapamiętywać:
* Custom (poniżej [Backup now])
	* Advanced
		* Można coś pozaznaczać i wewnątrz dodatkowo odznaczać...
		* (aplikacja obiecuje, że po pierwszym pełnym backupie w kolejnych są uwzględniane tylko zmiany i ma być szybciej)


Wygląda na to, że backup to pliki w folderze:

	<DyskUSB>:\Toolkit\Backup\<NazwaKomp>\

Na koniec backupu zamykam aplikację `Toolkit`, bo od razu zaczyna się męczyć nad robieniem kopii przyrostowej (a może różnicowej - nie sprawdzałem).

.

### 4. EasyUS

#### EaseUS Todo Backup Free 12.0 

Nawet w wersji darmowej może wykonać sporo dobrej roboty. Kopia dysku / partycji SSD jest wygodnie przeszukiwalna - można docierać do dowolnego pliku. A równocześnie ma opcję kopii zapasowej folderów. Nabrałem wątpliwości, czy poprawnie są zapamiętywane pliki zaszyfrowane EFS i porzuciłem dalsze próby - być może są to wątpliwości niezasadne. Ogólnie jest to bardzo użyteczne narzędzie kopii zapasowej.

.

### 5. MS Windows 10

Backup całego dysku to nierozwijana od Win10 1709 aplikacja z Windows 7. Nie używam. 

![Win10HistoriaPlikow.png]({{site.baseurl}}/assets/img/Win10HistoriaPlikow.png "Win10HistoriaPlikow.png"){: style="float:right;width:53%;margin:0px 0px 10px 10px"}
Kopia zapasowa plików jest w opcji "**Historia plików**" [zob. szczegółową instrukcję na https://trybawaryjny.pl/](https://trybawaryjny.pl/backup-plikow-windows10/). Używam historii plików, bo jest dobrze zintegrowana w systemie plików Windows. Historia jest zapamiętywana w miejscu tymczasowym i co jakiś czas pojawia się zachęta do podłączenia dysku zewnętrznego w celu zabezpieczenia kopii.

![Win10HistoriaPlikow-wersje.png]({{site.baseurl}}/assets/img/Win10HistoriaPlikow-wersje.png "Win10HistoriaPlikow-wersje.png"){: style="float:left;width:42%;margin:10px 10px 10px 0px"}
Interfejs historii plików przypomina przeglądanie slajdów. Równocześnie dostępne wersje historii są dostępne we właściwościach pliku.



<small>Być może pliki użytkownika zaszyfrowane EFS są też zaszyfrowane w kopii (gdy kopia jest na NTFS to widać kłódkę na ikonie pliku). Wydaje się, że pliki EFS innych użytkowników są pomijane.</small>

<div>Pamiętaj:</div>{: style="clear:left"}

1. "Opcje kopii zapasowych" pozwalają dodawać / wykluczać foldery. Dodaj swoje foldery, jeśli masz dane poza standardowymi bibliotekami jak Dokumenty, Obrazy, Pulpit, ...
2. Gdy zmieniasz dysk/system to podczas pierwszego włączenia nośnika ze starą historią plików masz **jednorazowe(!) pytanie** czy przyłączyć tą historię do aktualnego dysku.

.

### 6. Robocopy (Robust File Copy)

#### Robocopy jako polecenie kopii zapasowej (dla zaawansowanych)

Ważne: to działa w oknie poleceń `cmd` (czarnym) lub `PowerShell`, a także w wierszu polecenia w trybie awaryjnym Windows.

	robocopy "D:\Dokumenty" "F:\Backup\Dokumenty" *.* /E /MIR /XJD /XA:SH /R:1 /W:3 /COPYALL /EFSRAW /ZB

`/E` - kopiuj podfoldery, także puste  
`/MIR` - mirror; usuwa w kopii to co usunięte w źródle  
`/XJD` - pomijanie linków symbolicznych - junction directory  
`/XA:SH` - pomiń pliki systemowe i ukryte  
`/R:1 /W:3` - powtarzanie, czekanie (sek.)  
`/COPYALL` - kopiuj wszystkie inf. o pliku (= `/COPY:DATSOU`; ->do Linux użyj: `/COPY:DT`)  
`/EFSRAW` - kopiuj pliki zaszyfrowane w trybie EFS RAW mode (nie używaj w tym przypadku `/MT`)  
`/ZB` - Tryb restartowania; gdy plik zablokowany użyj trybu Backup  

`/LOG:C:\LogFileName.txt /TEE /NP`   (`/NP` = NOT show the progress - nie pokazuj postępu w log)  
`/LOG+:C:\LogFileName.txt /TEE /NP`  
`/TEE`   - log na w konsoli jak i zapisywany do pliku  
(`/XD "folder"` `/XF "plik"` - pomiń podany folder lub plik)

Kolejny przykład - kopiowanie całych dysków z wykluczeniem pewnych folderów (uruchom w trybie administratora):


	robocopy a:\. b:\. *.* /E /XJ /XA:SH /R:1 /W:3 /COPYALL /DCOPY:DAT /MT /ZB /XO /XD "a:\$RECYCLE.BIN" "a:\tmp" "a:\Recovery" "a:\System Volume Information" /TEE /NFL /NDL /LOG+:robocopy_log.txt

W tym przykładzie `a:` i `b:` to nazwa dysku źródłowego i docelowego.  
Uwaga 1: Na koniec nazwy foldera ukośnik **nie może występować**.  Stąd odwołanie do głównych folderów dysku przez `\. `.  
Uwaga 2: Gdy pliki zaszyfrowane mają w kopii pozostać zaszyfrowane to zamiast opcji `/MT` (MultiThreaded) należy wstawić opcję `/EFSRAW`. (Można też czasowo wyłączyć program antywirusowy).  
Uwaga 3: Pomimo zmiany kodowania znaków w oknie poleceń (`chcp 65001`) zdaje się, że `/LOG` jest i tak w kodowaniu `OEM852`. `/UNILOG` ma dawać kodowanie Unicode, ale chyba wycina polskie znaki (?). Opcje `/NFL /NDL` powodują, że plik LOGu nie jest olbrzymi, a zawiera ważne informacje o ewentualnych problemach.  
Ciekawostka - opcja `/DCOPY:DAT` powoduje ustawienie dat folderów jak źródłowe, nawet jeśli żadne pliki nie wymagają skopiowania, bo np. są nie-nowsze. Można więc tego używać do naprawy dat folderów na dysku docelowym.
`/TEE`   - komunikaty zarówno na konsoli jak i w pliku Log.
`/XO`    - eXclude Older - jeśli plik docelowy istnieje i ma tę samą datę lub nowszą niż źródło - nie nadpisuj  
`/XJ`    - pomijaj dowiązania symboliczne (opcja domyślna - można nie podawać)  
`/XD`    - pomijaj foldery wymienione na liście (UWAGA: pełne ścieżki, ewentualnie względem źródłowego, [ale tylko 1 poziom](https://superuser.com/questions/690839/robocopy-xd-wont-work-with-relative-paths))  
`/NFL`   - No File List - w logu nie pokazuj nazw plików  
`/NDL`   - No Directory List - w logu nie pokazuj nazw folderów  


#### Inne przykłady `robocopy`:

- zobacz <https://andrzejq.github.io/El_Prog/programowanie/2019/09/07/RoboCopy.html>

**Dokumentacja:**

* <https://ss64.com/nt/robocopy.html>
* <https://docs.microsoft.com/pl-pl/windows-server/administration/windows-commands/robocopy>
* <https://adamtheautomator.com/robocopy-the-ultimate/>

[Notatki - robocopy_as_backup.txt]({{site.baseurl}}/assets/files/robocopy_as_backup.txt)

### 7. Bezstratna konwersja dysku z MBR na GPT

Gdy mamy nowe dyski, to warto je konwertować z formatu MBR na GPT (co daje do 128 partycji zamiast 4, pojemność dysku > 2TB).  

Jest wiele sposobów na taką konwersję, które wiążą się wyczyszczeniem danych(!)  
<https://www.dell.com/support/kbdoc/pl-pl/000137854/konwertowanie-dysku-twardego-z-mbr-na-gpt>

**Ale można też skorzystać z bezstratnego konwertera [`mbr2gpt.exe`](https://learn.microsoft.com/en-us/windows/deployment/mbr-to-gpt) dostępnego w Win10+**. Działa domyślnie w trybie awaryjnym, ale może też działać w pełnym systemie win10+. Na początek należy uruchomić `diskpart`,  >`list disk`, żeby odczytać numer dysku, a przy okazji sprawdzić partycjonowanie GPT.  
<small>Pamiętaj: Upewnij się, że BIOS obsługuje UEFI. Po przekonwertowaniu dysku na GPT, przestaw BIOS na tryb UEFI zamiast Legacy BIOS.</small>  
`diskpart`  
DISKPART> `list disk`

    Disk ###  Status   Size     Free     Dyn  Gpt
    --------  -------  -------  -------  ---  ---
    Disk 0    Online   1863 GB  9024 KB
    Disk 1    Online    465 GB  2048 KB        *

DISKPART> `exit`

Weryfikacja dysku np. dysku 0: `mbr2gpt /validate /disk:0`

Konwersja, gdy nie ma błędów: `mbr2gpt /convert /disk:0`

Uwaga: Jeśli instalujemy Windows na nowo to wybierając nośnik instalacyjny bieżemy ten z `UEFI:`.


**Odzyskanie partycji skasowanej podczas zmiany z MBR na GPT**

Jeśli podczas montowania dysku MBR Windows10 zmusi nas do zainicjowania go jako GPT, to powstaje pusty dysk i nie widać partycji z danymi. 
Może się udać odzyskanie takiej partycji z pomocą TestDisk:  
<https://www.cgsecurity.org/wiki/TestDisk_Krok_po_kroku>


### 8. Uwagi


**Uwaga: Wiersz polecenia, tryb awaryjny**

W trybie awaryjnym system startuje na dysku wirtualnym `[X:\]` i mapuje dyski fizyczne do innych liter. Jeśli w tym trybie w wierszu polecenia używasz `robocopy` (lub `mklink /j` żeby utworzyć dowiązanie symboliczne do folderu) to mogą się przydać instrukcje:
`diskpart`  
`list volume`
`select volume <nr>`
`list volume`
`assign letter=L`
.



**Konwersja RAID -> AHCI**

Podobno dla dysków SSD lepsze jest AHCI. W laptopach z jednym dyskiem HDD zdarza się konfiguracja RAID. Po przełożeniu dysku HDD na SSD można zmienić konfigurację z RAID na ACI bez reinstalacji systemu
* [Switch RAID to AHCI without reinstalling Windows 10](https://superuser.com/questions/1280141/switch-raid-to-ahci-without-reinstalling-windows-10) - porada z wejściem w tryb awaryjny (safe mode). To działa też w Windows 11. Pamiętaj, że po wejściu w tym awaryjny nie zadziała [Win+X] \ Terminal(Administrator). Trzeba zgodnie z instrukcją wywołać "cmd" w trybie administratora.
* [RAID vs. AHCI, Which One Should I Choose?](https://www.ubackup.com/articles/raid-vs-ahci-jkzbj.html) - rozdział "How to Switch from RAID to AHCI in Windows 10" (taka sama procedura jak powyżej, na końcu artykułu są polecenia i zrzuty ekranu).

.

**Właściciel plików i folderów**

Podczas zamontowania dysku z innego systemu można dla całego dysku i wszystkich podfolderów zmienić właściciela na siebie (ale nie jest to konieczne):

Ten komputer \ <dysk> - właściości \ Zabezpieczenia \ [Zaawansowane] \ Właściciel - Zmień.


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