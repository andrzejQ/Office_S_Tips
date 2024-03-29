---
layout: post
title:  "Windows 10 - uaktualnienia"
date:   2019-10-04 08:41
categories: System
---

Kilka ciekawych ulepszeń w kolejnych wydaniach Win 10, dotyczące także pracy biurowej, np. wstawianie symboli, powiększanie czcionki ekranowej. * [Szybka zmiana formatu daty z pomocą Powershell]({{site.url}}{{site.baseurl}}{{page.url}}#format-daty) * [Microsoft PowerToys]({{site.url}}{{site.baseurl}}{{page.url}}#microsoft-powertoys)


Majowe tzw. duże uaktualnienie Windowsa 10 z 2019r wprowadza trochę zmian <small>(symbol <span>1903</span>{: style="color:blue"} oznacza rok 20<span>19</span>{: style="color:blue"} i miesiąc <span>03</span>{: style="color:blue"}  - zapewne chodzi o czas powstania uaktualnienia, które potem jest wdrażane)</small>. Sporo informacji można znaleźć w:
* <https://www.centrumxp.pl/Publikacja/Pelna-lista-zmian-w-Windows-10-May-2019-Update> 
* <https://www.spidersweb.pl/2019/01/windows-10-1903.html>. 

W pracy biurowej może się przydać m.in.
* wygodne kopiowanie wycinka ekranu i nanoszenie na nim notatek: **`[Win+Shift+S]`** (tutaj **`+`** oznacza: przytrzymaj i naciskaj kolejny klawisz; zob. też [inne skróty klawiszowe](https://www.komputerswiat.pl/poradniki/programy/windows-10-skroty-klawiaturowe-windows-10-pulpit-pasek-zadan-wiersz-polecenia/pt4gpwy))  
Można sobie też taką funkcję [przypisać do klawisza Print Screen](https://www.centrumxp.pl/Publikacja/Jak-wywolac-wycinanie-obrazu-klawiszem-Print-Screen) (polecam):  
**`[Win+I]`** \ ![UlatwieniaDostepu1.png]({{site.baseurl}}/assets/img/UlatwieniaDostepu1.png "UlatwieniaDostepu1.png"){: style="width:2em;"}Ułatwienia dostępu \ Klawiatura \ Skrót klawisza Print Screen \ Włączone
<br>
* nowy sposób powiększania kursora myszy, czcionki ekranowej lub wszystkiego:  
**`[Win+I]`** \ ![UlatwieniaDostepu1.png]({{site.baseurl}}/assets/img/UlatwieniaDostepu1.png "UlatwieniaDostepu1.png"){: style="width:2em;"}Ułatwienia dostępu
![UlatwieniaDostepu-Ekran.png]({{site.baseurl}}/assets/img/UlatwieniaDostepu-Ekran.png "UlatwieniaDostepu-Ekran.png"){: style="float:right;width:38%;"}
![UlatwieniaDostepu-Wskaznik.png]({{site.baseurl}}/assets/img/UlatwieniaDostepu-Wskaznik.png "UlatwieniaDostepu-Wskaznik.png"){: style="width:32%;"}
  * Ogólnie powiększenie wszystkiego jest w przypadku monitorów wysokiej rozdzielczości bardzo potrzebne, ale równocześnie stwarza dużo problemów z rozmywaniem czcionek. Ten sposób pozawala na osobne ustawianie powiększana na każdym ekranie - jeśli mamy dwa. Na razie wydaje mi się, że najmniej problemów z rozmywaniem czcionek jest wtedy, gdy na obu monitorach ustawimy to samo powiększenie.
  * Warto też pamiętać o jednorazowym skorygowaniu ClearType na każdym monitorze (naciśnij `[Win]` i wpisz "ClearType")
  * Dodatkowo można poprawić rozmywanie w konkretnej aplikacji: **P**rawy**K**lawisz**M**yszy - Właściwości \ karta:Zgodność \ [Zmień ustawienia wysokiej rozdzelczości DPI].  
<br>
* ![Symbole_1.png]({{site.baseurl}}/assets/img/Symbole_1.png "Symbole_1.png"){: style="float:right;width:17%;"}     Wstawianie znaków specjalnych **`[Win+.]`** <small>(przytrzymaj klawisz Windows i naciśnij kropkę)</small>. W pierwszej chwili wydawać się może, że tu chodzi o emotikony, ale po przełączeniu na **Symbole** mamy sporo przydatnych znaków specjalnych.  
<small>Uwaga - nietypowe znaki wymagają przetestowania. Co prawda ich wstawianie działa nawet w notatniku, ale wymaga czcionek używanych w nowoczesnych systemach.</small>

![Symbole_2.png]({{site.baseurl}}/assets/img/Symbole_2.png "Symbole_2.png"){: style="width:233px;"} 
![Symbole_3.png]({{site.baseurl}}/assets/img/Symbole_3.png "Symbole_3.png"){: style="width:221px;"} 
![Symbole_4.png]({{site.baseurl}}/assets/img/Symbole_4.png "Symbole_4.png"){: style="width:221px;"} 
![Symbole_5.png]({{site.baseurl}}/assets/img/Symbole_5.png "Symbole_5.png"){: style="width:220px;"} 
![Symbole_6.png]({{site.baseurl}}/assets/img/Symbole_6.png "Symbole_6.png"){: style="width:231px;"}

### Format daty

Windows 10 ma format krókiej daty `'dd.MM.yyyy'`. Gdyby jednak była potrzeba przełączenia na format 'yyyy-MM-dd' to trzeba się trochę naklikać. Ale można wkleić do okienka Powershell polecenie
````powershell
($c=Get-Culture).DateTimeFormat.ShortDatePattern='yyyy-MM-dd'; Set-Culture $c
````
i po naciśnięciu `[Enter]` błyskawicznie uzyskać nowe ustawienie.

*Aktualizacja 2021-03-24:*  
Wygląda na to, że w nowszych kompilacjach Win10, np. 20H2 `Set-Culture` działa tylko na aktualną sesję PowerShell.
Trwale działa modyfikacja zapisu w rejestrze w PowerShell (i działa od razu - nie trzeba restartować systemu)

````powershell
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sShortDate -Value yyyy-MM-dd
````

<small>Zob. też post: [Hybrydowy plik CMD-Powershell](https://andrzejq.github.io/El_Prog/programowanie/2021/03/22/Hybrydowy_skrypt_CMD-Powershell.html).</small>.

### Microsoft PowerToys

... to kolekcja przydatnych narzędzi, m.in. zmniejszanie rozmiaru wielu zdjęć, zaawansowana zmiana nazw wielu plików, w obszarze podglądu dodatkowe typy plików - SVG i Markdown, przeprogramowywanie klawiatury, wstrzymywanie przed uśpieniem.

* <https://github.com/microsoft/PowerToys/releases>
* <https://www.komputerswiat.pl/poradniki/programy/osiem-przydatnych-wskazowek-do-power-toys-praktycznych-narzedzi-dla-windows/vb5bmnk>

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