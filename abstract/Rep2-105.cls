% This package designed and commented in russian koi8-r encoding.
%
% ����� ���������� �� ���� 2.105-95
% ����� - ������� �����, � ������� ������ �������� latex-gost-request@ice.ru,
%  "extreport.cls", "lastpage.sty" � ����������� RU.TEX
% �������� LGPL
% ��� �������, ��������� � ��������� ����: mailto:alxt@yandex.ru

% ���������:
%  a4paper, a5paper - ������ ������. ��-���������- a4paper.
%  econom - ��������� ��������. ��-��������� ���.
%  10pt, 12pt, 14pt - �����. ��-���������- 14pt
%  draft, final, fleqno - ��� ������. ��-���������- final

% � ���������� � ����������� ����� ���������� \subsection{} � \subsubsection{}
% ���� \nsubsection � \nsubsubsection (������ ��� ����������),
% ������� ������ �����, ������ ������, �� �� ��������� � ���������� -
% ������ � ��������� ��� ����������, � �������� ����

% ��� ���������� ������:
% indentfirst - �������� ������ � ������� ������
% amssymb     - ��� ������� "������ ��� �����" "������ ��� �����"
% ������������ ������ ������� extsizes.

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{Rep2-105}[2003/12/12 v1.1 Non Standard LaTeX document class]
\RequirePackage{fancyhdr}
\RequirePackage[unicode]{hyperref} \RequirePackage{indentfirst}

\newcommand\Gost@LineSpread{1.3}
\newcommand\@ptsize{}
\DeclareOption{a3paper}{\setlength\paperheight{420mm}\setlength\paperwidth{297mm}}
\DeclareOption{a4paper}{\setlength\paperheight{297mm}\setlength\paperwidth{210mm}}
\DeclareOption{a5paper}{\setlength\paperheight{210mm}\setlength\paperwidth{148mm}}
\DeclareOption{10pt}{\renewcommand\@ptsize{10}}
\DeclareOption{12pt}{\renewcommand\@ptsize{12}}
\DeclareOption{14pt}{\renewcommand\@ptsize{14}}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{econom}{\renewcommand\Gost@LineSpread{1.1}}
\DeclareOption{fleqn}{\input{fleqn.clo}}

\ExecuteOptions{a4paper,14pt,final}% ��� �������� ���������
%\ExecuteOptions{a4paper,10pt,final}% ��� �������
\ProcessOptions\relax


\input{size\@ptsize.clo}

%����� ��������
\pagestyle{plain}
\pagenumbering{arabic}
\raggedbottom
\onecolumn


%�����������
\def\ps@headings{%
 \let\@oddfoot\@empty
 \def\@oddhead{\hfil\thepage\hfil}%
 \let\@mkboth\markboth%
 \def\chaptermark##1{}%
}
\def\ps@myheadings{%
%    \let\@oddfoot\@empty\let\@evenfoot\@empty
%    \def\@evenhead{\thepage\hfil\slshape\leftmark}% ������
%    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}% ��������
%    \let\@mkboth\@gobbletwo
%    \let\chaptermark\@gobble
%    \let\sectionmark\@gobble
}
\def\@chapapp{}

%�����
\newcommand\@pnumwidth{1.55em}
\renewcommand\baselinestretch{}
\@lowpenalty   51                     %
\@medpenalty  151                     %
\@highpenalty 301                     %
\renewcommand\topfraction{.7}         %
\renewcommand\bottomfraction{.3}      %
\renewcommand\textfraction{.2}        %
\renewcommand\floatpagefraction{.5}   %
\renewcommand\dbltopfraction{.7}      %
\renewcommand\dblfloatpagefraction{.5}%
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\setlength\parskip{0\p@ \@plus \p@}
\setlength\leftmargini {2.5em}
\setlength\leftmarginii{2.2em}
\setlength\labelsep  {.5em}
\setlength\labelwidth{\leftmargini}\addtolength\labelwidth{-\labelsep}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
%\newcommand\appendix{}

