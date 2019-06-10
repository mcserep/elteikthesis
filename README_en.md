# ELTE FI bachelor and master thesis template

The [thesis.tex](thesis.tex) and the produced [thesis.pdf](thesis.pdf) serves as an example of usage.
This class template enforces the required formatting rules for bachelor and master theses and generates the cover page given on the provided metadata. The chapters of the example document follows the typical structure of a BSc thesis.
The formatting rules are defined to meet the requirements for theses submitted at the Eötvös Loránd University, Faculty of Informatics (Budapest, Hungary). However with sufficient modifications the template should be usable at other universities, too.

The template contains configuration both for single and double sided printing (see `twoside` option), by default it is set to the recommended single side format.
The template supports producing both Hungarian and English theses, which can be easily controlled (see `\documentlang` command).

## Compilation

```bash
# Generate thesis.aux file (PDF file contains incorrect references yet)
pdflatex thesis.tex
# Generate bibliography
bibtex thesis
# Generate nomenclature (optional)
makeindex -s nomencl.ist -t thesis.nlg -o thesis.nls thesis.nlo
# Generate final PDF file
pdflatex thesis.tex
pdflatex thesis.tex
```

**Note:** in case the bibliography changes, executing `bibtex`, then `pdflatex` _twice_ is required to generate to correct references in the PDF output.

Compilation might be carried out through a preferred IDE (e.g. [TexStudio](https://www.texstudio.org/)), given the same commands should be executed.

## Required packages (without completeness)

**Image handling:**
* Minimal and maximal size: [adjustbox](https://ctan.org/pkg/adjustbox)
* Subfigures: [subfigure](https://ctan.org/pkg/subfigure)
* Rotation: [rotating](https://ctan.org/pkg/rotating)

**Table management:**
* Multirow and multicolumn support: [multirow](https://ctan.org/pkg/multirow)
* Breakable tables: [longtable](https://ctan.org/pkg/longtable)
* Vertical positioning of cells: [array](https://ctan.org/pkg/array)
* Multiline cells (line breaks): [makecell](https://ctan.org/pkg/makecell)

**Lists:**
* Lists with narrow spacing: [paralist](https://ctan.org/pkg/paralist)

**Mathematical formulas and algorithms:**
* Mathematical formulas: [amsmath](https://ctan.org/pkg/amsmath)
* Mathematical definitions: [amsthm](https://ctan.org/pkg/amsthm)
* Mathematical symbols: [amsfonts](https://ctan.org/pkg/amsfonts)
* Algorithms: [algorithmic](https://ctan.org/pkg/algorithms)
* Code blocks: [listingsutf8](https://ctan.org/pkg/listingsutf8)

**Miscellaneous:**
* Todos: [todonotes](https://ctan.org/pkg/todonotes)

## Predefined theorem-like environments

* *definition*
* *theorem*
* *remark*
* *note*
