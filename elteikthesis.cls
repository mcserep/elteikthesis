%% MIT License
%%
%% Version 1.1, 2019/04/30
%% Copyright (c) 2013-2019 Máté Cserép, Bálint Bognár
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

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{elteikthesis}[2019/04/30 ELTE IK szakdolgozat és diplomamunka sablon]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions \relax

% Egyoldalashoz
\LoadClass[a4paper, 12pt, oneside]{report}
% Kétoldalashoz
%\LoadClass[a4paper, 12pt, twoside, openright]{report}

% ------------------------------
% Fejlécek és láblécek
\RequirePackage{fancyhdr}
\pagestyle{fancy}

% Chapter és section információk stílusának felüldefiniálása
\renewcommand{\chaptermark}[1]{\markboth{\thechapter.\ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}{}}
% Fej- és lábléc vonalak beállítása
\renewcommand{\headrulewidth}{1pt}
\renewcommand{\footrulewidth}{0pt}

% Fejléc törlése
\fancyhead{}
% Fejléc beállítása (egyoldalashoz)
\fancyhead[C]{\slshape \leftmark}
% Fejléc beállítása (kétoldalashoz)
%\fancyhead[EC]{\slshape \leftmark}
%\fancyhead[OC]{\slshape \rightmark}

% Fejléc és lábléc távolsága a tartalomtól
\topskip = 15pt		% default: 10pt
\footskip = 40pt	% default: 30pt

% Lábléc törlése
\fancyfoot{}
% Lábléc beállítása
\fancyfoot[C]{\thepage}

% A chapter page-k mindig visszaállnak plain style-ra, ezért azt is felül kell külön definiálni.
\fancypagestyle{plain}{
	% Fejléc vonal letiltása
	\renewcommand{\headrulewidth}{0pt}
	% Teljes fejléc és lábléc törlés
	\fancyhf{}
	% Lábléc beállítása
    \fancyfoot[C]{\thepage}
}

% Üres oldalakon ne legyen fej- és lábléc
% http://www.tex.ac.uk/cgi-bin/texfaq2html?label=reallyblank
\let\origdoublepage\cleardoublepage
 \newcommand{\clearemptydoublepage}{
   \clearpage
   {\pagestyle{empty}\origdoublepage}
 }
\let\cleardoublepage\clearemptydoublepage
% ------------------------------

% ------------------------------
% Karakterkódolás, nyelv
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[english,magyar]{babel}
\RequirePackage{indentfirst}
% ------------------------------

% ------------------------------
% Times font használata
%\RequirePackage{txfonts}
% ------------------------------

% ------------------------------
% Grafika
\RequirePackage{graphicx}
\RequirePackage{float}
% Maximális ill. minimális méret megadása ábráknak
\RequirePackage[export]{adjustbox}
% Több ábra egy figure-on belül
\RequirePackage[center]{subfigure}
% Ábrák forgatása
\RequirePackage{rotating}

% Az EPS fájlok támogatása pdflatex használata esetén
\RequirePackage{epstopdf}
% Képek kiterjesztési prioritása
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg}
% Képek tárolási helye
\graphicspath{{./images/}}
% ------------------------------

% ------------------------------
% Papírméret
\paperwidth 210mm
\paperheight 297mm
% ------------------------------

% ------------------------------
% Margók
\RequirePackage[left=35mm, right=25mm, top=25mm, bottom=25mm]{geometry}
%\setlength{\textwidth}{150mm}
%\setlength{\textheight}{247mm}
% ------------------------------

% ------------------------------
% Térköz bekezdések közé
%\RequirePackage{parskip}
% A bekezdések első soros behúzása maradjon meg
%\setlength{\parindent}{3.5ex}
% ------------------------------

% ------------------------------
% Árva- és fattyúsorok tiltása
\clubpenalty=3000
\widowpenalty=3000
% ------------------------------

% ------------------------------
% Helyközök és tördelés
\linespread{1.5}
\frenchspacing
\sloppy

