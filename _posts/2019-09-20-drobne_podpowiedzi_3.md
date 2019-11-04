---
layout: post
title:  "Drobne podpowiedzi 3 (programowanie)"
date:   2019-09-20 10:21:59 +0100
categories: System
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

Wybraną ścieżkę  "python.exe" można <u>trwale zapamiętać w PATH<a id="edytuj-zmienne"></a></u> na wcześniejszym miejscu (w menu START zacznij pisać "Edytuj zmienne środowiskowe dla konta") i wywołanie `python` lub `python mójSkrypt.py` będzie wywoływało właśnie tą wersję. Można też [modyfikować PATH](https://docs.python.org/3/using/windows.html#excursus-setting-environment-variables) tuż przed wywołaniem `python` w linii poleceń lub w pliku *.cmd, np:
````
set PATH=C:\Program Files\Python 3.8;%PATH%
````
Jeśli używamy tekstów UTF-8 (np. w nazwach plików) to warto na początek włączyć to kodowanie w linii poleceń: `chcp 65001`.

Gdy mamy swoje biblioteki, używane w różnych miejscach to można dodać `set PYTHONPATH=%PYTHONPATH%;C:\My_python_lib`

W Notepad++ można zapamiętać sobie w Uruchom wywołanie konkretnego kompilatora dla aktualnie edytowanego pliku `*.py`:
````bat
%ComSpec% /c chcp 65001 & cd /D "$(CURRENT_DIRECTORY)" & "C:\Program Files\Python 3.8\Python.exe" "$(FULL_CURRENT_PATH)" & pause
````

- - - -

### Python Launcher for Window

Od wersji 3.3 wraz z instalacją Pythona jest instalowany program `py.exe`[_^](https://docs.python.org/3/using/windows.html#python-launcher-for-windows) oraz `pyw.exe`, np. `C:\Windows\py.exe`, który pozwala na kompilację wprost poprzez uruchamianie pliku `*.py`. W pierwszym wierszu naszego skryptu `*.py` można wpisać np. `#! python3.7-64` lub `#! /usr/bin/python3.7-64` - `/usr/bin/` itp. jest pomijany w Windows, natomiast specjalne znaczenie ma `/usr/bin/env`, np. `#! /usr/bin/env python3` - tu następuje wyszukanie tej wersji, która pasuje do naszych warunków (tzn. możliwie najwyższa wersja 3) przeszukując ścieżki PATH.

Lista wersji kompilatora do wyboru m.in za pomocą `#! ....`: 
````
py -0
````
`py` bez parametrów wywołuje domyślny kompilator `python.exe`.

Gdy jest stworzone [**środowisko wirtualne**](https://docs.python.org/3/library/venv.html), np. działając w folderze naszego skryptu `*.py`: `"C:\Program Files\Python 3.8" -m venv ".venv"` i **jest aktywowane** np. `.venv\Scripts\activate.bat`, **to od tego momentu** pliki `*.py` są automatycznie uruchamiane przez `py.exe` z tą właśnie wersją kompilatora, aż do wydania polecenia `deactivate`.

W Notepad++ można zapamiętać sobie w Uruchom wywołanie programu właściwego dla rozszerzenia aktualnie edytowanego pliku (to działa uniwersalnie na dowolne rozszerzenia, nie tylko `*.py`):

````bat
%ComSpec% /c chcp 65001 & cd /D "$(CURRENT_DIRECTORY)" & "$(FULL_CURRENT_PATH)" & pause
````

Sprawdzenie aktualnej obsługi pliku `*.py` - skopiuj do linii poleceń:
````bat
for /f "tokens=2 delims==" %i in ('assoc .py') do (ftype %i)
````
<small> Przypisanie aplikacji do rozszerzenia ".py" w linii poleceń administratora (`cmd`[Ctrl+Shift+Enter] ) :</small>
````bat
ASSOC .py=Python.File
FTYPE Python.File="C:\WINDOWS\py.exe" "%1" %*
````
<small>
Ewentualnie, aby uruchamiać skrypt podając samą nazwę bez wpisywania rozszerzenia ".py" można jeszcze dodać `set PATHEXT=.PY;%PATHEXT%` lub trwale zmodyfikować PATHEXT w ["Edytuj zmienne..."](#edytuj-zmienne).
</small>

<small> Więcej inf. o aktualnym stanie  konfiguracji, np. z pliku `%LocalAppData%\py.ini` uzyskamy włączając PYLAUNCH_DEBUG: `set PYLAUNCH_DEBUG=1 & py -0`
</small>

----

`set PY_PYTHON=3.6` - ustala domyślną wersję dla `py.exe`. Równoważny zapis w `py.ini`:
````ini
[defaults]
python=3.6
````


