<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&height=190&color=0:0b2e4f,45:0e7c7b,75:4caf50,100:f2b705&text=Sebasti%C3%A1n%20Lucas&fontColor=ffffff&fontSize=48&fontAlignY=36&desc=Educador%20%2B%20cient%C3%ADfico%20de%20datos%20%C2%B7%20Bonsaicultor&descSize=17&descAlignY=57&animation=fadeIn" width="100%" alt="Sebastián Lucas" />

<img src="assets/typing.svg" width="748"
     alt="Modelado predictivo · Datos para la gestión universitaria, en Shiny · Datos para la orientación educativa · Datos para la política pública, en R, en Python, en SQL · Datos para lo que haga falta, en lo que haga falta" />

[![LinkedIn](https://img.shields.io/badge/LinkedIn-sebalucas-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/sebalucas/)
[![Correo](https://img.shields.io/badge/Correo-sebalucas@gmail.com-EA4335?style=for-the-badge&logo=gmail&logoColor=white)](mailto:sebalucas@gmail.com)
[![CRAN](https://img.shields.io/badge/CRAN-bigbang-198CE7?style=for-the-badge&logo=r&logoColor=white)](https://cran.r-project.org/package=bigbang)
[![r-universe](https://img.shields.io/badge/r--universe-sebollin-0e7c7b?style=for-the-badge&logo=r&logoColor=white)](https://sebollin.r-universe.dev/)

🇺🇾

[![English](https://img.shields.io/badge/README-English-1565c0?style=flat-square)](README.en.md)

</div>

---

## 👋 Quién soy

Licenciado en Educación que se volvió científico de datos. **17 años de
trabajo**: empecé adentro de un aula y hoy trabajo adentro de los datos —los de
las transferencias que decide el Estado, los de las compras de una universidad,
y los de cualquier problema que se deje modelar—. La pregunta es siempre la
misma: qué dice este dato, y qué no puede decir.

- 🏛️ **Analista de datos** en la **Dirección Nacional de Transferencias y Análisis de Datos ([DINTAD](https://www.gub.uy/ministerio-desarrollo-social/))** del **MIDES**, como consultor de **[UNFPA](https://uruguay.unfpa.org/)**: gestión y análisis de los programas de transferencias monetarias a hogares en situación de vulnerabilidad socioeconómica.
- 🎓 **Analista de datos** en el **[SeCIU](https://www.seciu.edu.uy/)** de la Universidad de la República: monitores y visualizadores institucionales en **R** y **Shiny**.
- 📚 **Coordinador de talleres extracurriculares** en un liceo público, desde 2016; son 13 años en educación secundaria antes de esto. No lo dejé cuando cambié de rubro y no pienso dejarlo.
- 🔬 Cursando la **Maestría en Ciencia de Datos** (CPAP–FIng, UdelaR).
- 🌐 Sostengo el front-end y el mantenimiento de la tienda **[komorebibonsai.uy](https://komorebibonsai.uy)**, que es donde escribo el código que no lleva estadística.
- 🌳 Cultivo bonsáis.

**Auditable antes que automático**: muestro alcance, evidencia e incertidumbre
antes que una respuesta cómoda.

> **In short** — Data scientist and educator from Uruguay, 17 years in.
> I build auditable R tooling for public-policy data: profiling, data quality,
> record linkage. `bigbang` is on CRAN and r-universe, `lupa` on GitHub, plus
> contributions to `ftfy` and to `geouy`, an archived CRAN package I'm helping
> bring back. → **[English version](README.en.md)**

---

## 📦 Paquetes de R

<table>
<tr>
<td width="50%" valign="top">

### 🌌 [bigbang](https://github.com/sebollin/bigbang)

**En CRAN.** Arma metapaquetes estilo *tidyverse* a partir de paquetes locales
(`.tar.gz` / `.zip`). Pensado para equipos detrás de un firewall
institucional: funciona sin internet.

```r
install.packages("bigbang")
```

[![CRAN](https://www.r-pkg.org/badges/version/bigbang)](https://cran.r-project.org/package=bigbang)

</td>
<td width="50%" valign="top">

### 🔎 [lupa](https://github.com/sebollin/lupa)

Perfilado, calidad de datos y búsqueda de duplicados a escala, **auditable**:
declara alcance, evidencia e incertidumbre de cada resultado. Nunca cambia el
dato original en silencio.

```r
pak::pak("sebollin/lupa")
```

[![Sitio](https://img.shields.io/badge/documentaci%C3%B3n-sebollin.github.io%2Flupa-0e7c7b)](https://sebollin.github.io/lupa/)

</td>
</tr>
</table>

`bigbang` está además en **[sebollin.r-universe.dev](https://sebollin.r-universe.dev/)**.

<sub>Los hexágonos de los dos son míos, de la idea al SVG.</sub>

---

## 🏗️ Lo que desarrollé

- 📊 **Monitor de compras de la UdelaR** *(SeCIU)* — cerca de **100.000 compras** en un tablero de [Shiny](https://shiny.posit.co/) con múltiples visualizaciones y filtros cruzados, CSS propio incluido.
- 🏛️ **[tus-ipm-microsimulacion](https://github.com/sebollin/tus-ipm-microsimulacion)** — microsimulación del efecto de aumentos de la Tarjeta Uruguay Social sobre la **pobreza multidimensional** (ECH 2025): resultados agregados, figuras reproducibles y la arquitectura metodológica.
- 🧰 **[lupa](https://github.com/sebollin/lupa)** y **[bigbang](https://github.com/sebollin/bigbang)** — las dos herramientas de acá arriba; las escribí porque me hacían falta y no existían.
- 🗺️ **CARTOGRAFÍA URGENTE** — relevamiento y análisis de la distribución geográfica de las propuestas educativas de Montevideo para niñas, niños y adolescentes.

Y fuera del horario: optimización y modelos de pronóstico para problemas que no
le importan a nadie más que a mí. Todavía privados.

---

## 🤝 Aportes a otros proyectos

### 🗺️ [geouy](https://github.com/Richard-Detomasi/geouy) — información geográfica de Uruguay

Colaborador del paquete de [Richard Detomasi](https://github.com/Richard-Detomasi),
con quien ya habíamos presentado {DADverse} en LatinR 2023. El paquete estuvo
cinco años en CRAN y fue archivado en 2025; el trabajo es devolverlo a la vida:
encontrar por qué se rompió, arreglarlo y dejarlo en condiciones de volver.

Hasta ahora: la función de ortofotos volvió a funcionar —abortaba siempre por
una validación que además nunca detectaba lo que decía detectar, y devolvía la
imagen entera en lugar del área pedida—, y un `download.file()` en modo *append*
que tumbaba la sesión de R entera con un segfault dejó de estar. El
`R CMD check` pasó de un error a ninguno.

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

| | |
|---|---|
| **Maestría en Ciencia de Datos** *(en curso)* | CPAP – FIng, UdelaR |
| **Especialista en Ciencia de Datos** | CPAP – FIng, UdelaR |
| **Licenciado en Educación** | Universidad Católica del Uruguay |
| **Sistemas de Información Geográfica e Innovación Ambiental** | Universidad Católica del Uruguay |
| **Técnico en Educación para el Tiempo Libre y la Recreación** | Universidad Católica del Uruguay |

---

## ✍️ Publicaciones, ponencias y reconocimientos

- **{DADverse}. Simplificando el procesamiento de datos para políticas públicas enfocadas en población vulnerable** — Lucas, S.; Detomasi, R. *LatinR 2023*.
- **La Siembra. El legado de Aulas Comunitarias: un aporte a la educación uruguaya** — coautor del cap. 1.3.2. OBSUR, 2020.
- **El aula en movimiento: aportes metodológicos desde la Educación No Formal** — *Enfoques, Revista de Educación No Formal*, MEC, v. 5, 2014.
- **Talleres en el liceo… ¿para qué?** — Lucas, S.; Verdún, N. Ponencia en la Cátedra «Alicia Goyena» (CES–ANEP), 2016.
- 🏆 **Proyecto «Todo Suma»** — creador e impulsor. Ganador del *Concurso sobre Proyectos de Convivencia de los Centros Educativos*, Programa Pelota al Medio a la Esperanza.

---

## 📊 GitHub

<div align="center">

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github-profile-summary-cards.vercel.app/api/cards/repos-per-language?username=sebollin&theme=github_dark" />
  <img height="170" src="https://github-profile-summary-cards.vercel.app/api/cards/repos-per-language?username=sebollin&theme=github_light" alt="Repositorios por lenguaje" />
</picture>
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github-profile-summary-cards.vercel.app/api/cards/most-commit-language?username=sebollin&theme=github_dark" />
  <img height="170" src="https://github-profile-summary-cards.vercel.app/api/cards/most-commit-language?username=sebollin&theme=github_light" alt="Lenguaje más usado" />
</picture>

</div>

---

<div align="center">

**¿Trabajamos juntos?** — [LinkedIn](https://www.linkedin.com/in/sebalucas/) · [sebalucas@gmail.com](mailto:sebalucas@gmail.com)

<sub>Ciudad de la Costa, Canelones · Uruguay 🇺🇾</sub>

<img src="https://capsule-render.vercel.app/api?type=waving&section=footer&height=90&color=0:f2b705,30:4caf50,70:0e7c7b,100:0b2e4f" width="100%" alt="" />

</div>
