---
layout: post
title:  "Drobne podpowiedzi 2"
date:   2019-09-20 10:21:59 +0100
categories: System
---

[Króki tekst z komputera przez QR-kod do tel. kom.]({{ site.url }}{{ site.baseurl }}{{ page.url }}#szybkie-przenoszenie-niewielkiego-tekstu-z-komputera-do-tel-komórkowego) * ...

----
## Szybkie przenoszenie niewielkiego tekstu z komputera do tel. komórkowego:

W edytorze tekstu [**Notatnik++**](https://notepad-plus-plus.org/downloads/) zainstaluj wtyczkę **NppQrCode** (menu: Wtyczki \ Plugins Admin...)

1. Zaznacz fragment tekstu i kliknij ikonę wtyczki ![NppQrCode.png]({{ site.baseurl }}/assets/img/NppQrCode.png "NppQrCode.png"){:style="width:10em;"}
 
2. W tel. komórkowym włącz aparat i nakieruj go na QR-kod (nie rób zdjęcia, tylko poczekaj na złapanie ostrości). Gdy pojawi się przycisk `( X Pokaż dane )` dotknij go i skopiuj tekst do schowka, a potem gdzieś wklej.  
<small>Są też specjalistyczne aplikacje do odczytywania QRkodu, np. **Czytnik Kodów QR i paskowych** / TeaCaps.</small>

Pamiętaj: Notatnik++ to jeden edytorów tekstowych w którym można włączyć wtyczki:
* **DSpellCheck** - z automatycznym sprawdzaniem pisowni; można nawet nie instalować słownika, a w ustawieniach włączyć _Library_: Native(Windows)
* **Compare** - porównuje teksty 2 plików (nawet nie muszą być zapisane); w MS Word też można porównywać pliki, ale tutaj można szybciej coś skopiować (np. z DOCX czy PDF) i teksty nie muszą być zapisane; dodatkowo mamy porównywany tylko czysty tekst (samą treść)
* Wykrywane są w tekście odnośniki do stron `http://` i `https://`, które stają się klikalne - otwierają stronę w przeglądarce.
* W _znajdź / zamień_ działają wyrażenia regularne.





- - - -

## Hurtowe zmniejszanie dużych obrazów `*.jpg`

Hurtowe zmniejszanie dużych obrazów `*.jpg` do 50%
w aktualnie otwartym folderze i  jego wszystkich podfolderach

(można ustawić `set DUZY=4000000` na inną wartość w `r.cmd`).

INSTALACJA
-------------------
1. Potrzebne jest wcześniejsze zainstalowanie https://www.irfanview.com/ np. 32-bit (darmowe do użytku domowego / niekomercyjnego)
2. Wypakuj [**i_view_advancedbatch.zip**]({{ site.baseurl }}/assets/files/i_view_advancedbatch.zip) i zamień/skopiuj plik `r.txt` na `r.cmd` (dla bezpieczeństwa - nie pobieramy bezpośrednio pliku `*.cmd`)
3. Umieść pliki `r.cmd` i `i_view32.ini` oraz/lub `i_view64.ini` gdzieś, gdzie wskazuje PATH  
 ... albo w aktualnie otwartym folderze z obrazami *.jpg.

(Plik INI z innymi ustawieniami można też wygenerować w IfranView:

     Plik \ Przetwarzanie wsadowe (seryjne) \ Opcja zaawansowane... \ [Zapisz ustawienia])

UŻYWANIE
-------------------
Wpisz

    r.cmd

w pasku eksploratora plików w aktualnie otwartym folderze w którym są obrazy `*.jpg`
Nastąpi automatyczne zmniejszenie wszystkich dużych `*.jpg` - poczekaj i na zakończenie naciśnij dowolny klawisz.
