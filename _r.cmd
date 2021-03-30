:: ostatni człon aktulanego foldera %cd% poprzedzony http://localhost/ oraz wywołanie przeglądarki
@FOR /F "delims=|" %%i IN ("%cd%") DO (
  start "jekyll-localhost-%%~ni" http://localhost:4000/%%~ni/
  start "jekyll-www-%%~ni" https://andrzejq.github.io/%%~ni/ )
::uruchomienie lokalnego serwera www
bundle exec jekyll serve