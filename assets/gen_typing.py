#!/usr/bin/env python3
"""Genera el SVG de tecleo que corrige como corrige una persona.

Entre dos frases consecutivas calcula el prefijo comun, borra solo hasta ahi y
teclea el resto: lo que cambia puede estar en el medio de la frase.
`readme-typing-svg` no puede hacerlo — borra la linea entera y la reescribe.

En gris queda lo que ya estaba y no cambio; en verde, lo que se acaba de
escribir. Cada frase puede pedir ritmo "normal" o "rapido".

La revelacion usa texto sobre un path cuya longitud se anima, no clip-path:
la app movil de GitHub ejecuta las animaciones SMIL pero ignora los
clip-path, asi que con recortes las ocho frases aparecian superpuestas. Un
textPath sobre un path corto simplemente no dibuja los glifos que no entran,
y el mismo guion de fotogramas sirve igual. Sin animacion se ve la primera
frase entera, porque el path de la capa 0 arranca con su largo completo.
"""
import sys

FS = 22                 # tamaño de fuente
ADV = FS * 0.6021       # avance real del monospace, medido en Chromium
X0 = 22                 # margen izquierdo
BASE = 34               # linea de base

COL_FIJO = "#5b7a99"    # legible en tema claro y en oscuro
COL_NUEVO = "#12a594"
COL_CARET = "#f2b705"

RITMO = {
    # teclear, borrar, sostener, respirar (ms). El sosten es corto a proposito:
    # apenas termina de escribir, arranca a borrar. "respirar" es la pausa
    # despues de borrar y antes de teclear: sin ella, borrar tres letras dura
    # 50 ms y no se ve.
    "normal": (48, 26, 620, 170),
    "rapido": (34, 42, 430, 210),
}


def prefijo_comun(a, b):
    n = 0
    for x, y in zip(a, b):
        if x != y:
            break
        n += 1
    return n


