---
layout: post
title:  "Drobne podpowiedzi 1 (system)"
date:   2019-09-20 09:21:59 +0100
categories: System
---

[Ostatnio używane foldery]({{ site.url }}{{ site.baseurl }}{{ page.url }}#ostatnio-używane-foldery) * [Zwalnianie miejsca na dysku C:]({{ site.url }}{{ site.baseurl }}{{ page.url }}#zwalnianie-miejsca-na-dysku-c) * [Hurtowa zmiana daty folderów]({{ site.url }}{{ site.baseurl }}{{ page.url }}#hurtowa-zmiana-daty-folderów)

----

### Ostatnio używane foldery 

.. to trochę co innego niż *często używane foldery*, które pojawiają się po włączeniu (Win+E) eksploratora plików.

![Przypnij_do_szybki_dostep.png]({{ site.baseurl }}/assets/img/Przypnij_do_szybki_dostep.png "Przypnij_do_szybki_dostep.png"){:style="float:right;width:35%;"}
Kroki w celu dodania do paska "szybki dostęp":

1. Win+R, wklej  
   `shell:::{22877a6d-37a1-461a-91b0-dbda5aaebc99}`   `[OK]`
2. Menu: "Przypnij do paska szybki dostęp".
3. Inne własne ważne foldery też wato tak przypiąć.

<br>

----
### Zwalnianie miejsca na dysku C:

W Win 10 jest wbudowanych kilka ciekawych opcji zwalniania miejsca na dysku C:

<https://support.microsoft.com/pl-pl/help/12425/windows-10-free-up-drive-space>

![Start-ustawienia.png]({{ site.baseurl }}/assets/img/Start-ustawienia.png "Start-ustawienia.png"){:style="float:left;width:8%;margin-right:3%;"}
* [Win + i]  albo Start \ Ustawienia
    * System \ Pamięć \

1. ![Zwolnij_miejsce_teraz.png]({{ site.baseurl }}/assets/img/Zwolnij_miejsce_teraz.png "Zwolnij_miejsce_teraz.png"){:style="float:right;width:45%;"} Skonfiguruj Czujnik pamięci lub uruchom go teraz <small>(albo: Zmień sposób zwalniania miejsca)</small> \ Zwolnij miejsce teraz \ Oczyść teraz
2. 

![Zmien_lok_zapisywania.png]({{ site.baseurl }}/assets/img/Zmien_lok_zapisywania.png "Zmien_lok_zapisywania.png"){:style="width:50%;"}


Można tu też wspomnieć o możliwości przesuwania foldera na inny dysk z dysku systemowego (np. gdy mamy mały dysk SSD) i [tworzeniu dowiązania](https://leniwy.eu/news,10,Linki-symboliczne-w-Windowsie.html#Windows-a-linki) udającego, że folder jest na dysku systemowym 

Przykład w linii poleceń Windows (uruchom CMD)
````bat
C:\mklink /j "C:\NazwaPseudoFoldera" "D:\Scieżka\NazwaIstniejącegoFoldera"
````

<br>

----

### Hurtowa zmiana daty folderów

Podczas kopiowania zawartości dysku, np. po zakupie nowego komputera, na ogół wszystkie foldery uzyskują datę z momentu kopiowania. Na nasze szczęście pliki mają prawdziwe daty, ale gubienie faktycznych dat dla folderów jest kłopotliwe. Przecież nie raz chcemy coś przeszukać i nie musielibyśmy zaglądać do folderów, które nie mają dat w interesującym nas zakresie.

![Touch32.gif]({{ site.baseurl }}/assets/img/Touch32.gif "Touch32.gif"){:style="float:right;width:55%;"}

Można do tego wykorzystać aplikację, która potrafi ustawiać datę folderu na na podstawie dat plików/folderów wewnętrznych. Przykładem jest mój programik [**Touch32.exe**](https://pei.prz.edu.pl/~kubaszek/freeware/index_pl.html).

Aby dopasować daty folderów do plików i folderów wewnętrznych należy w jednej ze ścieżek **Path**  <small>(w menu START zacznij pisać "Edytuj zmienne środowiskowe dla konta" aby zobaczyć listę ścieżek)</small> umieścić plik `Touch32.exe` oraz [`dt.cmd`]({{ site.baseurl }}/assets/files/dt.cmd.txt) o zawartości jak poniżej (dla wygody nazwa powinna być dość krótka). W Eksploratorze plików 
![Eksplorator_dt.png]({{ site.baseurl }}/assets/img/Eksplorator_dt.png "Eksplorator_dt.png"){:style="float:left;width:40%;"}
ustawiamy się w folderze dla którego (i dla podfolderów) chcemy zmienić datę. W pasku adresu 
(tam gdzie jest "Ten komputer") wpisujemy `dt.cmd 0` albo krócej `dt 0` i następuje wykonanie skryptu. Najpierw podfoldery są ustawiane na datę 1980-01-01, a potem na datę jak najnowszy wewnętrzny plik lub folder.

````bat
@echo off & chcp 1250
:: Set date and time for folder like it newest file or folder
if [%1] EQU [0] for /D /r %%G in (*.*) do Touch32.exe "%%G" 1980-01-01
if [%1] NEQ [1] for /D /r %%G in (*.*) do call :DirLastFile "%%G"
call :DirLastFile "."
goto:eof
:DirLastFile
  for /f "tokens=*" %%i in ('dir "%~1\*.*" /b/o-d') do (
    Touch32.exe "%~1" /f "%~1\%%~i" & exit /b )
  Touch32.exe "%~1" 1980-01-01
````

W tym skrypcie przeglądane są foldery wewnętrzne oraz bieżący i wykonywana jest dla nich procedura `DirLastFile`.
* W procedurze `DirLastFile` odbywa się zamiana daty folderu na 
	* datę najnowszego pliku/folderu wewnętrznego
	* albo 1980-01-01, gdy dany folder jest pusty
	* Pętla `for /f` przebiega po liście plików/folderów posortowanych od daty najnowszej `/o-d` i jest przerywana przy pierwszym elemencie `& exit /b`. Ten element jest referencją dla daty folderu podanego jako parametr tej procedury. 
* Jeśli trzeba podglądnąć co się dzieje to należy zamienić  `goto:eof` na `pause&goto:eof`. Można też pominąć `& chcp 1250`. 
* Gdy w ramach folderu są tylko podfoldery i nie ma plików, to w zależności od kolejności przeglądania folderów data aktualnego folderu może pozostać nie uaktualniona. Można wtedy wykonać ponownie skrypt  `dt.cmd` (bez parametru 0 - który jest używany jednorazowo na początek). A najlepiej wejść do wewnątrz foldera, który nie skorygował daty i tam wykonać ten skrypt `dt.cmd`. 
* `dt.cmd 1` wykona szybkie działanie nierekurencyjne - tylko dla bieżącego folderu dostosuje jego datę dla najnowszego pliku lub folderu wewnętrznego.

<small>
Uwaga - program *Touch32* nie jest gruntownie przetestowany – używasz go na własną odpowiedzialność  (nie ma zbyt wielu użytkowników, choć jeden używa go od wielu lat). Sprawdź jego działanie na początek na niewielkiej na kopii danych. Proszę o kontakt w przypadku zauważenia błędów.
</small>

<small>
Aplikacja _Attribute Changer_ (<https://www.petges.lu/>) pozwala zdaje się na hurtową zmianę czasu modyfikacji folderów na podstawie dat wewnętrznych plików/folderów. Podobno także pozwala na zmianę dat zdjęć na podstawie metadanych. Można monitorować stan tej aplikacji, bo wygląda na to, że jest aktualnie rozwijana. </small>


### Hurtowa zmiana daty zdjęć i  filmów na podstawie metadanych 

* ....