% Beállítás alternatív módon
%\RequirePackage{setspace}
%\singlespacing		% ~1.0 linespread
%\onehalfspacing	% ~1.3 linespread
%\doublespacing		% ~1.6 linespread

% Azonos sorköz használata láblácben
%\RequirePackage{footmisc}
%\setlength{\footnotesep}{\baselineskip}
% ------------------------------

% ------------------------------
% Nagybetűs szavak elválasztásának mellőzése
\uchyph=0
% ------------------------------

% ------------------------------
% Szoros térközű felsorolások
\RequirePackage{paralist}
% ------------------------------

% ------------------------------
% Matematikai mód
\RequirePackage{amsthm}
\RequirePackage{amsmath}
\DeclareMathAlphabet{\mathpzc}{OT1}{pzc}{m}{it}
% ------------------------------

% ------------------------------
% Színes szövegek
\RequirePackage{color}
\RequirePackage{xcolor}
% Színek
\definecolor{codebackg}{rgb}{0.95,0.95,0.95}
\definecolor{codecomment}{rgb}{0,0.6,0}
\colorlet{todobackg}{orange!10}
% ------------------------------

% ------------------------------
% Hivatkozások
% dvipdfm-hez
%\newcommand{\hyperrefComp}{dvipdfm}
% pdflatex-hez
\newcommand{\hyperrefComp}{}

\RequirePackage[pdfborder={0 0 0}, unicode, \hyperrefComp]{hyperref}
\RequirePackage[all]{hypcap}
\RequirePackage{url}
\RequirePackage{bookmark}
% ------------------------------

% ------------------------------
% Multirow és multicolumn táblázathoz
\RequirePackage{multirow}
% Táblázatok tördelése több oldalra
\RequirePackage{longtable}
% Celltartalmak vertikális igazítása
\RequirePackage{array}
% Sortörés táblázat cellákban
\RequirePackage{makecell}
% ------------------------------

