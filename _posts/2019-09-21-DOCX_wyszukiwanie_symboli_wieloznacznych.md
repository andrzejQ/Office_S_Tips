---
layout: post
title:  "DOCX - symbole wieloznaczne"
date:   2019-09-21 10:21:59 +0100
categories: DOCX
---

_+ 25.04.2024_{: .date}  
Zaawansowane wyszukiwanie i zamiana wraz z możliwością zmiany formatowania w wyszukanych fragmentach oraz przyklejania osamotnionych liter **a**, **w**, **i**, **z**, **o**, **u**  na początek kolejnego wiersza.

<style>.date{font-size: smaller;color:#828282;}</style>

Jeśli interesuje cię tylko sprawa osamotnionych liter to [przeczytaj więcej poniżej](#automatyczne-porzenoszenie-pojedynczych-liter-z-końca-wiersza-do-wiersza-następnego), a krótko mówiąc:
* W otwartym dokumencie naciśnij `Ctrl+H` (albo menu: Narzędzia główne \ Zamień)
* [**Więcej <u>></u>>**] \ [x] **Użyj sym<u>b</u>oli wieloznacznych** 
* Wklej w polu "Znaj<u>d</u>ź": `<([awizou]) <`  (tu na końcu jest spacja i "<" oznaczający początek wyrazu), w "Zam<u>i</u>eń na": `\1^s`. Na koniec [**Zam<u>i</u>eń wszystko**].
* ![spacja_nierozdzielajaca.png]({{site.baseurl}}/assets/img/spacja_nierozdzielajaca.png "spacja_nierozdzielajaca.png"){: style="float:right;width:31%;margin:12px;"}Dla kontroli na chwilę włącz przycisk [**¶**] <small>(Narzędzia główne - sekcja Akapit) = [Ctrl+Shift+8]</small> i zobacz czy pojawiły się spacje nierozdzielające.  
<br>

- - - - -

### Symbole wieloznaczne w MS Word

**Zamień** \ [**Więcej <u>></u>>**] \
* [x] **Użyj sym<u>b</u>oli wieloznacznych**   ![Word-symbole-wieloznaczne.png]({{site.baseurl}}/assets/img/Word-symbole-wieloznaczne.png "Word-symbole-wieloznaczne.png"){: style="float:right;width:40%;"}

wygląda _prawie_ jak korzystanie z 
[wyrażeń regularnych](https://andrzejq.github.io/El_Prog/programowanie/2019/09/07/RegularExpression-sciagawka.html). 
Jednak tutaj to _prawie_ potrafi być naprawdę denerwujące. Tym nie mniej czasem warto się przebić przez osobliwości takich wyrażeń:

* bo są całkiem zgrabnie opisane w przycisku [**Specjalne ^**],
* a co najważniejsze pozwalają korzystać z opcji formatowania zarówno w oknie "Znaj<u>d</u>ź" jak i przede wszystkim w "Zam<u>i</u>eń na", czyli np. w polu "Zamień na" można nic wpisywać, a można tylko dodać zmienione formatowanie, które będzie dotyczyło wyszukanych fragmentów dokumentu.

Dla osób korzystających z wyrażeń regularnych zaskoczeniem może być to, że w symbolach wieloznacznych mamy tylko wyszukiwanie niezachłanne, tzn. wyszukiwany jest jak najkrótszy fragment pasujący do wzorca. I dobrze.

* <small>zob. też [Triki w Wordzie, które powinien znać każdy
redaktor](https://phavi.umcs.pl/at/attachments/2020/0120/132240-triki-word.pdf) - to ciekawy dokument PDF, który jest do wyszukania w Internecie. Autora nie udaje się odszukać. Jest tam informacja o dodatkowych znakach nie występujących na liście [**Specjalne ^**]. Np. gdy jest włączona opcja symboli wieloznacznych to na liście nie ma znaku końca paragrafu `^p` (¶), a okazuje się, ze wtedy można użyć `^13`. Jest też ciekawy przykład dla znaków w formacie "Nie Pogrubienie" i "Nie znak akapitu" tj. `[!^13]`.
</small>
* <small>zob. [Finding and replacing characters using wildcards](https://wordmvp.com/FAQs/General/UsingWildcards.htm) - sporo przykładów</small>
* <small>[MS_Word_symb_wielozn-testy.docx.zip]({{site.baseurl}}/assets/files/MS_Word_symb_wielozn-testy.docx.zip)</small>


### Automatyczne porzenoszenie pojedynczych liter z końca wiersza do wiersza następnego

![Word-symbole-wieloznaczne-zamien-na.png]({{site.baseurl}}/assets/img/Word-symbole-wieloznaczne-zamien-na.png "Word-symbole-wieloznaczne-zamien-na.png"){: style="float:right;width:40%;"}
Niektórzy nie preferują pozostawiania pojedynczych liter np. **a**, **w**, **i**, **z**, **o**, **u** na końcu wiersza. Sposobem na automatyczne przenoszenie ich do kolejnego wiersza jest wstawianie z ich prawej strony spacji nierozdzielającej (niełamliwej). Można to zrobić automatycznie w całym dokumencie.

W trybie symboli wieloznacznych - pole "Znaj<u>d</u>ź": `<([awizou]) <`  (tu na końcu jest spacja i "<" oznaczający początek wyrazu), pole "Zam<u>i</u>eń na": `\1^s`. Na koniec [**Zam<u>i</u>eń wszystko**].

Różnicę pomiędzy spacją a spacją nierozdzielającą można podejrzeć klikając przycisk [**¶**] w menu (wstążce) Worda <small>=[Ctrl+Shift+8]</small> (tu ![spacja_nierozdzielajaca.png]({{site.baseurl}}/assets/img/spacja_nierozdzielajaca.png "spacja_nierozdzielajaca.png"){: style="width:31%;"}).

Uwagi
1. Zauważ, że przycisk [**Specjalne ^**] po przejściu do pola "Zam<u>i</u>eń na" zmienia listę dostępnych symboli. Również w trybie wyłączonych symboli wieloznacznych lista symboli jest całkiem inna - warto zobaczyć.
2. W trybie symboli wieloznacznych jest rozróżniana wielkość liter. Jeśli należałoby uwzględniać także pojedyncze wielkie litery to w polu "Znaj<u>d</u>ź" wstawiamy `<([awizouAWIZOU]) <`. 
3. Dla nieco zaawansowanych: [MS Word - makra, pola, szablony »]( https://andrzejq.github.io/El_Prog/programowanie/2024/04/18/MS_Word-makra_pola_szablony.html)


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