% �������� ������ ����� �������, ������, �������� � ����������
\newcounter{totalpage}
\newcounter{totaltable} \setcounter{totaltable} {0}
\newcounter{totalfigure}\setcounter{totalfigure}{0}
\newcounter{totalbib}   \setcounter{totalbib}   {0}
\newif\if@tablesonchapter \@tablesonchapterfalse
\newif\if@figuresonchapter\@figuresonchapterfalse

% �� ��������� �������� �������� ����� � ��������
%  - ��������� ��������
%  - ����� ������, ������� caption
%  - ����� ��������, ������� caption
\def\totalobjects@putlabel{%
 \addtocounter{totalpage}  {\c@page}
 \addtocounter{totaltable} {\c@table}
 \addtocounter{totalfigure}{\c@figure}
 \addtocounter{totaltable} {-1}
 \addtocounter{totalfigure}{-1}
 \addtocounter{totalbib}{-1}
 \refstepcounter{totalpage}  \label{reftotalpages}
 \refstepcounter{totaltable} \label{reftotaltables}
 \refstepcounter{totalfigure}\label{reftotalfigures}
 \refstepcounter{totalbib}   \label{reftotalbibs}
}
\AtEndDocument{\totalobjects@putlabel}

% ������� ����������� ������ ����� ...
\newcommand\totalpages  {\pageref{reftotalpages}}
\newcommand\totaltables {\ref{reftotaltables}   }
\newcommand\totalfigures{\ref{reftotalfigures}  }
\newcommand\totalbibs   {\ref{reftotalbibs}     }

% 3.6 �������� ������ - 15..17 ��
\setlength\parindent{15mm}

% 4.1.1 - 4.1.6 ������� ���������

%  ������� ��� ���������� ���� ����������:
%   ���������� ����� ���������� � �������
\newlength\GostAfterTitleSkip    \setlength\GostAfterTitleSkip    {24pt}%15mm}
\newlength\GostBetweenTitleSkip  \setlength\GostBetweenTitleSkip  {1.8ex}%8mm}
\newlength\GostBeforTitleSkip    \setlength\GostBeforTitleSkip    {24pt}%\GostAfterTitleSkip}
\newlength\GostBeforNoTitleSkip  \setlength\GostBeforNoTitleSkip  {1.0ex}
\newlength\GostHTitleSpace       \setlength\GostHTitleSpace       {2mm}
\newlength\GostTitleIndent       \setlength\GostTitleIndent       {10mm}
\newlength\Gost@ChapterIndent    \setlength\Gost@ChapterIndent    {\GostTitleIndent}
\newlength\Gost@MainChapterIndent\setlength\Gost@MainChapterIndent{\parindent}
\newlength{\Gost@TitleDropSkip}
 \setlength\Gost@TitleDropSkip{\GostBetweenTitleSkip}
 \addtolength\Gost@TitleDropSkip{-\GostAfterTitleSkip}
%  ����� ���� ����������
\newcommand\GostTitleStyle{\normalfont\bfseries}
\newcommand\Gost@MainChapterStyle{}
\newcommand\Gost@IntroChapterStyle{\centering}
%\newcommand\Gost@ChapterStyle{\Gost@MainChapterStyle}
\newcommand\Gost@ChapterStyle{\Gost@IntroChapterStyle} % �������� ����� �� ������

%  ������

\newcounter{chapter}
\renewcommand\thechapter{\@arabic\c@chapter}
\newcommand\chapter{%
 \clearpage%
 \if@figuresonchapter%
  \addtocounter{totalfigure}{\c@figure}\setcounter{figure}{0}%
 \fi%
 \if@tablesonchapter%
  \addtocounter{totaltable} {\c@table }\setcounter{table}{0}%
 \fi%
 \@startsection{chapter}{0}%
  {0mm}{0mm}{\GostAfterTitleSkip}%
  {\GostTitleStyle\fontsize{15}{16}\selectfont\Gost@ChapterStyle}%
}
\newcommand*\chaptermark[1]{}

