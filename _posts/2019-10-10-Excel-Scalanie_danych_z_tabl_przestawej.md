---
layout: post
title:  "Excel - scalanie danych z tablicy przestawnej"
date:   2019-10-10 09:21:59 +0100
categories: CSV
---

Wielokrotne dane w danej kategorii jako pojedynczy tekst.  
Także dodatek do Excel 2013- "AK_dodFunkcje.xlam" dla kilku nowych funkcji Excel 2016+ : TEXTJOIN/POŁĄCZ.TEKSTY, CONCAT/ZŁĄCZ.TEKST, SWITCH/PRZEŁĄCZ, IFS/WARUNKI  
(+ opis szybkiego przełączania języka funkcji Excel)

Tabela przestawna to świetny sposób na wykrywanie powiązań danych. 
Gdy korzystam z tej funkcjonalności to najczęściej 
* przełączam widok we wstążce "Narzędzia tabel przestawnych": `Projektowanie` \ `Układ raportu` \ `Pokaż w formie tabelarycznej`
* wyłączam sumy częściowe i końcowe (gdy są mi niepotrzebne)

![TextJoin_1.png]({{ site.baseurl }}/assets/img/TextJoin_1.png "TextJoin_1.png"){:style="float:right;width:41%;"}
i otrzymuję układ kategorii z potencjalnie wielokrotnymi danymi - jak w kolumnach A i B na rys. Często potrzebuję scalić te wielokrotne dane w jeden tekst - jak w kol. D, żeby się nimi posługiwać w kolejnym raporcie. 

Rysunek to obraz pliku "JoinIfEmpty_o.old.xlsx", gdzie opisałem jedno z możliwych rozwiązań. Omawiane tutaj pliki znajdują się w spakowanej paczce
* [**TextJoin.zip**]({{ site.baseurl }}/assets/files/TextJoin.zip) 

Podstawą tego rozwiązania jest możliwość scalenia tekstów z wielu komórek. W tym celu - w przypadku wersji MS Office 2013 i starszych - można użyć **dodatku dla Excel "AK_dodFunkcje.xlam"**. Opis instalacji dodatku (standardowy - nic specjalnego) jest w pliku "AK_dodFunkcje-test.xlsx". Plik "AK_dodFunkcje.bas" zawiera kod funkcji "TEXTJOIN" zawartej w tym dodatku (a także funkcji CONCAT, SWITCH, IFS występującyh w Excel 2016+).

