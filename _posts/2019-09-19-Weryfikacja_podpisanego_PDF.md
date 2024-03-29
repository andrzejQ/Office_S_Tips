---
layout: post
title:  "Weryfikacja podpisu cyfrowego PDF w przeglądarce internetowej"
date:   2019-09-19 10:21:56 +0100
categories: PKI
---

Poprawność podpisu można zweryfikować w aplikacji do składania podpisu. W przypadku PDF można to też sprawdzić w darmowej aplikacji Adobe Reader DC. 

![AdobeR-PanelPodpis.png]({{site.baseurl}}/assets/img/AdobeR-PanelPodpis.png "AdobeR-PanelPodpis.png"){: style="float:right;width:65%;"}
Po otwarciu pliku w Adobe Reader DC pojawia się pasek z przyciskiem [Panel Podpis], którego kliknięcie powoduje wyświetlenie szczegółów podpisu.

Jeśli często korzystamy z PDF z e-podpisami, to warto odpowiednio skonfigurować sobie przeglądarkę internetową:

#### Firefox

Po zmianie domyślnej konfiguracji działa to całkiem sprawnie:

Firefox \ `Opcje` \ (sekcja) `Aplikacje` \ (typ) `Dokument PDF` \ Otwórz w... zmieniamy na `"Użyj aplikacji Adobe Acrobat Reader DC"`.

#### Google Chrome

Google Chrome \ (po kliknięciu na plik PDF) `Pobierz` \ (w pasku pobranych na dole klikamy strzałkę w górę) `Otwórz w przeglądarce systemowej` albo `Zawsze otwieraj w przeglądarce systemowej`

Oczywiście jako przeglądarkę PDF należy ustawić Adobe Reader DC

#### Microsoft Edge

Nowy Microsoft Edge - weryfikacja e-podpisów od razu w przeglądarce:

**Konfiguracja Microsoft Edge** (*jednorazowa*)  
<small>Na razie jest to wersja eksperymentalna usługi.</small>  
W pasku adresu wpisujemy:  
`edge://flags/#edge-digsig-enabled-pdf` albo  
`edge://flags` i przechodzimy do sekcji: `Enable Digital Signature for PDF`  
Wybieramy `[Enabled]`.

Po kliknięciu PDF \ "Podgląd" pojawia się w przeglądarce nad dokumentem pasek: 
* Ten dokument jest podpisany cyfrowo. (Niektórych podpisów nie można zweryfikować.)  
[Wyświetl podpisy]

Wybieramy `[Wyświetl podpisy]` \ `Właściwości` \ `Sprawdź poprawność`

Pomimo, że "Niektórych podpisów nie można zweryfikować" (np. dla podpisów pz.gov.pl czy tych z pieczęcią kwalifikowaną), to jednak można odczytać istotne dane podpisu - kto, kiedy.

Zob. też 
* [Podpisy cyfrowe]({% if jekyll.environment == "production" %}{{site.baseurl}}{% endif %}{% post_url 2019-09-19-Podpisy_cyfrowe %})
* [Podpisywanie e-dokumentów za pomocą profilu zaufanego]({% if jekyll.environment == "production" %}{{site.baseurl}}{% endif %}{% post_url 2019-09-19-Podpisywanie_e_dokumentow_pz_gov_pl %})
* [Długoterminowe potwierdzanie ważności e-podpisu]({% if jekyll.environment == "production" %}{{site.baseurl}}{% endif %}{% post_url 2019-09-19-Dlugoterminowa_waznosc_e-podpisu %})


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