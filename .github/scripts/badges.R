# Cifras de los badges de paquetes del perfil, en español y en inglés.
#
# Lo ejecuta todos los días .github/workflows/badges.yml. Escribe un JSON por
# badge, con el formato «endpoint» de shields.io, en la carpeta que recibe como
# argumento (en el workflow, la rama `badges`):
#
#   <paquete>-total.<idioma>.json      descargas desde que está en CRAN
#   <paquete>-mes.<idioma>.json        descargas de los últimos 30 días
#   <paquete>-posicion.<idioma>.json   posición entre los debuts de su año
#
# Descargas: las de cranlogs, que cuenta sólo el espejo de CRAN de Posit, el
# único que publica descargas por paquete. Hasta 9999 se muestra la cifra
# completa, y desde ahí abreviada, como el badge de cranlogs: «47 mil» / «47K».
#
# Posición, sólo para los paquetes propios:
#   1. El debut es la fecha de la primera versión en CRAN: la más antigua entre
#      el archivo de versiones viejas (src/contrib/Meta/archive.rds) y la
#      publicación de la versión actual.
#   2. La cohorte son los paquetes que están hoy en CRAN y debutaron el mismo
#      año calendario, con al menos 30 días en CRAN al cierre de la ventana.
#   3. Se comparan las descargas de los últimos 30 días, la misma cifra del
#      badge de descargas del mes.
#   4. El puesto es 1 + la cantidad de paquetes de la cohorte con más
#      descargas, y el porcentaje se redondea hacia arriba (top 8,5 % → 9 %).
#   Un paquete con menos de 30 días en CRAN queda afuera hasta cumplirlos.

con_descargas <- c("lupa", "bigbang", "geouy")
con_posicion <- c("bigbang", "lupa")
cran <- "https://cloud.r-project.org"
salida <- commandArgs(TRUE)[1]
if (is.na(salida)) salida <- "badges"
dir.create(salida, recursive = TRUE, showWarnings = FALSE)

azul <- "007ec6"

## Lectura ---------------------------------------------------------------

leer_json <- function(u) {
  for (intento in 1:5) {
    r <- tryCatch(jsonlite::fromJSON(u), error = function(e) NULL)
    if (!is.null(r)) return(r)
    Sys.sleep(5 * intento)
  }
  stop("no respondió: ", u)
}

## Descargas de varios paquetes en un período de cranlogs, en lotes de 100.
descargas <- function(pkgs, periodo) {
  lotes <- split(pkgs, ceiling(seq_along(pkgs) / 100))
  do.call(rbind, lapply(lotes, function(b) {
    u <- sprintf("https://cranlogs.r-pkg.org/downloads/total/%s/%s",
                 periodo, paste(b, collapse = ","))
    leer_json(u)[, c("package", "downloads", "end")]
  }))
}

## Escritura -------------------------------------------------------------

escribir <- function(archivo, etiqueta, mensaje, color) {
  jsonlite::write_json(
    list(schemaVersion = 1, label = etiqueta, message = mensaje, color = color),
    file.path(salida, archivo), auto_unbox = TRUE, pretty = TRUE)
}

abreviar <- function(n, idioma) {
  if (n < 1e4) return(sprintf("%.0f", n))
  if (n < 999500) {
    return(sprintf(if (idioma == "es") "%.0f mil" else "%.0fK", n / 1e3))
  }
  m <- round(n / 1e6, 1)
  if (idioma == "es") paste(format(m, decimal.mark = ","), "M") else paste0(m, "M")
}

textos <- list(
  es = list(descargas = "descargas", por_mes = "/mes",
            debuts = function(a) sprintf("debuts de %s en CRAN", a),
            top = function(p) sprintf("top %d %% en descargas del mes", p)),
  en = list(descargas = "downloads", por_mes = "/month",
            debuts = function(a) sprintf("%s CRAN debuts", a),
            top = function(p) sprintf("top %d%% in monthly downloads", p))
)

## Descargas totales y del mes -------------------------------------------

total <- descargas(con_descargas, paste0("2012-10-01:", Sys.Date()))
mes <- descargas(con_descargas, "last-month")
for (pk in con_descargas) {
  n_total <- total$downloads[total$package == pk]
  n_mes <- mes$downloads[mes$package == pk]
  message(sprintf("%s: %d descargas en total, %d en el último mes", pk, n_total, n_mes))
  for (idioma in names(textos)) {
    tx <- textos[[idioma]]
    escribir(sprintf("%s-total.%s.json", pk, idioma), tx$descargas,
             abreviar(n_total, idioma), azul)
    escribir(sprintf("%s-mes.%s.json", pk, idioma), tx$descargas,
             paste0(abreviar(n_mes, idioma), tx$por_mes), azul)
  }
}

## Posición entre los debuts del mismo año -------------------------------

db <- tools::CRAN_package_db()
db <- db[!duplicated(db$Package), ]
f <- tempfile(fileext = ".rds")
download.file(paste0(cran, "/src/contrib/Meta/archive.rds"), f, quiet = TRUE, mode = "wb")
archivo <- readRDS(f)

primera_archivada <- vapply(archivo, function(x) as.numeric(min(x$mtime)), 0)
primera_archivada <- as.Date(as.POSIXct(primera_archivada, origin = "1970-01-01"))
debut <- setNames(as.Date(substr(db$Published, 1, 10)), db$Package)
con_archivo <- intersect(names(primera_archivada), names(debut))
debut[con_archivo] <- pmin(debut[con_archivo], primera_archivada[con_archivo], na.rm = TRUE)

for (pk in con_posicion) {
  if (is.na(debut[pk])) next
  anio <- format(debut[pk], "%Y")
  d <- descargas(names(debut)[which(format(debut, "%Y") == anio)], "last-month")
  cierre <- as.Date(max(d$end))
  cohorte <- d[debut[d$package] <= cierre - 29, ]
  if (!(pk %in% cohorte$package)) {
    message(pk, ": todavía no cumple 30 días en CRAN")
    next
  }
  propias <- cohorte$downloads[cohorte$package == pk]
  puesto <- 1 + sum(cohorte$downloads > propias)
  pct <- ceiling(100 * puesto / nrow(cohorte))
  message(sprintf("%s: puesto %d de %d debuts de %s (top %d %%), %d descargas al %s",
                  pk, puesto, nrow(cohorte), anio, pct, propias, cierre))
  color <- if (pct <= 10) "2e7d32" else if (pct <= 25) "198CE7" else "6e7781"
  for (idioma in names(textos)) {
    tx <- textos[[idioma]]
    escribir(sprintf("%s-posicion.%s.json", pk, idioma), tx$debuts(anio), tx$top(pct), color)
  }
}