def svg(guion_frases, salida):
    frases = [f for f, _ in guion_frases]
    n = len(frases)

    # Guion de fotogramas: (t, texto_visible, indice_de_la_capa_que_lo_dibuja).
    # Al borrar manda la frase de la que se viene; al teclear, la de destino.
    # SMIL exige que keyTimes empiece en 0 y termine en 1: sin el fotograma
    # inicial en t=0 el navegador descarta la animacion entera y se ve la
    # pantalla congelada en el primer valor.
    guion = [(0, "", 0)]
    t = 0
    actual = ""
    for i in range(n):
        frase, ritmo = guion_frases[i]
        teclear, borrar, sosten, respirar = RITMO[ritmo]
        comun = prefijo_comun(actual, frase)
        for k in range(len(actual), comun, -1):
            t += borrar
            guion.append((t, actual[:k - 1], (i - 1) % n))
        if len(actual) > comun and comun < len(frase):
            t += respirar
            guion.append((t, frase[:comun], (i - 1) % n))
        for k in range(comun, len(frase)):
            t += teclear
            guion.append((t, frase[:k + 1], i))
        actual = frase
        t += sosten
        guion.append((t, frase, i))
    # El ciclo cierra borrando todo: el estado en t=total tiene que ser el
    # mismo que en t=0, o al repetirse la primera frase se teclea dos veces.
    borrar = RITMO[guion_frases[0][1]][1]  # el cierre borra al ritmo inicial
    for k in range(len(actual), 0, -1):
        t += borrar
        guion.append((t, actual[:k - 1], n - 1))
    total = t

    # Cada frase se dibuja una vez y se revela con un rectangulo de recorte.
    capas = [[] for _ in frases]
    caret = []
    for ts, texto, dueña in guion:
        k = round(ts / total, 6)
        w = len(texto) * ADV
        caret.append((k, X0 + w))
        for j in range(n):
            capas[j].append((k, w if j == dueña else 0.0))

    def comprimir(pares):
        salida = [pares[0]]
        for j in range(1, len(pares) - 1):
            if not (pares[j][1] == salida[-1][1] == pares[j + 1][1]):
                salida.append(pares[j])
        salida.append(pares[-1])
        return salida

    # respaldo sin animacion: se ve entera la primera frase
    def respaldo(i):
        return len(frases[0]) * ADV if i == 0 else 0.0

    partes = []
    for i, frase in enumerate(frases):
        comp = comprimir(capas[i])
        # textLength encaja el texto en el ancho medido, asi el path, el caret
        # y los glifos comparten la misma regla aunque la fuente del movil sea
        # mas ancha que la medida en Chromium. La holgura de abajo queda de
        # respaldo por si algun renderer ignora textLength: cuando la frase
        # esta completa el path puede sobrar (no queda glifo por filtrar y el
        # margen absorbe la diferencia; sin el, la app recortaba la ultima
        # letra). En tecleo y borrado el ancho sigue exacto: ahi el path si
        # decide que letra se ve.
        lleno = len(frase) * ADV

        def holgar(v, _lleno=lleno):
            return v + 2 * ADV if abs(v - _lleno) < 0.05 else v
        # Gris: el tronco que la frase comparte con su vecina mas parecida,
        # antes o despues. Verde: lo que se teclea o se va a reescribir. Mirar
        # solo hacia adelante dejaba el remate entero en verde y hacia atras
        # repintaba texto que en realidad se conservaba.
        fijo = max(prefijo_comun(frases[i - 1], frase),
                   prefijo_comun(frase, frases[(i + 1) % n]))
        fijo = frase.rfind(" ", 0, fijo) + 1 if fijo < len(frase) else fijo
        partes.append(
            f'  <path id="p{i}" d="m{X0},{BASE} h{holgar(respaldo(i)):.1f}">\n'
            f'    <animate attributeName="d" dur="{total}ms" '
            f'repeatCount="indefinite"\n'
            f'      values="{";".join(f"m{X0},{BASE} h{holgar(v):.1f}" for _, v in comp)}"\n'
            f'      keyTimes="{";".join(f"{k:g}" for k, _ in comp)}" />'
            f'</path>')
        partes.append(
            f'  <text fill="{COL_NUEVO}" textLength="{lleno:.1f}" '
            f'lengthAdjust="spacingAndGlyphs"\n'
            f'    font-family="ui-monospace,SFMono-Regular,Menlo,Consolas,monospace"\n'
            f'    font-size="{FS}" font-weight="600"><textPath xlink:href="#p{i}">'
            + (f'<tspan fill="{COL_FIJO}" font-weight="500">{frase[:fijo]}</tspan>'
               if fijo else "")
            + f'{frase[fijo:]}</textPath></text>')

    comp_caret = comprimir(caret)
    ancho = int(X0 * 2 + max(len(f) for f in frases) * ADV + 16)
    cuerpo = "\n".join(partes)
    doc = f'''<svg xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink" width="{ancho}" height="52"
  viewBox="0 0 {ancho} 52" role="img" aria-label="{' · '.join(frases)}">
  <title>{' · '.join(frases)}</title>
{cuerpo}
  <rect y="{BASE - FS + 3}" width="2.5" height="{FS + 2}" fill="{COL_CARET}"
    x="{X0 + len(frases[0]) * ADV:.1f}">
    <animate attributeName="x" dur="{total}ms" repeatCount="indefinite"
      values="{";".join(f"{v:.1f}" for _, v in comp_caret)}"
      keyTimes="{";".join(f"{k:g}" for k, _ in comp_caret)}" />
    <animate attributeName="opacity" dur="1s" repeatCount="indefinite"
      values="1;1;0;0;1" keyTimes="0;0.45;0.5;0.95;1" />
  </rect>
</svg>
'''
    open(salida, "w").write(doc)
    print(f"  {salida}  {ancho}x52 · ciclo {total/1000:.1f} s · {n} frases")


svg([
    ("Modelado predictivo", "normal"),
    ("Datos para la gestión universitaria, en Shiny", "normal"),
    ("Datos para la orientación educativa", "normal"),
    ("Datos para la política pública, en R", "normal"),
    ("Datos para la política pública, en Python", "rapido"),
    ("Datos para la política pública, en SQL", "rapido"),
    ("Datos para la política pública, en lo que haga falta", "rapido"),
    ("Datos para lo que haga falta, en lo que haga falta", "normal"),
], sys.argv[1] if len(sys.argv) > 1 else "typing.svg")

svg([
    ("Predictive modelling", "normal"),
    ("Data for university management, in Shiny", "normal"),
    ("Data for educational guidance", "normal"),
    ("Data for public policy, in R", "normal"),
    ("Data for public policy, in Python", "rapido"),
    ("Data for public policy, in SQL", "rapido"),
    ("Data for public policy, in whatever it takes", "rapido"),
    ("Data for whatever it takes, in whatever it takes", "normal"),
], sys.argv[2] if len(sys.argv) > 2 else "typing.en.svg")
