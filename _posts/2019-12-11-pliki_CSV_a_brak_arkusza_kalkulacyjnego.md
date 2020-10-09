---
layout: post
title:  "Pliki CSV a brak arkusza kalkulacyjnego"
date:   2019-12-11 09:21:59 +0100
categories: CSV
---

CSV - wygodny odczyt bez arkusza kalkulacyjnego.

Zdarza się, że w niektórych systemach mamy dane w formacie CSV, ale nie mamy pod ręką arkusza kalkulacyjnego, żeby je wygodnie przeglądać i sortować. Tutaj kilka porad (na razie jedna...).

### 1. Notepad++ & CsvQuery

![Notepad++ CsvQuery widok aplikacji](https://raw.githubusercontent.com/jokedst/CsvQuery/master/Meta/Screenshot.png){:style="float:right;width:74%;"}
W Notatniku++ mamy dodatek **CsvQuery** (zob. Wtyczki \ Zarządzaj Wtyczkami...). Po kliknięciu na jego ikonkę (ukośne **CQ**: ![CSVQueryIcon.png]({{ site.baseurl }}/assets/img/CSVQueryIcon.png "CSVQueryIcon.png") ) , wyświetlane są kolumny CSV, które można sobie wygodnie sortować. Dodatkowo automatycznie wykrywany jest znak separatora kolumn. W pewnych sytuacjach zaletą może tu być wyświetlanie treści jako prosty tekst, bez przekształcania np. liczb z zerami wiodącymi itp.

