%% MIT License
%%
%% Version 2.3.1, 2023/04/10
%% Copyright (c) 2013-2023 Máté Cserép <mcserep@inf.elte.hu>, Bálint Bognár
%%
%% Permission is hereby granted, free of charge, to any person obtaining a copy
%% of this software and associated documentation files (the "Software"), to deal
%% in the Software without restriction, including without limitation the rights
%% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
%% copies of the Software, and to permit persons to whom the Software is
%% furnished to do so, subject to the following conditions:
%%
%% The above copyright notice and this permission notice shall be included in all
%% copies or substantial portions of the Software.
%%
%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
%% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
%% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
%% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
%% SOFTWARE.
%%
%% -----------------------------------------------------------------------------
%%
%% The original 1.x versions of the CTAN package were developed by
%% Dániel Majoros, under the LaTeX Project Public License version 1.2 or later.
%% This updated work is a complete rewrite with no connection
%% to the original package.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{elteikthesis}[2023/04/10 ELTE FI bachelor and master thesis template]

% LaTeX programming tools
\RequirePackage{etoolbox}
\RequirePackage{xparse}
\RequirePackage{ifthen}

% ------------------------------
% Processing parameters
\newtoggle{oneside}\toggletrue{oneside}
\newtoggle{hypenation}\toggletrue{hypenation}
\newtoggle{parspace}\togglefalse{parspace}
\newtoggle{indent}\toggletrue{indent}

