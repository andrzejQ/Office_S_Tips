---
layout: post
title:  "Podpisywanie e-dokumentów za pomocą profilu zaufanego"
date:   2019-09-19 10:21:56 +0100
categories: PKI
---

Za pomocą profilu zaufanego pz.gov.pl można można m.in. podpisywać cyfrowo swoje dokumenty, pobrać je i przesyłać/załączać do swojej e-korespondencji.


* <https://www.gov.pl/web/gov/podpisz-dokument-elektronicznie-wykorzystaj-podpis-zaufany>

**Zobacz krótką instrukcję**, a równocześnie przykład podpisanego dokumentu PDF:

* [PAdES.**Podpisywanie_PDF**_podpisem_zaufanym-**instrukcja**.pdf]({{site.baseurl}}/assets/files/PAdES.Podpisywanie_PDF_podpisem_zaufanym.pdf).

Tak podpisany dokument można pobrać i wysłać dalej w postaci elektronicznej.  
<small>
Informacje o podpisie widoczne w dokumencie:  
Podpisane przez: Minister do spraw informatyzacji - pieczęć podpisu zaufanego  
Certyfikat jest kwalifikowany zgodnie z rozporządzeniem UE 910/2014 Aneks III  
Powód: Opatrzono pieczęcią ministra właściwego do spraw informatyzacji w imieniu: (Imię Nazwisko, ...)
</small>

**Poprawność e-podpisu zaufanego** można zweryfikować w darmowej aplikacji Adobe Acrobat Reader. Są też inne narzędzia. Również [można skorzystać z przeglądarki internetowej]({% if jekyll.environment == "production" %}{{site.baseurl}}{% endif %}{% post_url 2019-09-19-Weryfikacja_podpisanego_PDF %}).

------
.

<small>
Podpis zaufany jest uregulowany w **ustawie o informatyzacji** (Dz.U.2024.307), która dotyczy ściśle określonych podmiotów publicznych  
(m.in. organów administracji publicznej, sądów, prokuratury, jednostek samorządu terytorialnego, jednostek budżetowych i funduszy celowych, ZUS, KRUS, NFZ, SPZOZ, uczelni, federacji podmiotów systemu szkolnictwa wyższego i nauki, instytutów badawczych, instytutów działających w ramach Sieci Badawczej Łukasiewicz, jednostek organizacyjnych tworzonych przez Polską Akademię Nauk, Polskiej Komisji Akredytacyjnej, Rady Doskonałości Naukowej - art. 2 ust. 1)  
.  
Szersze zastosowanie ma **podpis osobisty** (Dz.U.2022.671 - ustawa o dowodach osobistych), który zgodnie z prawem ma skutek prawny **równoważny podpisowi własnoręcznemu** w stosunku do podmiotu publicznego. Dodatkowo może być wykorzystany w innych relacjach, np. cywilnoprawnych z kontrahentem w przypadku obopólnej zgody stron (art. 12d). Podpis osobisty występuje w kpa, w prawie podatkowym, w informatyzacji i doręczeniach elektronicznych, w sprawozdaniach finansowych spółek, we wnioskach do KRS i w skargach do WSA/NSA.  
Pomimo tego, że podpis osobisty jest podpisem wyższej klasy w stosunku do podpisu zaufanego, to jest (na razie) pewna niedogodność w jego weryfikowaniu.  
.  
Kodeks postępowania administracyjnego (Dz.U.2024.572 t.j.) przywołuje te podpisy w art.  14.  (Zasada pisemności postępowania...) §  1a.:  
Sprawy należy prowadzić i załatwiać na piśmie utrwalonym w postaci papierowej lub elektronicznej.  
Pisma utrwalone w postaci papierowej opatruje się podpisem własnoręcznym.  
Pisma utrwalone w postaci elektronicznej opatruje się kwalifikowanym podpisem elektronicznym, podpisem zaufanym albo podpisem osobistym lub kwalifikowaną pieczęcią elektroniczną organu administracji publicznej ze wskazaniem w treści pisma osoby opatrującej pismo pieczęcią.
</small>

* Zob. też [Podpisy cyfrowe]({% if jekyll.environment == "production" %}{{site.baseurl}}{% endif %}{% post_url 2019-09-19-Podpisy_cyfrowe %})

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