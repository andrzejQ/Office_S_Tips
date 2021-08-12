---
layout: post
title:  "Backup dysku SSD i kopia ważnych plików"
date:   2020-02-20 06:41
categories: System
---

Przegląd kilku systemów backupu.

To nie jest profesjonalne porównanie. Raczej jest to coś co wypróbowałem i oceniałem pod kątem łatwości odtwarzania i przeglądania historycznych plików. Także istotne jest dla mnie poprawne odtwarzanie plików zaszyfrowanych EFS - tak, że są zakryte dla nie-właściciela, a deszyfrowalne dla właściciela, również w historii plików (uwaga - backup z plikami EFS testowałem tylko dla partycji docelowej NTFS i backupu całych partycji; w innych przypadkach może to działać inaczej)

![VeeamBackupJob.png]({{ site.baseurl }}/assets/img/VeeamBackupJob.png "VeeamBackupJob.png"){:style="float:right;width:60%;"}
### 1. Veeam Agent FREE

Np. * [Veeam Agent for Microsoft Windows FREE - download](https://www.veeam.com/windows-backup-free-download.html) (trzeba się najpierw zarejestrować)

* Edycja Free nie wymaga kupowania licencji. 
* Można robić kopię zapasową całych partycji i/albo wybranych folderów - "albo" dotyczy edycji Free, bo można w tej wersji mieć tylko 1 zadanie. (Można np. użyć Acronis True Image OEM do kopii całego dysku SSD, a Veeam Agent Free do wybranych folderów na innym dysku)
* Podczas kopiowania całych partycji działa bardzo szybko (np. 5 minut dla dysku SSD 240GB), nie wymaga przerywania swojej pracy (VSS-Volume Snapshot Service/[Volume Shadow Copy Service](https://docs.microsoft.com/en-us/windows-server/storage/file-server/volume-shadow-copy-service)), tworzy kopie przyrostowe (w czasie pojedynczych minut).
* Pozwala na wygodne przeglądanie folderów/plików w kopii zapasowej całej partycji (także tej przyrostowej) i wyciąganie pojedynczych plików, w tym zaszyfrowanych plików EFS różnych użytkowników (każdy widzi zawartość tylko swoich plików EFS).
* Tworzy dysk ratunkowy z dołączonymi sterownikami.
* Chyba nie ma wersji językowej polskiej.

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
* Wersja OEM ma ograniczoną funkcjonalność w stosunku do wersji pełnej Acronis True Image.
* Dobrze sobie radzi z zaszyfrowanymi plikami EFS różnych użytkowników.


![Seagate_DiscWizart.png]({{ site.baseurl }}/assets/img/Seagate_DiscWizart.png "Seagate_DiscWizart.png"){:style="float:right;width:60%;"}
**Przykład:**

#### Seagate DiscWizart <br>(=Acronis True Image OEM)

**Instalacja**

W niektórych systemach pojawia się ostrzeżenie, że nie można uruchomić harmonogramu zadań i proponowany jest restart komputera
- Restart

Po instalacji odinstalowuję program
- Bonjur 

jeśli zainstalował się razem z Acronis. Program wydaje mi się zbędny.

Po starcie Seagate DiscWizart:
1. Backup
2. Wpisuję nazwę sugerującą, że to backup dysku C.
3. Źródło: [Disk and partitions] (Tu widać, że "Files and Folders" jest zablokowane w tej wersji) Wybrać cały dysk SSD z C.
4. Cel: Albo dysk zewnętrzny, albo [Browse...] \ Mój komputer \ Dysk zewnętrzny \ Folder z moją nazwą.
5. Backup Now (ma też opcje "Za godzinę", ...).


Dodatkowo warto sobie utworzyć:
- Tools \ Rescue Media Builder

(co najmniej zrobić sobie plik ISO, aby w razie potrzeby w przyszłości nagrać płytę lub dysk USB).

.

![ToolkitIcon.jpg]({{ site.baseurl }}/assets/img/ToolkitIcon.jpg "ToolkitIcon.jpg"){:style="float:right;width:12%;"}
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

Backup całego dysku to nierozwijana od Win10 1709 aplikacja z Windows 7. Kopia zapasowa plików jest w opcji "[Historia plików](https://trybawaryjny.pl/backup-plikow-windows10/)" podobno też wygaszanej. 

Jak chodzi o przejrzystość docierania do plików historycznych to interfejs jest trochę niewygodny (moim zdaniem). Być może pliki użytkownika zaszyfrowane EFS są też zaszyfrowane w kopii (gdy kopia jest na NTFS to widać kłódkę na ikonie pliku). Wydaje się, że pliki EFS innych użytkowników są pomijane.

Pamiętaj:
1. "Opcje kopii zapasowych" pozwalają dodawać / wykluczać foldery. Dodaj swoje foldery, jeśli masz dane poza standardowymi bibliotekami jak Dokumenty, Obrazy, Pulpit, ...
2. Gdy zmieniasz dysk/system to podczas pierwszego włączenia nośnika ze starą historią plików masz jednorazowe(!) pytanie czy przyłączyć tą historię do aktualnego dysku.

.

### 6. Robocopy (Robust File Copy)

#### Robocopy jako polecenie kopii zapasowej

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
`/XD`    - pomijaj foldery wymienione na liście  
`/NFL`   - No File List - w logu nie pokazuj nazw plików  
`/NDL`   - No Directory List - w logu nie pokazuj nazw folderów  


#### Inne przykłady `robocopy`:

Lista plików większych niż....

	ROBOCOPY . "..\_%date%_%time::=.%" *.* /L /S /nDL /nC /nJH /nJS /min:44444444

* Folder docelowy powinien być pusty! (tutaj to jest `"..\_%date%_%time::=.%"`); /L - tylko wyświetlaj; min:bajtów
		
Lista plików nie starszych niż 7 dni (maxage:n; gdy n < 1900 to n = liczba dni, inaczej data n = YYYYMMDD):

	ROBOCOPY . "..\_%date%_%time::=.%" *.* /L /S /nDL /maxAge:7

* /nS - bez rozmiaru, więc dostajemy same nazwy plików; albo /TS - będzie rozmiar i czas 
* Usuwając /L dostaniemy kopiowanie wybranych plików

Kopiowanie (po usunięciu `/L`) plików z 3 ostatnich dni, nie większych niż (`/MAX`) 20MB z pominięciem (`/XD`) niektórych folderów:

	ROBOCOPY "C:\SOURCE" "d:\dest" *.* /L /S /nDL /MAX:20971520 /XD .git SeaDriverCache "Google Drive" "c:\temp" /maxAge:3

<small>
/L : List only; /S : copy Subfolders; /nDL : no Directory List
</small> 

**Dokumentacja:**

* <https://ss64.com/nt/robocopy.html>
* <https://docs.microsoft.com/pl-pl/windows-server/administration/windows-commands/robocopy>
* <https://adamtheautomator.com/robocopy-the-ultimate/>


[Notatki - robocopy_as_backup.txt]({{ site.baseurl }}/assets/files/robocopy_as_backup.txt)

**Uwaga: Wiersz polecenia, tryb awaryjny**

W trybie awaryjnym system startuje na dysku wirtualnym `[X:\]` i mapuje dyski fizyczne do innych liter. Jeśli w tym trybie w wierszu polecenia używasz `robocopy` lub `mklink /j` żeby utworzyć dowiązanie symboliczne do folderu to mogą się przydać instrukcje:
`diskpart`  
`list volume`
`select volume <nr>`
`list volume`
`assign letter=L`
.


**Odzyskanie partycji skasowanej podczas konwersji dysku z MBR na GPT**

Gdy mamy nowe dyski, to warto je konwertować z formatu MBR na GPT.  
<https://www.dell.com/support/kbdoc/pl-pl/000137854/konwertowanie-dysku-twardego-z-mbr-na-gpt>

Jeśli podczas montowania dysku MBR Windows10 zmusi nas do zainicjowania go jako GPT, to powstaje pusty dysk i nie widać partycji z danymi. 
Może się udać odzyskanie takiej partycji z pomocą TestDisk:  
<https://www.cgsecurity.org/wiki/TestDisk_Krok_po_kroku>

**Właściciel plików i folderów**

Podczas zamontowania dysku z innego systemu można dla całego dysku i wszystkich podfolderów zmienić właściciela na siebie (ale nie jest to konieczne):

Ten komputer \ <dysk> - właściości \ Zabezpieczenia \ [Zaawansowane] \ Właściciel - Zmień.
