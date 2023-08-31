---
layout: post
title:  "Portfele haseł"
date:   2021-03-01 21:21:21 +0100
categories: pswd
---

Kilka luźnych uwag - KeePass, Bitwarden...

1. [**KeePass Password Safe**](https://keepass.info/) (free, open source)
   * Zaleta, gdy ważna jest prywatność: baza trzymana w lokalnym, zaszyfrowanym pliku
   * ![Keepass2-Opcje-integracja.png]({{site.baseurl}}/assets/img/Keepass2-Opcje-integracja.png "Keepass2-Opcje-integracja.png"){: style="float:right;width:550px;"} Jest opcja autouzupełniania loginów/haseł, ale od razu trzeba zmienić domyślny skrót klawiszowy `[Ctrl+Alt+A]` na coś innego, bo ten to akurat jest wywołanie litery "ą".
   * Konfigurowanie autozupełniania nie jest może zbyt proste, ale jest bardzo użyteczne.
   * Warto, żeby kombinacja autozupełniania nie była tak do końca automatyczna, np. `{USERNAME}{TAB}{PASSWORD}{ENTER}`. Lepiej, żeby na koniec trzeba było samodzielnie nacisnąć Enter czy coś kliknąć, bo inaczej może się zdarzyć, że nasze super tajne hasło wpisze się w jakimś zbyt jawnym miejscu, np. zapytaniu przeglądarki internetowej, więc np. po prostu może to być `{USERNAME}{TAB}{PASSWORD}` (w wersji 2 jest to ustawienie grupy).
   * Łatwo można odszukać historyczne hasła sprzed wielu lat - przydatne np. podczas uruchomienia starego komputera.
   * Portal ["Niebezpiecznik"](https://niebezpiecznik.pl/post/keepass-jak-zaczac-swoja-przygode-z-managerem-hasel/) proponuje używanie wieloplatformowowej wersji [KeepassXC](https://keepassxc.org/).
2. [**Bitwarden**](https://bitwarden.com/download/) (open source, bezpłatne dla pojedynczego użytkownika, a nawet dla podwójnego)
   * Zaszyfrowana baza haseł w chmurze pozwala na wygodne współużywanie na różnych urządzeniach.
   * Działa jako [**dodatki do przeglądarek**](https://bitwarden.com/download/#web-browser), oraz jako portal <https://vault.bitwarden.com/>, gdzie jest sporo opcji importu z innych portfeli haseł.
   * Można więc używać tego portfela jako drugiego do używania w przeglądarkach.
   * Biometryczne urządzenia w telefonach można używać do odblokowania aplikacji Bitwarden (ale zalogowanie wymaga oczywiście mocnego hasła głównego).
   * Niestety historia i czas ostatniego użycia nie jest pamiętany. Może to zmniejsza ruch internetowy, ale czasem brakuje takich informacji.


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