% ------------------------------
% Felső és alsó indexek
% http://anthony.liekens.net/index.php/LaTeX/SubscriptAndSuperscriptInTextMode
\newcommand{\superscript}[1]{\ensuremath{^{\textrm{\scriptsize{#1}}}}}
\newcommand{\subscript}[1]{\ensuremath{_{\textrm{\scriptsize{#1}}}}}
% ------------------------------

% ------------------------------
% Lábjegyzet folytonos számozása fejezetek között
\RequirePackage{chngcntr}
%\counterwithout{footnote}{chapter} % documenten belülre kell helyezni
% Lábjegyzet oldalak közti eltörésének tiltása
\interfootnotelinepenalty=10000
% ------------------------------

% ------------------------------
% Lábjegyzet teljes körűbb támogatása (savenotes)
%\RequirePackage{footnote}
% Lábjegyzet kezelése minipage-ekben
% http://www.cs.brown.edu/system/software/latex/doc/mpfnmark.pdf
%\RequirePackage{mpfnmark}
% ------------------------------

% ------------------------------
% Függelék
\RequirePackage{appendix}
% ------------------------------

% ------------------------------
% Irodalomjegyzék
\RequirePackage[style=english]{csquotes}
\RequirePackage[
	backend=bibtex,
	style=numeric, % irodalomjegyzék stílusa
	sorting=none   % idézések rendezettségee
]{biblatex}
% ------------------------------

% ------------------------------
% Feliratok, tartalomjegyzék, ábrajegyzék, táblázatjegyzék
\RequirePackage[justification=centering]{caption}
\RequirePackage[subfigure]{tocloft}
% Tartalomjegyzék oldalszámozásának rejtése
\tocloftpagestyle{empty}

% ------------------------------

% ------------------------------
% Tárgymutató
\RequirePackage{makeidx}
\makeindex
% ------------------------------

% ------------------------------
% Jelölésjegyzék
\RequirePackage [refpage,noprefix]{nomencl}
\renewcommand{\nomname}{Jelölésjegyzék}
% Elemek közötti bigskip kihagyása
\setlength{\nomitemsep}{-\parsep}
% Jobbra igazítás
\renewcommand{\nomlabel}[1]{\hfil \hfil #1}
% Oldalhivatkozás megjelenése
\renewcommand{\pagedeclaration}[1]{, #1}
% Jelölésjegyzék elkészítse (még nem szúrja be)
\makenomenclature
% ------------------------------

% ------------------------------
% Algoritmusok és kódblokkok írása
\RequirePackage{algorithm}
\RequirePackage{algorithmic}
\RequirePackage{listingsutf8}
\lstset{
	basicstyle=\footnotesize\ttfamily,
	numbers=left,
    numberstyle=\tiny,
    backgroundcolor=\color{codebackg},
	keywordstyle=\color{blue},
	commentstyle=\color{codecomment},
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
	frame=linesc,
	captionpos=b,
	morekeywords={var}
}
% Forráskódjegyzék elnevezése
\renewcommand\lstlistingname{forráskód}
% Algoritmus kommentek jobb szélre igazítása
\renewcommand{\algorithmiccomment}[1]{\hfill {\it #1}}
% ------------------------------

% ------------------------------
% Teendőlista
% http://www.tex.ac.uk/tex-archive/help/Catalogue/entries/todonotes.html
\RequirePackage[textwidth=30mm, textsize=small, color=todobackg, linecolor=orange, colorinlistoftodos, shadow, obeyFinal]{todonotes}
\RequirePackage[displaymath, tightpage]{preview}
% A bal margóra kerüljenek a TODO-k
\reversemarginpar
\setlength{\marginparwidth}{30mm}
% ------------------------------

% ------------------------------
% Metaadatok
\RequirePackage{xparse}
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
% Fordítások
\DeclareDocumentCommand{\documentlang}{m}{
	\selectlanguage{#1}
	
	\ifthenelse{\equal{\detokenize{#1}}{\detokenize{magyar}}}
	{
		\newcommand{\authorlabel}{Szerző}
		\newcommand{\suplabel}{Témavezető}
		\newcommand{\intsuplabel}{Belső témavezető}
		\newcommand{\extsuplabel}{Külső témavezető}
		
		\newcommand{\deflabel}{Definíció}
		\newcommand{\theolabel}{Tétel}
		\newcommand{\remlabel}{Emlékeztető}
		\newcommand{\notelabel}{Megjegyzés}
		
		\newcommand{\biblabel}{Irodalomjegyzék}
		\newcommand{\lstfigurelabel}{Ábrajegyzék}
		\newcommand{\lsttablelabel}{Táblázatjegyzék}
		\newcommand{\lstcodelabel}{Forráskódjegyzék}
		\newcommand{\todolabel}{Teendők listája}
	}
	{
		\newcommand{\authorlabel}{Author}
		\newcommand{\suplabel}{Supervisor}
		\newcommand{\intsuplabel}{Internal supervisor}
		\newcommand{\extsuplabel}{External supervisor}
		
		\newcommand{\deflabel}{Definiton}
		\newcommand{\theolabel}{Theorem}
		\newcommand{\remlabel}{Remark}
		\newcommand{\notelabel}{Note}
		
		\newcommand{\biblabel}{Bibliograhpy}
		\newcommand{\lstfigurelabel}{List of Figures}
		\newcommand{\lsttablelabel}{List of Tables}
		\newcommand{\lstcodelabel}{List of Codes}
		\newcommand{\todolabel}{Todo list}
	}

	\renewcommand{\listfigurename}{\lstfigurelabel}		
	\renewcommand{\listtablename}{\lsttablelabel}
	\renewcommand{\lstlistlistingname}{\lstcodelabel}
}
% ------------------------------

% ------------------------------
% Tételek, definíciók
\newtheorem{definition}{\deflabel}
\newtheorem{theorem}{\theolabel}
\newtheorem*{remark}{\remlabel}
\newtheorem*{note}{\notelabel}
% ------------------------------

% ------------------------------
% Címlap
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
			{\bf \LARGE \thesistitle}
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
