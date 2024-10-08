---
layout: post
title:  "Obrazy z PDF w DOCX"
date:   2019-09-23 10:21:59 +0100
categories: PDF_DOCX
---

Rysunki wektorowe i inne fragmenty PDF można skopiować jako obrazy do Worda w niezłej jakości.


* Ten opis skupia się głównie na kopiowaniu rysunków wektorowych z PDF do obrazów rastrowych w DOCX bardzo wysokiej jakości. Równocześnie udaje się uzyskać stosunkowo niewielki rozmiar pliku DOCX.
* Zakładam, że rysunek wektorowy zawiera różnokolorowe linie i figury, a liczba różnych kolorów jest niewielka. Sposób ten może też dotyczyć tekstu, który skopiowany jako obraz można podłożyć pod tekstem w DOCX i nawet coś pisać/rysować ponad nim.

Plik PDF otwieramy w **Adobe Acrobat Reader** i korzystamy z narzędzia   **Edycja** \ ![AdobeR-wykonaj_zdjecie.png]({{site.baseurl}}/assets/img/AdobeR-wykonaj_zdjecie.png "AdobeR-wykonaj_zdjecie.png"){: style="width:30px;"} **W<u>y</u>konaj zdjęcie**. Najpierw jednak należy odpowiednio skonfigurować jakość zdjęcia:

![AdobeR-Preferencje.png]({{site.baseurl}}/assets/img/AdobeR-Preferencje.png "AdobeR-Preferencje.png"){: style="float:right;width:55%;"}
Menu: **Edycja** \ **Preferencje** \ **Ogólnie** \
- [x] Używaj stałej rozdzielczości dla obrazów narzędzia Zdjęcie: 300 piks/cal albo 600 piks/cal 

Już użycie rozdzielczości 300dpi daje wysoką jakość na wydruku. Można jednak nawet ustawić 600dpi (jakość jest wtedy doskonała) i pomimo tak dużej rozdzielczości uzyskać obrazy rastrowe rozsądnej pojemności:

Menu: **Wyświetlanie strony** \ **Rendering** - wyłączyć wszystkie wygładzania, także: _Wygładź tekst: Brak_.

Następnie wyświetlamy obszar, który chcemy skopiować (można dowolnie pomniejszać widok, aby na kranie znalazł się cały potrzebny obszar), wywołujemy
narzędzie   **Edycja** \ ![AdobeR-wykonaj_zdjecie.png]({{site.baseurl}}/assets/img/AdobeR-wykonaj_zdjecie.png "AdobeR-wykonaj_zdjecie.png"){: style="width:30px;"} **W<u>y</u>konaj zdjęcie** i zaznaczmy obszar do kopiowania.

- - - - -

Mamy w schowku obraz rastrowy. Najlepiej wkleić go w jakimś programie graficznym, np. IrfanView i zapisać w formacie **PNG** lub w innym bezstratnie spakowanym formacie. <small>Uwaga - nie używamy tutaj JPG, które dobrze pakuje obrazy z płynnymi przejściami kolorów (zdjęcia), ale w tym wypadku drastycznie pogorszy jakość i rozmiar obrazu.</small> Obraz ze schowka można też bezpośrednio skopiować do Worda lub do Painta, ale nie będzie on zbyt dobrze spakowany, więc rozmiar pliku DOCX będzie niepotrzebnie powiększony (ale może rozmiar będzie akceptowalny - więc warto próbować).

W programie graficznym np. IrfanView można zredukować głębię kolorów  (na czas ich edycji!) i z łatwością edytować poszczególne kolory w palecie zamieniając je na inne. Na koniec należy przywrócić pełną głębię kolorów (24bpp) bo inaczej Word potrafi pomijać takie obrazy podczas wydruku.


Uwaga:
* W Wordzie wybieraj format pliku ***.DOCX** a nie *.DOC czy *.RTF. Inaczej pliki wynikowe mogą okazać się ogromne (choć jest na to rada - zob. 
[Problem ogromnego rozmiaru plików RTF i DOC]({% if jekyll.environment == "production" %}{{site.baseurl}}{% endif %}{% post_url 2019-09-20-drobne_podpowiedzi_2 %}#problem-ogromnego-rozmiaru-plików-rtf-i-doc)).

- - - - -

<small> Gdy już jesteśmy przy konfiguracji Adobe Acrobat Reader to warto trwale odchudzić panel z narzędziami z prawej strony, który niepotrzebnie zajmuje obszar okna programu - Menu: **Dokumenty** \ [x] **Zapamiętaj bieżący stan panelu narzędzi**</small>


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