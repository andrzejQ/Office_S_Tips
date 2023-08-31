---
layout: post
title:  "Długoterminowe potwierdzanie ważności e-podpisu"
date:   2019-09-19 10:21:57 +0100
categories: PKI
---

W sytuacji, gdy będzie potrzeba sprawdzania ważności podpisu także po okresie ważności certyfikatów powinniśmy używać opcji LTV (**L**ong **T**erm **V**alidation). 


Podpis elektroniczny lub pieczęć elektroniczna weryfikowane za pomocą certyfikatu wywołują skutki prawne, jeżeli zostały złożone w okresie ważności tego certyfikatu. Opcja LTV powoduje dodanie to podpisu pełnej listy certyfikatów, co umożliwi łatwą weryfikację podpisu po latach, nawet, jeśli w międzyczasie np. certyfikat dostawcy usług zaufania utracił ważność albo przestał on świadczyć takie usługi.

Podczas podpisywania należy wybrać podpis ze znacznikiem czasu. To pozwala ustalić dokładną datę złożenia podpisu elektronicznego ("datę pewną" w rozumieniu przepisów kodeksu cywilnego) i weryfikację, że podpis został złożony w okresie ważności certyfikatu. Jeśli jest przy tym dostęna opcja LTV to warto ją wybrać.

![PDF_z_podpisem.png]({{site.baseurl}}/assets/img/PDF_z_podpisem.png "PDF_z_podpisem.png"){: style="float:right;width:44%;"}
Ale listę certyfikatów można też dopisać później do dokumentu, np. w Adobe Reader DC do dokumentu PDF z podpisem **PAdES** w wariancie **T** (znacznik czasu).

Po otwarciu dokumentu PDF z e-podpisem należy rozwinąć szczegóły podpisu. 
Zobaczymy informację, że podpis nie obsługuje LTV i wygaśnie po wskazanym czasie. Należy kliknąć prawym klawiszem myszy na `Wersja 1: podpisane przez...` wybrać `Dodaj informacje weryfikacji` i zapisać nową wersję pliku PDF.  
![AdobeR-PanelPodpisDataWygasniecia.png]({{site.baseurl}}/assets/img/AdobeR-PanelPodpisDataWygasniecia.png "AdobeR-PanelPodpisDataWygasniecia.png"){: style="width:77%;"}

Po otwarciu tego pliku i rozwinięciu szczegółów podpisu zobaczymy, że mamy dodaną informację LTV (Long Term Validation) umożliwiającą długoterminową weryfikację e-podpisu:  
![AdobeR-PanelPodpisLTV.png]({{site.baseurl}}/assets/img/AdobeR-PanelPodpisLTV.png "AdobeR-PanelPodpisLTV.png"){: style="width:77%;"}


----

Można też wybrać opcję LTV w aplikacji do składania podpisu, np. w aplikacji  Sigillum Sign jest profil "Podpis długoterminowy" oraz pojawia się wariant "A" lub "XL". Tak podpisane pliki pozwalają na łatwą weryfikację e-podpisu także w czasie, gdy minął okres jego ważności (ale oczywiście - w momencie podpisywania był ważny).

Z instr. Sigillum Sign:

5. XAdES-XL – (Extended Long Term) – format umożliwia dodanie dodatkowych certyfikatów (poza certyfikatem osoby podpisującej). Ponadto zawiera informacje pobrane z serwerów CRL lub OCSP. Podpis w tym formacie szczegółowo określa warunki, w jakich został złożony. Zapewnia on, że certyfikat osoby podpisującej w chwili podpisania pliku był ważny;

6. XAdES-A – (Archival) – format ten umożliwia dodawanie znaczników czasowych wystawianych przez Urząd Znakowania Czasem. Jest on stosowany m.in. w celu konserwacji podpisu (przedłużenia jego ważności). Dzięki niemu, właściciel podpisanego pliku może dodawać nowe zaświadczenia certyfikacyjne UZC przed upływem terminu ważności poprzedniego.

----


Odnośniki:

* [Długoterminowa walidacja (LTV) podpisów cyfrowych PDF w Adobe Acrobat](https://www.ssl.com/pl/jak/d%C5%82ugoterminowa-weryfikacja-LTV-podpis%C3%B3w-cyfrowych-pdf-w-programie-Adobe-Acrobat/)
* ["Kwalifikowane podpisy elektroniczne - praktyczne aspekty", Tomasz Zalewski](https://www.twobirds.com/pl/insights/2021/poland/210712-kwalifikowane-podpisy-elektroniczne) <small>(m.in. eliminacja wad podpisu własnoręcznego, długoterminowa konserwacja podpisów, zbędne postanowienie o miejscu zawarcia umowy, zbędne postanowienie o dacie zawarcia umowy i liczbie „jednobrzmiących” egzemplarzy)</small>

* [Podpis elektroniczny - kilka cytatów z aktów prawnych]({% if jekyll.environment == "production" %}{{site.baseurl}}{% endif %}{% post_url 2019-09-19-e-podpis_kilka_cytatow_z_aktow_prawnych %})
* [Weryfikacja podpisu cyfrowego]({% if jekyll.environment == "production" %}{{site.baseurl}}{% endif %}{% post_url 2019-09-19-Weryfikacja_podpisanego_PDF %})
* [Podpisywanie e-dokumentów za pomocą profilu zaufanego]({% if jekyll.environment == "production" %}{{site.baseurl}}{% endif %}{% post_url 2019-09-19-Podpisywanie_e_dokumentow_pz_gov_pl %})

----

<style> code {font-size: small;} </style>

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