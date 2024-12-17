---
layout: post
title:  "Weryfikacja podpisu cyfrowego"
date:   2019-09-19 10:21:56 +0100
categories: PKI
---

_+ 25.09.2024, + 16.12.2024_{: .date}  
Poprawność podpisu można zweryfikować w tej samej aplikacji, która służy do składania podpisu.  
W przypadku PDF można to też sprawdzić w darmowej aplikacji Adobe Acrobat Reader.  
[Adobe Acrobat Reader]({{site.url}}{{site.baseurl}}{{page.url}}#adobe-acrobat-reader) *
[Weryfikacja w aplikacji komputerowej]({{site.url}}{{site.baseurl}}{{page.url}}#weryfikacja-w-aplikacji-komputerowej) *
[Weryfikacja w przeglądarce internetowej]({{site.url}}{{site.baseurl}}{{page.url}}#weryfikacja-na-serwerze-zdalnym-przez-przeglądarkę) *
[Weryfikacja podpisu osobistego]({{site.url}}{{site.baseurl}}{{page.url}}#weryfikacja-podpisu-osobistego) *
[pl.ID jako zaufany w Adobe Reader]({{site.url}}{{site.baseurl}}{{page.url}}#pl_ID_zaufany_w_Adobe) 

<style>.smaller{font-size:smaller;} .date{font-size:smaller;color:#828282;} .answ{font-size:smaller;color:DarkSlateBlue;}
blockquote{font-style: normal;letter-spacing: 0px;}</style>

Należy pamiętać, że **podpis elektroniczny** wywołuje skutki prawne, jeżeli **został złożony w okresie ważności tego certyfikatu** <small>(z art. 18 ustawy o usługach zaufania... Dz.U.2024.1725 t.j.) Dla ważności podpisu nie jest istotny moment jego weryfikacji, ale moment jego złożenia. Czyli w warunkach, gdy raport z programu weryfikującego stwierdza, że okres ważności podpisu minął należy sprawdzać okres jego ważności i czas złożenia podpisu</small>.

Program AdobeReader pozwala zarówno na podpisywanie jak i weryfikowanie poprawności podpisu (na razie z wyjątkiem podpisu osobistego pl.ID, [zob. niżej]({{site.url}}{{site.baseurl}}{{page.url}}#pl_ID_zaufany_w_Adobe)). Polskie rozwiązania do składania i/albo weryfikacji podpisu na ogół wykazują problemy, gdy weryfikacja następuje po okresie ważności certyfikatu podpisującego. Ale to się może zmienić, bo te komunikaty o błędach czy ostrzeżeniach nie uwzględniają art. 18 powyższej ustawy, pomimo, że można odczytać informację o okresie ważności certyfikatu i o czasie podpisywania. 

<small>
Dodatkowo te komunikaty nie spełniają wymogów dostępności, choćby w zakresie prostego języka, komunikując się żargonem z użyciem nieznanych powszechnie skrótów.
Takie ostrzeżenia dotyczące niemożności weryfikacji poza okresem ważności certyfikatu podważają ustawową zasadę równoważności e-podpisu z podpisem własnoręcznym.
</small>

### Adobe Acrobat Reader

![AdobeR-PanelPodpis.png]({{site.baseurl}}/assets/img/AdobeR-PanelPodpis.png "AdobeR-PanelPodpis.png"){: style="float:right;width:65%;"}
Po otwarciu pliku w Adobe Acrobat Reader pojawia się pasek z przyciskiem [Panel Podpis], którego kliknięcie powoduje wyświetlenie szczegółów podpisu.

Program **AdobeReader** można zapamiętać jako **domyślny** do otwierania plików PDF: 
1. Kliknij prawym klawiszem myszy na dowolnym pliku PDF;
2. Otwórz za pomocą >
   ![Adobe_domyslny.png]({{site.baseurl}}/assets/img/Adobe_domyslny.png "Adobe_domyslny.png"){: style="float:right;width:41%;"}
3. (!) Wybierz inną aplikację (na dole menu)
4. AdobeReader [Zawsze]

Jeśli często korzystamy z PDF z e-podpisami, to warto odpowiednio skonfigurować swoją przeglądarkę internetową, żeby pliki PDF otwierały się w Adobe Reader, a nie w przeglądarce:

##### Firefox

<details markdown=1><summary markdown="span"> . . . </summary>
![Firefox_PDF_Acrobat.png]({{site.baseurl}}/assets/img/Firefox_PDF_Acrobat.png "Firefox_PDF_Acrobat.png"){: style="float:right;width:65%;"}

Firefox `Ξ` (z prawej) \ `Ustawienia` \ `Ogólne` -  
przewijam w dół do sekcji \ `Aplikacje` \  
(typ) `Dokument PDF` \ `Użyj domyślnej aplikacji systemu Windows`  
albo wybieramy `Adobe Reader`  
w `Użyj innej aplikacji...`
</details>
.

##### Google Chrome

<details markdown=1><summary markdown="span"> . . . </summary>
![Chrome_PDF_Acrobat.png]({{site.baseurl}}/assets/img/Chrome_PDF_Acrobat.png "Chrome_PDF_Acrobat.png"){: style="float:right;width:40%;"}
Google Chrome \ (po kliknięciu na plik PDF) 1. `Pobierz` \ 2. `Pobrane pliki` (powyżej) - otwiera się historia pobierania \ (prawy klawisz myszy na nazwie pliku PDF) `Otwórz w przeglądarce systemowej` albo  
`Zawsze otwieraj w przeglądarce systemowej`

Oczywiście jako przeglądarkę PDF należy ustawić Adobe Reader.
</details>
.

##### Microsoft Edge

Można zapisać plik PDF na dysku i wybrać (pr.kl.myszy) "Otwórz za pomocą..." - "Adobe Reader".

------
.


### Weryfikacja w aplikacji komputerowej

![Szafir_weryfikujaca_1.0.png]({{site.baseurl}}/assets/img/Szafir_weryfikujaca_1.0.png "Szafir_weryfikujaca_1.0.png"){: style="float:right;width:40%;"}
Programy do składania e-podpisów pozwalają też zwykle na weryfikację. Są też programy przeznaczony wyłącznie do weryfikacji, jak np. darmowa "Aplikacja Szafir do weryfikacji" Krajowej Izby Rozliczeniowej:
* <https://www.elektronicznypodpis.pl/aplikacje-i-sterowniki> (przewiń stronę w dół)

### Weryfikacja na serwerze zdalnym przez przeglądarkę

<small>_(m.in. przeglądarkę internetową w telefonie)_</small>

* [![puesc.gov.pl_wer_weryfikacja_eDo.png]({{site.baseurl}}/assets/img/puesc.gov.pl_wer_weryfikacja_eDo.png "puesc.gov.pl_wer_weryfikacja_eDo.png")]({{site.baseurl}}/assets/img/puesc.gov.pl_wer_weryfikacja_eDo.png "puesc.gov.pl_wer_weryfikacja_eDo.png"){: style="float:right;width:39%;"}

  <https://puesc.gov.pl/wer/> - serwis Ministerstwa Finansów dla klientów Krajowej Administracji Skarbowej lub Ministerstwa Finansów.  
  <small>Warto zbierać informacje o tego rodzaju weryfikatorach, które nie wymagają instalacji. Z drugiej strony trzeba zaufać deklaracji 
  jak w powyższym serwisie "§3.5 Dane z dokumentów przekazywanych w celu weryfikacji podpisu są przetwarzane przez okres niezbędny do 
  prawidłowego wykonania usługi. Dane te nie są gromadzone ani przechowywane, z wyjątkiem sytuacji, gdy jest to niezbędne dla 
  zdiagnozowania błędów, ...".</small>
* [![mObywatel_weryfikacja.png]({{site.baseurl}}/assets/img/mObywatel_weryfikacja.png "mObywatel_weryfikacja.png")]({{site.baseurl}}/assets/img/mObywatel_weryfikacja.png "mObywatel_weryfikacja.png"){: style="float:right;width:35%;"}
[mObywatel](https://moj.gov.pl/nforms/signer/upload?xFormsAppName=SIGNER). Podpisz i sprawdź dokumenty elektroniczne. Weryfikacja różnego rodzaju podpisów nie tylko podpisu zaufanego.


#### Weryfikacja podpisu osobistego

<small>Uwaga - do podpisywania dokumentów służy podpis osobisty z "pl.ID Authorization CA" a nie "pl.ID Presence CA". </small>

Weryfikacja podpisu osobistego może zakończyć się ostrzeżeniem o niezaufaniu na liście TSL (takie komunikaty są oczywiście w sprzeczności z zasadą prostego języka). Choć są niektóre weryfikatory które akceptują certyfikaty organizacji pl.ID, np. internetowy:

* **Weryfikacja w przeglądarce**

*    * <https://puesc.gov.pl/wer/> - działa także w telefonie, zob. wyżej.

. 

* **Weryfikacja na komputerze**:


Obsługę podpisów cyfrowych zapewnia Polska Wytwórnia Papierów Wartościowych S.A. (PWPW). Do podpisywania i weryfikacji podpisu osobistego można używać aplikacji "**E-dowód podpis elektroniczny**" - zob. <https://www.gov.pl/web/e-dowod> - Pliki do pobrania.


* [![e-dowod_weryfikacja_eDo.png]({{site.baseurl}}/assets/img/e-dowod_weryfikacja_eDo.png "e-dowod_weryfikacja_eDo.png")]({{site.baseurl}}/assets/img/e-dowod_weryfikacja_eDo.png "e-dowod_weryfikacja_eDo.png"){: style="float:right;width:45%;"} 
     Podpis osobisty jest w niej weryfikowany poprawnie, ale pojawia się ostrzeżenie, które może sugerować, że są problemy z zaufaniem do tego podpisu:  
     <span style="color: brown;">Żaden z certyfikatów w ścieżce nie znajduje się na zaufanej liście TSL!</span> 

Podczas gdy w (darmowej) [aplikacji "Szafir" z Krajowej Izby Rozliczeniowej (KIR)](https://www.elektronicznypodpis.pl/aplikacje-i-sterowniki) 
weryfikacja przebiega bez problemów.
[![Szafir_weryfikacja_eDo.png]({{site.baseurl}}/assets/img/Szafir_weryfikacja_eDo.png "Szafir_weryfikacja_eDo.png")]({{site.baseurl}}/assets/img/Szafir_weryfikacja_eDo.png "Szafir_weryfikacja_eDo.png")
{: style="width:55%;"}


* <a name="pl_ID_zaufany_w_Adobe"></a>
 [![Adobe_eDo_zaufany.png]({{site.baseurl}}/assets/img/Adobe_eDo_zaufany.png "Adobe_eDo_zaufany.png")]({{site.baseurl}}/assets/img/Adobe_eDo_zaufany_i_dalej.png "Adobe_eDo_zaufany_i_dalej.png"){: style="float:right;width:73%;"} 
  W programie **Adobe Reader** wyświetlane są informacje o osobie podpisującej, ale jest ostrzeżenie "Wystąpiły problemy z ..." i opis "Poprawność podpisu jest nieznana". Problem znika, gdy dodamy certyfikat `pl.ID Root CA` do zaufanych:   →
    1. **[ Panel podpis ]** \ Wersja ... \ Szczegóły podpisu \ Szczegóły zatwierdzenia ...
    2. `pl.ID Root CA` \ [ Zaufanie ] \ **[ Dodaj do zaufanych certyfikatów... ]**
    3. Zabezpieczenia Adobe: "... Czy na pewno ..." \ [ OK ]
    4. Ustawienia importu... \ [ OK ]
    5. [ OK ] (na odsłoniętym oknie "Przegląd cetyfikatów"!)
    6. Wyjdź z programu Adobe Reader.
    7. **Uruchom ponownie Adobe Reader**.
    8. [Można upewnić się]({{site.baseurl}}/assets/img/Adobe_eDo_ZaufaneCertyfikaty.png "Adobe_eDo_ZaufaneCertyfikaty.png"), 
       że `pl.ID Root CA` jest na liście w menu: Preferencje [Ctrl+K] \ Podpisy \ Tożsamości i certyfikaty zaufane [ Więcej ] \ Zaufane certyfikaty.

.

Próbowałem dopytać twórców aplikacji _e-dowód Podpis elektroniczny_
{: style="margin-bottom:0px;"}

<details markdown=1><summary markdown="span"><u>w sprawie problemów z listą zaufania:</u> <br/> . . .</summary>


Na moje kolejne zapytanie w tej sprawie do PWPW ServiceDesk:
{: style="color: MidnightBlue;"}
> Zastanawiam się, czy jednak nie warto pociągnąć tematu. Skoro można jakoś usprawnić weryfikację w Adobe Reader, to może da się jakoś złagodzić ostrzeżenie w tej aplikacji. Uważam, że jest ono mocno niepokojące i zniechęcające do używania podpisu osobistego.  
Inna sprawa to adres http://repo.e-dowod.gov.pl/certs/ - czy nie warto przenieść certyfikatów na serwer z certyfikatem?
{: .smaller}

otrzymałem odpowiedź z PWPW ServiceDesk, że to sprawa MSWiA, a nie weryfikacji w aplikacji:
{: style="color: MidnightBlue;"}

>Szanowny Użytkowniku, 
dziękujemy za przesłane uwagi, zostały przekazane do Menadżera Produktu.  
Finalnie tylko CPD MSWiA, jako prawny wystawca certyfikatów, może zawnioskować o zmiany. Dotyczy to również Repozytorium.  
Ponieważ tematy nie dotyczą wprost działania aplikacji e-dowód Podpis elektroniczny (brak zadań do wykonania dla pomocy technicznej), zgłoszenia zostają rozwiązane.
{: .answ}

Na moje poprzednie zapytanie otrzymałem odpowiedź z PWPW ServiceDesk, która nie odniosła się do treści ostrzeżenia, tylko do weryfikacji w Adobe Reader:
{: style="color: MidnightBlue;"}

> Każdy podpis złożony przy użyciu e-dowodu można zweryfikować w narzędziu e-dowód Podpis elektroniczny możliwym do pobrania z <https://www.gov.pl/web/e-dowod>.
{: .answ}
> Status weryfikacji w oprogramowaniu Adobe Acrobat Reader „Tożsamość autora podpisu nie jest znana …” (weryfikacja „na żółto”) wynika z faktu, iż Adobe prowadzi własną listę zaufanych urzędów CA Adobe Approved Trust List (AATL) na której znajdują się certyfikowani przez Adobe wystawcy oraz wystawcy z listy TSL (europejska lista dostawców usług zaufanych).  
Status ten nie oznacza, że złożony podpis jest niepoprawny („weryfikacja na czerwono”), lecz to, że certyfikat którym się posłużono nie jest traktowany jako zaufany w tym oprogramowaniu.
{: .answ}
> Aby podpis osobisty złożony przy użyciu e-dowodu weryfikował się poprawnie w Adobe Acrobat Reader, wystawca certyfikatów e-dowodu (MSWiA) powinien wystąpić do firmy Adobe o wpisanie na listę AATL urzędu PL.ID Root CA lub notyfikować ten urząd w ramach Unii Europejskiej.  
Do czasu zakończenia formalnych procedur certyfikacji można samodzielnie dodać CA PLID do listy zaufanych w Adobe Acrobat Reader. W tym celu należy zaimportować certyfikaty CA urzędów: PLID_Root_CA, PLID_Authorization_CA_*, (do pobrania z http://repo.e-dowod.gov.pl/certs/) do magazynu zaufanych certyfikatów w Adobe Acrobat Reader:  
   
menu -> Edycja -> Preferencje -> Podpisy -> Tożsamości i certyfikaty zaufane -> Więcej -> Zaufane certyfikaty.  
   
Tutaj należy po kolei zaimportować (Importuj) i zaufać wybranym CA:
- PLID_Root_CA,
- PLID_Authorization_CA_20190221,
- PLID_Authorization_CA_20191207,
- PLID_Authorization_CA_20201202.
{: .answ}
> Po wykonaniu powyższego należy zamknąć aplikację, otworzyć na nowo i ponownie zweryfikować pliki.  
Podpisy złożone przy użyciu e-dowodu powinny być weryfikowane „na zielono”.  
   
Pozdrawiamy  
Zespół eDO
{: .answ}

</details>

- - - -

.

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