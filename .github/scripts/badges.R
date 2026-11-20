# Cifras de los badges de paquetes del perfil, en español y en inglés.
#
# Lo ejecuta .github/workflows/badges.yml cada vez que cranlogs publica un día
# nuevo. Escribe en la carpeta que recibe como argumento (en el workflow, la
# rama `badges`) un JSON por badge, con el formato «endpoint» de shields.io, o
# un SVG cuando el badge tiene que poder desaparecer:
#
#   <paquete>-descargas.<idioma>.json  descargas en total y de los últimos 30 días
#                                      (éstas, sólo si está en CRAN)
#   <paquete>-posicion.<idioma>.svg    posición entre los debuts de su año
#   <paquete>-chequeos.<idioma>.json   resultado de los chequeos de CRAN
#   ultimo-dia.txt                     último día que publicó cranlogs
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
#      año calendario.
#   3. Con 30 días o más en CRAN, se comparan las descargas de los últimos 30
#      días (la cifra del badge de descargas del mes) entre los de la cohorte
#      que también tienen 30 días o más.
#      Con menos de 30 días, se compara el arranque: las descargas de los
#      primeros N días de cada paquete, cada uno desde su propio debut, entre
#      los de la cohorte que ya tienen N días. Así un paquete nuevo no compite
#      con meses de descargas ajenas. Al día 30 las dos cuentas coinciden.
#   4. El puesto es 1 + la cantidad de paquetes de la cohorte con más
#      descargas, y el porcentaje se redondea hacia arriba (top 8,5 % → 9 %).
#   5. El badge se ve sólo en el top 25 % (verde hasta el 10 %, azul hasta el
#      25 %). Fuera de eso, o con menos de 7 días en CRAN, el SVG queda vacío y
#      el badge no aparece en el perfil.
#
# Chequeos de CRAN: los que CRAN corre en sus propias máquinas (13 plataformas),
# de tools::CRAN_check_results(). El badge muestra el peor resultado.

con_descargas <- c("lupa", "bigbang", "geouy")
con_posicion <- c("bigbang", "lupa")
en_cran <- c("bigbang", "lupa")
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
  es = list(descargas = "descargas", en_total = "en total", por_mes = "/mes",
            chequeos = "chequeos de CRAN",
            todo_ok = function(n) sprintf("OK en %d plataformas", n),
            peor = function(s, k, n) sprintf("%s en %d de %d", s, k, n),
            debuts = function(a) sprintf("debuts de %s en CRAN", a),
            top = function(p) sprintf("top %d %% en descargas del mes", p),
            top_arranque = function(p, n) {
              sprintf("top %d %% en descargas de sus primeros %d días", p, n)
            }),
  en = list(descargas = "downloads", en_total = "total", por_mes = "/month",
            chequeos = "CRAN checks",
            todo_ok = function(n) sprintf("OK on %d platforms", n),
            peor = function(s, k, n) sprintf("%s on %d of %d", s, k, n),
            debuts = function(a) sprintf("%s CRAN debuts", a),
            top = function(p) sprintf("top %d%% in monthly downloads", p),
            top_arranque = function(p, n) {
              sprintf("top %d%% in downloads in its first %d days", p, n)
            })
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
    # Las del mes, sólo si está en CRAN: archivado, las que quedan son de bots.
    mensaje <- paste(abreviar(n_total, idioma), tx$en_total)
    if (pk %in% en_cran) {
      mensaje <- paste0(mensaje, " · ", abreviar(n_mes, idioma), tx$por_mes)
    }
    escribir(sprintf("%s-descargas.%s.json", pk, idioma), tx$descargas, mensaje, azul)
  }
}
writeLines(as.character(max(as.Date(mes$end))), file.path(salida, "ultimo-dia.txt"))

## Chequeos de CRAN --------------------------------------------------------

niveles <- c("OK", "NOTE", "WARNING", "ERROR", "FAILURE")
colores <- c(OK = "4c1", NOTE = "dfb317", WARNING = "fe7d37", ERROR = "e05d44",
             FAILURE = "e05d44")
