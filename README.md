# ELTE IK szakdolgozat és diplomamunka sablon

A [thesis.tex](thesis.tex) és a belőle előálló [thesis.pdf](thesis.pdf) szolgál kiindulási példaként.
A sablon alkalmazza a szakdolgozatra / diplomamunkára vonatkozó formai előírásokat, valamint elkészíti a megadott metaadatok alapján a címlapot.
A formai megkötések az ELTE Informatikai Kar szabályzatában rögzítetteknek felelnek meg, de általánosan (a megfelelő módosításokkal) alkalmazható más egyetemek dolgozataihoz is.

A sablon alapértelmezetten a javasolt egy oldalas nyomtatásra konfigurált, de előkészítetten (kikommentelve) tartalmazza a két oldalas nyomtatáshoz szükséges beállításokat. A sablon magyar és angol nyelvű dokumentumok elkészítését támogatja (ld. `\documentlang`).

## Fontosabb kiegészítő csomagok

**Képkezelés:**
* Minimális és maximális méret: [adjustbox](https://ctan.org/pkg/adjustbox)
* Alábrák: [subfigure](https://ctan.org/pkg/subfigure)
* Forgatás: [rotating](https://ctan.org/pkg/rotating)

**Táblázatkezelés:**
* Oszlopok és sorok egyesítése: [multirow](https://ctan.org/pkg/multirow)
* Tördelhető táblázat: [lontable](https://ctan.org/pkg/longtable)
* Cellatartalom vertikális igazítása: [array](https://ctan.org/pkg/array)

**Felsorolások:**
* Szoros térközű felsorolások: [paralist](https://ctan.org/pkg/paralist)

**Egyebek:**
* Kódblokkok: [listingsutf8](https://ctan.org/pkg/listingsutf8)
* Teendők: [todonotes](https://ctan.org/pkg/todonotes)

## Tételszerű bekezdések

* definition: Definíció
* theorem: Tétel
* remark: Emlékeztető
* note: Megjegyzés