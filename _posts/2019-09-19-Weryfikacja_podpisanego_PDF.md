---
layout: post
title:  "Weryfikacja podpisu cyfrowego PDF w przeglądarce internetowej, weryfikacja podpisu osobistego"
date:   2019-09-19 10:21:56 +0100
categories: PKI
---

_+ 25.09.2024_{: .date}  
Poprawność podpisu można zweryfikować w aplikacji do składania podpisu. W przypadku PDF można to też sprawdzić w darmowej aplikacji Adobe Acrobat Reader. (Choć na razie weryfikacja podpisu osobistego ma pewne niedogodności). 
[Adobe Acrobat Reader]({{site.url}}{{site.baseurl}}{{page.url}}#adobe-acrobat-reader) *
[Firefox]({{site.url}}{{site.baseurl}}{{page.url}}#firefox) *
[Google Chrome]({{site.url}}{{site.baseurl}}{{page.url}}#google-chrome) *
[Microsoft Edge]({{site.url}}{{site.baseurl}}{{page.url}}#microsoft-edge)  *
[Weryfikacja podpisu osobistego]({{site.url}}{{site.baseurl}}{{page.url}}#weryfikacja-podpisu-osobistego) 

<style>.date{font-size: smaller;color:#828282;}</style>

#### Adobe Acrobat Reader

![AdobeR-PanelPodpis.png]({{site.baseurl}}/assets/img/AdobeR-PanelPodpis.png "AdobeR-PanelPodpis.png"){: style="float:right;width:65%;"}
Po otwarciu pliku w Adobe Acrobat Reader pojawia się pasek z przyciskiem [Panel Podpis], którego kliknięcie powoduje wyświetlenie szczegółów podpisu.

Jeśli często korzystamy z PDF z e-podpisami, to warto odpowiednio skonfigurować sobie przeglądarkę internetową:

#### Firefox

Po zmianie domyślnej konfiguracji działa to całkiem sprawnie:

Firefox \ `Opcje` \ (sekcja) `Aplikacje` \ (typ) `Dokument PDF` \ Otwórz w... zmieniamy na `"Użyj aplikacji Adobe Acrobat Reader"`.

#### Google Chrome

Google Chrome \ (po kliknięciu na plik PDF) `Pobierz` \ (w pasku pobranych na dole klikamy strzałkę w górę) `Otwórz w przeglądarce systemowej` albo `Zawsze otwieraj w przeglądarce systemowej`

Oczywiście jako przeglądarkę PDF należy ustawić Adobe Acrobat Reader

#### Microsoft Edge

Nowy Microsoft Edge - weryfikacja e-podpisów od razu w przeglądarce:

**Konfiguracja Microsoft Edge** (*jednorazowa*)  
<small>Na razie jest to wersja eksperymentalna usługi.</small>  
W pasku adresu wpisujemy:  
`edge://flags/#edge-digsig-enabled-pdf` albo  
`edge://flags` i przechodzimy do sekcji: `Enable Digital Signature for PDF`  
Wybieramy `[Enabled]`.

Po kliknięciu PDF \ "Podgląd" pojawia się w przeglądarce nad dokumentem pasek: 
* Ten dokument jest podpisany cyfrowo. (Niektórych podpisów nie można zweryfikować.)  
[Wyświetl podpisy]

Wybieramy `[Wyświetl podpisy]` \ `Właściwości` \ `Sprawdź poprawność`

Pomimo, że "Niektórych podpisów nie można zweryfikować" (np. dla podpisów pz.gov.pl czy tych z pieczęcią kwalifikowaną), to jednak można odczytać istotne dane podpisu - kto, kiedy.

#### Weryfikacja podpisu osobistego

* **Weryfikacja na komputerze**:

Obsługę podpisów cyfrowych zapewnia Polska Wytwórnia Papierów Wartościowych S.A. (PWPW). Do podpisywania i weryfikacji podpisu osobistego można używać aplikacji "**E-dowód podpis elektroniczny**" - zob. <https://www.gov.pl/web/e-dowod> - Pliki do pobrania.

Podpis osobisty jest w niej weryfikowany poprawnie, ale pojawia się ostrzeżenie: <span style="color: brown;">Żaden z certyfikatów w ścieżce nie znajduje się na zaufanej liście TSL!</span> 
{: style="color: darkblue;"}

Na moje zapytanie w tej sprawie otrzymałem odpowiedź z PWPW ServiceDesk, która nie odniosła się do treści ostrzeżenia, tylko do weryfikacji w Adobe Reader:
{: style="color: darkblue;"}

"  
Każdy podpis złożony przy użyciu e-dowodu można zweryfikować w narzędziu e-dowód Podpis elektroniczny możliwym do pobrania z <https://www.gov.pl/web/e-dowod>.

Status weryfikacji w oprogramowaniu Adobe Acrobat Reader „Tożsamość autora podpisu nie jest znana …” (weryfikacja „na żółto”) wynika z faktu, iż Adobe prowadzi własną listę zaufanych urzędów CA Adobe Approved Trust List (AATL) na której znajdują się certyfikowani przez Adobe wystawcy oraz wystawcy z listy TSL (europejska lista dostawców usług zaufanych).  
Status ten nie oznacza, że złożony podpis jest niepoprawny („weryfikacja na czerwono”), lecz to, że certyfikat którym się posłużono nie jest traktowany jako zaufany w tym oprogramowaniu.

Aby podpis osobisty złożony przy użyciu e-dowodu weryfikował się poprawnie w Adobe Acrobat Reader, wystawca certyfikatów e-dowodu (MSWiA) powinien wystąpić do firmy Adobe o wpisanie na listę AATL urzędu PL.ID Root CA lub notyfikować ten urząd w ramach Unii Europejskiej.  
Do czasu zakończenia formalnych procedur certyfikacji można samodzielnie dodać CA PLID do listy zaufanych w Adobe Acrobat Reader.  
W tym celu należy zaimportować certyfikaty CA urzędów: PLID_Root_CA, PLID_Authorization_CA_*, (do pobrania z http://repo.e-dowod.gov.pl/certs/) do magazynu zaufanych certyfikatów w Adobe Acrobat Reader:

menu -> Edycja -> Preferencje -> Podpisy -> Tożsamości i certyfikaty zaufane -> Więcej -> Zaufane certyfikaty.

Tutaj należy po kolei zaimportować (Importuj) i zaufać wybranym CA:
- PLID_Root_CA,
- PLID_Authorization_CA_20190221,
- PLID_Authorization_CA_20191207,
- PLID_Authorization_CA_20201202,

Po wykonaniu powyższego należy zamknąć aplikację, otworzyć na nowo i ponownie zweryfikować pliki.  
Podpisy złożone przy użyciu e-dowodu powinny być weryfikowane „na zielono”.

Pozdrawiamy  
Zespół eDO  
"




...

Zob. też 
* [Podpisy cyfrowe]({% if jekyll.environment == "production" %}{{site.baseurl}}{% endif %}{% post_url 2019-09-19-Podpisy_cyfrowe %})
* [Podpisywanie e-dokumentów za pomocą profilu zaufanego]({% if jekyll.environment == "production" %}{{site.baseurl}}{% endif %}{% post_url 2019-09-19-Podpisywanie_e_dokumentow_pz_gov_pl %})
* [Długoterminowe potwierdzanie ważności e-podpisu]({% if jekyll.environment == "production" %}{{site.baseurl}}{% endif %}{% post_url 2019-09-19-Dlugoterminowa_waznosc_e-podpisu %})


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