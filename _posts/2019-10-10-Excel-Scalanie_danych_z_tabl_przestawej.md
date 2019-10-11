---
layout: post
title:  "Excel - scalanie danych z tablicy przestawnej"
date:   2019-10-10 09:21:59 +0100
categories: CSV
---

Wielokrotne dane w danej kategorii jako pojedynczy tekst.

Tabela przestawna to świetny sposób na wykrywanie powiązań danych. 
Gdy korzystam z tej funkcjonalności to najczęściej 
* przełączam widok we wstążce "Narzędzia tabel przestawnych": `Projektowanie` \ `Układ raportu` \ `Pokaż w formie tabelarycznej`
* wyłączam sumy częściowe i końcowe (gdy są mi niepotrzebne)

![TextJoin_1.png]({{ site.baseurl }}/assets/img/TextJoin_1.png "TextJoin_1.png"){:style="float:right;width:41%;"}
i otrzymuję układ kategorii z potencjalnie wielokrotnymi danymi - jak w kolumnach A i B na rys. Często potrzebuję scalić te wielokrotne dane w jeden tekst - jak w kol. D, żeby się nimi posługiwać w kolejnym raporcie. 

Rysunek to obraz pliku "JoinIfEmpty_o.old.xlsx", gdzie opisałem jedno z możliwych rozwiązań. Omawiane tutaj pliki znajdują się w spakowanej paczce
* [**TextJoin.zip**]({{ site.baseurl }}/assets/files/TextJoin.zip) 

Podstawą tego rozwiązania jest możliwość scalenia tekstów z wielu komórek. W tym celu - w przypadku wersji MS Office 2013 i starszych - można użyć **dodatku dla Excel "AK_dodFunkcje.xlam"**. Opis instalacji dodatku (standardowy - nic specjalnego) jest w pliku "AK_dodFunkcje-test.xlsx". Plik "AK_dodFunkcje.bas" zawiera kod funkcji "TEXTJOIN" zawartej w tym dodatku. Taką funkcję można też dodać do swojego arkusza w inny sposób.

Instalacja dodatku jest zbędna w wersji MS Office 365 lub 2016 i wyższych, które standardowo zawierają funkcję "TEXTJOIN" (en) / "POŁĄCZ.TEKSTY" (pl). Przykład jej użycia do celu jak wyżej jest w pliku "JoinIfEmpty_o.2016.xlsx".

- - - -

<br>

![TextJoin_2.png]({{ site.baseurl }}/assets/img/TextJoin_2.png "TextJoin_2.png"){:style="float:right;width:50%;"}
W pliku "AK_dodFunkcje-test.xlsx" jest przedstawiony jeszcze inny sposób scalania danych. Gdy przedstawimy je w tabeli przestawnej tak, że kategorie są we wierszach a dane w kolumnach to w wartościach tabeli przestawnej można wpisać liczbę wystąpień danych i potem scalać dane z wiersza nagłówkowego obok kategorii.


- - - -
<small>
Pamiętajmy też, że możemy sobie błyskawicznie [zmieniać język](https://support.office.com/pl-pl/article/pakiet-akcesori%c3%b3w-j%c4%99zykowych-dla-pakietu-office-82ee1236-0f9a-45ee-9c72-05b026ee809f?legRedir=true&LpArch=x86&ver=15&app=excel.exe&CorrelationId=cc608ee5-a234-4f27-a505-dedd13fa5b52&ui=pl-PL&rs=pl-PL&ad=PL) w menu Excela: `Plik` \ `Opcje` \ `Język` i korzystać z polskich bądź angielskich nazw funkcji.
</small>

<small>
W każdym przypadku w wewnętrznym zapisie pliku XLSX pamiętane są angielskie nazwy funkcji. Aby się o tym przekonać potraktuj plik XLSX jako archiwum ZIP (np. dopisz takie rozszerzenie do pliku) i zobacz pliki XML w folderze "\xl\worksheets". Nowsze funkcje, niedostępne w wersjach 2013 i wcześniejszych mają w tych XML przedrostek "_xlfn.", np. "_xlfn.TEXTJOIN".
</small>