<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&height=190&color=0:0b2e4f,45:0e7c7b,75:4caf50,100:f2b705&text=Sebasti%C3%A1n%20Lucas&fontColor=ffffff&fontSize=48&fontAlignY=36&desc=Educator%20%2B%20data%20scientist%20%C2%B7%20Bonsai%20grower&descSize=17&descAlignY=57&animation=fadeIn" width="100%" alt="Sebastián Lucas" />

<img src="assets/typing.en.svg" width="695"
     alt="Predictive modelling · Data for university management, in Shiny · Data for educational guidance · Data for public policy, in R, in Python, in SQL · Data for whatever it takes, in whatever it takes" />

[![LinkedIn](https://img.shields.io/badge/LinkedIn-sebalucas-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/sebalucas/)
[![Email](https://img.shields.io/badge/Email-sebalucas@gmail.com-EA4335?style=for-the-badge&logo=gmail&logoColor=white)](mailto:sebalucas@gmail.com)
[![CRAN](https://img.shields.io/badge/CRAN-bigbang-198CE7?style=for-the-badge&logo=r&logoColor=white)](https://cran.r-project.org/package=bigbang)
[![r-universe](https://img.shields.io/badge/r--universe-sebollin-0e7c7b?style=for-the-badge&logo=r&logoColor=white)](https://sebollin.r-universe.dev/)

🇺🇾

[![Español](https://img.shields.io/badge/README-espa%C3%B1ol-2e7d32?style=flat-square)](README.md)

</div>

---

## 👋 Who I am

An education graduate who became a data scientist. **Seventeen years of work**:
I started inside a classroom and now work inside the data — the state's cash
transfers, a university's procurement, and any problem that lets itself be
modelled. The question is always the same: what does this data say, and what can
it not say?

- 🏛️ **Data analyst** at Uruguay's **National Directorate for Transfers and Data Analysis ([DINTAD](https://www.gub.uy/ministerio-desarrollo-social/))**, Ministry of Social Development, as a **[UNFPA](https://uruguay.unfpa.org/)** consultant: managing and analysing the cash-transfer programmes for households in socio-economic vulnerability.
- 🎓 **Data analyst** at **[SeCIU](https://www.seciu.edu.uy/)**, Universidad de la República: institutional dashboards and data visualisation in **R** and **Shiny**.
- 📚 **Coordinator of extracurricular workshops** at a public secondary school, since 2016; thirteen years in secondary education came before this. I did not drop it when I changed fields, and I do not plan to.
- 🔬 Currently doing an **MSc in Data Science** (CPAP–FIng, Universidad de la República).
- 🌐 I keep the front-end and the maintenance of **[komorebibonsai.uy](https://komorebibonsai.uy)** running — that is where I write the code with no statistics in it.
- 🌳 I grow bonsai.

**Auditable before automatic**: I show scope, evidence and uncertainty before
I show a convenient answer.

> **En resumen** — Licenciado en Educación devenido científico de datos, 17 años
> de trabajo. Construyo herramientas auditables en R para datos de política
> pública. → **[Versión en español](README.md)**

---

## 📦 R packages

<table>
<tr>
<td width="50%" valign="top">

### 🌌 [bigbang](https://github.com/sebollin/bigbang)

**On CRAN.** Builds *tidyverse*-style meta-packages from local package archives
(`.tar.gz` / `.zip`). Made for teams behind an institutional firewall: it works
offline.

```r
install.packages("bigbang")
```

[![CRAN](https://www.r-pkg.org/badges/version/bigbang)](https://cran.r-project.org/package=bigbang)

</td>
<td width="50%" valign="top">

### 🔎 [lupa](https://github.com/sebollin/lupa)

Data profiling, quality measurement and duplicate search at scale, and
**auditable**: it states the scope, evidence and uncertainty of every result,
and never changes your data silently.

```r
pak::pak("sebollin/lupa")
```

[![Docs](https://img.shields.io/badge/docs-sebollin.github.io%2Flupa-0e7c7b)](https://sebollin.github.io/lupa/)

</td>
</tr>
</table>

`bigbang` is also on **[sebollin.r-universe.dev](https://sebollin.r-universe.dev/)**.

<sub>Both hex stickers are mine, from the idea to the SVG.</sub>

---

## 🏗️ What I have built

- 📊 **UdelaR procurement monitor** *(SeCIU)* — around **100,000 purchases** in a [Shiny](https://shiny.posit.co/) dashboard with several visualisations and cross-filters, hand-written CSS included.
- 🏛️ **[tus-ipm-microsimulacion](https://github.com/sebollin/tus-ipm-microsimulacion)** — microsimulation of how increases in Uruguay's *Tarjeta Uruguay Social* affect **multidimensional poverty** (ECH 2025): aggregate results, reproducible figures, and the methodological architecture.
- 🧰 **[lupa](https://github.com/sebollin/lupa)** and **[bigbang](https://github.com/sebollin/bigbang)** — the two tools above; I wrote them because I needed them and they did not exist.
- 🗺️ **CARTOGRAFÍA URGENTE** — survey and analysis of the geographic distribution of educational provision for children and adolescents in Montevideo.

And after hours: optimisation and forecasting models for problems nobody cares
about except me. Still private.

---

## 🤝 Contributions to other projects

### 🗺️ [geouy](https://github.com/Richard-Detomasi/geouy) — geographic data for Uruguay

Collaborator on [Richard Detomasi](https://github.com/Richard-Detomasi)'s
package, which spent five years on CRAN until it was archived in 2025. The work
is bringing it back: finding out what broke, fixing it, and getting it ready to
return.

### 🔤 [ftfy](https://github.com/rspeer/python-ftfy) — mojibake repair

Three fixes proposed to the reference library for repairing mojibake, by
[Robyn Speer](https://github.com/rspeer):
[detecting and fixing KOI8-R](https://github.com/rspeer/python-ftfy/pull/234),
[Windows-1252 mojibake of U+2000 block symbols](https://github.com/rspeer/python-ftfy/pull/235),
and [a regex anchor that swallows the trailing newline in the CESU-8 codec](https://github.com/rspeer/python-ftfy/pull/237).

---

## 🛠️ What I work with

<div align="center">

**Languages**

<img src="https://img.shields.io/badge/R-276DC3?style=flat-square&logo=r&logoColor=white" />
<img src="https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white" />
<img src="https://img.shields.io/badge/SQL-4479A1?style=flat-square" />
<img src="https://img.shields.io/badge/Bash-4EAA25?style=flat-square&logo=gnubash&logoColor=white" />
<img src="https://img.shields.io/badge/GNU%20Octave-0790C0?style=flat-square&logo=octave&logoColor=white" />

**Environments and version control**

<img src="https://img.shields.io/badge/RStudio-75AADB?style=flat-square&logo=rstudioide&logoColor=white" />
<img src="https://img.shields.io/badge/VS%20Code-007ACC?style=flat-square&logoColor=white&logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMDAgMTAwIj48cGF0aCBmaWxsPSIjZmZmIiBkPSJNNzAuOTExOSA5OS4zMTcxQzcyLjQ4NjkgOTkuOTMwNyA3NC4yODI4IDk5Ljg5MTQgNzUuODcyNSA5OS4xMjY0TDk2LjQ2MDggODkuMjE5N0M5OC42MjQyIDg4LjE3ODcgMTAwIDg1Ljk4OTIgMTAwIDgzLjU4NzJWMTYuNDEzM0MxMDAgMTQuMDExMyA5OC42MjQzIDExLjgyMTggOTYuNDYwOSAxMC43ODA4TDc1Ljg3MjUgMC44NzM3NTZDNzMuNzg2MiAtMC4xMzAxMjkgNzEuMzQ0NiAwLjExNTc2IDY5LjUxMzUgMS40NDY5NUM2OS4yNTIgMS42MzcxMSA2OS4wMDI4IDEuODQ5NDMgNjguNzY5IDIuMDgzNDFMMjkuMzU1MSAzOC4wNDE1TDEyLjE4NzIgMjUuMDA5NkMxMC41ODkgMjMuNzk2NSA4LjM1MzYzIDIzLjg5NTkgNi44NjkzMyAyNS4yNDYxTDEuMzYzMDMgMzAuMjU0OUMtMC40NTI1NTIgMzEuOTA2NCAtMC40NTQ2MzMgMzQuNzYyNyAxLjM1ODUzIDM2LjQxN0wxNi4yNDcxIDUwLjAwMDFMMS4zNTg1MyA2My41ODMyQy0wLjQ1NDYzMyA2NS4yMzc0IC0wLjQ1MjU1MiA2OC4wOTM4IDEuMzYzMDMgNjkuNzQ1M0w2Ljg2OTMzIDc0Ljc1NDFDOC4zNTM2MyA3Ni4xMDQzIDEwLjU4OSA3Ni4yMDM3IDEyLjE4NzIgNzQuOTkwNUwyOS4zNTUxIDYxLjk1ODdMNjguNzY5IDk3LjkxNjdDNjkuMzkyNSA5OC41NDA2IDcwLjEyNDYgOTkuMDEwNCA3MC45MTE5IDk5LjMxNzFaTTc1LjAxNTIgMjcuMjk4OUw0NS4xMDkxIDUwLjAwMDFMNzUuMDE1MiA3Mi43MDEyVjI3LjI5ODlaIi8%2BPC9zdmc%2B" />
<img src="https://img.shields.io/badge/Jupyter-F37626?style=flat-square&logo=jupyter&logoColor=white" />
<img src="https://img.shields.io/badge/Colab-F9AB00?style=flat-square&logo=googlecolab&logoColor=white" />
<img src="https://img.shields.io/badge/Git-F05032?style=flat-square&logo=git&logoColor=white" />
<img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white" />
<img src="https://img.shields.io/badge/GitLab-FC6D26?style=flat-square&logo=gitlab&logoColor=white" />

**Data, models and visualisation**

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

**Databases**

<img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=flat-square&logo=postgresql&logoColor=white" />
<img src="https://img.shields.io/badge/SQLite-003B57?style=flat-square&logo=sqlite&logoColor=white" />
<img src="https://img.shields.io/badge/DBeaver-382923?style=flat-square&logo=dbeaver&logoColor=white" />

**Systems and publishing**

<img src="https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=docker&logoColor=white" />
<img src="https://img.shields.io/badge/Linux-FCC624?style=flat-square&logo=linux&logoColor=white" />
<img src="https://img.shields.io/badge/LaTeX-008080?style=flat-square&logo=latex&logoColor=white" />
<img src="https://img.shields.io/badge/WordPress-21759B?style=flat-square&logo=wordpress&logoColor=white" />

**Geographic information**

<img src="https://img.shields.io/badge/QGIS-589632?style=flat-square&logo=qgis&logoColor=white" />
<img src="https://img.shields.io/badge/gvSIG-4A7C2F?style=flat-square" />
<img src="https://img.shields.io/badge/GeoDa-2D6A4F?style=flat-square" />

</div>

---

## 🎓 Education

| | |
|---|---|
| **MSc in Data Science** *(ongoing)* | CPAP – FIng, Universidad de la República |
| **Postgraduate Specialist in Data Science** | CPAP – FIng, Universidad de la República |
| **BA in Education** | Universidad Católica del Uruguay |
| **GIS and Environmental Innovation** | Universidad Católica del Uruguay |
| **Technical degree in Leisure and Recreation Education** | Universidad Católica del Uruguay |

---

## ✍️ Publications, talks and awards

- **{DADverse}. Simplifying data processing for public policy aimed at vulnerable populations** — Lucas, S.; Detomasi, R. *LatinR 2023*.
- **La Siembra. El legado de Aulas Comunitarias: un aporte a la educación uruguaya** — co-author of ch. 1.3.2. OBSUR, 2020.
- **El aula en movimiento: aportes metodológicos desde la Educación No Formal** — *Enfoques, Revista de Educación No Formal*, Ministry of Education and Culture, v. 5, 2014.
- **Talleres en el liceo… ¿para qué?** — Lucas, S.; Verdún, N. Talk at the «Alicia Goyena» Chair (CES–ANEP), 2016.
- 🏆 **«Todo Suma» project** — creator and project lead. Winner of the *Concurso sobre Proyectos de Convivencia de los Centros Educativos*, Pelota al Medio a la Esperanza programme.

---

## 📊 GitHub

<div align="center">

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github-profile-summary-cards.vercel.app/api/cards/repos-per-language?username=sebollin&theme=github_dark" />
  <img height="170" src="https://github-profile-summary-cards.vercel.app/api/cards/repos-per-language?username=sebollin&theme=github_light" alt="Repositories per language" />
</picture>
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://github-profile-summary-cards.vercel.app/api/cards/most-commit-language?username=sebollin&theme=github_dark" />
  <img height="170" src="https://github-profile-summary-cards.vercel.app/api/cards/most-commit-language?username=sebollin&theme=github_light" alt="Most used language" />
</picture>

</div>

---

<div align="center">

**Want to work together?** — [LinkedIn](https://www.linkedin.com/in/sebalucas/) · [sebalucas@gmail.com](mailto:sebalucas@gmail.com)

<sub>Ciudad de la Costa, Canelones · Uruguay 🇺🇾</sub>

<img src="https://capsule-render.vercel.app/api?type=waving&section=footer&height=90&color=0:f2b705,30:4caf50,70:0e7c7b,100:0b2e4f" width="100%" alt="" />

</div>
