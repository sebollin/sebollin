# Piezas generadas

Todo lo visual de este perfil se genera con estos dos guiones, para que cambiar
un texto o un color no obligue a rehacer nada a mano. Los dos usan Chromium a
través de [Playwright](https://playwright.dev/python/).

```sh
pip install playwright && playwright install chromium
```

## `gen_typing.py` — el tecleo del encabezado

Produce `typing.svg` y `typing.en.svg`: la línea que se escribe y se corrige sola
arriba del README.

```sh
python3 gen_typing.py            # regenera los dos, acá mismo
```

A diferencia de los generadores en línea, **no borra la frase entera entre una y
otra**: calcula el prefijo común con la siguiente, borra sólo hasta ahí y teclea
la diferencia, que puede estar en el medio. En gris queda lo que la frase
comparte con su vecina más parecida; en verde, lo que cambia.

Las frases y su ritmo están al final del archivo:

```python
svg([
    ("Modelado predictivo", "normal"),
    ("Datos para la política pública, en Python", "rapido"),
    ...
])
```

`normal` y `rapido` salen del diccionario `RITMO`, que fija cuánto tarda en
teclear, borrar y sostener cada frase. Los colores están en `COL_FIJO`,
`COL_NUEVO` y `COL_CARET`, y son los del hexágono de `lupa`.

**Verificalo después de tocarlo** con `verificar_animacion.py`: carga el SVG como
`<img>` —igual que lo sirve GitHub—, saca capturas en varios instantes del ciclo
y avisa si la imagen quedó congelada.

```sh
python3 verificar_animacion.py typing.svg
```

Esa comprobación existe por un error real: una versión anterior tenía el primer
`keyTimes` en `0.0029` en vez de `0`, SMIL exige que empiece en 0, y el navegador
descartaba la animación entera y mostraba una sola letra.

## `gen_social.py` — las vistas previas sociales

Produce las tres imágenes de `social/`, a 1280 × 640, que son las que aparecen
cuando alguien comparte el enlace de un repositorio.

```sh
python3 gen_social.py            # deja los PNG en ./social
python3 gen_social.py /otra/ruta # o donde quieras
```

Los hexágonos se leen de los repositorios de cada paquete. Si están en otro lado:

```sh
REPOS_R=/ruta/a/mis/paquetes python3 gen_social.py
LUPA_LOGO=/ruta/lupa.png BIGBANG_LOGO=/ruta/logo.png python3 gen_social.py
```

Falla con un mensaje claro si no los encuentra, en vez de generar una imagen
incompleta.

Cada imagen es un bloque HTML en el diccionario `PAGINAS`: fondo, hexágono,
título, bajada y etiquetas. Cambiar un texto es editar esa cadena. El guion
**comprueba que el texto y los hexágonos no se pisen** y reporta la holgura entre
ambos; eso también sale de un error real, cuando el hexágono de `lupa` quedó
tocando el nombre.

### Dónde se suben

No se sirven desde el repositorio: se cargan a mano, una vez por repositorio, en
**Settings → General → Social preview → Edit → Upload an image**.

| imagen | repositorio |
|---|---|
| `social/lupa-social.png` | `sebollin/lupa` |
| `social/bigbang-social.png` | `sebollin/bigbang` |
| `social/sebollin-social.png` | `sebollin/sebollin` |

## La paleta

La misma en todo, tomada del hexágono de `lupa`:

```
#0B2E4F  navy      #0E7C7B  teal      #4CAF50  verde      #F2B705  ámbar
```
