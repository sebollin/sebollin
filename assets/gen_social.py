#!/usr/bin/env python3
"""Genera las imagenes de vista previa social, 1280x640, con Chromium.

GitHub las muestra recortadas en muchos tamaños distintos, asi que todo lo que
importa vive en el centro y el texto es grande a proposito.
"""
import base64
import os
import pathlib
import sys
from playwright.sync_api import sync_playwright

AQUI = pathlib.Path(__file__).resolve().parent
SALIDA = pathlib.Path(sys.argv[1]) if len(sys.argv) > 1 else AQUI / "social"

# Los hexágonos viven en sus paquetes. Se pueden apuntar a otro lado con
# LUPA_LOGO y BIGBANG_LOGO si los repositorios cambian de sitio.
BASE_R = pathlib.Path(os.environ.get(
    "REPOS_R", "/home/user/Proyectos/Analista de Datos - DAD/R"))
LUPA = os.environ.get("LUPA_LOGO",
                      BASE_R / "calidad-de-datos/lupa/man/figures/lupa.png")
BIGBANG = os.environ.get("BIGBANG_LOGO", BASE_R / "bigbang/man/figures/logo.png")


def incrustar(ruta):
    ruta = pathlib.Path(ruta)
    if not ruta.exists():
        raise SystemExit(
            f"No encuentro el hexágono en {ruta}.\n"
            "Apuntá REPOS_R al directorio que contiene los paquetes, o "
            "LUPA_LOGO / BIGBANG_LOGO a cada archivo."
        )
    return "data:image/png;base64," + base64.b64encode(ruta.read_bytes()).decode()


BASE = """
<meta charset="utf-8">
<style>
  * { margin:0; padding:0; box-sizing:border-box; }
  body { width:1280px; height:640px; overflow:hidden;
         font-family: "DejaVu Sans", "Liberation Sans", system-ui, sans-serif; }
  .lienzo { width:1280px; height:640px; display:flex; align-items:center;
            gap:64px; padding:0 88px; position:relative; }
  .hex { flex:0 0 auto; filter: drop-shadow(0 18px 40px rgba(0,0,0,.45)); }
  .texto { display:flex; flex-direction:column; gap:18px; }
  h1 { font-size:104px; font-weight:800; letter-spacing:-3px; line-height:1; }
  .bajada { font-size:31px; font-weight:400; line-height:1.35; max-width:660px; }
  .pie { display:flex; gap:14px; margin-top:14px; flex-wrap:wrap; }
  .chip { font-size:20px; font-weight:600; padding:9px 18px; border-radius:999px;
          letter-spacing:.4px; }
  .franja { position:absolute; left:0; right:0; bottom:0; height:12px; }
</style>
"""

