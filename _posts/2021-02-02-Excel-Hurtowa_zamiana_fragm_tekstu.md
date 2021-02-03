---
layout: post
title:  "Excel - hurtowa zamiana fragmentów tekstu"
date:   2021-02-02 21:21:21 +0100
categories: Excel
---

Przepis na hurtową zamianę fragmentów tekstu z uwzględnianiem wielkości znaków - z użyciem ZNAJDŹ() i PODSTAW(). 


![n_znajdz.png]({{ site.baseurl }}/assets/img/n_znajdz.png "n_znajdz.png"){:style="float:left;width:25%;"}
Parametry:  
Lista (1 wymiarowa) elementów do znalezienia w **n_znajdz**  
(n_... - to nazwany zakres).  
Te elementy są zamieniane na wypisane w liście **n_zamien** (musi mieć pasującą liczbę elementów).  
Powyższe dwa 1-wymiarowe zakresy mogą być gdziekolwiek, także w  innym arkuszu. Mogą być pionowe lub poziome.  
 
Jeżeli w liście **n_znajdz** pewne elementy są podtekstami innych elementów, to muszą być na dalszej pozycji. 

Poniżej fragment pliku-demo "ZnajdzZamienWgListy.xlsx ", zob. [**ZnajdzZamienWgListy.zip**]({{ site.baseurl }}/assets/files/ZnajdzZamienWgListy.zip) 

![Po-zamianie.png]({{ site.baseurl }}/assets/img/Po-zamianie.png "Po-zamianie.png"){:style="width:100%;"}


 
Uwagi: 
1. Formuła tablicowa (CSE) bez użycia VBA. 
2. W jednym kroku zamienia tylko 1 wyszukaną pozycję z listy **n_znajdz**. 
3. Fomuła może być uproszczona, gdy zamieniamy wszystko na stałą wartość, np. " ". 
4. <small>
W MS Office365 (2016+) nie są potrzebne formuły tablicowe (CSE) w kol. B, D i E powyżej (?), pomimo użycia tablicy tekstów w ZNAJDŹ(). 
Ten dokument w niższych Office (gdzie nie było tablic dynamicznych) w kolumnie B, C, D i E pokazuje formułę tablicową (CSE). 
Po powrocie do wyższego MS Office w kol. C pojawia się operator @, tj. niejawny operator przecięcia.</small>

<small>pl:</small>
```` js
B23: =PODAJ.POZYCJĘ(0;0*ZNAJDŹ(n_znajdz;A23);0)
C23: =JEŻELI.ND(PODSTAW(A23;INDEKS(n_znajdz;B23);INDEKS(n_zamien;B23));A23)
D23: =JEŻELI.ND(PODSTAW(A23;INDEKS(n_znajdz;PODAJ.POZYCJĘ(0;0*ZNAJDŹ(n_znajdz;A23);0));INDEKS(n_zamien;PODAJ.POZYCJĘ(0;0*ZNAJDŹ(n_znajdz;A23);0)));A23)
E23: =JEŻELI.ND(PODSTAW(A23;INDEKS(n_znajdz;PODAJ.POZYCJĘ(0;0*ZNAJDŹ(n_znajdz;A23);0));"_x_");A23)
````

<small>en:</small>
```` js
B23: =MATCH(0,0*FIND(n_znajdz,A23),0)
C23: =IFNA(SUBSTITUTE(A23,INDEX(n_znajdz,B23),INDEX(n_zamien,B23)),A23)
D23: =IFNA(SUBSTITUTE(A23,INDEX(n_znajdz,MATCH(0,0*FIND(n_znajdz,A23),0)),INDEX(n_zamien,MATCH(0,0*FIND(n_znajdz,A23),0))),A23)
E23: =IFNA(SUBSTITUTE(A23,INDEX(n_znajdz,MATCH(0,0*FIND(n_znajdz,A23),0)),"_x_"),A23)
````

<style> pre code {font-size: smaller;} </style>
