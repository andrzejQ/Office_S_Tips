---
layout: post
title:  "Edycja PDF"
date:   2024-05-16 08:20:00 +0100
categories: PDF
---

Tutaj kilka wskazówek dotyczących edycji PDF za pomocą darmowych narzędzi

### 1. Adobe Acrobat Reader

Świetne narzędzie (także w wersji darmowej) do dopisywania tekstów, wypełniania formularzy, usuwania fragmentów.

#### 1.1. Zamazywanie fragmentów


![AcrobatR-Zamazywanie.png]({{site.baseurl}}/assets/img/AcrobatR-Zamazywanie.png "AcrobatR-Zamazywanie.png"){: 
style="float:left;width:248px;margin-right:10px;"}


Można wybrać rysowanie linii (tu dziwna nazwa "wiersz"), a dla niej kolor biały i jak największą grubość (12 pkt). Zakreślamy fragmenty do usunięcia tak jakby korektorem tasiemkowym. 2x większą powierzchnię może pokryć prostokąt z taką białą grubą linią.

#### 1.2. Dopisywanie tekstu

![AcrobatR-WypelnijPolaFormularza.png]({{site.baseurl}}/assets/img/AcrobatR-WypelnijPolaFormularza.png "AcrobatR-WypelnijPolaFormularza.png"){: 
style="float:right;width:271px;margin-left:10px;"}

To opcja do wypełniania formularzy. Działa prawie rewelacyjnie. Tylko trochę nieprzyjemny jest efekt, gdy wpisujemy polskie znaki - od razu krój czcionki zmienia się na szeryfowy.

{: style="clear:both;"}

![AcrobatR-DodajPodpis.png]({{site.baseurl}}/assets/img/AcrobatR-DodajPodpis.png "AcrobatR-DodajPodpis.png"){: 
style="float:left;width:82px;margin-right:30px;margin-bottom:20px;"}

#### 1.3. Dodaj podpis lub inicjały

Tu można zapisać skany swoich podpisów odręcznych i wstawiać je w dokumentach PDF. Oczywiście nie jest to podpis cyfrowy, ale może się to przydać, gdy odbiorca akceptuje skany dokumentów.

{: style="clear:both;"}


* Zob. też [Obrazy z PDF w DOCX]({% if jekyll.environment == "production" %}{{site.baseurl}}{% endif %}{% post_url 2019-09-23-z_PDF_do_DOCX %})


.

### 2. Firefox


![Firefox-Zamazywanie.png]({{site.baseurl}}/assets/img/Firefox-Zamazywanie.png "Firefox-Zamazywanie.png"){: 
style="float:right;width:440px;hight:170px;margin-left:10px;"}


Firefox w nowej wersji 126+ ma możliwość edycji PDF. Jak opisano powyżej można zamazywać fragmenty za pomocą grubej białej linii.


{: style="clear:both;"}


![Firefox-WstawTekst.png]({{site.baseurl}}/assets/img/Firefox-WstawTekst.png "Firefox-WstawTekst.png"){: 
style="float:left;width:291px;hight:141px;margin-right:10px;"}

Ma opcję wstawiania tekstu - prostą, ale za to bez problemu zmiany kroju czcionki z polskimi znakami.

{: style="clear:both;"}

![Firefox-WstawObraz.png]({{site.baseurl}}/assets/img/Firefox-WstawObraz.png "Firefox-WstawObraz.png"){: 
style="float:left;width:291px;hight:101px;margin-right:10px;"}

Interesująca jest możliwość wstawiania obrazu (w przypadku Adobe Acrobat dostępna dopiero w płatnej wersji). 

{: style="clear:both;"}

Można z pomocą obrazu, oprócz oczywistej funkcji uzyskać kilka dodatkowych efektów:

1. Można wstawić skan swojego odręcznego podpisu.
2. Można skopiować pusty fragment tła dokumentu (np. niekoniecznie śnieżnobiałego) i wstawiając go w innym miejscu zakryć zapisany fragment.
3. Można w obrazie umieścić tekst dowolną czcionką (np. podobną do czcionki dokumentu) i wstawić do dokumentu.

.

### 3. Microsoft Edge

Microsoft Edge też ma edytor PDF. Nie widać wstawiania tekstu czy obrazu (na razie). Jest za to kilka innych funkcji jak czytanie na głos.


![Microsoft_Edge-EdycjaPDF.png]({{site.baseurl}}/assets/img/Microsoft_Edge-EdycjaPDF.png "Microsoft_Edge-EdycjaPDF.png"){: 
style="float:left;width:674px;hight:60px;margin-right:10px;"}
 

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