%  ���������

\newcounter{section}[chapter]
\renewcommand\thesection{\thechapter.\@arabic\c@section}
\newcommand\section{%
 \renewcommand\subsection[1]{\rgsubsection{##1}}%
 \renewcommand\subsubsection[1]{\rgsubsubsection{##1}}%
 \@startsection{section}{1}%
 {\GostTitleIndent}{\GostBeforTitleSkip}{\GostAfterTitleSkip}%
 {\GostTitleStyle\fontsize{15}{16}\selectfont}%
}

%  �����
\newcounter{subsection}[section]
\renewcommand\thesubsection{\thesection.\@arabic\c@subsection}
%  ... ���������� � ����������
\newcommand\rgsubsection{%
 \renewcommand\subsubsection[1]{\rgsubsubsection{##1}}%
 \@startsection{subsection}{2}%
 {\GostTitleIndent}{\GostBeforTitleSkip}{\GostAfterTitleSkip}%
 {\GostTitleStyle}%
}
%  ... �� ���������� � ����������
\newcommand\rgnsubsection{%
 \par\vspace{\GostBeforNoTitleSkip}%
 \refstepcounter{subsection}\thesubsection%
 \hspace{\GostHTitleSpace}%
}
\newcommand\subsection[1]{\rgsubsection{#1}}
\newcommand\nsubsection{\rgnsubsection}

%  ��������
\newcounter{subsubsection}[subsection]
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
%  ... ���������� � ����������
\newcommand\rgsubsubsection{%
 \@startsection{subsubsection}{3}%
 {\GostTitleIndent}{18pt}{1pt}%
 {\GostTitleStyle}%
}
%  ... �� ���������� � ����������
\newcommand\rgnsubsubsection{%
 \par\vspace{\GostBeforNoTitleSkip}%
 \refstepcounter{subsubsection}\thesubsubsection%
 \hspace{\GostHTitleSpace}%
}
\newcommand\subsubsection[1]{\rgsubsubsection{#1}}
\newcommand\nsubsubsection{\rgnsubsubsection}

\newcommand\nottlsubsection{
 \renewcommand\subsection[1]{\rgnsubsection{##1}}%
 \renewcommand\subsubsection[1]{\rgnsubsubsection{##1}}%
}
\newcommand\nottlsubsubsection{
 \renewcommand\subsubsection[1]{\rgnsubsubsection{##1}}%
}

\newlength{\NirTitleDropSkip}
%  ��� ������� ������ ���������� ����� ����� �����������
\newcommand\ttl{\vspace{\Gost@TitleDropSkip}}

%  ���������� ��� ���������
\setcounter{secnumdepth}{4}
%  � ����������- ���� ����� ���� ���.
\setcounter{tocdepth}{4}
%  ������� � ������-�-�������
\lccode`\-=`\-
\defaulthyphenchar=127

% 4.2.7 ������������

\newlength{\GostItemGap}
\newlength{\GostItemIndent}
\newcommand\Gost@List{%
 \setlength{\itemsep}{0mm}%                ������ ����� ����������������� ����������
 \setlength{\topsep}{0mm}%                 ������ �� ������ �� �������
 \setlength{\partopsep}{0mm}%              �������������� ������,  ���� ������ �����
 \setlength{\parsep}{0mm}%                 ���������� ����� �������� ������ ������
 \setlength{\leftmargin}{\GostItemIndent}% ����� ������ �� ������
 \setlength{\itemindent}{0mm}%    �������������� ����� ������ ������ �������
 \setlength{\labelsep}{2\GostItemGap}%     �� ����� �� ������
}

\renewcommand{\@listI} {\Gost@List}
\renewcommand{\@listii}{\Gost@List}
\setlength\GostItemGap{2mm} % ��������� ������� ��� ������� ������������
\setlength\leftmarginii{\parindent}
\setlength\GostItemIndent{\parindent}
 \addtolength\GostItemIndent{-\GostItemGap}

%  �������������� ������������
\newcommand{\labelitemi}{}%����� ������������

%  ������������ ������������
\renewcommand\theenumi {\arabic{enumi}.}
\renewcommand\theenumii{\asbuk{enumii})}
\newcommand\labelenumi{\theenumi}
\newcommand\labelenumii{\theenumii}
\renewcommand\p@enumii{\theenumi}

%  ������ �� ������������ ������������
\newcommand\pref[2]{%
 \cyrp\cyre\cyrr\cyre\cyrch\cyri\cyrs\cyrl\cyre\cyrn\cyri\cyre~\ref{#2})~\ref{#1}}

%������������ ���� description - ��� ������ ���������� � �.�.
\newenvironment{description}{%
 \list{}{%
  \labelwidth\z@ \itemindent-\leftmargin \leftmargin 25mm%
  \let\makelabel\descriptionlabel%
 }%
}{%
 \endlist%
}
\newcommand*\descriptionlabel[1]{\hspace\labelsep\normalfont #1~---}

% 4.2.15 - 4.2.19 �������

\RequirePackage{amssymb} % ��� ������� "������ ��� �����" "������ ��� �����"
\RequirePackage{icomma}


\def\@eqnnum{{\normalfont\normalcolor\theequation}}
\newenvironment{table} {\@float   {table}}{\end@float   }
\newenvironment{table*}{\@dblfloat{table}}{\end@dblfloat}
%\renewcommand{\theequation}{\arabic{equation}}%
\newlength\Gost@EqRemLen
\newlength\Gost@@EqRemLen
\newenvironment{eqrem}{%
 \begin{tabular}{p{\Gost@@EqRemLen}p{\Gost@EqRemLen}}
  \cyrg\cyrd\cyre
}{
 \end{tabular}
 \vspace{5mm}
}
% ��������� �.�. � ����
%  \begin{eqrem}
%   & X~--- ����������� \\
%   & Y~--- ��� ����������� \\
%  \end{eqrem}

% ... ����������� ��������� ������ � �������� �������
\newcommand\EqInChaper{%
 \@addtoreset{equation}{chapter}%
 \renewcommand{\theequation}{\thechapter.\arabic{equation}}%
}

%������� ������ �� =+-
%\begingroup
%\catcode`\+\active\gdef+{\mathchar8235\nobreak\discretionary{}%
% {\usefont{OT1}{cmr}{m}{n}\char43}{}}
%\catcode`\-\active\gdef-{\mathchar8704\nobreak\discretionary{}%
% {\usefont{OMS}{cmsy}{m}{n}\char0}{}}
%\catcode`\=\active\gdef={\mathchar12349\nobreak\discretionary{}%
% {\usefont{OT1}{cmr}{m}{n}\char61}{}}
%\endgroup
%\def\cdot{\mathchar8705\nobreak\discretionary{}%
% {\usefont{OMS}{cms�}{m}{n}\char1}{}}
%\def\times{\mathchar8706\nobreak\discretionary{}%
% {\usefont{OMS}{cmsy}{m}{n}\char2}{}}
%\mathcode`\==32768
%\mathcode`\+=32768
%\mathcode`\-=32768

\renewcommand\leq{\leqslant}
\renewcommand\geq{\geqslant}

% 4.3.1 - 4.3.3 �����������

\newcommand\@makecaption{}
\RequirePackage[center]{caption2}

\def\fps@figure{bph}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}

\newcounter{figure}
\newenvironment{figure} {\@float   {figure}}{\end@float   }
\newenvironment{figure*}{\@dblfloat{figure}}{\end@dblfloat}
\renewcommand\captionlabeldelim{.}
%\renewcommand\captionmargin{0.2cm}
%  ������� � �������
%\addto\captionsrussian{\def\figurename{{�������}}}

% ... ����������� ��������� �������� � �������� �������
\newcommand\PicInChaper{%
 \@addtoreset{figure}{chapter}%
 \@figuresonchaptertrue%
 \renewcommand{\thefigure}{\thechapter.\arabic{figure}}%
}

% 4.4 - �������
% ... ����������� ��������� ������ � �������� �������
\newcommand\TableInChaper{%
 \@addtoreset{table}{chapter}%
 \@tablesonchaptertrue%
 \renewcommand{\thetable}{\thechapter.\arabic{table}}%
}

\RequirePackage{longtable}% ��������������� �������
%   ��� ������������ ������� ������
\LTleft=\z@
\LTright=\fill
\def\LT@makecaption#1#2#3{%
  \LT@mcol\LT@cols l{\hbox to\z@{\parbox[t]\LTcapwidth{%
      \sbox\@tempboxa{#1{#2\captionlabeldelim{} }#3}%
          {\box\@tempboxa\hfil}%
          \endgraf}%
    \hss}}}

%  4.3.4 - 4.1.14 ����������
%\renewcommand\appendix{\par
 %\setcounter{secnumdepth}{4}
 %\setcounter{chapter}{0}%
 %\EqInChaper\PicInChaper\TableInChaper%
 %\gdef\@chapapp{\appendixname}%
 %\gdef\thechapter{\@Asbuk\c@chapter}%
 %\renewcommand\Gost@ChapterStyle{\Gost@MainChapterStyle}%
 %\setlength\Gost@ChapterIndent{\Gost@MainChapterIndent}%
%}

% 4.5 ������
\RequirePackage[bottom]{footmisc}

% ����� ���������- ��� ������ ���� ���������� � �.�.
%  ��������, �����������
\newcommand\frontmatter
{%
 \setcounter{secnumdepth}{-1}%
 \renewcommand\Gost@ChapterStyle{\Gost@IntroChapterStyle}%
 \setlength\Gost@ChapterIndent{0mm}%
}
%  �������� �����
\newcommand\mainmatter
%%%%% ������� ��������� �����
{%
\newpage
    \renewcommand\chapter{%
%     \clearpage%
     \if@figuresonchapter%
      \addtocounter{totalfigure}{\c@figure}\setcounter{figure}{0}%
     \fi%
     \if@tablesonchapter%
      \addtocounter{totaltable} {\c@table }\setcounter{table}{0}%
     \fi%
     \@startsection{chapter}{0}%
      {\Gost@ChapterIndent}{0mm}{\GostAfterTitleSkip}%
      {\GostTitleStyle\large\Gost@ChapterStyle}%
    }
\chapter*{�������� �����}
  \setcounter{secnumdepth}{4}
  \renewcommand\Gost@ChapterStyle{\Gost@MainChapterStyle}%
 \setlength\Gost@ChapterIndent{\Gost@MainChapterIndent}%
 % \pagestyle{fancy}
 % \fancyhf{}
 %\fancyhead[LE,RO]{\textrm{\thepage}}
 % \fancyhead[CE]{\footnotesize\uppercase{\bfseries\leftmark}}
 %\fancyhead[CO]{\small\nouppercase{\bfseries\rightmark}}
 %\fancyfoot{}
 \pagestyle{plain}
}


%  ����������, ������������
\newcommand\backmatter
{%
\newpage
 \setcounter{secnumdepth}{-1}
 \renewcommand\Gost@ChapterStyle{\Gost@IntroChapterStyle}%
 \setlength\Gost@ChapterIndent{0mm}%

%\pagestyle{fancy}
%\fancyhf{}
%\renewcommand{\leftmark}{}
%\renewcommand{\rightmark}{}
%\fancyhead[LE,RO]{\thepage}
%\fancyhead[CO]{\rightmark}
%\fancyhead[CE]{\leftmark}
%\fancyfoot{}
\pagestyle{plain}
}

%������ ����������
\newcommand\tableofcontents{\chapter*{\contentsname}\@starttoc{toc}}
\newcommand\listoffigures{\chapter*{\listfigurename}\@starttoc{lof}}
\newcommand\listoftables{\chapter*{\listtablename}\@starttoc{lot}}

\newdimen\contentlinelen
\def\@bolddottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip 3mm %\z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {\bfseries #4}\nobreak
     \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
     \vskip 2mm%\par
     }%
  \fi}

\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\hskip -\leftskip
     {\hyphenpenalty=0 #4}\nobreak
     \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
     \par}%
  \fi}

\newcommand{\l@chapter}   {\@dottedtocline{1}{0mm}{1.0em}}
\newcommand{\l@section}   {\@dottedtocline{2}{10mm}{10mm}}
\newcommand{\l@subsection}   {\@dottedtocline{3}{20mm}{15mm}}
\newcommand{\l@subsubsection}{\@dottedtocline{4}{30mm}{25mm}}
\newcommand{\l@paragraph}   {\@dottedtocline{3}{12mm}{3.1em}}
\newcommand{\l@subparagraph}{\@dottedtocline{4}{12mm}{4.1em}}
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@table {\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\@tocrmarg{2.55em} %������ ������� ���� ���������� ����������� �����
\newcommand\@dotsep{4.5}      %����� ������� � ���������� � em
\linespread{\Gost@LineSpread} %���������� ����������� ��������

\AtBeginDocument{%
 \makeatletter%
  \setlength\Gost@EqRemLen{\textwidth}%
  \addtolength\Gost@EqRemLen{-10mm}%
  \settowidth\Gost@@EqRemLen{\cyrg\cyrd\cyre}%
  \addtolength\Gost@EqRemLen{-\Gost@@EqRemLen}%
 \makeatother%
}

%������������(������ ����������) \bibname
\newdimen\bibindent
\newcommand\bibcaption{\chapter*{\MakeUppercase{\bibname}}\addcontentsline{toc}{chapter}{\bibname}}
\newenvironment{thebibliography}[1]{
 \bibcaption%
 \list{\@biblabel{\@arabic\c@enumiv.}}%
      {\settowidth\labelwidth{\@biblabel{#1}}%
       \leftmargin\labelwidth
       \advance\leftmargin\labelsep
       \@openbib@code
       \usecounter{enumiv}%
       \let\p@enumiv\@empty
       \renewcommand\theenumiv{\@arabic\c@enumiv}}%
 \sloppy\clubpenalty4000\widowpenalty4000%
 \sfcode`\.\@m
}{
 \setcounter{totalbib}{\c@enumiv}%
 \def\@noitemerr
 {\@latex@warning{Empty `thebibliography' environment}}%
 \endlist
}
\renewcommand\@biblabel{}%
\setlength\bibindent{1.5em}

%������
\def\mymakeschapterhead#1{
  \vspace*{\GostBeforTitleSkip}%
  { \parindent \GostTitleIndent 
    \raggedright
    \normalfont
    \interlinepenalty\@M
    \GostTitleStyle\large\Gost@ChapterStyle
    #1\par\nobreak
    \vskip \GostAfterTitleSkip
  }}

\newenvironment{theindex}{
                \columnseprule \z@
                \columnsep 35\p@
                \twocolumn[\mymakeschapterhead{\indexname}]%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\onecolumn}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}

%��� �������� �����
\righthyphenmin=2
\unitlength=1mm
\clubpenalty=10000
\widowpenalty=10000
%���-��, ���������� � �������� �����
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\skip\@mpfootins = \skip\footins



%defining chapter and sections:
\renewcommand\sectionmark[1]{\markright{\thechapter.\thesection\quad#1}}
\renewcommand\chaptermark[1]{\markboth{\chaptername{} \thechapter.\,#1}{}}

\@twosidetrue

\def\@makeschapterhead#1{.}

%%% Local Variables: 
%%% mode: latex
%%% TeX-master: "konspect.tex"
%%% End: 
