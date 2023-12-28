[![CI status](https://github.com/mcserep/elteikthesis/actions/workflows/ci.yml/badge.svg)](https://github.com/mcserep/elteikthesis/actions/workflows/ci.yml)
[![Overleaf template](https://img.shields.io/badge/Overleaf-ELTE%20FI%20Thesis%20Template-brightgreen)](https://www.overleaf.com/latex/templates/elte-fi-thesis-template/scjzzzbjvwfz)

See [Hungarian version](README_hu.md).

# ELTE FI Bachelor's and Master's thesis template

The [elteikthesis_en.tex](elteikthesis_en.tex) and the produced [elteikthesis_en.pdf](elteikthesis_en.pdf) serves as an example of usage.
This class template enforces the required formatting rules for bachelor and master theses and generates the cover page given on the provided metadata. The chapters of the example document follows the typical structure of a BSc thesis.
The formatting rules are defined to meet the requirements for theses submitted at the Eötvös Loránd University, Faculty of Informatics (Budapest, Hungary). However with sufficient modifications the template should be usable at other universities, too.

The template contains configuration both for single and double sided printing (see `twoside` option), by default it is set to the recommended single side format.
The template supports producing both Hungarian and English theses, which can be easily controlled (see `\documentlang` command).

## Compilation

Compilation might be carried out through a preferred IDE (e.g. [TexStudio](https://www.texstudio.org/)), given the same commands should be executed.

### Using a build system

```bash
# Generate everything automatically, in the right order.
# (Needs GNU make to be installed!)
make thesis

# The same as above, just by calling LaTeX-mk directly:
# (This is available without make, using standard TeX distributions.)
latexmk --pdflatex elteikthesis_en
```

### Manually

```bash
# Generate elteikthesis_en.aux file
# (PDF file contains incorrect references yet)
pdflatex elteikthesis_en.tex
# Generate bibliography
biber elteikthesis_en
# Generate nomenclature (optional)
makeindex -s nomencl.ist -t elteikthesis_en.nlg \
  -o elteikthesis_en.nls elteikthesis_en.nlo
# Generate final PDF file
pdflatex elteikthesis_en.tex
```

## Syntax highlighting of code blocks

The minted package is also supported for syntax  highlighting. For its usage the Python interpreter and the `Pygments` package must be installed as a prerequisite.
See the `elteikthesis_minted.tex` file for example and this [documentation](https://www.overleaf.com/learn/latex/Code_Highlighting_with_minted).

## Overleaf

*Overleaf* is a free, easy to use online, collaborative LaTeX editor; similar like e.g. Google Docs, but for LaTeX documents.
You can also find the latest release of this ELTE FI bachelor and master thesis template [on Overleaf](https://www.overleaf.com/latex/templates/elte-fi-thesis-template/scjzzzbjvwfz).

## Required packages (without completeness)

**Image handling:**

* Minimal and maximal size: [adjustbox](https://ctan.org/pkg/adjustbox)
* Subfigures: [subcaption](https://ctan.org/pkg/subcaption)
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
* Algorithms: [algpseudocode](https://www.ctan.org/pkg/algorithmicx)
* Code blocks: [listingsutf8](https://ctan.org/pkg/listingsutf8), [minted](https://ctan.org/pkg/minted)

**Miscellaneous:**

* Todos: [todonotes](https://ctan.org/pkg/todonotes)

## Predefined theorem-like environments

* *definition*
* *theorem*
* *remark*
* *note*
