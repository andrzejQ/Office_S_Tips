---
layout: post
title:  "DOCX - symbole wieloznaczne"
date:   2019-09-21 10:21:59 +0100
categories: DOCX
---

"Zamień" \ [Więcej>>] \ [x] Użyj sym<u>b</u>oli wieloznacznych

wygląda _prawie_ jak korzystanie z wyrażeń regularnych. Jednak tutaj to _prawie_ potrafi być naprawdę denerwujące. Może jednak czasem warto się przebić przez osobliwości takich wyrażeń:

1. bo są całkiem zgrabnie opisane w przycisku [Specjalnie],
2. a co najważniejsze pozwalają korzystać z formatowania zarówno w oknie "Znajdź" jak i przede wszystkim w "Zamień na".

Dla osób korzystających z wyrażeń regularnych pewnym zaskoczeniem może być to, że w symbolach wieloznacznych mamy tylko wyszukiwanie niezachłanne i co najgorsze nie widać możliwości wpisania początku / końca paragrafu.

Gdybyśmy więc chcieli wyszukać w powyższym zdaniu fragment od ukośnika do końca paragrafu to wpisanie `/?@` (tj. `/<dowolny znak>1 lub więcej`) da tylko `/<spacja>`. Dopiero `/?@.` da cały fragment `/ końca paragrafu.`. Ale nie zawsze w paragrafie jest jedyna kropka na końcu i nie zawsze jest kropka - może nie być nic albo "!" albo "?". Wtedy można czasem posłużyć się protezą - zamianą końca paragrafu (`^p` - ale nie w trybie symboli wieloznacznych) na ręczny podział wiersza `^l`. A ręczny podział wiersza już występuje w liście znaków specjalnych symboli wieloznacznych.

Dobra wiadomość - w polu "Zamień na" nie potrzeba nic wpisywać, a można dodać formatowanie, które będzie dotyczyło wyszukanych fragmentów dokumentu.