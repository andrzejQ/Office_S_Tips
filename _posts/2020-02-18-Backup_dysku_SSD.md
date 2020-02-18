---
layout: post
title:  "Backup dysku SSD i kopia ważnych plików"
date:   2020-02-18 18:41
categories: System
---

Testy kilku systemów backupu.

To nie jest profesjonalne porównanie. Raczej jest to coś co wypróbowałem i oceniałem pod kątem w miarę komunikatywnego orientowania się w tym co i kiedy jest zapamiętywane. Pod kątem przejrzystej możliwości odtwarzania i przeglądania historycznych plików. Także istotne jest dla mnie poprawne odtwarzanie plików zaszyfrowanych EFS - tak, że są zakryte dla nie-właściciela, a deszyfrowalne dla właściciela.

### 1. MS Windows 10

Backup całego dysku to nierozwijana aplikacja z Windows 7. Kopia zapasowa plików jest w opcji "Historia plików" podobno też wygaszanej. Chyba warto szukać czegoś innego. 

Jak chodzi o przejrzystość docierania do plików historycznych to interfejs nie jest wygodny.

Pamiętaj:
1. Zdaje się, że zapamiętywane są pliki ze standardowych bibliotek użytkownika. Jeśli masz coś poza bibliotekami to dodaj to jako swoją dodatkową bibliotekę.
2. Gdy zmieniasz dysk/system to podczas pierwszego włączenia nośnika ze starą historią plików masz jednorazowe(!) pytanie czy przyłączyć tą historię do aktualnego dysku.

.

### 2. Acronis

Seagate DiscWizart (Acronis)

**Instalacja**

Pojawia się ostrzeżenie, że nie można uruchomić harmonogramu zadań i proponowany jest restart komputera
- Restartuję

Po instalacji usuwam instalację programu
- Bonjur 
	- jeśli ile nastąpiła właśnie razem z instalacją Acronis; program wydaje mi się zbędny.

Po starcie Seagate DiscWizart:
1. Backup
2. Wpisuję nazwę sugerującą, że to backup dysku C
3. Źródło: [Disk and partitions] (Tu widać, że "Files and Folders" jest zablokowane w tej wersji) Wybrać cały dysk SSD z C
4. Cel: Albo dysk zewnętrzny, albo [Browse...] \ Mój komputer \ Dysk zewnętrzny \ Folder z moją nazwą
5. Backup Now (ma też opcje "Za godzinę", ...)


Dodatkowo warto sobie utworzyć:
- Tools \ Rescue Media Builder
	- co najmniej zrobić sobie ISO i w razie potrzeby w przyszłości nagrać płytę lub dysk USB.

.

### 3. Veeam

...

.

### 4. Seagate Toolkit

Backup wybranych folderów/plików. Po uruchomieniu siedzi w zasobniku obok zegara. Jest dostarczany m.in. z zewnętrznym dyskiem USB Seagate.

Jest instrukcja po polsku: <https://www.seagate.com/pl/pl/support/software/toolkit/>, 
ale chyba nie ma języka polskiego w aplikacji.

##### [Backup]

Gdy chcemy sami zdecydować co zapamiętywać:
* Custom (poniżej [Backup now])
	* Advanced
		* Można coś pozaznaczać i wewnątrz dodatkowo odznaczać...
		* (jest obiecane, że po pierwszym pełnym backup w kolejnych są uwzględniane tylko zmiany i ma być szybciej)


Wygląda na to, że backup to pliki w folderze:

	<DyskUSB>:\Toolkit\Backup\<NazwaKomp>\

Na konie backupu zamykam aplikację `Toolkit`, bo od razu zaczyna się męczyć nad robieniem kopii przyrostowej (a może różnicowej - nie wiem).

.

### 5. EasyUS

W wersji darmowej może wykonać sporo dobrej roboty. Kopia dysku / partycji SSD (nie plików) jest wygodnie przeszukiwalna - można docierać do dowolnego pliku. Ma opcję kopii zapasowej pliku także w wersji darmowej. Nabrałem wątpliwości, czy poprawnie są zapamiętywane pliki zaszyfrowane - i porzuciłem dalsze próby. Być może są to wątpliwości niezasadne. Gdy nie potrzebujesz się zajmować zaszyfrowanymi plikami EFS to na pewno można tego używać.

.

### 6. Robocopy

#### Robocopy jako polecenie kopii zapasowej

Na razie nie próbowałem tego produkcyjnie, ale może się mi to kiedyś przyda...

	robocopy "D:\Dokumenty" "F:\Backup\Dokumenty" *.* /MIR /XJD /XA:SH /R:1 /W:3 /COPYALL /EFSRAW /ZB

`/MIR` - mirror; usuwa w kopii to co usunięte w źródle  
`/XJD` - pomijanie linków symbolicznych - junction directory  
`/XA:SH` - pomiń pliki systemowe i ukryte  
`/R:1 /W:3` - powtarzanie, czekanie (sek.)  
`/COPYALL` - kopiuj wszystkie inf. o pliku (= `/COPY:DATSOU`; ->do Linux użyj: `/COPY:DT`)  
`/EFSRAW` - kopiuj pliki zaszyfrowane w trybie EFS RAW mode (nie używaj w tym przypadku `/MT`)  
`/ZB` - Tryb restarowania; gdy plik zablokowany użyj trybu Backup  

`/LOG:C:\LogFileName.txt /TEE /NP`   (`/NP` = NOT show the progress - nie pokazuj postępu w log)  
`/LOG+:C:\LogFileName.txt /TEE /NP`  
(`/XD "folder"` `/XF "plik"` - pomiń podany folder lub plik)


#### Inne przykłady `robocopy`:

Lista plików większych niż....

	ROBOCOPY . "..\_%date%_%time::=.%" *.* /L /S /nDL /nC /nJH /nJS /min:44444444

* Folder docelowy powinien być pusty! (tutaj to jest `"..\_%date%_%time::=.%"`); /L - tylko wyświetlaj; min:bajtów
		
Lista plików nie starszych niż  (maxage:n; gdy n < 1900 to n = liczba dni, inaczej data n = YYYYMMDD):

	ROBOCOPY . "..\_%date%_%time::=.%" *.* /L /S /nDL /nC /nJH /nJS /nS /maxage:7

* /nS - bez rozmiaru, więc dostajemy same nazwy plików; albo /TS - będzie rozmiar i czas 
* Usuwając /L dostaniemy kopiowanie wybranych plików

**Dokumentacja:**

* <https://ss64.com/nt/robocopy.html>
* <https://docs.microsoft.com/pl-pl/windows-server/administration/windows-commands/robocopy>

[Notatki - robocopy_as_backup.txt]({{ site.baseurl }}/assets/files/robocopy_as_backup.txt)