chequeos <- tools::CRAN_check_results()
for (pk in en_cran) {
  estado <- factor(chequeos$Status[chequeos$Package == pk], levels = niveles)
  n <- length(estado)
  if (n == 0) next
  peor <- niveles[max(as.integer(estado))]
  k <- sum(estado == peor)
  message(sprintf("%s: %s en %d de %d plataformas de CRAN", pk, peor, k, n))
  for (idioma in names(textos)) {
    tx <- textos[[idioma]]
    escribir(sprintf("%s-chequeos.%s.json", pk, idioma), tx$chequeos,
             if (peor == "OK") tx$todo_ok(n) else tx$peor(peor, k, n),
             colores[[peor]])
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

umbral <- 25    # el badge se ve sólo en el top 25 %
dias_min <- 7   # antes de una semana en CRAN, las cifras son puro ruido
cierre <- as.Date(max(mes$end))

## El badge como SVG de shields.io, guardado en la rama, para poder vaciarlo.
svg_badge <- function(archivo, etiqueta, mensaje, color) {
  u <- sprintf("https://img.shields.io/static/v1?label=%s&message=%s&color=%s",
               URLencode(etiqueta, TRUE), URLencode(mensaje, TRUE), color)
  svg <- NULL
  for (intento in 1:5) {
    svg <- tryCatch(readLines(u, warn = FALSE, encoding = "UTF-8"),
                    error = function(e) NULL)
    if (length(svg) && grepl("<svg", svg[1], fixed = TRUE)) break
    svg <- NULL
    Sys.sleep(5 * intento)
  }
  if (is.null(svg)) stop("shields.io no respondió: ", u)
  writeLines(svg, file.path(salida, archivo), useBytes = TRUE)
}
svg_invisible <- function(archivo) {
  writeLines('<svg xmlns="http://www.w3.org/2000/svg" width="0" height="0"/>',
             file.path(salida, archivo))
}

for (pk in con_posicion) {
  archivos <- sprintf("%s-posicion.%s.svg", pk, names(textos))
  dias <- as.integer(cierre - debut[pk]) + 1
  if (is.na(dias) || dias < dias_min) {
    message(pk, ": menos de ", dias_min, " días en CRAN, badge invisible")
    for (a in archivos) svg_invisible(a)
    next
  }
  anio <- format(debut[pk], "%Y")
  del_anio <- debut[which(format(debut, "%Y") == anio)]
  if (dias >= 30) {
    d <- descargas(names(del_anio), "last-month")
    cohorte <- d[del_anio[d$package] <= cierre - 29, ]
    que <- "en el último mes"
  } else {
    ya_tienen <- del_anio[del_anio <= cierre - dias + 1]
    por_debut <- split(names(ya_tienen), format(ya_tienen))
    cohorte <- do.call(rbind, lapply(names(por_debut), function(f) {
      descargas(por_debut[[f]], sprintf("%s:%s", f, as.Date(f) + dias - 1))
    }))
    que <- sprintf("en sus primeros %d días", dias)
  }
  propias <- cohorte$downloads[cohorte$package == pk]
  puesto <- 1 + sum(cohorte$downloads > propias)
  pct <- ceiling(100 * puesto / nrow(cohorte))
  message(sprintf("%s: puesto %d de %d debuts de %s (top %d %%), %d descargas %s, al %s",
                  pk, puesto, nrow(cohorte), anio, pct, propias, que, cierre))
  for (i in seq_along(textos)) {
    tx <- textos[[i]]
    if (pct > umbral) {
      svg_invisible(archivos[i])
      next
    }
    mensaje <- if (dias >= 30) tx$top(pct) else tx$top_arranque(pct, dias)
    svg_badge(archivos[i], tx$debuts(anio), mensaje,
              if (pct <= 10) "2e7d32" else "198CE7")
  }
}
