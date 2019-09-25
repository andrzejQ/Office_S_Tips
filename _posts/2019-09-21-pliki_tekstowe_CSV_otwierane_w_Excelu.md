---
layout: post
title:  "Pliki tekstowe CSV otwierane w Excelu"
date:   2019-09-21 09:21:59 +0100
categories: CSV
---

Podczas przetwarzania surowych danych często chcemy nadać im strukturę tabeli przesyłanej do Excela. Można w tym miejscu posłużyć się plikiem tekstowym CSV. Excel ma tu kilka jawnych ale też kilka ukrytych możliwości.

1. Jeśli tekst dla danej komórki zaczyna się od 
   `=` to jest automatycznie interpretowany jako formuła.
2. Dla pliku w kodowaniu ANSI możemy dopisać w dodatkowym pierwszym wierszu np. `sep=,` - tu ostatni znak w tym wierszu (przecinek) oznacza separator niezależnie od systemowego separatora danych (np. w Excel PL to `;`). Sposób ten działa _tylko na pliki w starym kodowaniu ANSI_- czyli np. w Windows PL jest to zestaw znaków [cp1250](https://pl.wikipedia.org/wiki/Windows-1250), a więc znaków spoza Europy środkowej nie zobaczymy....
3. Wszelkie teksty ujęte w cudzysłowy "..." nawet zawierające wewnątrz znak dowolnego separatora czy nowego wiersza (!) są umieszczane w jednej komórce, a zewnętrzne cudzysłowy są pomijane.
4. ![Notatnik-utf8.png]({{ site.baseurl }}/assets/img/Notatnik-utf8.png "Notatnik-utf8.png"){:style="float:right;width:55%;"} Da się używać wszelkich znaków gdy plik tekstowy jest w kodowaniu **UTF-8 z BOM** (bez BOM to nie działa). Obecnie nawet Notatnik Windowsa ma te potrzebne kodowania UTF-8 i dalej opisane USC-2. Oczywiście ma je od dawna Notatnik++.  
Ale dla kodowania UTF-8 BOM nie działa dopisek w pierwszym wierszu: `sep=...`. Czyli np. jak się ma Polski Excel to **separatorem komórek musi być `;`**.
5. Można jednak stworzyć plik tekstowy CSV poprawnie otwierany zaróno w Excelu z zeparatorem `;` jak i `,` używając kodowania **UCS-2 LE** (UNICODE Little Endian) (w notatniku Windows 10 to kodowanie "UTF-16-LE" lub "UNICODE" - w odróżnieniu od UNICODE big endian). Tym razem **separatorem musi być znak tabulacji**, a więc znak neutralny w stosunku do `,` i `;`. Oczywiście działają wszelkie znaki międzynarodowe. Znak nowego wiersza wewnątrz komórki znowu wymaga otoczenia jej zawartości przez "....". Działają formuły `=...`, ale chyba tylko z nazwami funkcji w języku naturalnym zgodnym z wersją w Excelu.
6. Największe możliwości pobierania danych tekstowych daje podpięcie ich jako źródła danych do arkusza Excela. Dodatkowo uzyskujemy pełną zgodność z różnymi wersjami językowymi Excela. Jest wtedy możliwość skonfigurowania dowolnych separatorów, kodowania tekstu, formatowania dat itp. Jest nawet możliwość podziału danych ze względu na ich położenie we wierszu, tak, że udaje się się przenosić np. tabele z PDF zapisane jako pliki tekstowe (choć nie działa to tak idealnie jak używanie pliku TXT z separatorem). Ogólnie w tym wypadku mamy zdaje się wadę, że łamanie wiersza w jednej komórce na ogół jest źle interpretowane (komórka nie jest scalana zgodnie z zasadą "..."). 
7. ![Excel-opcje-zapis.png]({{ site.baseurl }}/assets/img/Excel-opcje-zapis.png "Excel-opcje-zapis.png"){:style="float:right;width:55%;"} Gdy przekazujemy/przenosimy na inny komputer taki zestaw plików XLSX+TXT to po otwarciu XLSX mamy od nowa wyszukiwanie źródłą danych TXT ... Może to się kiedyś zmieni, bo aż się prosi, żeby po prostu poszukać źródła TXT w folderze w jakim jest plik główny XLSX. Na razie niezłe efekty daje umieszczenie żródła TXT w folderze-bibliotece "Dokumenty", a dokładnie w takim folderze jaki jest zapisany w: menu Plik \ Opcje \ Zapisywanie \ Domyślna lokalizacja pliku lokalnego [____]. Można też ustawić w XLSX względne położenie źródła TXT względem tego foldera: .....

- - - - - - - - -

Nie wiem o tym, czy te sposoby są oficjalnie udokumentowane w Microsoft (zwłaszcza 4 i 5), czy tylko działają i nie wiadomo od kiedy. Oczywiście udokumentowany jest "sep=..." i "...". Gdyby ktoś natrafił na oficjalną dokumentację to piszcie.

W mojej praktyce najbardziej przydatne są sposoby opsane w 4 i 6.

