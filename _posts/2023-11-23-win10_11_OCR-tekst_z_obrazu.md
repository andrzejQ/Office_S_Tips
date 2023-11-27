---
layout: post
title:  "Tekst z obrazu na ekranie oraz dyktowanie tekstu"
date:   2023-11-23 09:41
categories: System
---

[1. Tekst z obrazu na ekranie]({{site.url}}{{site.baseurl}}{{page.url}}#tekst-z-obrazu-na-ekranie)   [2. Dyktowanie tekstu]({{site.url}}{{site.baseurl}}{{page.url}}#dyktowanie-tekstu)


## Tekst z obrazu na ekranie

![wycinanie-akcje-tekstowe.png]({{site.baseurl}}/assets/img/wycinanie-akcje-tekstowe.png "narzędzie wycinanie - akcje tekstowe"){: style="float:right;width:44%;"}
Narzędzie "Wycinanie" `[ ⊞ Win + ⇧ Shift + S ]` ma w MS Windows 11 nową funkcję: "Akcje tekstowe". Po wejściu w kafelek zrzutu ekranu (pojawia się na chwilę w prawym dolnym rogu) można włączyć rozpoznawanie tekstu na obrazie (OCR) i skopiować go.

 

Można w ten sposób kopiować tekst z obrazów, skanów, z filmu czy z bieżącej prezentacji. Z wszystkiego co w danej chwili widać na ekranie.

Jest jeszcze szybszy sposób na takie kopiowanie tekstu. **Działa w Windows 10 i 11**. 

* **Wymaga zainstalowania  Microsoft PowerToys**: <https://aka.ms/installpowertoys> - zwykle należy wybrać `...EXE` obok "Per user - x64"

![PowerToys-Ekstraktor_tekstu.png]({{site.baseurl}}/assets/img/PowerToys-Ekstraktor_tekstu.png "PowerToys - Ustawienia - Ekstraktor tekstu"){: style="float:right;width:54%;"}
Microsoft PowerToys to kolekcja przydatnych narzędzi, m.in. zmniejszanie rozmiaru wielu zdjęć, zaawansowana zmiana nazw wielu plików, a także moduł "Ekstraktor tekstu"

Sposób użycia:
1. Uruchamiamy program, do którego będziemy kopiowali tekst, np. MS Word, Notatnik. itp.
2. W drugim oknie odtwarzamy obraz, film, prezentację, pdf, itp..
3. Naciskamy `[ ⊞ Win + ⇧ Shift + T ]` i zaznaczamy myszą obszar do odczytu tekstu. 
4. Po puszczeniu przycisku myszy tekst jest w tle kopiowany do schowka. W klejamy go w aplikacji docelowej np. MS Word:  `[ Ctrl + V ]`

Tekst może być przekrzywiony. OCR radzi sobie też ze starannym pismem odręcznym.

* więcej na <https://learn.microsoft.com/en-us/windows/powertoys/text-extractor>

UWAGA: Kopiowanie tekstu z obrazu czy dyktowanie oparte jest zwykle na usługach chmurowych. Czyli obraz lub głos jest przesyłany gdzieś dalej na serwery Microsoftu. 
* więcej na: [Opis OCR - Optical Character Recognition](https://learn.microsoft.com/en-us/azure/ai-services/computer-vision/overview-ocr)

W przypadkach wymagających szczególnej poufności powinniśmy zachowywać ostrożność. (Podobny problem dotyczy korzystania z takich usług na telefonie).
Co ciekawe rozpoznawanie tekstu z obrazu działa w trybie off-line. Ale nie wiadomo (na razie) czy nasze dane nie są przesyłane, gdy komputer jest połączony z internetem. 


## Dyktowanie tekstu

![Slucham.png]({{site.baseurl}}/assets/img/Slucham.png "Słucham - dyktowanie tekstu"){: style="float:left;width:18%;"}
Po naciśnięciu `[ ⊞ Win + H ]` można dyktować tekst, zamiast wpisywania go z klawiatury. 
Oczywiście trzeba mieć mikrofon - np. w kamerce internetowej.

Dyktowanie nie działa w trybie off-line.

&nbsp;

<small>
W Windows 11 dyktowanie w języku polskim działa od razu. Zapewne też jest jakaś możliwość w Windows 10, skoro w dniu 02.06.2021 ogłoszono możliwość dyktowania w języku polskim w Microsoft Office - zob. 
![Win10-dod_jezyk.png]({{site.baseurl}}/assets/img/Win10-dod_jezyk.png "Windows 10 - rozpoznawanie mowy tylko w j. angielskim"){: style="float:right;width:22%;"}
[www.centrumxp.pl/Aktualnosci » ](https://www.centrumxp.pl/Aktualnosci/Dyktowanie-w-Microsoft-Office-teraz-ze-wsparciem-dla-jezyka-polskiego) . Ale prosta próba pobrania pakietu mowy dla języka polskiego kończy się niepowodzeniem. Dostępne jest dyktowanie w języku angielskim. 
![Office365_dyktafon.png]({{site.baseurl}}/assets/img/Office365_dyktafon.png "Office365 - dyktowanie tekstu"){: style="float:left;width:35%;"}  
Działa za to dyktowanie w przeglądarkowej wersji MS Word 365 (po zezwoleniu na korzystanie z mikrofonu w przeglądarce).
</small>

<style> code {font-size: smaller;} </style>

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











