---
layout: post
title:  "Drobne podpowiedzi 3 (programowanie)"
date:   2019-09-20 11:21:59 +0100
categories: Programowanie
---

[Szukanie ścieżek do plików .exe]({{ site.url }}{{ site.baseurl }}{{ page.url }}#szukanie-plików-exe-dostępnych-poprzez-path) * [Python Launcher for Windows]({{ site.url }}{{ site.baseurl }}{{ page.url }}#python-launcher-for-window) 


### Wyszukiwanie dostępnych wersji kompilatora Python w Windows

#### W SKRÓCIE

Reguły, które zamierzam sobie stosować:

1. Uruchamianie plików _*.py_ jako skryptów Windows przez _py.exe_ tj. _Python Launcher for Windows_, głównie z opcją wynikającą z pierwszeństwa na liście ścieżek do _python.exe_ w zmiennej środowiskowej _PATH_.
2. Używanie w pierwszym wierszu pliku _*.py_: `#!/usr/bin/env python` - właśnie celu korzystania z _PATH_ (na końcu nie może być żadnych cyfr - tylko samo _python_)
3. W ["Edytuj zmienne środowiskowe systemu"](#edytuj-zmienne) należy po instalacji kolejnej wersji Pythona przenieść ścieżki do _Python.exe_ z _Path - system_ do _Path - użytkownika_, żeby umożliwić sobie wygodniejszą ich modyfikację.
4. Na pierwszym miejscu w _Path - użytkownika_ wpisuję *%PY_PTH%*, a zmienną środowiskową *PY_PTH* ustawiam domyślnie na _.venv\Scripts_ np. poleceniem `setx PY_PTH .venv\Scripts` (to daje ścieżkę względną w _Path_). W ten sposób skrypt uruchamiany z miejsca, gdzie jest wygenerowane środowisko wirtualne będzie wywoływał _python.exe_ właśnie z tego środowiska. Dla doraźnej potrzeby można zmieniać *PY_PTH* na inną ścieżkę.
5. W _Path - użytkownika_ poniżej *%PY_PTH%* umieszczam ścieżkę do wybranego _python.exe_, który ma być uruchamiany, gdy nie korzystam ze środowiska wirtualnego.
6. Na sam koniec _Path - użytkownika_  przenoszę `%USERPROFILE%\AppData\Local\Microsoft\WindowsApps`, żeby się nie włączał sklep Microsoft po wywołaniu _python.exe_
7. [Środowsko wirtualne](https://chriswarrick.com/blog/2018/09/04/python-virtual-environments/) generuję w miejscu (tj. folderze) skryptu _*.py_ za pomocą:
````bat
ścieżka\do\wzorcowego\python.exe -m venv .venv
.venv\Scripts\python -m pip install --upgrade pip setuptools wheel
setx PY_PTH .venv\Scripts
````
Przy takich ustawieniach nie jest potrzebna aktywacja środowiska wirtualnego. Będzie się włączało to, które jest w folderze wywoływanego skryptu.  
Ostatnie polecenie jest zbędne, gdy nie zmienialiśmy *PY_PTH*. (Można by wpisać na trwałe właśnie to środowisko wirtualne podając pełną ścieżkę: `setx PY_PTH %CD%\.venv\Scripts`, ale ścieżka względna jest tu raczej dostateczna, a przede wszystkim uniwersalna).  
Ścieżka do _python.exe_ może dotyczyć jakiejkolwiek wersji, nawet zainstalowanej tylko na chwilę, bo produkcyjnie używana będzie kopia w _.venv\Scripts_.

- - - -

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

Wybraną ścieżkę  "python.exe" można <u>trwale zapamiętać w PATH<a id="edytuj-zmienne"></a></u> na początkowym miejscu (w menu START zacznij pisać "Edytuj zmienne środowiskowe dla konta" lub "... dla systemu"). Wtedy `python` lub `python mójSkrypt.py` będzie wywoływało właśnie tą wersję. Można też [modyfikować PATH](https://docs.python.org/3/using/windows.html#excursus-setting-environment-variables) tuż przed wywołaniem `python` w linii poleceń lub w pliku _*.cmd_. Jeśli używamy tekstów UTF-8 (np. w nazwach plików) to warto na początek włączyć to kodowanie w linii poleceń: `chcp 65001`.

Gdy mamy swoje moduły, używane w różnych projektach to można dodać  
`set PYTHONPATH=%PYTHONPATH%;C:\My_python_lib`

W Notepad++ można zapamiętać sobie w Uruchom wywołanie konkretnego kompilatora dla aktualnie edytowanego pliku _*.py_:
`%ComSpec% /c chcp 65001 & cd /D "$(CURRENT_DIRECTORY)" & "C:\Program Files\Python 3.8\Python.exe" "$(FULL_CURRENT_PATH)" & pause`{:style="font-size: smaller;"}

Ścieżkę do aktualnie potrzebnej nam wersji Python.exe można wpisać trwale do zmiennej środowiskowej za pomocą ["Edytuj zmienne..."](#edytuj-zmienne) lub pliku _*.CMD_ z _SetX_ (po tym okna cmd lub N++ należy uruchomić na nowo):
````bat
setx PY_PTH "C:\Program Files\Python 3.8"
````
Wtedy możemy w przyszłości wygodnie zmieniać wartość zmiennej, a używać stałej modyfikacji  
`set PATH=%PY_PTH%;%PATH%`, a wręcz [trwale ją wpisać do _PATH_](https://ss64.com/nt/path.html) za pomocą ["Edytuj zmienne..."](#edytuj-zmienne) - PATH / Edytuj / Nowy: `%PY_PTH%` i/lub wpisać na stałe w opcjach "uruchom" N++:
`%ComSpec% /c chcp 65001 & cd /D "$(CURRENT_DIRECTORY)" & "%PY_PTH%\Python.exe" "$(FULL_CURRENT_PATH)" & pause`{:style="font-size: smaller;"}  
<small>[Nie powinno się używać _SetX_ do _PATH_](https://ss64.com/nt/path.html), czy do wyżej wspomnianego _PYTHONPATH_.</small>

- - - -

<span style="font-size: smaller; color:DarkGrey;">
Można wyświetlić ścieżki PATH w linii poleceń wstawiając łamanie wierszy:
</span>
`ECHO.%PATH:;=; & ECHO.%`{:style="font-size: smaller;"}  
<span style="font-size: smaller; color:DarkGrey;">
Uwaga - _Path_ jest składana z 2 części, które w w ["Edytuj zmienne..."](#edytuj-zmienne) widzimy jako - _Path - system_ (priorytetowa) i _Path - użytkownika_. Warto je sobie uporządkować jak opisano na początku artykułu.
</span>
- - - -
<br>

### Python Launcher for Windows

Od wersji 3.3 wraz z instalacją Pythona jest instalowany [program `py.exe` oraz `pyw.exe`](https://docs.python.org/3/using/windows.html#python-launcher-for-windows), np. `C:\Windows\py.exe`, który pozwala na kompilację wprost poprzez uruchamianie pliku `*.py`. W pierwszym wierszu naszego skryptu `*.py` można wpisać np. `#!python3.7-64` lub `#!/usr/bin/python3.7-64` (w Windows `/usr/bin/` jest pomijany). 

Natomiast specjalne znaczenie ma `#!/usr/bin/env python` - [wg. dokumentacji](https://docs.python.org/3/using/windows.html#shebang-lines) następuje tu przeszukiwanie ścieżki _PATH_ w celu uruchomienia pierwszego(?) napotkanego _Python.exe_ . Jest to również przydatna opcja do uruchamiania [środowiska wirtualnego](https://chriswarrick.com/blog/2018/09/04/python-virtual-environments/) <small>(Uwaga - niestety nie można wpisać np. _#!/usr/bin/env python3_, i to pomimo tego, że _python3.exe_ jest znajdywalny w _PATH_. Gdy tylko użyjemy jakichś cyfr, to sposób uruchamiania ignoruje _/usr/bin/env_ i działa wg. [reguły poszukiwania wersji](https://learning-python.com/py33-windows-launcher.html) podanej w `*`{:style="font-size: smaller;"} w `#!/usr/bin/env python*`{:style="font-size: smaller;"} lub `#!/usr/bin/python*`{:style="font-size: smaller;"} lub `#!/usr/local/bin/python*`{:style="font-size: smaller;"} lub `#!python*`{:style="font-size: smaller;"}).</small>

Aby przetestować który kompilator się uruchamia można przygotować sobie testowy plik _v.py_:
````py
#!/usr/bin/env python
import sys
input('\n'.join(['',sys.executable,sys.version,'','naciśnij Enter']))
````

Lista wersji kompilatorów do wyboru m.in za pomocą `#!....`: 
````
py -0p
````
`py` bez parametrów wywołuje swój domyślny kompilator `python.exe` - oznaczany na liście gwiazdką. Ale gdy uruchamiamy jakiś plik z pierwszym wierszem _#!..._, to to ustawienie ma priorytet. Generalnie wywołanie z `py` może dawać całkiem inne efekty niż z `python` (wyszukany w PATH).

W Notepad++ można zapamiętać sobie w _Uruchom_ wywołanie programu właściwego dla rozszerzenia aktualnie edytowanego pliku (to działa uniwersalnie na dowolne rozszerzenia, nie tylko _*.py_):  
`%ComSpec% /c chcp 65001 & cd /D "$(CURRENT_DIRECTORY)" & "$(FULL_CURRENT_PATH)" & pause`{:style="font-size: smaller;"}

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

<small> Jest to już zrobione jak w tym przykładzie, jeśli instalowaliśmy jakikolwiek pakiet PYTHONa 3.3+.</small>

Uwaga - jeśli dodaliśmy swoją obsługę plików _*.py_ (poprzez _"Otwórz za pomocą"_), to ten nasz wybór będzie miał [priorytet nad powyższą konfiguracją](https://code.activestate.com/lists/python-list/727915/). Aby to naprawić należy wybierać do uruchomienia _*.py_ aplikację Python z ikoną rakiety ![py32.png]({{ site.baseurl }}/assets/img/py32.png "py32.png"). Wybieranie wprost "C:\WINDOWS\py.exe" [jest błędem](https://code.activestate.com/lists/python-list/727915/#as_lists_article_thread).


<span style="font-size: smaller;">
Ewentualnie, aby uruchamiać skrypt podając samą nazwę bez wpisywania rozszerzenia ".py" można jeszcze dodać  `set PATHEXT=.PY;%PATHEXT%`
lub trwale zmodyfikować PATHEXT w ["Edytuj zmienne..."](#edytuj-zmienne).
</span>

<span style="font-size: smaller;">
Więcej inf. o aktualnym stanie  konfiguracji, np. z pliku `%LocalAppData%\py.ini`{:style="font-size: smaller;"} uzyskamy włączając `PYLAUNCH_DEBUG`{:style="font-size: smaller;"} :  
`set PYLAUNCH_DEBUG=1 & py -0p`{:style="font-size: smaller;"} . Następnie można uruchamiać plik testowy _v.py_ testując różne opcje w _#!..._
</span>

----
<br>

`set PY_PYTHON=3` & `set PY_PYTHON3=3.6-32` , albo ustawić trwale: `setx PY_PYTHON 3` & `setx PY_PYTHON3 3.6-32` - 
[ustala domyślną wersję dla](https://docs.python.org/3/using/windows.html#customizing-default-python-versions)
 uruchamianych _*.py_. 
Równoważny zapis w `py.ini`:
````ini
[defaults]
python=3
python3=3.6-32
````

<span style="font-size: smaller;">
Z linii poleceń można dopisać tekst do swojego _py.ini_ (modyfikacja działa od razu i nie trzeba restartu aplikacji np. _cmd_ albo _N++_ jak w przypadku SetX): 
`(echo.[defaults]&echo.python=3&echo.python3=3.6-32)>>%LocalAppData%\py.ini`{:style="font-size: smaller;"}  
Aby _py.ini_ stworzyć na nowo należy użyć pojedynczego znaku '>' zamiast '\>>'. Zob. `type %LocalAppData%\py.ini`{:style="font-size: smaller;"}
</span>

W [środowisku wirtualnym](https://docs.python.org/3/library/venv.html) [(zob.^)](https://chriswarrick.com/blog/2018/09/04/python-virtual-environments/) regułą nadrzędną jest wywołanie aktywowanego kompilatora Python.exe.

Można tu jeszcze wspomnieć o wymyślaniu [własnych poleceń](https://www.python.org/dev/peps/pep-0397/#customized-commands) wpisywanych w _py.ini_, które można używać w _#!..._.,tylko należy pamiętać, że nie mogą zaczynać się od _python_.


