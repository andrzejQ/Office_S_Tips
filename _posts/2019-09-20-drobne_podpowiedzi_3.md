---
layout: post
title:  "Drobne podpowiedzi 3 (programowanie)"
date:   2019-09-20 10:21:59 +0100
categories: Programowanie
---

[Szukanie ścieżek do plików *.exe]({{ site.url }}{{ site.baseurl }}{{ page.url }}#szukanie-plików-exe-dostępnych-poprzez-path) * [Python Launcher for Window]({{ site.url }}{{ site.baseurl }}{{ page.url }}#python-launcher-for-window) 



### Wyszukiwanie dostępnych wersji kompilatora Python w Windows

Tu nie ma może nic odkrywczego, ale nie zawsze się to pamięta...

#### Szukanie plików ".exe" dostępnych poprzez PATH 

````bat
where /t "$path:python.exe"
````

`/t` - można pominąć; wtedy nie wyświetla się rozmiar i data pliku. W najprostszej wersji, najlepiej w jakimś folderze gdzie nie ma "python.exe":

````
where python.exe
````

#### Przeszukiwanie w głąb całych folderów 

Uwaga - to chwilę trwa. Tu po `/r` jest nazwa foldera, od którego zaczyna się szukanie - chyba powinno się stosować podwójne `\\` np. dla całego dysku: `C`

````
where /r "C:\\" /t python.exe
````

Wybraną ścieżkę  "python.exe" można <u>trwale zapamiętać w PATH<a id="edytuj-zmienne"></a></u> na początkowym miejscu (w menu START zacznij pisać "Edytuj zmienne środowiskowe dla konta"). Wtedy `python` lub `python mójSkrypt.py` będzie wywoływało właśnie tą wersję. Można też [modyfikować PATH](https://docs.python.org/3/using/windows.html#excursus-setting-environment-variables) tuż przed wywołaniem `python` w linii poleceń lub w pliku *.cmd, np:
````
set PATH=C:\Program Files\Python 3.8;%PATH%
````
Jeśli używamy tekstów UTF-8 (np. w nazwach plików) to warto na początek włączyć to kodowanie w linii poleceń: `chcp 65001`.

Gdy mamy swoje moduły, używane w różnych projektach to można dodać  
`set PYTHONPATH=%PYTHONPATH%;C:\My_python_lib`

W Notepad++ można zapamiętać sobie w Uruchom wywołanie konkretnego kompilatora dla aktualnie edytowanego pliku _*.py_:
`%ComSpec% /c chcp 65001 & cd /D "$(CURRENT_DIRECTORY)" & "C:\Program Files\Python 3.8\Python.exe" "$(FULL_CURRENT_PATH)" & pause`{:style="font-size: smaller;"}

Ścieżkę do aktualnie potrzebnej nam wersji Python.exe można wpisać trwale do zmiennej środowiskowej za pomocą ["Edytuj zmienne..."](#edytuj-zmienne) lub pliku _*.CMD_ z _SetX_ (po tym okna cmd lub N++ należy uruchomić na nowo):
````bat
setx PY_PTH "C:\Program Files\Python 3.8"
````
Wtedy możemy w przyszłości wygodnie zmieniać wartość zmiennej, a używać stałej modyfikacji  
`set PATH=%PY_PTH%;%PATH%`, a wręcz [trwale ją wpisać do PATH](https://ss64.com/nt/path.html) za pomocą ["Edytuj zmienne..."](#edytuj-zmienne) (nie powinno się używać SetX do PATH) oraz wpisać na stałe w opcjach "uruchom" N++:
`%ComSpec% /c chcp 65001 & cd /D "$(CURRENT_DIRECTORY)" & "%PY_PTH%\Python.exe" "$(FULL_CURRENT_PATH)" & pause`{:style="font-size: smaller;"}

- - - -

<span style="font-size: smaller; color:DarkGrey;">
Można wyświetlić ścieżki PATH w linii poleceń wstawiając łamanie wierszy:
</span>
`ECHO.%PATH:;=; & ECHO.%`{:style="font-size: smaller;"}

- - - -
<br>

### Python Launcher for Window

Od wersji 3.3 wraz z instalacją Pythona jest instalowany program `py.exe`[_^](https://docs.python.org/3/using/windows.html#python-launcher-for-windows) oraz `pyw.exe`, np. `C:\Windows\py.exe`, który pozwala na kompilację wprost poprzez uruchamianie pliku `*.py`. W pierwszym wierszu naszego skryptu `*.py` można wpisać np. `#! python3.7-64` lub `#! /usr/bin/python3.7-64` - `/usr/bin/` itp. jest pomijany w Windows. Natomiast specjalne znaczenie ma `/usr/bin/env`, np. `#! /usr/bin/env python3` - tu następuje wyszukanie tej wersji, która pasuje do naszych warunków (tzn. możliwie najwyższa wersja 3) przeszukując ścieżki PATH <small>(nie sprawdzałem tego - jeśli ktoś to wypróbował proszę o komentarz).</small>

Lista wersji kompilatora do wyboru m.in za pomocą `#! ....`: 
````
py -0
````
`py` bez parametrów wywołuje swój domyślny kompilator `python.exe`. Nie musi to być ten znaleziony jako pierwszy w PATH, stąd wywołanie `py` może dawać całkiem inne efekty niż `python` (wyszukany w PATH).

W Notepad++ można zapamiętać sobie w Uruchom wywołanie programu właściwego dla rozszerzenia aktualnie edytowanego pliku (to działa uniwersalnie na dowolne rozszerzenia, nie tylko `*.py`):

````bat
%ComSpec% /c chcp 65001 & cd /D "$(CURRENT_DIRECTORY)" & "$(FULL_CURRENT_PATH)" & pause
````

Sprawdzenie aktualnej obsługi pliku `*.py` - skopiuj do linii poleceń:
````bat
for /f "tokens=2 delims==" %i in ('assoc .py') do (ftype %i)
````
<small>Można też znaleźć [bardziej rozbudowane wersje](https://ss64.com/nt/ftype.html) takiego sprawdzania:</small>  `FOR /F "tokens=2* delims==" %G IN ('assoc .py') DO for /f "tokens=2* delims==" %a in ('ftype %G') do @echo %a`{:style="font-size: smaller;"}

<span style="font-size: smaller;"> [Przypisanie aplikacji do rozszerzenia](https://www.robvanderwoude.com/ntstart.php#FileAssociations) ".py" w linii poleceń administratora (`cmd`[Ctrl+Shift+Enter] ):</span>
````bat
ASSOC .py=Python.File
FTYPE Python.File="C:\WINDOWS\py.exe" "%L" %*
````

<small> - jest to już zrobione jak w tym przykładzie, jeśli instalowaliśmy jakikolwiek pakiet PYTHONa 3.3+
</small>

<span style="font-size: smaller;">
Ewentualnie, aby uruchamiać skrypt podając samą nazwę bez wpisywania rozszerzenia ".py" można jeszcze dodać  `set PATHEXT=.PY;%PATHEXT%`
lub trwale zmodyfikować PATHEXT w ["Edytuj zmienne..."](#edytuj-zmienne).
</span>

<span style="font-size: smaller;">
Więcej inf. o aktualnym stanie  konfiguracji, np. z pliku `%LocalAppData%\py.ini`{:style="font-size: smaller;"} uzyskamy włączając PYLAUNCH_DEBUG: `set PYLAUNCH_DEBUG=1 & py -0`{:style="font-size: smaller;"}
</span>

----
<br>

`set PY_PYTHON=3.6` - ustala domyślną wersję dla `py.exe`. Równoważny zapis w `py.ini`:
````ini
[defaults]
python=3.6
````
W [środowisku wirtualnym](https://docs.python.org/3/library/venv.html),
 `py.exe` regułą nadrzędną jest wywołanie aktywowanego kompilatora Python.exe.