\DeclareOption{nohyp}{\togglefalse{hypenation}}
\DeclareOption{parspace}{\toggletrue{parspace}}
\DeclareOption{noindent}{\togglefalse{indent}}
\DeclareOption{twoside}{
	\PassOptionsToClass{\CurrentOption}{report}
	\PassOptionsToClass{openright}{report}
	\togglefalse{oneside}
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions \relax

% Load document class (default settings)
\LoadClass[a4paper, 12pt, oneside]{report}
% ------------------------------

% ------------------------------
% Character encoding, language
\RequirePackage{iftex} % XeTex or LuaTex
\iftutex
	\RequirePackage{fontspec}
\else % other (PdfTex)
	\RequirePackage[utf8]{inputenc}
	\RequirePackage[T1]{fontenc}
\fi
\RequirePackage[english,hungarian]{babel}
\RequirePackage{indentfirst}
% ------------------------------

% ------------------------------
% Metadata
\DeclareDocumentCommand{\author}{m}{\newcommand{\authorname}{#1}\renewcommand{\@author}{#1}}
\NewDocumentCommand{\degree}{m}{\newcommand{\degreename}{#1}}

\NewDocumentCommand{\supervisor}{m}{\newcommand{\supname}{#1}}
\NewDocumentCommand{\affiliation}{m}{\newcommand{\supaff}{#1}}

\NewDocumentCommand{\extsupervisor}{m}{\newcommand{\extsupname}{#1}}
\NewDocumentCommand{\extaffiliation}{m}{\newcommand{\extsupaff}{#1}}

\NewDocumentCommand{\university}{m}{\newcommand{\univname}{#1}}
\NewDocumentCommand{\faculty}{m}{\newcommand{\facname}{#1}}
\NewDocumentCommand{\department}{m}{\newcommand{\deptname}{#1}}
\NewDocumentCommand{\city}{m}{\newcommand{\cityname}{#1}}
\NewDocumentCommand{\logo}{m}{\newcommand{\logofilename}{#1}}

\DeclareDocumentCommand{\title}{m}{\newcommand{\thesistitle}{#1}\renewcommand{\@title}{#1}}
\DeclareDocumentCommand{\date}{m}{\newcommand{\thesisyear}{#1}\renewcommand{\@date}{#1}}
% ------------------------------

% ------------------------------
% Translations
\DeclareDocumentCommand{\documentlang}{m}{
	\selectlanguage{#1}

	% Hungarian
	\ifthenelse{\equal{\detokenize{#1}}{\detokenize{hungarian}}}
	{
		\newcommand{\authorlabel}{Szerző}
		\newcommand{\suplabel}{Témavezető}
		\newcommand{\intsuplabel}{Belső témavezető}
		\newcommand{\extsuplabel}{Külső témavezető}

		\newcommand{\deflabel}{Definíció}
		\newcommand{\theolabel}{Tétel}
		\newcommand{\remlabel}{Emlékeztető}
		\newcommand{\notelabel}{Megjegyzés}

		\newcommand{\codelabel}{forráskód}
		\newcommand{\alglabel}{algoritmus}

		\newcommand{\biblabel}{Irodalomjegyzék}
		\newcommand{\lstalgorithmlabel}{Algoritmusjegyzék}
		\newcommand{\lstfigurelabel}{Ábrajegyzék}
		\newcommand{\lsttablelabel}{Táblázatjegyzék}
		\newcommand{\lstcodelabel}{Forráskódjegyzék}
		\newcommand{\lstnomencl}{Jelölésjegyzék}
		\newcommand{\todolabel}{Teendők listája}
		\newcommand{\acklabel}{Köszönyetnyilvánítás}
	}
	{ % English
		\newcommand{\authorlabel}{Author}
		\newcommand{\suplabel}{Supervisor}
		\newcommand{\intsuplabel}{Internal supervisor}
		\newcommand{\extsuplabel}{External supervisor}

		\newcommand{\deflabel}{Definition}
		\newcommand{\theolabel}{Theorem}
		\newcommand{\remlabel}{Remark}
		\newcommand{\notelabel}{Note}

		\newcommand{\codelabel}{Code}
		\newcommand{\alglabel}{Algorithm}

		\newcommand{\biblabel}{Bibliography}
		\newcommand{\lstalgorithmlabel}{List of Algorithms}
		\newcommand{\lstfigurelabel}{List of Figures}
		\newcommand{\lsttablelabel}{List of Tables}
		\newcommand{\lstcodelabel}{List of Codes}
		\newcommand{\lstnomencl}{List of Symbols}
		\newcommand{\todolabel}{Todo list}
		\newcommand{\acklabel}{Acknowledgements}
	}
}
% ------------------------------

% ------------------------------
% Margin
\RequirePackage[left=35mm, right=25mm, top=25mm, bottom=25mm, headheight=16pt]{geometry}
%\setlength{\textwidth}{150mm}
%\setlength{\textheight}{247mm}
% ------------------------------

% ------------------------------
% Headers and footers
\RequirePackage{fancyhdr}
\pagestyle{fancy}

% Overriding chapter and section marks
\renewcommand{\chaptermark}[1]{\markboth{\thechapter.\ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}{}}
% Set header and footer separator lines
\renewcommand{\headrulewidth}{1pt}
\renewcommand{\footrulewidth}{0pt}

% Clear default header style
\fancyhead{}
% Set new header style
\iftoggle{oneside}{ % one sided format
	\fancyhead[C]{\slshape \leftmark}
}{ % double sided format
	\fancyhead[EC]{\slshape \leftmark}
	\fancyhead[OC]{\slshape \rightmark}
}

% Set header and footer margin from main content
\topskip = 15pt		% default: 10pt
\footskip = 40pt	% default: 30pt

% Clear default footer style
\fancyfoot{}
% Set new footer style
\fancyfoot[C]{\thepage}

% Chapters are set back to plain style, therefore we need to override it
\fancypagestyle{plain}{
	% Disable header line
	\renewcommand{\headrulewidth}{0pt}
	% Completely erase header and footer
	\fancyhf{}
	% Set new footer
    \fancyfoot[C]{\thepage}
}

% No header and footer on empty pages
% http://www.tex.ac.uk/cgi-bin/texfaq2html?label=reallyblank
\let\origdoublepage\cleardoublepage
 \newcommand{\clearemptydoublepage}{
   \clearpage
   {\pagestyle{empty}\origdoublepage}
 }
\let\cleardoublepage\clearemptydoublepage
% ------------------------------

% ------------------------------
% Graphics
\RequirePackage{graphicx}
\RequirePackage{float}
% Set maximum and minimum size for figures
\RequirePackage[export]{adjustbox}
% Subfigures
\RequirePackage{subcaption}
% Rotating figures
\RequirePackage{rotating}

% Support of EPS graphics with pdflatex
\RequirePackage{epstopdf}
% Priority order of image extensions
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg}
% Default image path
\graphicspath{{./images/}}
% Set name for List of Figures
\renewcommand{\listfigurename}{\lstfigurelabel}
% ------------------------------

% ------------------------------
% Paper size
\paperwidth 210mm
\paperheight 297mm
% ------------------------------

% ------------------------------
% Set the spacing between paragraphs
\iftoggle{parspace}{
	\RequirePackage{parskip}
	% Keep the indention of the first line
	\iftoggle{indent}{
		\setlength{\parindent}{3.5ex}
	}{}
}{
	% No spacing, no indentation
	\nottoggle{indent}{
		\RequirePackage[skip=0pt]{parskip}
	}{
		% by default there is no spacing, but first lines are indented
	}
}
% ------------------------------

% ------------------------------
% Disable widow and orphan lines
\clubpenalty=3000
\widowpenalty=3000
% ------------------------------

% ------------------------------
% Line and word spacing
% Single spacing at end of sentences
\frenchspacing
% Avoid overfull lines (text reaching over the right margin)
\sloppy
% Disable word hyphenation
\nottoggle{hypenation}{\RequirePackage[none]{hyphenat}}{}

% Line spacing
\RequirePackage{setspace}
% According to
% https://tex.stackexchange.com/questions/442030/setting-spaces-with-titlespacing-and-fonts
% this matches the 1.5 linespacing in MS Word
\setstretch{1.427465}

% Display vectors and matrixes with single line spacing
% https://tex.stackexchange.com/questions/568084/problem-with-matrices-using-linespread
\everydisplay=\expandafter{\the\everydisplay\linespread{1}\selectfont}

% Use same line spacing in footer
%\RequirePackage{footmisc}
%\setlength{\footnotesep}{\baselineskip}
% ------------------------------

% ------------------------------
% Do not hyphenate uppercase words
\uchyph=0
% ------------------------------

% ------------------------------
% Lists with narrow spacing
\RequirePackage{paralist}
% ------------------------------

% ------------------------------
% Mathematical mode
\RequirePackage{amsthm}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\DeclareMathAlphabet{\mathpzc}{OT1}{pzc}{m}{it}
% ------------------------------

% ------------------------------
% Predefined theorem-like environments
\theoremstyle{definition}
\newtheorem{definition}{\deflabel}

\theoremstyle{plain}
\newtheorem{theorem}{\theolabel}

\theoremstyle{remark}
\newtheorem*{remark}{\remlabel}
\newtheorem*{note}{\notelabel}
% ------------------------------

% ------------------------------
% Use the Times font
%\RequirePackage{mathptmx}
% ------------------------------

% ------------------------------
% Colored texts
\RequirePackage{color}
\RequirePackage{xcolor}
% Predefined colors
\definecolor{codebackg}{rgb}{0.95,0.95,0.95}
\definecolor{codecomment}{rgb}{0,0.6,0}
\definecolor{codestring}{rgb}{0.58,0,0.82}
\colorlet{todobackg}{orange!10}
% ------------------------------

% ------------------------------
% URL references
% dvipdfm-hez
%\newcommand{\hyperrefComp}{dvipdfm}
% pdflatex-hez
\newcommand{\hyperrefComp}{}

\RequirePackage[pdfborder={0 0 0}, unicode, pdfusetitle, \hyperrefComp]{hyperref}
\RequirePackage[all]{hypcap}
\RequirePackage{url}
\RequirePackage{bookmark}
% ------------------------------

% ------------------------------
% Multirow and multicolumn tables
\RequirePackage{multirow}
% Breakable tables over multiple pages
\RequirePackage{longtable}
% Vertical positioning of cells
\RequirePackage{array}
% Multiline cells (line breaks)
\RequirePackage{makecell}
% Set name for List of Tables
\renewcommand{\listtablename}{\lsttablelabel}
% ------------------------------

% ------------------------------
% Superscripts and subscripts
% http://anthony.liekens.net/index.php/LaTeX/SubscriptAndSuperscriptInTextMode
\newcommand{\superscript}[1]{\ensuremath{^{\textrm{\scriptsize{#1}}}}}
\newcommand{\subscript}[1]{\ensuremath{_{\textrm{\scriptsize{#1}}}}}
% ------------------------------

% ------------------------------
% Manage counters
\RequirePackage{chngcntr}
% Continuous counting of footnotes among chapters
\counterwithout{footnote}{chapter}
% Avoid breaking footnotes over pages
\interfootnotelinepenalty=10000
% ------------------------------

% ------------------------------
% Extended support for footnotes (savenotes)
%\RequirePackage{footnote}
% Handle footnotes in minipages
% http://www.cs.brown.edu/system/software/latex/doc/mpfnmark.pdf
%\RequirePackage{mpfnmark}
% ------------------------------

% ------------------------------
% Include PDF documents
% For topic declaration page
\RequirePackage{pdfpages}
% ------------------------------

% ------------------------------
% Appendix
\RequirePackage{appendix}
% ------------------------------

% ------------------------------
% Bibliography
\RequirePackage[autostyle=true]{csquotes}
\RequirePackage[
	backend=biber,
	style=numeric, % style of bibliography
	sorting=none   % sorting of references
]{biblatex}
% ------------------------------

% ------------------------------
% Captions, Table of Contents
\RequirePackage[justification=centering]{caption}
\RequirePackage{tocloft}

% ------------------------------

% ------------------------------
% Index
\RequirePackage{makeidx}
\makeindex
% ------------------------------

% ------------------------------
% List of Symbols
\RequirePackage[intoc,noprefix,refpage]{nomencl}
% Avoid bigskip between items
\setlength{\nomitemsep}{-\parsep}
% Right alignment
\renewcommand{\nomlabel}[1]{\hfil \hfil #1}
% Display page reference
\renewcommand{\pagedeclaration}[1]{, #1}
% Set name for List of Symbols
\renewcommand{\nomname}{\lstnomencl}
% Generate List of Symbols (does not insert it)
\makenomenclature
% ------------------------------

% ------------------------------
% Algorithms and code blocks
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\RequirePackage{listingsutf8}
\lstset{
	basicstyle=\footnotesize\ttfamily,
	numbers=left,
    numberstyle=\tiny,
    backgroundcolor=\color{codebackg},
	keywordstyle=\color{blue},
	commentstyle=\color{codecomment},
	stringstyle=\color{codestring},
	stepnumber=1,
	firstnumber=1,
	numbersep=5pt,
	showspaces=false,
	showstringspaces=false,
	showtabs=false,
	tabsize=2,
	breaklines=true,
	breakatwhitespace=false,
	float,
	frame=lines,
	captionpos=b
}
% Set name for code blocks and List of Codes
\renewcommand{\lstlistingname}{\codelabel}
\renewcommand{\lstlistlistingname}{\lstcodelabel}
% Set name for algorithm blocks and List of Algorithms
\floatname{algorithm}{\alglabel}
\renewcommand{\listalgorithmname}{\lstalgorithmlabel}
% ------------------------------

% ------------------------------
% List of TODOs
% http://tug.ctan.org/macros/latex/contrib/todonotes/todonotes.pdf
\RequirePackage[textwidth=30mm, textsize=small, color=todobackg, linecolor=orange, colorinlistoftodos, loadshadowlibrary, shadow, obeyFinal]{todonotes}
\RequirePackage[displaymath, tightpage]{preview}
% Place TODOs on the left margin
\reversemarginpar
\setlength{\marginparwidth}{30mm}
% ------------------------------

% ------------------------------
% Cover page
\renewcommand{\maketitle}{
	\begin{titlepage}

		\begin{center}

			\begin{tabular}{ c c }
				\multirow{4}{*}{\hspace{-1.0cm}\includegraphics[width=0.25\textwidth]{\logofilename}}

				& {\sc \Large \makecell{\univname}} \vspace{0.3cm}\\
				& {\sc \Large \makecell{\facname}} \vspace{0.5cm}\\
				& {\sc \large \makecell{\deptname}}
			\end{tabular}

			\vspace{5.0cm}
			{\bf \LARGE \thesistitle \par}
			\vspace{4.0cm}

			\ifdefined\extsupaff
				{\it \large \authorlabel:}\\
				{\large \authorname}\\
				\degreename\\
				\vspace{2.0cm}

				\begin{tabular}{ l c l }
					{\it \large \intsuplabel:} &
					\hspace{4.0cm} &
					{\it \large \extsuplabel:}\\

					{\large \supname} &
					\hspace{4.0cm} &
					{\large \extsupname}\\

					\supaff &
					\hspace{4.0cm} &
					\extsupaff\\
				\end{tabular}
			\else
				\vspace{1.0cm}
				\begin{tabular}{ l c l }
					{\it \large \suplabel:} &
					\hspace{4.0cm} &
					{\it \large \authorlabel:}\\

					{\large \supname} &
					\hspace{4.0cm} &
					{\large \authorname}\\

					\supaff &
					\hspace{4.0cm} &
					\degreename\\
				\end{tabular}
			\fi

			\vfill

			{\it \cityname, \thesisyear}

		\end{center}

	\end{titlepage}
}
% ------------------------------

\AtBeginDocument{
	% If the minted package is loaded, then provide a default for the formatting,
	% and set the labels for the listings 
	\@ifpackageloaded{minted}{
		\setminted{
			style=tango,
			numbers=left,
			stepnumber=1,
			firstnumber=1,
			numbersep=5pt,
			showspaces=false,
			showtabs=false,
			tabsize=2,
			breaklines=true,
			frame=lines,
			bgcolor=codebackg,
		}
		\SetupFloatingEnvironment{listing}{
			name=\codelabel,        % set name for code blocks
			listname=\lstcodelabel, % set name for List of Codes
		}
	}

	% Page numbering starts with Table of Contents, but not shown there
	\let\oldtableofcontents\tableofcontents
	\renewcommand{\tableofcontents}{
		\pagenumbering{gobble}
		\oldtableofcontents
		\cleardoublepage
		% Save and load page number, because \pagenumbering resets it
		\newcounter{conpageno}
		\defcounter{conpageno}{\value{page}}
		\pagenumbering{arabic}
		\setcounter{page}{\value{conpageno}}
	}
}
