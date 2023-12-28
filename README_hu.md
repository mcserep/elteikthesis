# ELTE IK Szakdolgozat és Diplomamunka sablon

A [elteikthesis_hu.tex](elteikthesis_hu.tex) és a belőle előálló [elteikthesis_hu.pdf](elteikhesis_hu.pdf) szolgál kiindulási példaként.
A sablon alkalmazza a szakdolgozatra / diplomamunkára vonatkozó formai előírásokat, valamint elkészíti a megadott metaadatok alapján a címlapot. A példa dokumentum tartalmi fejezetei a BSc szakdolgozat tipikus felépítését tükrözik.
A formai megkötések az ELTE Informatikai Kar szabályzatában rögzítetteknek felelnek meg, de általánosan (a megfelelő módosításokkal) alkalmazható más egyetemek dolgozataihoz is.

A sablon tartalmazza az egy és két oldalas nyomtatáshoz szükséges beállításokat is (ld. `twoside` paraméter), alapértelmezetten a javasolt egy oldalas nyomtatásra konfigurált. (Érdemes figyelembe venni, hogy 20-nál kevesebb lapszám kemény kötésben furcsán mutat, továbbá az ábrák könnyen átütnek az általános 80g/m<sup>2</sup> fénymásolópapíron).
A sablon magyar és angol nyelvű dokumentumok elkészítését is támogatja (ld. `\documentlang` parancs).

## Fordítás

A fordításhoz tetszőleges fejlesztő környezet is használható (pl. [TexStudio](https://www.texstudio.org/)), ugyanezen utasítások kiadásával.

### Build rendszer használatával

```bash
# Mindent lefordít automatikusan, a megfelelő sorrendben.
# (GNU make kell hozzá!)
make

# Ugyanaz, mint az előző, csak közvetlenül a LaTeX-mk-t hívva:
# (Elérhető standard TeX disztribúcióval, make nélkül.)
latexmk --pdflatex elteikthesis_hu
```

### Kézzel

```bash
# elteikthesis_hu.aux fájl generálása
# (PDF fájl még hibás hivatkozásokat fog tartalmazni)
pdflatex elteikthesis_hu.tex
# Irodalomjegyzék generálása
biber elteikthesis_hu
# Jelölésjegyzék generálása (ha szükséges)
makeindex -s nomencl.ist -t elteikthesis_hu.nlg \
  -o elteikthesis_hu.nls elteikthesis_hu.nlo
# Végleges PDF fájl generálása
pdflatex elteikthesis_hu.tex
```


## Kódblokkok szintaxis kiemelése

A *minted* csomag támogatott a forráskódok szedésére és szintaxis kiemelésére. Használatához szükséges a Python interpreter és a `Pygments` csomag telepítése.
Lásd az `elteikthesis_minted.tex` fájlt példaként és ezt a [dokumentációt](https://www.overleaf.com/learn/latex/Code_Highlighting_with_minted).

## Overleaf

Az *Overleaf* egy ingyenes, könnyen használható, kollaboratív, online LaTeX szerkesztő. Hasonló, mint például a Google Docs, de LaTeX dokumentumokhoz.
Az ELTE IK szakdolgozat és diplomamunka sablon legfrissebb kiadását [Overleafen is megtalálod](https://www.overleaf.com/latex/templates/elte-fi-thesis-template/scjzzzbjvwfz).

## Fontosabb függőségi csomagok

**Képkezelés:**

* Minimális és maximális méret: [adjustbox](https://ctan.org/pkg/adjustbox)
* Alábrák: [subcaption](https://ctan.org/pkg/subcaption)
* Forgatás: [rotating](https://ctan.org/pkg/rotating)

**Táblázatkezelés:**

* Oszlopok és sorok egyesítése: [multirow](https://ctan.org/pkg/multirow)
* Tördelhető táblázat: [longtable](https://ctan.org/pkg/longtable)
* Cellatartalom vertikális igazítása: [array](https://ctan.org/pkg/array)
* Többsoros cellák (sortörés): [makecell](https://ctan.org/pkg/makecell)

**Felsorolások:**

* Szoros térközű felsorolások: [paralist](https://ctan.org/pkg/paralist)

**Matematika és algoritmusok:**

* Matematikai formulák: [amsmath](https://ctan.org/pkg/amsmath)
* Matematikai definíciók: [amsthm](https://ctan.org/pkg/amsthm)
* Matematikai szimbólumok: [amsfonts](https://ctan.org/pkg/amsfonts)
* Algoritmusok: [algpseudocode](https://www.ctan.org/pkg/algorithmicx)
* Kódblokkok: [listingsutf8](https://ctan.org/pkg/listingsutf8), [minted](https://ctan.org/pkg/minted)

**Egyebek:**

* Teendők: [todonotes](https://ctan.org/pkg/todonotes)

## Előre definiált tételszerű bekezdések

* *definition*: Definíció
* *theorem*: Tétel
* *remark*: Emlékeztető
* *note*: Megjegyzés
