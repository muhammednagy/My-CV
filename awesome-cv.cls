%% Start of file `awesome-cv.cls'.
% Awesome CV Class File
%
% This class has been downloaded from:
% https://github.com/posquit0/Awesome-CV
%
% Author:
% Claud D. Park <posquit0.bj@gmail.com>
% http://www.posquit0.com
%
% Class license:
% LPPL v1.3c (http://www.latex-project.org/lppl)
%
% This copy has been heavily simplified and restyled for a one-page resume:
% unused CV/cover-letter macros were removed and the entry macros redesigned.

\ProvidesClass{awesome-cv}[2015/12/14 v1.3 Awesome Curriculum Vitae Class (simplified)]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper]{article}

%--- Packages -------------------------------------------------------------------
\RequirePackage{enumitem}
\RequirePackage{geometry}
\RequirePackage{xcolor}
\RequirePackage[quiet]{fontspec}
\defaultfontfeatures{Ligatures=TeX}
\RequirePackage{hyperref}

%--- Layout ---------------------------------------------------------------------
\geometry{a4paper, left=1.6cm, right=1.6cm, top=1.2cm, bottom=1.2cm}
\pagestyle{empty}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}

%--- Colors ---------------------------------------------------------------------
\definecolor{text}{HTML}{333333}      % body text (dark grey)
\definecolor{graytext}{HTML}{5D5D5D}  % dates, locations
\definecolor{awesome}{HTML}{1F4E79}   % single accent colour (deep blue)
\color{text}

%--- Fonts (bundled in fonts/) --------------------------------------------------
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir

\newfontfamily\headerfont[Path=\@fontdir, UprightFont=*-Regular, ItalicFont=*-Italic,
  BoldFont=*-Bold, BoldItalicFont=*-BoldItalic]{Roboto}
\newfontfamily\bodyfont[Path=\@fontdir, UprightFont=*-Regular, ItalicFont=*-It,
  BoldFont=*-Bold, BoldItalicFont=*-BoldIt]{SourceSansPro}
\newfontfamily\semibold[Path=\@fontdir, UprightFont=*-Semibold]{SourceSansPro}
\newfontfamily\iconfont[Path=\@fontdir]{FontAwesome.otf}
\setmainfont[Path=\@fontdir, UprightFont=*-Regular, ItalicFont=*-It,
  BoldFont=*-Bold, BoldItalicFont=*-BoldIt]{SourceSansPro}
\setsansfont[Path=\@fontdir, UprightFont=*-Regular, ItalicFont=*-It,
  BoldFont=*-Bold, BoldItalicFont=*-BoldIt]{SourceSansPro}
\renewcommand{\familydefault}{\rmdefault}

% Icons (FontAwesome 4 code points)
\newcommand*{\icon}[1]{{\iconfont\color{awesome}\char"#1}\hspace{0.35em}}

%--- Links: clickable, no boxes -------------------------------------------------
\hypersetup{colorlinks=false, pdfborder={0 0 0}, pdfstartview=FitH}
\newcommand*{\cvlink}[2]{\href{#1}{#2}}

%--- Styles ---------------------------------------------------------------------
\newcommand*{\bodystyle}{\fontsize{9.5pt}{12pt}\selectfont\bodyfont\color{text}}
\newcommand*{\namestyle}[2]{{\fontsize{28pt}{30pt}\selectfont\headerfont\bfseries\color{text}#1}
  {\fontsize{28pt}{30pt}\selectfont\headerfont\color{awesome}#2}}
\newcommand*{\contactstyle}[1]{{\fontsize{9.5pt}{12pt}\selectfont\bodyfont\color{text}#1}}
\newcommand*{\sectionstyle}[1]{{\fontsize{11pt}{13pt}\selectfont\headerfont\bfseries
  \MakeUppercase{#1}}}
\newcommand*{\companystyle}[1]{{\fontsize{10.5pt}{12.5pt}\selectfont\bodyfont\bfseries\color{text}#1}}
\newcommand*{\rolestyle}[1]{{\fontsize{9.5pt}{12pt}\selectfont\semibold\color{awesome}#1}}
\newcommand*{\metastyle}[1]{{\fontsize{9.5pt}{12pt}\selectfont\bodyfont\color{graytext}#1}}

%--- Header ---------------------------------------------------------------------
% Usage: \cvheader{First}{Last}{contact line}
\newcommand*{\cvheader}[3]{%
  \begin{center}
    \namestyle{#1}{ #2}\par
    \vspace{2.5mm}
    \contactstyle{#3}\par
  \end{center}
  \vspace{-1.5mm}%
}
\newcommand*{\contactsep}{\hspace{0.9em}{\color{graytext}\textbar}\hspace{0.9em}}

%--- Sections and entries ------------------------------------------------------
% Section title with accent rule
\newcommand*{\cvsection}[1]{%
  \par\addvspace{3.4mm}%
  \noindent\color{awesome}\sectionstyle{#1}\hspace{0.8em}%
  {\color{awesome!45}\leaders\hrule height 0.6pt\hfill\kern0pt}\par
  \nobreak\vspace{1mm}\color{text}%
}

% Company / institution line: name left, location right
% Usage: \cvcompany{Name}{Location}
\newcommand*{\cvcompany}[2]{%
  \par\addvspace{2.1mm}\noindent\companystyle{#1}\hfill\metastyle{#2}\par\nobreak}

% Role line: title left, dates right
% Usage: \cvrole{Title}{Dates}
\newcommand*{\cvrole}[2]{%
  \noindent\rolestyle{#1}\hfill\metastyle{#2}\par\nobreak}

% Bullet list (shared description or per-role)
\newenvironment{cvitems}{%
  \vspace{0.4mm}%
  \begin{itemize}[leftmargin=1.1em, itemsep=0.3mm, topsep=0pt, parsep=0pt, partopsep=0pt]%
    \bodystyle\hyphenpenalty=10000\relax
    \renewcommand{\labelitemi}{{\color{awesome}\textbullet}}%
}{%
  \end{itemize}\vspace{0.2mm}%
}

% One-line description under an entry
\newcommand*{\cvline}[1]{\noindent\bodystyle#1\par}

% Skill row: label + list
\newcommand*{\cvskill}[2]{\par\addvspace{1.2mm}\noindent{\bodystyle\bfseries #1\hspace{0.6em}}\bodystyle#2\par}

% One-line summary under the header
\newcommand*{\cvsummary}[1]{\par\vspace{1.5mm}{\centering\bodystyle\color{graytext}#1\par}}

% Compact one-line entry: name and title left, location and dates right
% Usage: \cvcompact{Name}{Title}{Location}{Dates}
\newcommand*{\cvcompact}[4]{%
  \par\addvspace{2.1mm}\noindent\companystyle{#1}\hspace{0.7em}\rolestyle{#2}\hfill\metastyle{#3, #4}\par}

% Project: name, description and a short link, wrapping if needed
% Usage: \cvproject{Name}{Description}{URL}{Link text}
\newcommand*{\cvproject}[4]{%
  \par\addvspace{1.6mm}\noindent{\bodystyle\bfseries #1\hspace{0.6em}}{\bodystyle #2}\hfill
  \href{#3}{\bodystyle\color{awesome}#4}\par}
