:: ostatni człon aktulanego foldera %cd% poprzedzony http://localhost/ oraz wywołanie przeglądarki
@FOR /F "delims=|" %%i IN ("%cd%") DO start "jekyll-localhost" http://localhost:4000/%%~ni/
::uruchomienie lokalnego serwera www
bundle exec jekyll serve