# BIMSA Lecture Notes (BLN) author support

## Table of Contents

* [About](#about)
* [Package content](#package-content)
* [Setup](#setup)
* [Recomended usage of `bln` package](#recomended-usage-of-bln-package)
* [Submission](#submission)
* [Bug reports](#bug-reports)

## About

Author support service provides LaTeX style files and `*.tex` file templates designed for BIMSA Lecture Notes (*BLN*).

## Package content

The following files are given in the repository (or directly in `*.zip` archive):

* `bln.cls` - LaTeX style file designed for International Press book.
  Please do not change it. This file is already loaded in the respective template files;
* `bln-template.tex` - topmatter template (should be used for book preparation);
* `bln-sample.tex` - sample book;
* `bln-sample.pdf` - sample book (`PDF` file);

## Setup
* Clone the repository or download the `*.zip` archive. Rename the package to `<your-project-name>`.
* Install `bln.cls` in your TeX system.
* Use the file `bln-template.tex` to start your book as a template.
* Use the file `bln-sample.tex` as a reference for how to prepare a topmatter of your book.

## Recommended usage of `bln` package

Use `bln-template.tex` as a template.

### LaTeX document preamble content

The preamble of your LaTeX document should look like this:

```latex
\documentclass{bln}

\title{Book title}
\author{Firstname Surname}
\address{Address of the author}

\begin{document}

    \maketitle

    \tableofcontents

    \begin{preface}
    Introduction to the book.
    \end{preface}

    \chapter{Chapter one}

    Your book content

    \begin{thebibliography}{}
    \bibitem{}
 
    \bibitem{}

    \end{thebibliography}

\end{document}
```

## Submission

Submit one single file as a `ZIP` archive.
Pack your root folder `<your-project-name>` with files and subfolders.

## Bug reports

Please submit bug report or feature requests at
[github](https://github.com/vtex-soft/texsupport.intlpress-bln/issues) page.