Instalacja dodatku jest zbędna [w wersji MS Office 365 lub 2016 i wyższych, które standardowo zawierają funkcję "TEXTJOIN" (en) / "POŁĄCZ.TEKSTY" (pl)](https://skuteczneraporty.pl/blog/nowego-programie-excel-2016-cz-5-funkcje-warunki-przelacz-oraz-polacz-teksty/). Przykład jej użycia do celu jak wyżej jest w pliku "JoinIfEmpty_o.2016.xlsx".

Funkcja "POŁĄCZ.TEKSTY" jest standardowo dostępna w LibreOffice - zob. "JoinIfEmpty_LiOf.ods". 
W LibreOffice można się też łatwo przełączać na ang. nazwy funkcji:
Narzędzia \ Opcje [Alt+F12] \ LibreOffice Calc \ Formuła \ [x] Użyj angielskich nazw funkcji


- - - -

<br>

![TextJoin_2.png]({{ site.baseurl }}/assets/img/TextJoin_2.png "TextJoin_2.png"){:style="float:right;width:50%;"}
W pliku "AK_dodFunkcje-test.xlsx" jest przedstawiony jeszcze inny sposób scalania danych. Gdy przedstawimy je w tabeli przestawnej tak, że kategorie są we wierszach a dane w kolumnach to w wartościach tabeli przestawnej można wpisać liczbę wystąpień danych i potem scalać te dane z wiersza nagłówkowego, dla których pojawiła się niezerowa wartość.


- - - -
<small>
Pamiętajmy też, że możemy sobie błyskawicznie [zmieniać język](https://support.office.com/pl-pl/article/pakiet-akcesori%c3%b3w-j%c4%99zykowych-dla-pakietu-office-82ee1236-0f9a-45ee-9c72-05b026ee809f?legRedir=true&LpArch=x86&ver=15&app=excel.exe&CorrelationId=cc608ee5-a234-4f27-a505-dedd13fa5b52&ui=pl-PL&rs=pl-PL&ad=PL) w menu Excela: `Plik` \ `Opcje` \ `Język` i korzystać z polskich bądź angielskich nazw funkcji.
</small>

<small>
W każdym przypadku w wewnętrznym zapisie pliku XLSX pamiętane są angielskie nazwy funkcji. Aby się o tym przekonać potraktuj plik XLSX jako archiwum ZIP (np. dopisz takie rozszerzenie do pliku) i zobacz pliki XML w folderze "\xl\worksheets". Nowsze funkcje, niedostępne w wersjach 2013 i wcześniejszych mają w tych XML przedrostek "_xlfn.", np. "_xlfn.TEXTJOIN".
</small>

- - - -
<small>
W tym miejscu można wspomnieć o [łączeniu danych z plików Excela w folderze](https://szkolenieexcel.waw.pl/laczenie-danych-z-kilku-plikow-excela-w-jedna-zbiorcza-tabele/) (zob. <https://szkolenieexcel.waw.pl/>) do jednego arkusza i dalej do tabeli przestawnej - o.2016+ : Dane \ Nowe zapytanie \ Z pliku \ Z foderu (w o.2013- : Power Query \ Z pliku \ Z foderu).
</small>

<small>
Inne interesujące opcje łączenia można znaleźć w <http://excelszkolenie.pl> - [Operacje na wielu arkuszach na raz](http://excelszkolenie.pl/OperacjeNaWieluArkuszach.htm) np. `=SUMA(Arkusz1:Arkusz3!B2)`. Działa to też w LibreOffice[ _^_](https://help.libreoffice.org/Calc/Applying_Multiple_Sheets) - nieco inna jest postać wyrażenia: `=SUMA($'Arkusz1'.B2:$'Arkusz3'.B2)`. Podobne są też skróty klawiszowe do poruszania się po arkuszach - [Ctrl+PgUp/PgDn] i zaznaczania wielu arkuszy [Shift+Ctrl+PgUp/PgDn]. 
</small>

<small>
TEXTJOIN / POŁĄCZ.TEKSTY działa w Excel 2016+ także na zakres wielu arkuszy, np. `=POŁĄCZ.TEKSTY(" ~ ";0;Arkusz1:Arkusz3!A1)`.  
Nie działa to (na razie) z dodatkiem "AK_dodFunkcje.xlam" w Excel 2013-, ani w LibreOffice. We wszystkich wersjach Excel Może najpierw można wykonać ![Konsoliduj-ikona.png]({{ site.baseurl }}/assets/img/Konsoliduj-ikona.png "Konsoliduj-ikona.png"){:style="width:30px;"} **konsolidację** wielu arkuszy. W MS Office stosunkowo wygodnie dodaje się te same obszary przeklikując kolejne arkusze. W LibreOffice można wręcz dodać je na raz przy zaznaczonych wielu arkuszach. Choć zostanie to zamienione na statyczną listę arkuszy w oknie "Obszary konsolidacji" (nie zadziała potem dynamicznie mieszanie kolejności arkuszy), ale i tak jest to bardzo wygodne. <small>

- - - -
.

#### Moje notatki -> tworzenie / uaktualnianie "AK_dodFunkcje.xlam":

* W pierwotnym pliku XLSX: Plik \ Informacje \ Pokaż wszystkie właściwości \ Tytuł ... \ Komentarze ...  
(tak powstaje ogólny opis dodatku widoczny w: Plik \ Opcje \ Dodatki)

* Developer \ Visual Basic
	* Import File "AK_dodFunkcje.bas " (Module1)
	* [F2], search "Module1" (VBAProj Module1)
		* Members of...
		* prawy.kl.m. na każdej f.: Properties (tak powstaje opis widoczny w pomocy funkcji) (istotne są też wymowne nazwy parametrów - przywołanie parametrów: [Ctrl+Shift+A])

* Zamykam Developer (bez zapisu). Zapisuję plik XLSX jako XLAM, np."AK_dodFunkcje_2.xlam".
* Po zamknięciu wszelkich plików Excela podmieniam nazwę na "AK_dodFunkcje.xlam"