PAGINAS = {
"lupa-social.png": BASE + f"""
<div class="lienzo" style="background:
     radial-gradient(1100px 620px at 12% 22%, #143b5e 0%, transparent 62%),
     linear-gradient(118deg,#0b2e4f 0%,#0d4a5c 46%,#12655c 78%,#1a6f4a 100%);">
  <img class="hex" src="{incrustar(LUPA)}" width="286" alt="">
  <div class="texto">
    <h1 style="color:#fff">lupa</h1>
    <div class="bajada" style="color:#bfe3dd">
      Perfilado, calidad de datos y duplicados a escala, en R.<br>
      <b style="color:#fff">Auditable</b>: declara alcance, evidencia e incertidumbre.
    </div>
    <div class="pie">
      <span class="chip" style="background:#0e7c7b;color:#fff">R</span>
      <span class="chip" style="background:rgba(255,255,255,.13);color:#cfeae5">calidad de datos</span>
      <span class="chip" style="background:rgba(255,255,255,.13);color:#cfeae5">duplicados</span>
      <span class="chip" style="background:rgba(255,255,255,.13);color:#cfeae5">codificación</span>
    </div>
  </div>
  <div class="franja" style="background:linear-gradient(90deg,#0b2e4f,#0e7c7b 38%,#4caf50 72%,#f2b705)"></div>
</div>
""",

"bigbang-social.png": BASE + f"""
<div class="lienzo" style="background:
     radial-gradient(1000px 600px at 14% 26%, #1e3a52 0%, transparent 60%),
     linear-gradient(122deg,#12253a 0%,#16394a 52%,#12564f 100%);">
  <img class="hex" src="{incrustar(BIGBANG)}" width="286" alt="">
  <div class="texto">
    <h1 style="color:#fff">bigbang</h1>
    <div class="bajada" style="color:#b9dcd6">
      Metapaquetes estilo <i>tidyverse</i> a partir de paquetes locales.<br>
      <b style="color:#fff">Resuelve en qué orden instalar</b> y fija un conjunto
      de versiones que conviven.
    </div>
    <div class="pie">
      <span class="chip" style="background:#0e9b8e;color:#fff">CRAN</span>
      <span class="chip" style="background:rgba(255,255,255,.13);color:#cfe9e4">dependencias</span>
      <span class="chip" style="background:rgba(255,255,255,.13);color:#cfe9e4">versiones compatibles</span>
      <span class="chip" style="background:rgba(255,255,255,.13);color:#cfe9e4">sin internet</span>
    </div>
  </div>
  <div class="franja" style="background:linear-gradient(90deg,#12253a,#0e9b8e 46%,#7fb069)"></div>
</div>
""",

"sebollin-social.png": BASE + f"""
<div class="lienzo" style="background:
     radial-gradient(1200px 640px at 78% 26%, #14415f 0%, transparent 64%),
     linear-gradient(126deg,#0b2e4f 0%,#0e5a5e 55%,#1a6f4a 100%); padding:0 92px;">
  <div class="texto" style="gap:20px">
    <h1 id="nombre" style="color:#fff;font-size:76px">Sebastián Lucas</h1>
    <div class="bajada" style="color:#c4e6e0;max-width:640px">
      Educador y científico de datos, en Uruguay.<br>
      Herramientas <b style="color:#fff">auditables</b> en R para datos de política pública.
    </div>
    <div class="pie">
      <span class="chip" style="background:#0e7c7b;color:#fff">R</span>
      <span class="chip" style="background:rgba(255,255,255,.13);color:#d2ece7">Python</span>
      <span class="chip" style="background:rgba(255,255,255,.13);color:#d2ece7">Shiny</span>
      <span class="chip" style="background:rgba(255,255,255,.13);color:#d2ece7">SIG</span>
      <span class="chip" style="background:rgba(255,255,255,.13);color:#d2ece7">🇺🇾</span>
    </div>
  </div>
  <div id="hexes" style="position:absolute;right:64px;top:50%;transform:translateY(-50%);
              display:flex;gap:20px;align-items:center;">
    <img src="{incrustar(LUPA)}" width="164"
         style="filter:drop-shadow(0 16px 34px rgba(0,0,0,.5))">
    <img src="{incrustar(BIGBANG)}" width="164"
         style="filter:drop-shadow(0 16px 34px rgba(0,0,0,.5))">
  </div>
  <div class="franja" style="background:linear-gradient(90deg,#0b2e4f,#0e7c7b 34%,#4caf50 68%,#f2b705)"></div>
</div>
""",
}

with sync_playwright() as p:
    nav = p.chromium.launch()
    pag = nav.new_page(viewport={"width": 1280, "height": 640}, device_scale_factor=1)
    for nombre, html in PAGINAS.items():
        pag.set_content(html)
        pag.wait_for_timeout(350)
        # El texto y los hexagonos no se pueden pisar: se comprueba, no se mira.
        choques = pag.evaluate("""() => {
          const t = [...document.querySelectorAll('h1,.bajada,.pie')];
          const h = [...document.querySelectorAll('#hexes, img.hex')];
          const malos = [];
          for (const a of t) for (const b of h) {
            const A = a.getBoundingClientRect(), B = b.getBoundingClientRect();
            if (A.right > B.left && B.right > A.left &&
                A.bottom > B.top && B.bottom > A.top)
              malos.push(a.tagName + '.' + a.className + ' vs ' + (b.id || 'hex'));
          }
          return malos;
        }""")
        margen = pag.evaluate("""() => {
          const t = [...document.querySelectorAll('h1,.bajada,.pie')]
                      .map(e => e.getBoundingClientRect().right);
          const h = [...document.querySelectorAll('#hexes')]
                      .map(e => e.getBoundingClientRect().left);
          return h.length ? Math.round(Math.min(...h) - Math.max(...t)) : null;
        }""")
        ruta = SALIDA / nombre
        pag.screenshot(path=str(ruta))
        aviso = "  SE PISAN: " + "; ".join(choques) if choques else ""
        holgura = f" · holgura texto-hexágonos {margen} px" if margen is not None else ""
        print(f"  {nombre}  {ruta.stat().st_size // 1024} KB{holgura}{aviso}")
    nav.close()
