# Posición de un paquete entre los que debutaron en CRAN el mismo año.
#
# Para cada paquete de `paquetes`:
#   1. El debut es la fecha de su primera versión en CRAN: la más antigua entre
#      el archivo de versiones viejas (src/contrib/Meta/archive.rds) y la
#      publicación de la versión actual.
#   2. La cohorte son los paquetes que están hoy en CRAN y debutaron el mismo
#      año calendario, con al menos 30 días en CRAN al cierre de la ventana.
#   3. Se comparan las descargas de los últimos 30 días que publica cranlogs,
#      la misma cifra del badge «downloads/month». Cuenta sólo el espejo de
#      CRAN de Posit, que es el único que publica descargas por paquete.
#   4. El puesto es 1 + la cantidad de paquetes de la cohorte con más
#      descargas, y el porcentaje se redondea hacia arriba (top 8,5 % → 9 %).
#
# Escribe assets/badges/<paquete>.<idioma>.json con el formato de los badges
# «endpoint» de shields.io. Un paquete que todavía no cumple 30 días queda
# afuera hasta que los cumpla.

paquetes <- c("bigbang", "lupa")
cran <- "https://cloud.r-project.org"
salida <- "assets/badges"

leer_rds <- function(url) {
  f <- tempfile(fileext = ".rds")
  download.file(url, f, quiet = TRUE, mode = "wb")
  readRDS(f)
}

db <- tools::CRAN_package_db()
db <- db[!duplicated(db$Package), ]
archivo <- leer_rds(paste0(cran, "/src/contrib/Meta/archive.rds"))

primera_archivada <- vapply(archivo, function(x) as.numeric(min(x$mtime)), 0)
primera_archivada <- as.Date(as.POSIXct(primera_archivada, origin = "1970-01-01"))
publicada <- setNames(as.Date(substr(db$Published, 1, 10)), db$Package)
debut <- publicada
con_archivo <- intersect(names(primera_archivada), names(debut))
debut[con_archivo] <- pmin(debut[con_archivo], primera_archivada[con_archivo], na.rm = TRUE)

descargas_30 <- function(pkgs) {
  lotes <- split(pkgs, ceiling(seq_along(pkgs) / 100))
  partes <- lapply(lotes, function(b) {
    u <- paste0("https://cranlogs.r-pkg.org/downloads/total/last-month/",
                paste(b, collapse = ","))
    for (intento in 1:5) {
      r <- tryCatch(jsonlite::fromJSON(u), error = function(e) NULL)
      if (!is.null(r)) return(r[, c("package", "downloads", "end")])
      Sys.sleep(5 * intento)
    }
    stop("cranlogs no respondió para un lote")
  })
  do.call(rbind, partes)
}

textos <- list(
  es = list(etiqueta = function(a) sprintf("debuts de %s en CRAN", a),
            mensaje = function(p) sprintf("top %d %% en descargas del mes", p)),
  en = list(etiqueta = function(a) sprintf("%s CRAN debuts", a),
            mensaje = function(p) sprintf("top %d%% in monthly downloads", p))
)

dir.create(salida, recursive = TRUE, showWarnings = FALSE)
for (pk in paquetes) {
  if (is.na(debut[pk])) next
  anio <- format(debut[pk], "%Y")
  del_anio <- names(debut)[which(format(debut, "%Y") == anio)]
  d <- descargas_30(del_anio)
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
    jsonlite::write_json(
      list(schemaVersion = 1, label = tx$etiqueta(anio), message = tx$mensaje(pct),
           color = color),
      file.path(salida, sprintf("%s.%s.json", pk, idioma)),
      auto_unbox = TRUE, pretty = TRUE)
  }
}
