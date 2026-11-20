# Cifras de los badges del perfil

Esta rama sólo guarda las cifras de los badges del perfil: JSON para los badges
«endpoint» de shields.io, y SVG para los que pueden desaparecer (la posición
entre los debuts de CRAN). Los escribe el workflow `badges` de la rama `main`,
cada vez que cranlogs publica un día nuevo, con `.github/scripts/badges.R`,
donde está explicado el método. No se edita a mano.
