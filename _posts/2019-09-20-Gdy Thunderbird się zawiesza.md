---
layout: post
title:  "Gdy Thunderbird się zawiesza"
date:   2019-09-20 18:21:59 +0100
categories: System
---


_+ 20.08.2024_{: .date} 
[1.Thunderbird zawiesza się podczas pobierania nowych wiadomości]({{site.url}}{{site.baseurl}}{{page.url}}#1thunderbird-zawiesza-się-podczas-pobierania-nowych-wiadomości) * 
[2.Thunderbird — tryb rozwiązywania problemów]({{site.url}}{{site.baseurl}}{{page.url}}#2thunderbird--tryb-rozwiązywania-problemów) * 
[3.Thunderbird — rozwiązywanie problemów dla zaawansowanych]({{site.url}}{{site.baseurl}}{{page.url}}#3thunderbird--rozwiązywanie-problemów-dla-zaawansowanych)

<style>.date{font-size: smaller;color:#828282;}</style>

----
### 1.Thunderbird zawiesza się podczas pobierania nowych wiadomości

Zdarzało mi się, że po uaktualnieniu Thunderbird do nowszej wersji program zachowywał się niestabilnie. Po (niedługiej) chwili od uruchomienia zawieszał się (zamrażał) i tylko można było zamknąć aplikację. Nie działały typowe porady - jak te niżej opisane. Zadziałało to:

1. Włączam z lewej strony - na liście kont pocztowych opcję "Wyświetlaj rozmiar folderu".
2. Wyłączam automatyczne pobieranie wiadomości dla każdego konta pocztowego w **ustawieniach**:  
   **Konfiguracja serwera** \ `[_]` Sprawdzaj podczas uruchamiania, czy są nowe wiadomości, `[_]` Automatycznie pobieraj nowe wiadomości  
   <small>(a przynajmniej dla konta pocztowego, gdzie rozmiar skrzynki "Odebrane" jest ogromny, np. ponad 1GB)</small>
3. Przenoszę dużą część (starszych) wiadomości do archiwum. Przy okazji usuwam też zbędne wiadomości z ogromnymi załącznikami, albo usuwam / odłączam takie załączniki z wiadomości.
4. Porządkuję foldery.
5. Gdy problem już nie występuje przywracam przydatne ustawienia w "Konfiguracjach serwerów".

<small>
Trudno jednak stwierdzić co było przyczyną tych kłopotów. Przy takiej samej konfiguracji na innym komputerze nie było problemów. Widziałem też bezproblemową obsługę skrzynek o pojemności wielu GB.
</small>

. 

W moim przypadku nic nie dawały porady jak poniżej, ale mogą być skuteczne w innych warunkach...

----
### 2.Thunderbird — tryb rozwiązywania problemów

Klikając na ikonę Thunderbird przy wciśniętym klawiszu `[Shift]` uruchamiamy:

**Thunderbird — tryb rozwiązywania problemów**  
użyj tego trybu programu Thunderbird do diagnozowania problemów.  Dodatki i ustawienia użytkownika
zostaną tymczasowo wyłączone.  
[Kontynuuj w trybie rozwiązywania problemów]


Przy okazji niektóre z poniższych zmian można wprowadzić na stałe:

`[ ]` Wyłącz wszystkie dodatki  
`[ ]` Przywróć domyślne paski narzędzi i przyciski  
[Wprowadź zmiany i uruchom ponownie]


----
### 3.Thunderbird — rozwiązywanie problemów dla zaawansowanych

W Internecie są też porady bardziej zaawansowane, jak przebudowa indeksów e-maili poprzez zmazanie pliku bazy indeksów.

Można też próbować [cofnąć uaktualnienie Thunderbird do poprzedniej wersji](https://www.companionlink.com/support/wiki/index.php/How_to_downgrade_ThunderBird_Supernova_115_to_Regular_Thunderbird_102_Email)
, co polega na zamknięciu aplikacji, usunięciu pliku "compatibility.ini" z profilu TB użytkownika i zainstalowaniu [wcześniejszej wersji](https://archive.mozilla.org/pub/thunderbird/releases/). To może się też przydać na pewien czas, gdy oczekujemy na pojawienie się nowej wersji ważnej dla nas wtyczki, która działała dla wersji starszej.

 

<style> pre code {font-size: smaller;} </style>

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