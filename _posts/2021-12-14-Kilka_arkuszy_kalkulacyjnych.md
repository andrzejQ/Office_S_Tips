---
layout: post
title:  "Kilka arkuszy kalkulacyjnych"
date:   2021-12-14 06:30:30 +0100
categories: Excel
---

[1. Czy święta wypadają w sobotę](#1-czy-święta-wypadają-w-sobotę) &nbsp;
[2. Planowanie urlopów](#2-planowanie-urlopów) &nbsp;
[3. Podświetl gdy pilne](#3-podświetl-gdy-pilne) &nbsp;



### 1. Czy święta wypadają w sobotę.

![Swieta-sob_GooExcLiO.png]({{site.baseurl}}/assets/img/Swieta-sob_GooExcLiO.png "Swieta-sob_GooExcLiO.png"){: style="float:right;width:63%;"} 
[**Swieta-sob_GooExcLiO.xlsx**]({{site.baseurl}}/assets/files/Swieta-sob_GooExcLiO.xlsx)

* Oszacowanie daty Wielkanocy pochodzi z: <https://www.contextures.com/exceleastercalculation.html>
* Tłumaczenie funkcji EN-PL: <https://pl.excelfunctions.eu/DOLLAR/Polski>
* Arkusz działa w Google, Excel, LibreOffice.

.

![PlanUrlopow.png]({{site.baseurl}}/assets/img/PlanUrlopow.png "PlanUrlopow.png"){: style="float:right;width:63%;"} 

### 2. Planowanie urlopów


[**PlanUrlopow.xlsx**]({{site.baseurl}}/assets/files/PlanUrlopow.xlsx)

* Arkusz działa w Google, Excel, LibreOffice.

.


### 3. Podświetl gdy pilne

Przykład: [**Pilne_terminy.xlsx**]({{site.baseurl}}/assets/files/Pilne_terminy.xlsx)


Gdy mamy w komórkach daty, których nie chcemy przegapić można podświetlać komórki z odpowiednim wyprzedzeniem - tu przykład 14 dniowego podświetlenia.

![pilne-terminy.png]({{site.baseurl}}/assets/img/pilne-terminy.png "pilne-terminy.png")

1. Zaznaczam całą kolumnę z datami - tu kolumna B:
2. Narzędzia główne \ Formatowanie Warunkowe \ Nowa reguła
3. "Użyj formuły do ..." i w Edytuj opis reguły wpisuję: `= B1 < DZIŚ()+14`. Zauważ: `B1`, pomimo, że akurat w `B1` nie ma daty, a reguła dotyczy po prostu wszystkich komórek z datą w tej kolumnie.
4. Wybieram jakieś jaskrawe formatowanie czcionki lub tła.
5. [OK]



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