#!/usr/bin/env python3
"""Comprueba que el SVG anima cuando se lo carga como <img>, que es como lo
sirve GitHub. Saca capturas en distintos instantes y las compara."""
import hashlib
import pathlib
import sys
from playwright.sync_api import sync_playwright

AQUI = pathlib.Path(__file__).resolve().parent
SVG = sys.argv[1] if len(sys.argv) > 1 else "typing.svg"
INSTANTES = [0.4, 1.6, 3.0, 5.0, 7.5, 10.0, 13.0]

html = AQUI / "_prueba.html"
html.write_text(
    '<!doctype html><meta charset="utf-8">'
    '<body style="margin:0;background:#fff">'
    f'<img id="t" src="{SVG}" width="746">'
)

with sync_playwright() as p:
    nav = p.chromium.launch()
    pag = nav.new_page(viewport={"width": 800, "height": 70})
    pag.goto(html.as_uri())
    pag.wait_for_timeout(300)
    firmas = []
    previo = 0.0
    for ts in INSTANTES:
        pag.wait_for_timeout(int((ts - previo) * 1000))
        previo = ts
        ruta = AQUI / f"_cap_{ts:.1f}.png"
        pag.locator("#t").screenshot(path=str(ruta))
        h = hashlib.sha1(ruta.read_bytes()).hexdigest()[:10]
        firmas.append((ts, h))
        print(f"  t={ts:5.1f}s  {h}  {ruta.name}")
    nav.close()

html.unlink()
distintas = len({h for _, h in firmas})
print(f"\n  fotogramas distintos: {distintas} de {len(firmas)}")
print("  ANIMA" if distintas > 2 else "  NO ANIMA: la imagen está congelada")
