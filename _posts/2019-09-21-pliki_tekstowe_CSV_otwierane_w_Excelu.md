---
layout: post
title:  "Pliki tekstowe CSV otwierane w Excelu"
date:   2019-09-21 09:21:59 +0100
categories: CSV
---

Excel-CSV - kilka jawnych, ale też kilka mniej znanych możliwości.

Podczas przetwarzania surowych danych często chcemy nadać im strukturę tabeli przesyłanej do Excela. Można w tym miejscu posłużyć się plikiem tekstowym CSV. Plik tekstowy ma swoje zalety jak choćby możliwość kontroli wersji i wynajdywania zmian treści.

Głównym tematem tych notatek jest takie przygotowanie pliku CSV, żeby można go było przekazywać innym/uaktualniać i otwierać w Excelu bez skomplikowanych zabiegów.

1. Jeśli tekst dla danej komórki **zaczyna się od `=`** to jest automatycznie interpretowany **jako formuła**.
2. Dla pliku w kodowaniu ANSI możemy dopisać **w dodatkowym pierwszym wierszu np. `sep=,`** - tu ostatni znak w tym wierszu (przecinek) oznacza separator niezależnie od systemowego separatora danych (np. w Excel PL to `;`). Sposób ten działa _tylko na pliki w starym kodowaniu ANSI_- czyli np. w Windows PL jest to zestaw znaków [cp1250](https://pl.wikipedia.org/wiki/Windows-1250), a więc znaków spoza Europy środkowej nie zobaczymy....
3. Wszelkie **teksty ujęte w cudzysłowy "..."** nawet zawierające wewnątrz znak dowolnego separatora czy nowego wiersza (!) są umieszczane w jednej komórce, a zewnętrzne cudzysłowy są pomijane. <small>Jednak znaki nowego wiersza mogą powodować kłopoty - zob. p.7</small>
4. Aby [zablokować automatyczne przekształcanie tekstu](https://stackoverflow.com/questions/165042/stop-excel-from-automatically-converting-certain-text-values-to-dates) (np. `1E2` jest przekształcany na `1,00E+02`) podczas otwierania CSV w Excelu i zachować tekst pierwotny można stosować zapis `="1E2"` lub `"=""1E2"""`<small> - ten ostatni zapis działa także w Excelu 2007, a obie formy w LibreOffice</small>.
5. ![Notatnik-utf8.png]({{site.baseurl}}/assets/img/Notatnik-utf8.png "Notatnik-utf8.png"){: style="float:right;width:55%;"} 
Da się używać wszelkich znaków gdy plik tekstowy jest w kodowaniu **UTF-8 z BOM** (bez BOM to nie działa). Obecnie nawet Notatnik Windowsa ma te potrzebne kodowania UTF-8 i USC-2 opisane w p.6. Oczywiście ma je od dawna Notatnik++.  
 **Wypróbuj** [**test01.csv**]({{site.baseurl}}/assets/files/test01.csv) <!--a href="{{site.baseurl}}/assets/files/test01.csv" download="test01.csv">test01.csv</a-->.
    * Niestety dla kodowania UTF-8 BOM nie działa dopisek w pierwszym wierszu: `sep=...`. Czyli dla Excela w polskiej wersji **separatorem komórek musi być `;`**.
6. Można jednak stworzyć plik tekstowy CSV poprawnie otwierany zarówno w Excelu z separatorem `;` jak i `,` używając kodowania **UCS-2 LE** (UNICODE Little Endian) (w notatniku Windows 10 to kodowanie "UTF-16-LE" lub "UNICODE" - w odróżnieniu od UNICODE big endian). Tym razem **separatorem musi być znak tabulacji**, a więc znak neutralny w stosunku do `,` i `;`. Oczywiście działają wszelkie znaki międzynarodowe. Znak nowego wiersza wewnątrz komórki znowu wymaga otoczenia jej zawartości przez "....". Działają formuły `=...` - z nazwami funkcji w języku z wersją językową MS Office (na szczęście możemy sobie błyskawicznie [zmieniać język](https://support.office.com/pl-pl/article/pakiet-akcesori%c3%b3w-j%c4%99zykowych-dla-pakietu-office-82ee1236-0f9a-45ee-9c72-05b026ee809f?legRedir=true&LpArch=x86&ver=15&app=excel.exe&CorrelationId=cc608ee5-a234-4f27-a505-dedd13fa5b52&ui=pl-PL&rs=pl-PL&ad=PL) w menu Excela: `Plik` \ `Opcje` \ `Język`).
7. ![Excel-import-danych_i_wlasciwosci.png]({{site.baseurl}}/assets/img/Excel-import-danych_i_wlasciwosci.png "Excel-import-danych_i_wlasciwosci.png"){: style="float:right;width:50%;"} Największe możliwości pobierania danych tekstowych daje podpięcie ich jako **źródła danych** do **arkusza Excela**. Dodatkowo uzyskujemy pełną zgodność z różnymi wersjami językowymi Excela. Jest wtedy możliwość skonfigurowania dowolnych separatorów, kodowania tekstu, formatowania dat itp. Nie musi to być więc standard CSV i może być dowolny plik TXT. Jest nawet możliwość podziału danych ze względu na ich położenie w wierszu, tak, że udaje się się przenosić np. tabele z PDF wyeksportowane jako pliki tekstowe, choć nie działa to tak idealnie jak używanie pliku CSV/TXT z separatorem.  
Podczas konfigurowania źródła danych można można spowodować, że dane będą automatycznie odświeżane podczas otwierania pliku, albo, że nie będzie za każdym razem pytania o plik z danymi.  
W praktyce nie wstawiam tych danych od lewej kolumny `=$A$1`, lecz zostawiam sobie z lewej strony miejsce (kolumny) na jakieś formuły działające na danych, które się automatycznie przeliczają po uaktualnieniu danych. 
    * W wypadku tekstowego źródła danych mamy jednak wadę: **wewnętrzne łamanie wiersza w komórce jest źle interpretowane** (komórka nie jest scalana zgodnie z zasadą "..." tylko kończy się na pierwszym wierszu i co najgorsze kolejny wiersz jest kompletnie niepoprawny). 
      * Jeśli panujemy nad procesem eksportu do CSV to można zamieniać znaki nowego wiersza na ustaloną, sporą liczbę spacji np. 8 czy więcej. Gdy taki plik jest otwierany w Excelu to może spowodować całkiem niezłe przełamywanie wierszy przy opcji "Zawijaj tekst". Gdy także panujemy nad odczytywaniem takich CSV to można z powrotem zamieniać taką liczbę spacji na znak nowego wiersza.
      * Jeśli potrafimy odkryć w pliku CSV/TXT, że dany nowy wiersz to wewnętrzna kontynuacja  komórki (bo prawdziwy nowy wiersz ma inny początek) to w notatniku (np. Notepad++) znak nowego wiersza można zamieniać na dużą liczbę spacji, co spowoduje poprawne odczytywanie pliku jako źródła danych.
      * Jeśli w Excelu chcemy wyszukać/zamienić znak łamania tekstu wewnątrz komórki to wpisujemy [Alt+010] na klawiaturze numerycznej (tzn. przytrzymujemy Alt i wpisujemy 010). Można więc zamieć taki znak na coś innego np. wiele spacji otwierając testowo plik CSV w Excelu zanim skorzystamy z niego jako źródła danych. Dodatkowo można zaobserwować, że komórki z wewnątrznym łamaniem wierszy są wyświetlane w trybie "Zawijaj tekst" (zob. drugi wiersz w [test01.csv]({{site.baseurl}}/assets/files/test01.csv))
8. ![Excel-opcje-zapis.png]({{site.baseurl}}/assets/img/Excel-opcje-zapis.png "Excel-opcje-zapis.png"){: style="float:right;width:55%;"} Gdy przekazujemy/**przenosimy na inny komputer taki zestaw plików XLSX+TXT** to po otwarciu XLSX mamy od nowa wyszukiwanie źródła danych TXT. Może to się kiedyś zmieni, bo aż się prosi, żeby po prostu poszukać źródła TXT w folderze w jakim jest plik główny XLSX. Na razie niezłe efekty daje umieszczenie źródła TXT w folderze-bibliotece "Dokumenty", a dokładnie w takim folderze jaki jest zapisany w  menu Excela: Plik \ Opcje \ Zapisywanie \ Domyślna lokalizacja pliku lokalnego [____].
   * Można też ustawić w XLSX względne położenie źródła TXT względem tego foldera "Dokumenty" i uniknąć pytania o plik źródłowy TXT po przesiadce na inny komputer:
       * Wchodzimy do danego pliku XLSX jako spakowanego ZIP, np. można dopisać rozszerzenie ZIP, a w Total Commander [Ctrl + PgDn] - (widzimy foldery: `[_rels]`, `[docPros]`, `[xl]`).
       * Edytujemy plik `\xl\connections.xml` usuwając ścieżkę do "Dokumenty\\" włącznie przed nazwą pliku źródła. To wymaga oczywiście wypakowania na chwilę tego pliku a potem spakowania.
9. Ciekawostka - wpisując hiperłącze ze ścieżką do obrazka względem pliku CSV: `"=HIPERŁĄCZE(""./sciezka/wzgledna/obrazek.jpg"")"` dostajemy klikalny odnośnik do wyświetlenia obrazka. (Choć jeśli działamy w domenie organizacji to nie zawsze jest przyzwolenie na otwieranie odnośników w Excelu i wtedy to nie zadziała.) Inny przykład to odwołania do komórek w arkuszu <http://excelszkolenie.pl/Triki.htm> - *Hiperłącze*, pozwalające na szybkie przeniesienie się w inny obszar arkusza.
10. Niekiedy w tekstach może się przydać indeks górny / dolny, np. m³, H₂O. Zakładając współczesne kodowanie CSV, np, UTF-8 można skorzystać z trybu tekstowego - [utf8_sup_sub.txt]({{site.baseurl}}/assets/files/utf8_sup_sub.txt ), zob. też. [Przydatne znaki Unicode](https://andrzejq.github.io/El_Prog/programowanie/2019/09/07/PrzydatneZnakiUnicode.html) oraz [[Win+ . ]]({% if jekyll.environment == "production" %}{{site.baseurl}}{% endif %}{% post_url 2019-10-04-windows_10-uaktualnienie_1903 %}).


- - - - - - - - -

Nie wiem o tym, czy te sposoby są oficjalnie udokumentowane w Microsoft (zwłaszcza 4 i 5), czy tylko działają i nie wiadomo od kiedy. Oczywiście udokumentowany jest "sep=..." i "...". Gdyby ktoś natrafił na oficjalną dokumentację to piszcie.

W mojej praktyce najbardziej przydatne są sposoby opisane w 4, 5 i 7.

- - - - - - - - -
&nbsp;

* <small>W korespondecji seryjnej MS Word 2016 jest błędna interpretacja cudzysłowów innych niż podstawowy `"`. Można zastosować konwersję jak w 
[unicodeDoubleQuote.py]({{site.baseurl}}/assets/files/unicodeDoubleQuote.py.html )</small>.


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