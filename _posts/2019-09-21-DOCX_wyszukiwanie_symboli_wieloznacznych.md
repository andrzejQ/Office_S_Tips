---
layout: post
title:  "DOCX - symbole wieloznaczne"
date:   2019-09-21 10:21:59 +0100
categories: DOCX
---

Zaawansowane wyszukiwanie i zamiana wraz z możliwością zmiany formatowania w wyszukanych fragmentach oraz przyklejania osamotnionych liter **a**, **w**, **i**, **z**, **o**, **u**  na początek wiersza.

**Zamień** \ [**Więcej <u>></u>>**] \
* [x] **Użyj sym<u>b</u>oli wieloznacznych**   ![Word-symbole-wieloznaczne.png]({{ site.baseurl }}/assets/img/Word-symbole-wieloznaczne.png "Word-symbole-wieloznaczne.png"){:style="float:right;width:40%;"}

wygląda _prawie_ jak korzystanie z wyrażeń regularnych. Jednak tutaj to _prawie_ potrafi być naprawdę denerwujące. Tym nie mniej czasem warto się przebić przez osobliwości takich wyrażeń:

* bo są całkiem zgrabnie opisane w przycisku [**Specjalne ^**],
* a co najważniejsze pozwalają korzystać z formatowania zarówno w oknie "Znaj<u>d</u>ź" jak i przede wszystkim w "Zam<u>i</u>eń na".

Dla osób korzystających z wyrażeń regularnych zaskoczeniem może być to, że w symbolach wieloznacznych mamy tylko wyszukiwanie niezachłanne i co najgorsze nie widać możliwości wpisania początku / końca paragrafu.

Gdybyśmy więc chcieli wyszukać w powyższym zdaniu fragment od ukośnika do końca paragrafu to wpisanie `/?@` wybierze tylko `/ `. Dopiero `/?@.` wybierze cały fragment `/ końca paragrafu.`. Ale nie zawsze w paragrafie jest jedyna kropka na końcu i nie zawsze jest kropka - może nie być nic albo "!", albo "?". Wtedy można czasem posłużyć się protezą - zamianą końca paragrafu (`^p` - ale nie w trybie symboli wieloznacznych) na ręczny podział wiersza `^l`. A ręczny podział wiersza już występuje w liście znaków specjalnych symboli wieloznacznych.

Dobra wiadomość - w polu "Zamień na" nie potrzeba nic wpisywać, a można tylko dodać formatowanie, które będzie dotyczyło wyszukanych fragmentów dokumentu.

### Automatyczne porzenoszenie pojedynczych liter z końca wiersza do wiersza następnego

![Word-symbole-wieloznaczne-zamien-na.png]({{ site.baseurl }}/assets/img/Word-symbole-wieloznaczne-zamien-na.png "Word-symbole-wieloznaczne-zamien-na.png"){:style="float:right;width:40%;"}
Niektórzy nie preferują pozostawiania pojedynczych liter np. **a**, **w**, **i**, **z**, **o**, **u** na końcu wiersza. Sposobem na automatyczne przenoszenie ich do kolejnego wiersza jest wstawianie z ich prawej strony spacji nierozdzielającej (niełamliwej). Można to zrobić automatycznie w całym dokumencie.

W trybie symboli wieloznacznych - pole "Znaj<u>d</u>ź": `<([awizou]) `  (tu na końcu jest spacja), pole "Zam<u>i</u>eń na": `\1^s`. Na koniec [**Zam<u>i</u>eń wszystko**].

Różnicę pomiędzy spacją a spacją nierozdzielającą można podejrzeć naciskając przycisk [**¶**] w menu (wstążce) Worda.

Uwagi
1. Zauważ, że przycisk [**Specjalne ^**] po przejściu do pola "Zam<u>i</u>eń na" zmienia listę dostępnych symboli. Również w trybie wyłączonych symboli wieloznacznych lista symboli jest całkiem inna - warto zobaczyć.
2. W trybie symboli wieloznacznych jest rozróżniana wielkość liter. Jeśli należałoby uwzględniać także pojedyncze wielkie litery to w polu "Znaj<u>d</u>ź" wstawiamy `<([AWIZOUawizou]) `. 
