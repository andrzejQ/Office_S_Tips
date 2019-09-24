---
layout: post
title:  "DOCX - symbole wieloznaczne"
date:   2019-09-21 10:21:59 +0100
categories: DOCX
---


**Zamień** \ [**Więcej <u>></u>>**] \
* [x] **Użyj sym<u>b</u>oli wieloznacznych**   ![Word-symbole-wieloznaczne.png]({{ site.baseurl }}/assets/img/Word-symbole-wieloznaczne.png "Word-symbole-wieloznaczne.png"){:style="float:right;width:40%;"}

wygląda _prawie_ jak korzystanie z wyrażeń regularnych. Jednak tutaj to _prawie_ potrafi być naprawdę denerwujące. Tym nie mniej czasem warto się przebić przez osobliwości takich wyrażeń:

1. bo są całkiem zgrabnie opisane w przycisku [**Specjalne ^**],
2. a co najważniejsze pozwalają korzystać z formatowania zarówno w oknie "Znaj<u>d</u>ź" jak i przede wszystkim w "Zam<u>i</u>eń na".

Dla osób korzystających z wyrażeń regularnych zaskoczeniem może być to, że w symbolach wieloznacznych mamy tylko wyszukiwanie niezachłanne i co najgorsze nie widać możliwości wpisania początku / końca paragrafu.

Gdybyśmy więc chcieli wyszukać w powyższym zdaniu fragment od ukośnika do końca paragrafu to wpisanie `/?@` wybierze tylko `/ `. Dopiero `/?@.` wybierze cały fragment `/ końca paragrafu.`. Ale nie zawsze w paragrafie jest jedyna kropka na końcu i nie zawsze jest kropka - może nie być nic albo "!", albo "?". Wtedy można czasem posłużyć się protezą - zamianą końca paragrafu (`^p` - ale nie w trybie symboli wieloznacznych) na ręczny podział wiersza `^l`. A ręczny podział wiersza już występuje w liście znaków specjalnych symboli wieloznacznych.

Dobra wiadomość - w polu "Zamień na" nie potrzeba nic wpisywać, a można tylko dodać formatowanie, które będzie dotyczyło wyszukanych fragmentów dokumentu.