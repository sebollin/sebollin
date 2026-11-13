<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&height=190&color=0:0b2e4f,45:0e7c7b,75:4caf50,100:f2b705&text=Sebasti%C3%A1n%20Lucas&fontColor=ffffff&fontSize=48&fontAlignY=36&desc=Cient%C3%ADfico%20de%20datos%20%2B%20educador%20%C2%B7%20Bonsaicultor&descSize=17&descAlignY=57&animation=fadeIn" width="100%" alt="Sebastián Lucas" />

<img src="assets/typing.svg" width="748"
     alt="Modelado predictivo · Datos para la gestión universitaria, en Shiny · Datos para la orientación educativa · Datos para la política pública, en R, en Python, en SQL · Datos para lo que haga falta, en lo que haga falta" />

[![LinkedIn](https://img.shields.io/badge/LinkedIn-sebalucas-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/sebalucas/)
[![Correo](https://img.shields.io/badge/Correo-sebalucas@gmail.com-EA4335?style=for-the-badge&logo=gmail&logoColor=white)](mailto:sebalucas@gmail.com)
[![CRAN](https://img.shields.io/badge/CRAN-bigbang%20%C2%B7%20lupa-198CE7?style=for-the-badge&logo=r&logoColor=white)](https://cran.r-project.org/web/checks/check_results_sebalucas_at_gmail.com.html)
[![r-universe](https://img.shields.io/badge/r--universe-sebollin-0e7c7b?style=for-the-badge&logo=r&logoColor=white)](https://sebollin.r-universe.dev/)
[![ORCID](https://img.shields.io/badge/ORCID-0009--0009--9068--0276-A6CE39?style=for-the-badge&logo=orcid&logoColor=white)](https://orcid.org/0009-0009-9068-0276)

🇺🇾

[![English](https://img.shields.io/badge/README-English-1565c0?style=flat-square)](README.en.md)

</div>

---

## 👋 Quién soy

Empecé adentro de un aula y hoy, **18 años después**, trabajo adentro de los
datos —los de las transferencias que decide el Estado, los de las compras de una
universidad, y los de cualquier problema que se deje modelar—. La pregunta es
siempre la misma: qué dice este dato, y qué no puede decir. Del aula no me fui
del todo: sigo coordinando talleres en un liceo público.

- 🏛️ **Analista de datos** en la **Dirección Nacional de Transferencias y Análisis de Datos ([DINTAD](https://www.gub.uy/ministerio-desarrollo-social/))** del **MIDES**, como consultor de **[UNFPA](https://uruguay.unfpa.org/)**: gestión y análisis de los programas de transferencias monetarias a hogares en situación de vulnerabilidad socioeconómica.
- 📊 **Analista de datos** en el **[SeCIU](https://www.seciu.edu.uy/)** de la Universidad de la República: tableros institucionales en **R** y **Shiny**.
- 🎓 **Especialista en Ciencia de Datos**; ahora curso la **Maestría** (CPAP–FIng, UdelaR).
- 🌳 Cultivo bonsáis y mantengo el front-end de la tienda **[komorebibonsai.uy](https://komorebibonsai.uy)**, que es donde escribo el código que no lleva estadística.

**Auditable antes que automático**: muestro alcance, evidencia e incertidumbre
antes que una respuesta cómoda.

> **In English** — A Uruguayan data scientist who started out in a classroom 18
> years ago. I analyse cash-transfer data at the Ministry of Social Development,
> as a UNFPA consultant, and build dashboards at Universidad de la República.
> Two of my R packages are on CRAN: `lupa`, for auditable data quality, and
> `bigbang`, for meta-packages that work offline. I co-author `geouy`, archived
> in 2025 and now back under CRAN review, and I have proposed fixes to the
> Python library `ftfy`. → **[Full profile in English](README.en.md)**

---

## 📦 Paquetes de R

<table>
<tr>
<td colspan="2" valign="top">

### [lupa](https://github.com/sebollin/lupa) <a href="https://sebollin.github.io/lupa/"><img src="https://raw.githubusercontent.com/sebollin/lupa/main/man/figures/logo.png" align="right" height="120" alt="logo de lupa" /></a>

**En CRAN.** Calidad de datos de punta a punta, y **auditable**: cada resultado
declara su alcance, su evidencia y lo que no pudo medir. El dato original nunca
cambia en silencio.

- 🔎 **Perfilar** — lo que `summary()` no ve: faltantes disfrazados de `"S/D"` o de `-99`, fechas en formatos mezclados, claves y relaciones que nadie declaró. Con las filas donde está cada problema.
- 📏 **Medir** — con un marco de calidad propio o con los que trae implementados: el de gobierno digital de AGESIC, el de aseguramiento de la calidad estadística de Naciones Unidas en su adaptación de la CEPAL, e ISO/IEC 25012.
- 🧹 **Limpiar** — una copia, con un plan editable y registro de auditoría.
- 📈 **Seguir** — comparación de entregas, histórico de calidad y detección de deriva, en un informe HTML autocontenido.
- 🗄️ **Escalar** — perfila dentro de la base, en seis motores SQL, y busca duplicados aproximados con MinHash/LSH.

```r
install.packages("lupa")
```

[![CRAN](https://www.r-pkg.org/badges/version/lupa)](https://cran.r-project.org/package=lupa)
[![Descargas](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsebollin%2Fsebollin%2Fbadges%2Flupa-total.es.json)](https://cran.r-project.org/package=lupa)
[![Descargas del último mes](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsebollin%2Fsebollin%2Fbadges%2Flupa-mes.es.json)](https://cran.r-project.org/package=lupa)
[![Dependencias](https://img.shields.io/badge/dynamic/xml?url=https%3A%2F%2Ftinyverse.netlify.app%2Fbadge%2Flupa&query=substring-after%28%2F%2F%2A%5Blocal-name%28%29%3D%27title%27%5D%2C%27%3A%20%27%29&label=dependencias&color=67ac09)](https://cran.r-project.org/package=lupa)
[![R CMD check](https://img.shields.io/github/actions/workflow/status/sebollin/lupa/R-CMD-check.yaml?branch=main&label=R%20CMD%20check)](https://github.com/sebollin/lupa/actions/workflows/R-CMD-check.yaml)
[![Motores SQL](https://img.shields.io/github/actions/workflow/status/sebollin/lupa/motores.yaml?branch=main&label=motores%20SQL)](https://github.com/sebollin/lupa/actions/workflows/motores.yaml)
[![Estado](https://img.shields.io/badge/estado-activo-4c1)](https://www.repostatus.org/#active)
[![Sitio](https://img.shields.io/badge/documentaci%C3%B3n-sebollin.github.io%2Flupa-0e7c7b)](https://sebollin.github.io/lupa/)
[![DOI](https://img.shields.io/badge/DOI-10.5281%2Fzenodo.24117753-1682D4)](https://doi.org/10.5281/zenodo.24117753)

</td>
</tr>
<tr>
<td width="50%" valign="top">

### [bigbang](https://github.com/sebollin/bigbang) <a href="https://sebollin.github.io/bigbang/"><img src="https://raw.githubusercontent.com/sebollin/bigbang/main/man/figures/logo.png" align="right" height="100" alt="logo de bigbang" /></a>

**En CRAN.** Arma metapaquetes estilo *tidyverse* a partir de paquetes locales
(`.tar.gz` / `.zip`). Pensado para equipos detrás de un firewall
institucional: funciona sin internet.

```r
install.packages("bigbang")
```

[![CRAN](https://www.r-pkg.org/badges/version/bigbang)](https://cran.r-project.org/package=bigbang)
[![Descargas](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsebollin%2Fsebollin%2Fbadges%2Fbigbang-total.es.json)](https://cran.r-project.org/package=bigbang)
[![Descargas del último mes](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsebollin%2Fsebollin%2Fbadges%2Fbigbang-mes.es.json)](https://cran.r-project.org/package=bigbang)
[![Posición entre los debuts de 2026 en CRAN](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsebollin%2Fsebollin%2Fbadges%2Fbigbang-posicion.es.json)](https://github.com/sebollin/sebollin/blob/main/.github/scripts/badges.R)
[![Dependencias](https://img.shields.io/badge/dynamic/xml?url=https%3A%2F%2Ftinyverse.netlify.app%2Fbadge%2Fbigbang&query=substring-after%28%2F%2F%2A%5Blocal-name%28%29%3D%27title%27%5D%2C%27%3A%20%27%29&label=dependencias&color=67ac09)](https://cran.r-project.org/package=bigbang)
[![R CMD check](https://img.shields.io/github/actions/workflow/status/sebollin/bigbang/R-CMD-check.yaml?branch=main&label=R%20CMD%20check)](https://github.com/sebollin/bigbang/actions/workflows/R-CMD-check.yaml)
[![Cobertura](https://img.shields.io/codecov/c/github/sebollin/bigbang?label=cobertura)](https://app.codecov.io/gh/sebollin/bigbang)
[![Estado](https://img.shields.io/badge/estado-activo-4c1)](https://www.repostatus.org/#active)
[![Sitio](https://img.shields.io/badge/documentaci%C3%B3n-sebollin.github.io%2Fbigbang-0e7c7b)](https://sebollin.github.io/bigbang/)
[![DOI](https://img.shields.io/badge/DOI-10.5281%2Fzenodo.23192961-1682D4)](https://doi.org/10.5281/zenodo.23192961)

</td>
<td width="50%" valign="top">

### [geouy](https://github.com/Richard-Detomasi/geouy) · coautor <a href="https://github.com/Richard-Detomasi/geouy"><img src="https://raw.githubusercontent.com/Richard-Detomasi/geouy/master/man/figures/geouy_logo_b.png" align="right" height="100" alt="logo de geouy" /></a>

Datos geográficos oficiales de Uruguay —capas del INE, la IDE, el MIDES, el MTOP
y Ambiente, entre otras— listos para usar en R como objetos `sf`. Lo creó y lo
mantiene [Richard Detomasi](https://github.com/Richard-Detomasi). Estuvo cinco
años en CRAN hasta que lo archivaron en 2025. Lo dejamos otra vez en
condiciones, y la versión 0.3.0 ya está en revisión en CRAN; mientras tanto, se
instala desde GitHub:

```r
pak::pak("Richard-Detomasi/geouy")
```

[![CRAN](https://img.shields.io/badge/CRAN-0.3.0%20en%20revisi%C3%B3n-f2b705)](https://cran.r-project.org/package=geouy)
[![Descargas](https://img.shields.io/endpoint?url=https%3A%2F%2Fraw.githubusercontent.com%2Fsebollin%2Fsebollin%2Fbadges%2Fgeouy-total.es.json)](https://cran.r-project.org/package=geouy)
[![R CMD check](https://img.shields.io/github/actions/workflow/status/Richard-Detomasi/geouy/R-CMD-check.yaml?branch=master&label=R%20CMD%20check)](https://github.com/Richard-Detomasi/geouy/actions/workflows/R-CMD-check.yaml)
[![Cobertura](https://img.shields.io/codecov/c/github/Richard-Detomasi/geouy/master?label=cobertura)](https://app.codecov.io/gh/Richard-Detomasi/geouy?branch=master)
[![Estado](https://img.shields.io/badge/estado-activo-4c1)](https://www.repostatus.org/#active)
[![CRAN Task View](https://img.shields.io/badge/CRAN%20Task%20View-Spatial-198CE7)](https://cran.r-project.org/web/views/Spatial.html)
[![DOI](https://img.shields.io/badge/DOI-10.5281%2Fzenodo.3610246-1682D4)](https://doi.org/10.5281/zenodo.3610246)

</td>
</tr>
</table>

`bigbang` y `lupa` se instalan también desde **[sebollin.r-universe.dev](https://sebollin.r-universe.dev/)**.
`bigbang`, `lupa` y `geouy` figuran en el [catálogo de paquetes de R latinoamericanos](https://github.com/Estacion-R/asombrosos-paquetes-r-latinoamerica)
de Estación R, y los hexágonos de `bigbang` y `geouy`, en la [galería de hexSticker](https://github.com/GuangchuangYu/hexSticker#stickers-for-software-packages).

---

## 🏗️ Lo que desarrollé

- 📊 **Monitor de compras de la UdelaR** *(SeCIU)* — cerca de **100.000 compras** en un tablero de [Shiny](https://shiny.posit.co/) con múltiples visualizaciones y filtros cruzados, CSS propio incluido.
- 🏛️ **[tus-ipm-microsimulacion](https://github.com/sebollin/tus-ipm-microsimulacion)** — microsimulación del efecto de aumentos de la Tarjeta Uruguay Social sobre la **pobreza multidimensional** (ECH 2025): resultados agregados, figuras reproducibles y la arquitectura metodológica.
- 🧰 **[lupa](https://github.com/sebollin/lupa)** y **[bigbang](https://github.com/sebollin/bigbang)** — los dos paquetes míos de acá arriba; los escribí porque me hacían falta y no existían.
- 🗺️ **CARTOGRAFÍA URGENTE** — relevamiento y análisis de la distribución geográfica de las propuestas educativas de Montevideo para niñas, niños y adolescentes.

Y fuera del horario: optimización y modelos de pronóstico para problemas que no
le importan a nadie más que a mí. Todavía privados.

---

## 🤝 Aportes a otros proyectos

### 🔤 [ftfy](https://github.com/rspeer/python-ftfy) — reparación de mojibake

Tres arreglos propuestos a la biblioteca de referencia para reparar mojibake, de
[Robyn Speer](https://github.com/rspeer):
[detección y reparación de KOI8-R](https://github.com/rspeer/python-ftfy/pull/234),
[mojibake de Windows-1252 en los símbolos del bloque U+2000](https://github.com/rspeer/python-ftfy/pull/235)
y [un ancla de expresión regular que se come el salto de línea final en el codec CESU-8](https://github.com/rspeer/python-ftfy/pull/237).

---

## 🛠️ Con qué trabajo

<div align="center">

**Lenguajes**

<img src="https://img.shields.io/badge/R-276DC3?style=flat-square&logo=r&logoColor=white" />
<img src="https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white" />
<img src="https://img.shields.io/badge/SQL-4479A1?style=flat-square" />
<img src="https://img.shields.io/badge/Bash-4EAA25?style=flat-square&logo=gnubash&logoColor=white" />
<img src="https://img.shields.io/badge/GNU%20Octave-0790C0?style=flat-square&logo=octave&logoColor=white" />

**Entornos y versionado**

<img src="https://img.shields.io/badge/RStudio-75AADB?style=flat-square&logo=rstudioide&logoColor=white" />
<img src="https://img.shields.io/badge/VS%20Code-007ACC?style=flat-square&logoColor=white&logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMDAgMTAwIj48cGF0aCBmaWxsPSIjZmZmIiBkPSJNNzAuOTExOSA5OS4zMTcxQzcyLjQ4NjkgOTkuOTMwNyA3NC4yODI4IDk5Ljg5MTQgNzUuODcyNSA5OS4xMjY0TDk2LjQ2MDggODkuMjE5N0M5OC42MjQyIDg4LjE3ODcgMTAwIDg1Ljk4OTIgMTAwIDgzLjU4NzJWMTYuNDEzM0MxMDAgMTQuMDExMyA5OC42MjQzIDExLjgyMTggOTYuNDYwOSAxMC43ODA4TDc1Ljg3MjUgMC44NzM3NTZDNzMuNzg2MiAtMC4xMzAxMjkgNzEuMzQ0NiAwLjExNTc2IDY5LjUxMzUgMS40NDY5NUM2OS4yNTIgMS42MzcxMSA2OS4wMDI4IDEuODQ5NDMgNjguNzY5IDIuMDgzNDFMMjkuMzU1MSAzOC4wNDE1TDEyLjE4NzIgMjUuMDA5NkMxMC41ODkgMjMuNzk2NSA4LjM1MzYzIDIzLjg5NTkgNi44NjkzMyAyNS4yNDYxTDEuMzYzMDMgMzAuMjU0OUMtMC40NTI1NTIgMzEuOTA2NCAtMC40NTQ2MzMgMzQuNzYyNyAxLjM1ODUzIDM2LjQxN0wxNi4yNDcxIDUwLjAwMDFMMS4zNTg1MyA2My41ODMyQy0wLjQ1NDYzMyA2NS4yMzc0IC0wLjQ1MjU1MiA2OC4wOTM4IDEuMzYzMDMgNjkuNzQ1M0w2Ljg2OTMzIDc0Ljc1NDFDOC4zNTM2MyA3Ni4xMDQzIDEwLjU4OSA3Ni4yMDM3IDEyLjE4NzIgNzQuOTkwNUwyOS4zNTUxIDYxLjk1ODdMNjguNzY5IDk3LjkxNjdDNjkuMzkyNSA5OC41NDA2IDcwLjEyNDYgOTkuMDEwNCA3MC45MTE5IDk5LjMxNzFaTTc1LjAxNTIgMjcuMjk4OUw0NS4xMDkxIDUwLjAwMDFMNzUuMDE1MiA3Mi43MDEyVjI3LjI5ODlaIi8%2BPC9zdmc%2B" />
<img src="https://img.shields.io/badge/Jupyter-F37626?style=flat-square&logo=jupyter&logoColor=white" />
<img src="https://img.shields.io/badge/Colab-F9AB00?style=flat-square&logo=googlecolab&logoColor=white" />
<img src="https://img.shields.io/badge/Git-F05032?style=flat-square&logo=git&logoColor=white" />
<img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white" />
<img src="https://img.shields.io/badge/GitLab-FC6D26?style=flat-square&logo=gitlab&logoColor=white" />

**Datos, modelos y visualización**

<img src="https://img.shields.io/badge/tidyverse-1A162D?style=flat-square&logo=tidyverse&logoColor=white" />
<img src="https://img.shields.io/badge/ggplot2-1A162D?style=flat-square&logo=tidyverse&logoColor=white" />
<img src="https://img.shields.io/badge/Shiny-447099?style=flat-square&logo=posit&logoColor=white" />
<img src="https://img.shields.io/badge/pandas-150458?style=flat-square&logo=pandas&logoColor=white" />
<img src="https://img.shields.io/badge/NumPy-013243?style=flat-square&logo=numpy&logoColor=white" />
<img src="https://img.shields.io/badge/Plotly-3F4F75?style=flat-square&logo=plotly&logoColor=white" />
<img src="https://img.shields.io/badge/Matplotlib-11557C?style=flat-square&logo=python&logoColor=white" />
<img src="https://img.shields.io/badge/scikit--learn-F7931E?style=flat-square&logo=scikitlearn&logoColor=white" />
<img src="https://img.shields.io/badge/PyTorch-EE4C2C?style=flat-square&logo=pytorch&logoColor=white" />
<img src="https://img.shields.io/badge/TensorFlow-FF6F00?style=flat-square&logo=tensorflow&logoColor=white" />

**Bases de datos**

<img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=flat-square&logo=postgresql&logoColor=white" />
<img src="https://img.shields.io/badge/SQLite-003B57?style=flat-square&logo=sqlite&logoColor=white" />
<img src="https://img.shields.io/badge/DBeaver-382923?style=flat-square&logo=dbeaver&logoColor=white" />

**Sistemas y publicación**

<img src="https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=docker&logoColor=white" />
<img src="https://img.shields.io/badge/Linux-FCC624?style=flat-square&logo=linux&logoColor=white" />
<img src="https://img.shields.io/badge/LaTeX-008080?style=flat-square&logo=latex&logoColor=white" />
<img src="https://img.shields.io/badge/WordPress-21759B?style=flat-square&logo=wordpress&logoColor=white" />

**Información geográfica**

<img src="https://img.shields.io/badge/QGIS-589632?style=flat-square&logo=qgis&logoColor=white" />
<img src="https://img.shields.io/badge/gvSIG-4A7C2F?style=flat-square" />
<img src="https://img.shields.io/badge/GeoDa-2D6A4F?style=flat-square" />

</div>

---

## 🎓 Formación

<table>
<tr><td><strong>Maestría en Ciencia de Datos</strong> <em>(en curso)</em></td><td>CPAP – FIng, UdelaR</td></tr>
<tr><td><strong>Especialista en Ciencia de Datos</strong></td><td>CPAP – FIng, UdelaR</td></tr>
<tr><td><strong>Licenciado en Educación</strong></td><td>Universidad Católica del Uruguay</td></tr>
<tr><td><strong>Sistemas de Información Geográfica e Innovación Ambiental</strong></td><td>Universidad Católica del Uruguay</td></tr>
<tr><td><strong>Técnico en Educación para el Tiempo Libre y la Recreación</strong></td><td>Universidad Católica del Uruguay</td></tr>
</table>

---

## ✍️ Publicaciones, ponencias y reconocimientos

- **[{DADverse}. Simplificando el procesamiento de datos para políticas públicas enfocadas en población vulnerable en ambientes de uso restringido](https://github.com/LatinR/presentaciones-LatinR2023/blob/main/papers/slides/DADverse.pdf)** — Lucas, S.; Detomasi, R. *LatinR 2023*.
- **La Siembra. El legado de Aulas Comunitarias: un aporte a la educación uruguaya** — coautor del cap. 1.3.2. OBSUR, 2020.
- **[El aula en movimiento: aportes metodológicos desde la Educación No Formal](https://www.gub.uy/ministerio-educacion-cultura/sites/ministerio-educacion-cultura/files/documentos/publicaciones/Revista_Enfoques_5.pdf)** — Catalurda, R.; Lucas, S.; González, W. *Enfoques, Revista de Educación No Formal*, MEC, v. 5, 2014.
- **Talleres en el liceo… ¿para qué?** — Lucas, S.; Verdún, N. Ponencia en la Cátedra «Alicia Goyena» (CES–ANEP), 2016.
- 🏆 **Proyecto «Todo Suma»** — creador e impulsor. Ganador del *Concurso sobre Proyectos de Convivencia de los Centros Educativos*, Programa Pelota al Medio a la Esperanza.

---

## 📊 GitHub

<div align="center">

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="assets/tarjetas/1-repos-per-language.github_dark.svg" />
  <img height="170" src="assets/tarjetas/1-repos-per-language.github.svg" alt="Repositorios por lenguaje" />
</picture>
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="assets/tarjetas/2-most-commit-language.github_dark.svg" />
  <img height="170" src="assets/tarjetas/2-most-commit-language.github.svg" alt="Lenguaje más usado" />
</picture>

</div>

---

<div align="center">

**¿Trabajamos juntos?** — [LinkedIn](https://www.linkedin.com/in/sebalucas/) · [sebalucas@gmail.com](mailto:sebalucas@gmail.com)

<sub>Ciudad de la Costa, Canelones · Uruguay 🇺🇾</sub>

<img src="https://capsule-render.vercel.app/api?type=waving&section=footer&height=90&color=0:f2b705,30:4caf50,70:0e7c7b,100:0b2e4f" width="100%" alt="" />

</div>
