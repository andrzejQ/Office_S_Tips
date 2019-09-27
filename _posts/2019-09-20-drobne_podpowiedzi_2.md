---
layout: post
title:  "Drobne podpowiedzi 2"
date:   2019-09-20 10:21:59 +0100
categories: System
---

[Tekst z komputera przez QR-kod do tel. kom.]({{ site.url }}{{ site.baseurl }}{{ page.url }}#szybkie-przenoszenie-niewielkiego-tekstu-z-komputera-do-tel-komórkowego) * [Hurtowe zmniejszanie dużych obrazów *.jpg]({{ site.url }}{{ site.baseurl }}{{ page.url }}#hurtowe-zmniejszanie-dużych-obrazów-jpg)

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

## Hurtowe zmniejszanie dużych obrazów *.jpg

Gdy chcemy zapamiętać roczną kopię zdjęć, przesłać zdjęcia na dysk sieciowy czy przekazać do oglądania na pendrive to bardzo przydaje się zmniejszenie rozmiaru plików naszych obrazów, do takich, że jakość oglądania jest doskonała, a równocześnie szybko się je kopiuje i wczytuje.

Wtedy może przydać się 

* hurtowe zmniejszanie dużych obrazów `*.jpg` (>4MB) do 50% wymiaru (i wielokrotnie mniejszej pojemności) w aktualnie otwartym folderze i  jego wszystkich podfolderach
    * (można ustawić `set DUZY=4000000` na inną wartość w `r.cmd`).

### Instalacja

1. Potrzebne jest wcześniejsze zainstalowanie <https://www.irfanview.com/> (darmowy do użytku domowego i niekomercyjnego)
2. Wypakuj [**i_view_advancedbatch.zip**]({{ site.baseurl }}/assets/files/i_view_advancedbatch.zip) i zamień/skopiuj plik `r.txt` na `r.cmd`.
3. Umieść pliki `r.cmd` i `i_view32.ini` oraz/lub `i_view64.ini` gdzieś, gdzie wskazuje PATH (w menu START zacznij pisać "Edytuj zmienne środowiskowe dla konta")  
 ... albo w folderze z obrazami *.jpg lub folderze nadrzędnym, z którego będziemy uruchamiali skrypt.

Plik `i_view...ini` jest gotowy, ale można go też utworzyć z innymi, swoimi ustawieniami w IfranView:

     Plik \ Przetwarzanie wsadowe (seryjne) \ Opcja zaawansowane... \ 
       opcjonalnie - [Ładuj ustawienia]
       [Zapisz ustawienia]

![i_view_ini.png]({{ site.baseurl }}/assets/img/i_view_ini.png "i_view_ini.png"){:style="float:right;width:77%;"} 
Załadowanie ustawień pozwala na podgląd tego co jest wpisane w `i_view...ini` ->

### Użytkowanie

**Uwaga - wypróbuj najpierw działanie na kopii danych!**

Wpisz

    r.cmd

w pasku eksploratora plików w aktualnie otwartym folderze w którym lub poniżej którego są obrazy `*.jpg` i naciśnij [Enter].
Nastąpi automatyczne zmniejszenie wszystkich dużych `*.jpg`, także w podfolderach - poczekaj i na zakończenie naciśnij dowolny klawisz.
![cmd-exe.png]({{ site.baseurl }}/assets/img/cmd-exe.png "cmd-exe.png"){:style="float:right;width:33%;"} 
![r-cmd.png ]({{ site.baseurl }}/assets/img/r-cmd.png  "r-cmd.png "){:style="float:right;width:22%;"} 
