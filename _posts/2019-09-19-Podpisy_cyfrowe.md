---
layout: post
title:  "Podpisy cyfrowe"
date:   2019-09-19 10:21:59 +0100
categories: PKI
---

Kilka informacji o podpisie cyfrowym i dokumencie elektronicznym.


1. **Podpis cyfrowy** związany jest kryptografią. Przez jakąś zaufaną instytucję, która potwierdza tożsamość konkretnego użytkownika generowana jest para kluczy (unikalnych ciągów bitów/cyfr): **klucz prywatny** - chroniony przez użytkownika (niedostępny dla nikogo innego, nawet dla instytucji generującej go) i **klucz publiczny** pasujący do klucza prywatnego. Na podstawie klucza publicznego "nie da się" odgadnąć klucza prywatnego - odgadniecie metodą prób i błędów powinno zajmować superkomputerowi setki lat.
1. Klucz prywatny może służyć do stworzenia **podpisu** dla danych cyfrowych w postaci "odcisku palca", tj. jawny algorytm korzysta z klucza prywatnego i danych tworząc dość krótki ciąg bitów, który potem daje się zweryfikować z pomocą klucza publicznego, że dane cyfrowe nie zostały zmienione od momentu "podpisania".  
![Private_key_signing](https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Private_key_signing.svg/512px-Private_key_signing.svg.png "Private_key_signing"){:style="width:33%;margin:6px;"}  ![Public_key_encryption](https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Public_key_encryption.svg/500px-Public_key_encryption.svg.png "Public_key_encryption"){:style="width:33%;margin:6px;"}
1. Z pomocą klucza prywatnego użytkownika i klucza publicznego adresata danych cyfrowych można podpisać i **zaszyfrować** dane tak, że odbiorca odszyfruje je z pomocą swojego klucza prywatnego i klucza publicznego nadawcy. Jest to odpowiednik korespondencji typu list polecony. 
1. **Podpis kwalifikowany** to elektroniczny podpis zaawansowany, który jest składany za pomocą kwalifikowanego urządzenia i który opiera się na kwalifikowanym certyfikacie podpisu elektronicznego. Klucz prywatny tego certyfikatu jest tworzony automatycznie w karcie z procesorem (tzw. karcie inteligentnej) i nie jest dostępny na zewnątrz niej. Nie można go skopiować, wyeksportować, nigdy nie opuszcza karty procesorowej. Kryptografia realizowana jest z użyciem procesora kraty.  
Podpis ten jest równoważny prawnie podpisowi osobistemu na dokumencie papierowym. Procedura wydawania tego podpisu ma mocne podstawy prawne i wymaga udziału zaufanej instytucji potwierdzającej tożsamość użytkownika. Dokumenty tak podpisane można wysyłać jako załącznik e-maila. Roczny koszt podpisu jest równy kosztowi kilku wysyłek kurierskich. 
1. **Podpis zaawansowany** to podpis, gdzie przestrzegane są procedury zapewniające wiarygodny związek użytkownika z jego kluczem publicznym i prywatnym. Podpis taki może być używany do szyfrowania e-maili. Podpis może być przechowywany na karcie pracowniczej <http://orlowski.info/blog-arts/75-karta-z-chipem-dla-urzednika-jest-zalecana>.  
Podpis zaawansowany występuje też w nowym [**e-dowodzie osobistym** z warstwą elektroniczną](https://obywatel.gov.pl/dokumenty-i-dane-osobowe/dowod-osobisty-informacja-o-dokumencie) - "W kontakcie z urzędem (podmiotem publicznym) jest tak samo ważny jak podpis własnoręczny. Możesz go też używać do załatwiania innych spraw - z firmami lub osobami, jeśli zgodzą się na to obie strony".
1. Szczególnym przypadkiem podpisu zaawansowanego jest **Profil Zaufany** powiązany z ePUAP <https://epuap.gov.pl/> (obecnie wydzielony jako osobny system <https://pz.gov.pl/>). Każdy obywatel może bezpłatnie otrzymać taki podpis, którego klucze są przechowywane na serwerach rządowych. Osoby, które posiadają swój podpis kwalifikowany mogą same potwierdzić profil zaufany. Inni muszą skorzystać z wizyty w wybranym urzędzie lub skorzystać z pośrednictwa swojego banku w celu potwierdzenia profilu zaufanego. Profil zaufany ma umocowanie w Kodeksie Postępowania Administracyjnego.

### Format e-podpisu

Najbardziej przydatną wersją jest e-podpis **otoczony**. Plik z podpisem zawiera treść dokumentu oraz podpis i zwykle można go odczytać wprost za pomocą np. Adobe Reader, MS Word, łącznie z możliwością weryfikacji poprawności podpisu. Dla pliku PDF takim formatem jest m.in. **PAdES**.
![PDF_z_podpisem.png]({{ site.baseurl }}/assets/img/PDF_z_podpisem.png "PDF_z_podpisem.png"){:style="float:right;width:40%;"}

### Podpisy w PDF i DOCX 

Można składać podpisy elektroniczne bez dodatkowej aplikacji do podpisywania. Wbudowane opcje podpisywania dokumentów są dostępne m.in. w: 

1. Adobe Reader DC: Narzędzia \ Certyfikaty (a nie: "Wypełnij i podpisz") \ Podpisz cyfrowo 
1. Microsoft Office: Wstawianie \ Wiersz podpisu, potem 2x klikając na ten obiekt - Podpisywanie

### Dokument w formie pisemnej, postać papierowa albo elektroniczna

![K.Wojsyk_dok_forma_postac.png]({{ site.baseurl }}/assets/img/K.Wojsyk_dok_forma_postac.png "K.Wojsyk_dok_forma_postac.png"){:style="float:right;width:55%;"} Dokument **w formie pisemnej** może być utrwalony w postaci wydruku/zapisu na papierze, ale też zapisany jako ciąg danych elektronicznych. Oprócz formy pisemnej tj. ciągu wyrazów składający się ze znaków alfabetu, jest też forma ustna - audio, wideo i inne - zob. rysunek na str. 75 podręcznika <http://mc.bip.gov.pl/fobjects/download/97462/e-podrecznik-vademecum-pdf.html> obrazujący związki między dokumentem, formą i postacią. W tej publikacji Kajetana Wojsyka znajdziemy szczegółowe rozważania co jest dokumentem oraz co oznacza oryginał dokumentu w postaci elektronicznej:  
...  
**Podstawowe elementy konstytuujące dokument to forma wyrażenia informacji, postać nośnika i zabezpieczenie przed niekontrolowaną modyfikacją.**  
...  
**Podpis elektroniczny** służy nie tylko **do identyfikacji składającej go osoby**, ale także do **zabezpieczenia** podpisywanej treści **przed niekontrolowaną modyfikacją**  
...  
Intencją ustawodawcy było zapewnienie niezaprzeczalnego związku osoby podpisującej dokument z tym dokumentem w związku z faktem, że podpisywanie odbywa się „zaocznie”, tzn o dowolnej porze i w dowolnym miejscu dogodnym dla podpisującego. Właśnie podpis elektroniczny, dzięki **certyfikatowi** służącemu do jego złożenia, zapewnia ów związek konkretnej osoby z podpisywanym dokumentem. Certyfikat jest widoczny w czasie czynności weryfikacji podpisu - i zawiera dane jednoznacznie wskazujące na konkretną osobę fizyczną, która podpis złożyła.  
...
