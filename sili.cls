%% This is file `sili.cls'
%%
\NeedsTeXFormat{LaTeX2e}[1995/06/01]
\ProvidesClass{sili}
    [2025/11/11 v1.01, driver class for SILI book]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\PassOptionsToClass{a4paper,10pt,amsthm,amsmath,twoside}{report}
\ProcessOptions

\LoadClass{report}

\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\DeclareSymbolFont{letters}{OML}{cmm}{m}{it}
\DeclareSymbolFont{operators}{OT1}{cmr}{m}{n}
\DeclareSymbolFont{symbols}{OMS}{cmsy}{m}{n}
\DeclareSymbolFont{largesymbols}{OMX}{cmex}{m}{n}

%\InputIfFileExists{pagecrop.sty}{}{}
\IfFileExists{pagecrop.sty}{\RequirePackage{pagecrop}}{}

\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}
\RequirePackage{tcolorbox}
\RequirePackage{color}
\RequirePackage{etoolbox}
\RequirePackage{hyperref}

\def\startlocaldefs{\makeatletter}
\def\endlocaldefs{\makeatother}

\def\set@crop@page#1#2%
{%
  \gdef\@crop@page@wd{#1}%
  \gdef\@crop@page@ht{#2}%
  % skaiciuojam ploti:
  \gdef\crop@width{#1}%
  % skaiciuojam auksti
  \@tempdima=#2%
  \advance\@tempdima by-\topmargin%
  \advance\@tempdima by-\headheight%
  \advance\@tempdima by-\headsep%
  \advance\@tempdima by-\textheight%
  \xdef\the@bottom@margin{\the\@tempdima}%
  \advance\@tempdima by-#2               % DG/2006.10.27
  \xdef\the@top@margin{-\the\@tempdima}  % DG/2006.10.27
}

\addtolength{\textheight}{-2cm}
\addtolength{\textwidth}{1cm}
\addtolength{\evensidemargin}{-1cm}
\addtolength{\oddsidemargin}{-1cm}

% Trimsize
\newlength\trimwidth
\newlength\trimheight
\setlength\trimwidth{6.5in}%
\setlength\trimheight{9.375in}%

% Textsize
\setlength\textwidth{5.125in}%
\setlength\textheight{539pt}%

% Margins, skips, seps
\oddsidemargin = \dimexpr((\trimwidth-\textwidth)/2)\relax
\let\evensidemargin\oddsidemargin
\setlength\topmargin{41pt}
\setlength\footskip{25pt}
\setlength\headsep{20.7pt}

% Papersize special
\AtBeginDvi{\special{papersize=\the\paperwidth,\the\paperheight}}

\set@crop@page{\trimwidth}{\trimheight}

\def\address#1{\gdef\@address{#1}}
\renewcommand\maketitle{%
  \begin{titlepage}%
    \let\footnotesize\small
    \let\footnoterule\relax
    \let\footnote\thanks
    \begin{center}%
      \vglue15pc
      {\Huge\scshape\@title\par}%
	  \vglue5pc
      \lineskip .75em%
      \begin{tabular}[t]{c}%
        \LARGE\@author\\
		\@address
      \end{tabular}%
    \end{center}%\par
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@address\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  }

\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
	
%% Preface
\def\preface@title{Preface}
\newenvironment{preface}[1][]%
  {%
    \cleardoublepage%
    \chapter*{\preface@title}%
	\addcontentsline{toc}{chapter}{\preface@title}%
  }{%
	\par\cleardoublepage
    \pagenumbering{arabic}%
  }

\preto\tableofcontents{\pagenumbering{roman}\setcounter{page}{5}}
\pretocmd\@chapter{\cleardoublepage}{}{}
\pretocmd\thebibliography{\addcontentsline{toc}{chapter}{\bibname}}{}{}

\pagestyle{headings}

\endinput
%%
%% End of file `ipbook.cls'.
