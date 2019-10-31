---
layout: post
title:  "Drobne podpowiedzi 1 (system)"
date:   2019-09-20 09:21:59 +0100
categories: System
---

[Ostatnio używane foldery]({{ site.url }}{{ site.baseurl }}{{ page.url }}#ostatnio-używane-foldery) * [Zwalnianie miejsca na dysku C:]({{ site.url }}{{ site.baseurl }}{{ page.url }}#zwalnianie-miejsca-na-dysku-c) * [Hurtowa zmiana daty folderów]({{ site.url }}{{ site.baseurl }}{{ page.url }}#hurtowa-zmiana-daty-folderów)

----

### Ostatnio używane foldery 

.. to trochę co innego niż *często używane foldery*, które pojawiają się po włączeniu (Win+E) eksploratora plików.

![Przypnij_do_szybki_dostep.png]({{ site.baseurl }}/assets/img/Przypnij_do_szybki_dostep.png "Przypnij_do_szybki_dostep.png"){:style="float:right;width:35%;"}
Kroki w celu dodania do paska "szybki dostęp":

1. Win+R, wklej  
   `shell:::{22877a6d-37a1-461a-91b0-dbda5aaebc99}`   `[OK]`
2. Menu: "Przypnij do paska szybki dostęp".
3. Inne własne ważne foldery też wato tak przypiąć.

<br>

----
### Zwalnianie miejsca na dysku C:

W Win 10 jest wbudowanych kilka ciekawych opcji zwalniania miejsca na dysku C:

<https://support.microsoft.com/pl-pl/help/12425/windows-10-free-up-drive-space>

![Start-ustawienia.png]({{ site.baseurl }}/assets/img/Start-ustawienia.png "Start-ustawienia.png"){:style="float:left;width:8%;margin-right:3%;"}
* [Win + i]  albo Start \ Ustawienia
    * System \ Pamięć \

1. ![Zwolnij_miejsce_teraz.png]({{ site.baseurl }}/assets/img/Zwolnij_miejsce_teraz.png "Zwolnij_miejsce_teraz.png"){:style="float:right;width:45%;"} Skonfiguruj Czujnik pamięci lub uruchom go teraz <small>(albo: Zmień sposób zwalniania miejsca)</small> \ Zwolnij miejsce teraz \ Oczyść teraz
2. 

![Zmien_lok_zapisywania.png]({{ site.baseurl }}/assets/img/Zmien_lok_zapisywania.png "Zmien_lok_zapisywania.png"){:style="width:50%;"}


Można tu też wspomnieć o możliwości przesuwania foldera na inny dysk z dysku systemowego (np. gdy mamy mały dysk SSD) i [tworzeniu dowiązania](https://leniwy.eu/news,10,Linki-symboliczne-w-Windowsie.html#Windows-a-linki) udającego, że folder jest na dysku systemowym 

Przykład w linii poleceń Windows (uruchom CMD)
````bat
C:\mklink /j "C:\NazwaPseudoFoldera" "D:\Scieżka\NazwaIstniejącegoFoldera"
````

<br>

----
![Attribute_Changer.png]({{ site.baseurl }}/assets/img/Attribute_Changer.png "Attribute_Changer.png"){:style="float:right;width:45%;"}

### Hurtowa zmiana daty folderów

Podczas kopiowania zawartości dysku, np. po zakupie nowego komputera, na ogół wszystkie foldery uzyskują datę z momentu kopiowania. Na nasze szczęście pliki mają prawdziwe daty, ale gubienie faktycznych dat dla folderów jest kłopotliwe. Przecież nie raz chcemy coś przeszukać i nie musielibyśmy zaglądać do folderów, które nie mają dat w interesującym nas zakresie.

**Attribute Changer** <https://www.programosy.pl/program,attribute-changer.html> pozwala na hurtową zmianę czasu modyfikacji folderów na podstawie dat wewnętrznych plików. 

Uwagi:
1. Gdy wewnątrz są tylko podfoldery, a nie ma ani jednego pliku, to czas folderu nie jest zmieniany. Szkoda, bo można by zasadę zmiany taką jak do plików wewn. także przyjąć do folderów wewnętrznych.
2. U mnie zmieniał się tylko czas modyfikacji folderów. Ale to na szczęście załatwia sprawę na podglądzie listy folderów.
3. Są jakieś kłopoty z pobraniem pliku z oryginalnej strony (ESET wykrywa trojana), stąd podałem zastępczy link.
