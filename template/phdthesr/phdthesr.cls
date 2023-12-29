%%
%% This is file `phdthesr.cls',
%%
%% Author: Dmitry S. Kulyabov
%%
%% Class: phdthesr
%% Options: a4paper+, draft, final+, leqno, fleqn, openbib ('+' default)
%% Paper size: A4
%% Margins: top 2cm, bottom 2cm, left 3cm, right 1cm
%% Type: portrait, oneside, onecolumn
%% Font size: 14pt
%% Font: Computer Modern Roman
%% With package `PSCyr' and writing in preamble lines:
%%          \usepackage{pscyr}
%%          \renewcommand{\rmdefault}{ftm}
%%       will be using font `Times New Roman'
%% Interval: 1.5
%% Page numbering: upper-right corner
%% Type numbering: all sheets, including with title page (no visible)
%% Structures:
%%   Section \chapter 1
%%   Subsection \section 1.1
%%   Subsubsection \subsection 1.1.1
%%   Subsubsubsection \subsubsection 1.1.1.1
%%
%% Environments:
%%   description (labels prints such italic)
%%   quotation
%%   quote
%%   titlepage (with no keywords like \author, etc.)
%%   appendix
%%   figure
%%   table
%%   tableofcontents
%%   listoffigures
%%   thebibliography
%%   theindex
%%
%% New commands:
%% \contentsdesc (Default value `Page', print above page list in contents
%%                Reappropriate how you want)
%%
%%

%%% ====================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{phdthesr}[2023/01/01 v0.1 PhD Thesis Class, Russian Standard]
\RequirePackage{xparse}
%%

%%
% \lineskip 1pt            % \lineskip is 1pt for all font sizes.
% \normallineskip 1pt
% \def\baselinestretch{2.0}


% For some environments we switch back to single-spacing, also
% provides \dsp in case you need double-spacing where single-spacing
% is otherwise used.
\def\ssp{\def\baselinestretch{1.0}\large\normalsize}
\def\dsp{\def\baselinestretch{1.37}\large\normalsize}

% \smallssp is used to produce tabular environments in the small font.
% This is required because single-spacing requires a change in font size.
% \scriptsizessp is a still smaller version of the same thing.

\def\smallssp{\def\baselinestretch{1.0}\large\small}
\def\scriptsizessp{\def\baselinestretch{1.0}\large\scriptsize}

% draft option (this is where the draft option is actually implemented)
%
% \overfullrule = 0pt             % Default is don't mark overfull hboxes.
% \ifnum \@draftmark = 1
%   \ssp                              % Single-spaces and
%   \overfullrule 5pt                 % causes overfull hboxes to be marked.
% \fi


% PREPARING A FOREIGN LANGUAGE VERSION:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This document style is for documents prepared in the English language.%
% To prepare a version for another language, various English words must %
% be replaced.  Many of the English words that required replacement are %
% indicated below, where we give the name of the command in which the   %
% words appear, and which must be redefined, with the actual words      %
% underlined.                                                           %
% Other English words that need replacement can be found in the macros  %
% supporting the title and approval pages.                              %
% --------------------------------------------------------------------- %
% Это было из ucthesis, а я добавил русификацию  --- А. Смолин          %
%
%
%% \tableofcontents
%\def\contentsname{Содержание}
%
% \listoffigures:
%\def\listfigurename{СПИСОК РИСУНКОВ}
%                   ~~~~~~~~~~~~~~~
%
% \listoftables:
%\def\listtablename{СПИСОК ТАБЛИЦ}
%                  ~~~~~~~~~~~~~
%
% \thebibliography:
%\def\bibname{ЛИТЕРАТУРА}
%\def\bibname{Литература}
%            ~~~~~~~~~~
%
% \theindex:
%\def\indexname{Алфавитный указатель}
%              ~~~~~~~~~~~~~~~~~~~~
%
% figure environment:
%\def\figurename{Рис.}
%               ~~~~
%
% table environment:
%\def\tablename{Таблица}
%              ~~~~~~~
%
% \chapter:
%\def\chaptername{Глава}
%                ~~~~~
% \appendix:
%\def\appendixname{Приложение}
%                 ~~~~~~~~~~
% \part
%\def\partname{Часть}
%             ~~~~~
% abstract environment:
%\def\abstractname{Аннотация}
%                 ~~~~~~~~~
%
% acknowledge environment:
%\def\acknowledgename{Благодарности автора}
%                    ~~~~~~~~~~~~~~~~~~~~~
%\def\ccname{Копия}
%\def\headtoname{К}
%\def\pagename{Страница}
%\def\seename{смотри}
%\def\alsoname{смотри также}

%% And here I try Number Sign
\def\no{N$\!\frac{\scriptscriptstyle 0}{}$}% Number sign

%% Тангенс по-русски
%\def\tan{\mathop{\operator@font tg}\nolimits}

% we define today's date in European format
%  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%\def\today{\number\day\space
%     \ifcase\month\or
%       января\or февраля\or марта\or апреля\or мая\or июня\or
%       июля\or августа\or сентября\or октября\or ноября\or декабря\fi
%     \space\number\year}

%    ****************************************
%    *             FRONT MATTER             *
%    ****************************************
%

\AtBeginDocument{%
  \@ifpackageloaded{polyglossia}{%
    \addto\captionsrussian@modern{%
      \def\contentsname{Содержание}
      }
    }{%
  }
}


% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the front matter.

% The full (unabbreviated) name of the degree

\DeclareRobustCommand{\scidegree}[1]%
{%
  \def\PHDdegree{#1}
}
\let\PHDdegree\@empty


% All previous degrees: one per line in chronological order
\def\prevdegrees#1{\gdef\@prevdegrees{#1}}

% The name of your committee's chair
% \def\chair#1{\gdef\@chair{#1}}
\DeclareRobustCommand{\chair}[1]%
{%
  \def\PHDchair{#1}
  \def\@chair{#1}
}
\let\PHDchair\@empty

\DeclareRobustCommand{\chairname}[1]%
{%
  \def\PHDchairname{#1}
}
\let\PHDchairname\@empty


% The names of your other committe members, one per line
\def\othermembers#1{\gdef\@othermembers{#1}}

% The number of committee members, which affects both the
% number of lines and the amount of space between lines
% on the approval page.
\def\@numberofmembers{3}
\def\@approvalspace{.75in}
\def\numberofmembers#1{\gdef\@numberofmembers{#1}
\ifnum \@numberofmembers > 3
\gdef\@approvalspace{.5in}
\fi}

% The name of your degree's field (e.g. Psychology, Computer Science)

\DeclareRobustCommand{\field}[1]%
{%
  \def\PHDfield{#1}
}
\let\PHDfield\@empty

% Master program

\DeclareRobustCommand{\program}[1]%
{%
  \def\PHDprogram{#1}
}
\let\PHDprogram\@empty


% The name of your institution
% (e.g. ИНСТИТУТ ФИЗИКИ ПРОЧНОСТИ И МАТЕРАЛОВЕДЕНИЯ)

\DeclareRobustCommand{\institute}[1]%
{%
  \def\PHDinstitute{#1}
}
\let\PHDinstitute\@empty

% В родительном падеже (Кого? Чего?)
\DeclareRobustCommand{\instituteGen}[1]%
{%
  \def\PHDinstituteGen{#1}
}
\let\PHDinstituteGen\@empty

% В предложном падеже (О ком? О чём?)
\DeclareRobustCommand{\institutePrep}[1]%
{%
  \def\PHDinstitutePrep{#1}
}
\let\PHDinstitutePrep\@empty

% FIXME для совместимости
\DeclareRobustCommand{\institut}[1]%
{%
  \def\PHDinstitute{#1}
}
\let\PHDinstitut\PHDinstitute

% The name of your Ministery
% (e.g. СИБИРСКОЕ ОТДЕЛЕНИЕ РАН)

\DeclareRobustCommand{\ministry}[1]%
{%
  \def\PHDministry{#1}
}
\let\PHDministry\@empty

%%
\DeclareRobustCommand{\faculty}[1]%
{%
  \def\PHDfaculty{#1}
}
\let\PHDfaculty\@empty

%%
\DeclareRobustCommand{\thesistype}[1]%
{%
  \def\PHDthesistype{#1}
}
\let\PHDthesistype\@empty

% default
% Диссертация на соискание учёной степени
\thesistype{\cyr\CYRD\cyri\cyrs\cyrs\cyre\cyrr\cyrt\cyra\cyrc\cyri\cyrya{} \cyr\cyrn\cyra{}
\cyr\cyrs\cyro\cyri\cyrs\cyrk\cyra\cyrn\cyri\cyre{} \cyr\cyru\cyrch\cyryo\cyrn\cyro\cyrishrt{}
\cyr\cyrs\cyrt\cyre\cyrp\cyre\cyrn\cyri}

%% The title of your chief

\DeclareRobustCommand{\chieftitle}[1]%
{%
  \def\PHDchieftitle{#1}
}
\let\PHDchieftitle\@empty

%% The name of your chief and his degree

\DeclareRobustCommand{\chiefdegree}[1]%
{%
  \def\PHDchiefdegree{#1}
}
\let\PHDchiefdegree\@empty

%% The name of your chief and his degree

\DeclareRobustCommand{\chief}[1]%
{%
  \def\PHDchief{#1}
}
\let\PHDchief\@empty

%% The name of your department chief and his degree

\DeclareRobustCommand{\depchieftitle}[1]%
{%
  \def\PHDdepchieftitle{#1}
}
\let\PHDdepchieftitle\@empty

%% The name of your department chief and his degree

\DeclareRobustCommand{\depchiefdegree}[1]%
{%
  \def\PHDdepchiefdegree{#1}
}
\let\PHDdepchiefdegree\@empty

%% The name of your department chief and his degree

\DeclareRobustCommand{\depchief}[1]%
{%
  \def\PHDdepchief{#1}
}
\let\PHDdepchief\@empty

%% The city where the degree will be officially conferred

\DeclareRobustCommand{\degreecity}[1]%
{%
  \def\PHDdegreecity{#1}
}
\let\PHDdegreecity\@empty

% The year when the degree will be officially conferred

\DeclareRobustCommand{\degreeyear}[1]%
{%
  \def\PHDdegreeyear{#1}
}
\let\PHDdegreeyear\@empty

%%

\DeclareRobustCommand{\discipline}[1]%
{%
  \def\PHDdiscipline{#1}
}
\let\PHDdiscipline\@empty


\DeclareRobustCommand{\title}[1]%
{%
  \def\PHDtitle{#1}
}
\let\PHDtitle\@empty

%% author
\DeclareRobustCommand{\author}[1]{%
  \def\PHDauthor{#1}
}
\let\PHDauthor\@empty

\DeclareRobustCommand{\authorshort}[1]{%
  \def\PHDauthorshort{#1}
}
\let\PHDauthorshort\@empty

\DeclareRobustCommand{\authorgen}[1]{%
  \def\PHDauthorgen{#1}
}
\let\PHDauthorgen\@empty

%% country
\DeclareRobustCommand{\country}[1]%
{%
  \def\PHDcountry{#1}
}
\let\PHDcountry\@empty

%%

\DeclareRobustCommand{\studygroup}[1]%
{%
  \def\PHDstudygroup{#1}
}
\let\PHDstudygroup\@empty

\DeclareRobustCommand{\studentid}[1]%
{%
  \def\PHDstudentid{#1}
}
\let\PHDstudentid\@empty

\DeclareRobustCommand{\studentdegree}[1]%
{%
  \def\PHDstudentdegree{#1}
}
\let\PHDstudentdegree\@empty

\DeclareRobustCommand{\thesisSubtype}[1]%
{%
  \def\PHDthesisSubtype{#1}
}
\let\PHDthesisSubtype\@empty

% Ведущая организация
\DeclareRobustCommand{\leadorg}[1]%
{%
  \def\PHDleadorg{#1}
}
\let\PHDleadorg\@empty

% The name of your opponent1 and his degree
\DeclareRobustCommand{\oppi}[1]%
{%
  \def\PHDoppi{#1}
}
\let\PHDoppi\@empty

\DeclareRobustCommand{\oppidegree}[1]%
{%
  \def\PHDoppidegree{#1}
}
\let\PHDoppidegree\@empty

% The name of your opponent2 and his degree
\DeclareRobustCommand{\oppii}[1]%
{%
  \def\PHDoppii{#1}
}
\let\PHDoppii\@empty

\DeclareRobustCommand{\oppiidegree}[1]%
{%
  \def\PHDoppiidegree{#1}
}
\let\PHDoppiidegree\@empty

% The name of your opponent3 and his degree
\DeclareRobustCommand{\oppiii}[1]%
{%
  \def\PHDoppiii{#1}
}
\let\PHDoppiii\@empty

\DeclareRobustCommand{\oppiiidegree}[1]%
{%
  \def\PHDoppiiidegree{#1}
}
\let\PHDoppiiidegree\@empty

% The name of your opponent4 and his degree
\DeclareRobustCommand{\oppiv}[1]%
{%
  \def\PHDoppiv{#1}
}
\let\PHDoppiii\@empty

\DeclareRobustCommand{\oppivdegree}[1]%
{%
  \def\PHDoppivdegree{#1}
}
\let\PHDoppivdegree\@empty

% Секретарь учёного совета и его степень (Secretary of Academic Council)
\DeclareRobustCommand{\secrac}[1]%
{%
  \def\PHDsecrac{#1}
}
\let\PHDsecrac\@empty

\DeclareRobustCommand{\secracdegree}[1]%
{%
  \def\PHDsecracdegree{#1}
}
\let\PHDsecracdegree\@empty

\DeclareRobustCommand{\secracsign}[1]%
{%
  \def\PHDsecracsign{#1}
}
\let\PHDsecracsign\@empty

% Диссертационный совет (Dissertational council)
\DeclareRobustCommand{\discouncil}[1]%
{%
  \def\PHDdiscouncil{#1}
}
\let\PHDdiscouncil\@empty

% Где написана работа
\DeclareRobustCommand{\writeIn}[1]%
{%
  \def\PHDwriteIn{#1}
}
\let\PHDwriteIn\@empty

% Где состоится защита
\DeclareRobustCommand{\thesisIn}[1]%
{%
  \def\PHDthesisIn{#1}
}
\let\PHDthesisIn\@empty

% Библиотека, где находится диссертация
\DeclareRobustCommand{\libraryIn}[1]%
{%
  \def\PHDlibraryIn{#1}
}
\let\PHDlibraryIn\@empty

% Куда присылать отзывы
\DeclareRobustCommand{\feedbackArefIn}[1]%
{%
  \def\PHDfeedbackArefIn{#1}
}
\let\PHDfeedbackArefIn\@empty

% Когда разослан автореферат (число)
\DeclareRobustCommand{\sendday}[1]%
{%
  \def\PHDsendday{#1}
}
\let\PHDsendday\@empty

% Когда разослан автореферат (месяц)
\DeclareRobustCommand{\sendmonth}[1]%
{%
  \def\PHDsendmonth{#1}
}
\let\PHDsendmonth\@empty

\DeclareRobustCommand{\zz}{\rule{8mm}{.6pt}}
\DeclareRobustCommand{\zzz}{\rule{24mm}{.6pt}}

\AtBeginDocument{%
  \makeatletter
  \@ifpackageloaded{hyperref}{%
    \hypersetup{%
      pdftitle = {\PHDtitle},
      pdfauthor={\PHDauthor}
    }
  }{}
  \makeatother
}

%%
\RequirePackage{keyval}
\RequirePackage{substr}
%%
\def\ProcessClassOptionsWithKV#1{%
  \let\@tempa\@empty
  \@for\CurrentOption:=\@classoptionslist\do{%
    \@ifundefined{KV@#1@\CurrentOption}%
    {}{\edef\@tempa{\@tempa,\CurrentOption,}}}%
  \edef\@tempa{%
    \noexpand\setkeys{#1}{\@tempa\@ptionlist{\@currname.\@currext}}}%
  \@tempa
  \AtEndOfClass{\let\@unprocessedoptions\relax}%
}
%%
\define@key{PHDthesr}{type}{%
  \def\PHDtype{#1}%
  \InputIfFileExists{phdthesr/type/#1.cli}{}{}%
}
\def\SetPHDprocKey#1{%
  \let\@tempd\@empty
  \edef\@tempd{\CurrentOption}
  \edef\@tempd{\noexpand\setkeys{#1}{\@tempd}}
  \@tempd
}
%%
\RequirePackage{xifthen}
\provideboolean{brsTableNeeded}
\setboolean{brsTableNeeded}{false}
\provideboolean{approvedStampNeeded}
\setboolean{approvedStampNeeded}{false}

%%
%%
%% begin Options
%%
%\DeclareOption{longtable}{%
%  \PassOptionsToPackage{longtable}{caption2}%
%}
%
\DeclareOption*{%
  \IfSubStringInString{=}{\CurrentOption}%
  {% then
    \SetPHDprocKey{PHDthesr}
  }%
  {% else
    % \PassOptionsToClass{\CurrentOption}{kgeneric}
    \PassOptionsToClass{\CurrentOption}{scrreprt}
  }%
}
% \PassOptionsToClass{usegeometry}{scrreprt}
% \ExecuteOptions{a4paper,14pt,oneside,onecolumn,final,openany,doublespace}
\ProcessOptions*\relax
%%
%% end Options
%%
%%
\LoadClass{scrreprt}
% \LoadClass{kgeneric}
%\LoadClassWithOptions{kgeneric}
%%
\RequirePackage{scrhack}
\RequirePackage{geometry}


% \alwayssingle and \endalwayssingle
%
% These macros define an environment for front matter that is always
% single column even in a double-column document.

\def\alwayssingle{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
     \else \newpage \fi}

\def\endalwayssingle{\if@restonecol\twocolumn \else \newpage \fi}

% \maketitle outputs the complete titlepage.  It requires all the
% above macros except \campuscap.  It is probably not correct for
% joint (e.g. UCSD/SDSU) degrees.

%\newcommand\maketitle{\begin{titlepage}%
%  \let\footnotesize\small
%  \let\footnoterule\relax
%  \let \footnote \thanks
%  \null\vfil
%  \vskip 60\p@
%  \begin{center}%
%    {\LARGE \@title \par}%
%    \vskip 3em%
%    {\large
%     \lineskip .75em%
%      \begin{tabular}[t]{c}%
%        \@author
%      \end{tabular}\par}%
%      \vskip 1.5em%
%    {\large \@date \par}%       % Set date in \large size.
%  \end{center}\par
%  \@thanks
%  \vfil\null
%  \end{titlepage}%
%  \setcounter{footnote}{0}%
%  \global\let\thanks\relax
%  \global\let\maketitle\relax
%  \global\let\@thanks\@empty
%  \global\let\@author\@empty
%  \global\let\@date\@empty
%  \global\let\@title\@empty
%  \global\let\title\relax
%  \global\let\author\relax
%  \global\let\date\relax
%  \global\let\and\relax
%}


\def\titul{
        \begin{center}
                \textsf{ \@author} \par                 % Автор
                \bigskip
                \textsf{ \@title} \par  % Название
                \bigskip
                \textsf{\small {\@field}} \par          % Специальность
                \bigskip
                \textsf{\small Диссертация на соискание уч\"еной степени } %% \par
%%"
                \textsf{\small {\@degree} наук} \par
        \end{center}
}       % End of \def\makewhat

%%%
%%% Abstract
%%%

\ExplSyntaxOn

\RequirePackage{moreverb}

\NewDocumentEnvironment { Abstract } { o } {
  \group_begin:
  % Check if abstract exist
  \file_if_exist:nT { \jobname.abs } {
    \noindent
    % { \textbf{\sffamily Abstract} } \par
  } { }
} {
  \par \group_end:
}

\RenewDocumentEnvironment { abstract } { o } {
  % \IfNoValueTF { #1 } {
  % } { \tex_gdef:D \abstracttitle { #1 } }
  \verbatimwrite{\jobname.abs}
} { \endverbatimwrite }

\NewDocumentCommand \makeabstract { } {
  % \tex_def:D \baselinestretch{1}
  \thispagestyle{empty}
  \setcounter{page}{2}
  \null\vfil
  \begin{center}
    {\bfseries \MakeUppercase{\PHDministry} \par}
    \smallskip
    {\bfseries \MakeUppercase{\PHDinstitute} \par}
  \end{center}

  \bigskip
  \bigskip
  \bigskip

  \begin{center}
    {\large\textbf{Аннотация}}\par  
    \textbf{выпускной~квалификационной~работы}\par
    
    % Автор
    \ifx\@empty\PHDauthorgen
    \else%
      \bigskip
      \PHDauthorgen
      \bigskip
    \fi
  \end{center}
  
  \noindent на~тему:~
  \PHDtitle
  \par
  \bigskip
  
  \begin{Abstract}
    % \noindent
    % \ignorespaces
    \file_if_exist:nT { \jobname.abs } { \file_input:n { \jobname.abs } }
  \end{Abstract}
  
  \vfill

  \noindent Автор~ВКР
  \hfill \rule{5cm}{0.4pt} \hfill \PHDauthor
}


\ExplSyntaxOff


% APPROVALPAGE
%
% The \approvalpage macro emits a UC-approved approval page ready for
% your committee's signature.  It is not an automatic part of the
% output because there's really no point in printing it until you are
% ready to get signatures.  It requires the the \year, \author, and
% \institut macros have been defined.  It uses lots of tricky spacing
% that is probably better handled with tabular environment code, but
% I'm too lazy to fix it. (EVM, 9/19/94)

\def\approvalpage{
\begin{alwayssingle}
\thispagestyle{empty}
\null\vfill
\begin{center}
\fmfont The dissertation of {\@author} is approved: \\
\vspace{.25in}
\vspace{\@approvalspace}
$\:\overline{~~~~ \mbox{\rule{0in}{0.16in}\small Chair%
\hspace{3.15in} Date }}\:$ \\
\vspace{\@approvalspace}
$\:\overline{~~~~ \mbox{\rule{0in}{0.16in}\small ~\hspace{3.5in} Date }}\:$ \\
\vspace{\@approvalspace}
$\:\overline{~~~~ \mbox{\rule{0in}{0.16in}\small ~\hspace{3.5in} Date }}\:$ \\
\vspace{\@approvalspace}
\ifnum \@numberofmembers > 3
$\:\overline{~~~~ \mbox{\rule{0in}{0.16in}\small ~\hspace{3.5in} Date }}\:$ \\
\vspace{\@approvalspace}
\fi
\ifnum \@numberofmembers > 4
$\:\overline{~~~~ \mbox{\rule{0in}{0.16in}\small ~\hspace{3.5in} Date }}\:$ \\
\vspace{\@approvalspace}
\fi
\ifnum \@numberofmembers > 5
$\:\overline{~~~~ \mbox{\rule{0in}{0.16in}\small ~\hspace{3.5in} Date }}\:$ \\
\vspace{\@approvalspace}
\fi
{\fmfont University of California at {\@campus}} \\
\vspace{-.25in}
\vspace{\@approvalspace}
{\fmfont \@degreeyear}
\end{center}
\vfill\null
\end{alwayssingle}
}

% COPYRIGHTPAGE
%
% While it's technically optional, you probably want a copyright page.
% This is a macro, not an environment, because it can be generated
% with the \title, \author, and \year macros.

\def\copyrightpage{
\begin{alwayssingle}
\thispagestyle{empty}
\begin{center}
{\fmfont
{\bfseries\@title}\par
\vspace{1in}
Copyright \@degreeyear\par
by\par
\@author}
\end{center}
\end{alwayssingle}}

% ABSTRACT
%
% The ABSTRACT environment allows for multi-page abstracts which,
% in accordance with UC rules, is numbered separately from the rest
% of the rest of the dissertation in Arabic.  It requires definition
% of the \title, \author, \degree, \field, \institut, and \chair macros.


% \def\abstract{
% \begin{alwayssingle}
% \pagestyle{plain}
% \thispagestyle{plain}
% % \setcounter{page}{1}
% \begin{center}
% {\fmfont
% {\bfseries \abstractname}\par
% \vspace{.5in}
% \@title\par
% \vspace{.1in}
% by\par
% \vspace{.1in}
% \@author\par
% {\@degree} in \@field\par
% \vspace{.1in}
% University of California at {\@campus}\par
% \vspace{.1in}
% {\@chair}, Chair}
% \vspace{.1in}
% \end{center}}

% \def\endabstract{\par\vfil\null\end{alwayssingle}
% }

% \def\abstractsignature{
% \hspace*{\fill}
% \begin{minipage}[t]{3.25in}
% \addtolength{\baselineskip}{-.5\baselineskip}
% \vspace{1.7cm}
% \rule{3.2in}{.5pt}\\
% \@chair\\
% Dissertation Committee Chair
% \end{minipage}}

% DEDICATION
%
% The dedication environment just makes sure the dedication gets its
% own page.

% \newenvironment{dedication}
% {\begin{alwayssingle}}
% {\end{alwayssingle}}

% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered
% "Acknowledgements" label at the top of the page.

\newenvironment{acknowledgements}
{\begin{alwayssingle}
\begin{center}
{\large \bfseries \acknowledgename}
\end{center}
}
{\end{alwayssingle}}

% FRONTMATTER environment
%
% The FRONTMATTER environment makes sure that page numbering is set
% correctly (roman, lower-case, starting at 3) for the front matter
% that follows the abstract.  It also resets page-numbering for
% the remainder of the dissertation (arabic, starting at 1).

%\newenvironment{frontmatter}
%{\setcounter{page}{3}\renewcommand{\thepage}{\roman{page}}}
%{\newpage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}


%    ****************************************
%    *                LISTS                 *
%    ****************************************
%

% ENUMERATE
%  Enumeration is done with four counters: enumi, enumii, enumiii
%  and enumiv, where enumN controls the numbering of the Nth level
%  enumeration.  The label is generated by the commands \labelenumi
%  ... \labelenumiv.  The expansion of \p@enumN\theenumN defines the
%  output of a \ref command.
%
% 16 Mar 88 -- changed defs of \labelenum... to use \theenum...

%\def\labelenumi{\theenumi.}
%\def\theenumi{\arabic{enumi}}

%\def\labelenumii{(\theenumii)}
%\def\theenumii{\alph{enumii}}
%\def\p@enumii{\theenumi}

%\def\labelenumiii{\theenumiii.}
%\def\theenumiii{\roman{enumiii}}
%\def\p@enumiii{\theenumi(\theenumii)}

%\def\labelenumiv{\theenumiv.}
%\def\theenumiv{\Alph{enumiv}}
%\def\p@enumiv{\p@enumiii\theenumiii}

% ITEMIZE
% Itemization is controlled by four commands: \labelitemi, \labelitemii,
% \labelitemiii, and \labelitemiv, which define the labels of the
% various itemization levels.

%\def\labelitemi{$\m@th\bullet$}
%\def\labelitemii{\bfseries --}
%\def\labelitemiii{$\m@th\ast$}
%\def\labelitemiv{$\m@th\cdot$}


% VERSE
%   The verse environment is defined by making clever use of the
%   list environment's parameters.  The user types \\ to end a line.
%   This is implemented by \let'in \\ equal \@centercr.
%
\def\verse{\par\let\\=\@centercr
  \list{}{\ssp\itemsep\z@ \itemindent -1.5em\listparindent \itemindent
          \rightmargin\leftmargin\advance\leftmargin 1.5em}\item[]}
\let\endverse\endlist

% QUOTATION
%   Fills lines
%   Indents paragraph
%
\def\quotation{\par\list{}{\ssp\listparindent 1.5em
    \itemindent\listparindent
    \rightmargin\leftmargin\parsep \z@ plus\p@}\item[]}
\let\endquotation=\endlist

% QUOTE -- same as quotation except no paragraph indentation,
%
\def\quote{\par\list{}{\ssp\rightmargin\leftmargin}\item[]}
\let\endquote=\endlist

% DESCRIPTION
%
%  To change the formatting of the label, you must redefine
%  \descriptionlabel.

\def\descriptionlabel#1{\hspace\labelsep \bfseries #1}
\def\description{\list{}{\labelwidth\z@ \itemindent-\leftmargin
       \let\makelabel\descriptionlabel}}

\let\enddescription\endlist

\newdimen\descriptionmargin
\descriptionmargin=3em


%    ****************************************
%    *         OTHER ENVIRONMENTS           *
%    ****************************************
%
%
% VERBATIM
%
% standard verbatim mode driver macro is modified to use
% single-spacing.  There appears to be a small problem with extra
% vertical space (1 or 2 points worth) after this environment.
% Probably, this results from returning to double-spacing before
% issuing a \parskip, but I'm not enough of TeX hacker to figure out
% the source of the problem. (EVM, 9/25/94)
% 94/11/03 BBF converted \tt to \ttfamily

\def\@verbatim{\trivlist\ssp \item[]\if@minipage\else\vskip\parskip\fi
\leftskip\@totalleftmargin\rightskip\z@
\parindent\z@\parfillskip\@flushglue\parskip\z@
%%RmS 91/08/26 Added \@@par to clear possible \parshape definition
%%from a surrounding list (the verbatim guru says)
\@@par
\@tempswafalse \def\par{\if@tempswa\hbox{}\fi\@tempswatrue\@@par
\penalty\interlinepenalty}%
\obeylines \ttfamily \catcode``=13 \@noligs \let\do\@makeother \dospecials}

% ARRAY AND TABULAR
%

\arraycolsep 5pt     % Half the space between columns in an array
                     % environment.
\tabcolsep 6pt       % Half the space between columns in a tabular
                     % environment.
\arrayrulewidth .4pt % Width of rules in array and tabular environment.
\doublerulesep 2pt   % Space between adjacent rules in array or tabular
                     % environment.

% We have to redefine array here in order to make it single-spaced.
% (Not sure if this is really necessary.)
\def\array{\let\@acol\@arrayacol \let\@classz\@arrayclassz
 \let\@classiv\@arrayclassiv \let\\\@arraycr\let\@halignto\@empty\@tabarray}

% TABBING
%
\tabbingsep \labelsep   % Space used by the \' command.
                        %  (See LaTeX manual.)

% We have to redefine tabular here in order to make it single-spaced.
\def\tabular{\par\ssp\let\@halignto\@empty\@tabular}
\expandafter \def\csname tabular*\endcsname #1%
{\par\ssp\def\@halignto{to#1}\@tabular}

% \smalltabular and \smalltabular* are alternative tabular styles
% in the \small font.  They are required because single-spacing implies a
% change of font to a particular size.
% EVM, 7/20/93
\def\smalltabular{\par\smallssp\let\@halignto\@empty\@tabular}
\def\endsmalltabular{\endtabular}
\expandafter \def\csname smalltabular*\endcsname #1%
{\par\smallssp\def\@halignto{to#1}\@tabular}
\expandafter \let \csname endsmalltabular*\endcsname = \endtabular

% \scriptsizetabular and \scriptsizetabular* are analogs of \smalltabular
\def\scriptsizetabular{\par\scriptsizessp\let\@halignto\@empty\@tabular}
\def\endscriptsizetabular{\endtabular}
\expandafter \def\csname scriptsizetabular*\endcsname #1%
{\par\scriptsizessp\def\@halignto{to#1}\@tabular}
\expandafter \let \csname endscriptsizetabular*\endcsname = \endtabular

% MINIPAGE
%  \@minipagerestore is called upon entry to a minipage environment to
%  set up things that are to be handled differently inside a minipage
%  environment. In the current styles, it does nothing.
%
% \skip\@mpfootins : plays same role for footnotes in a minipage as
%                    \skip\footins does for ordinary footnotes

\skip\@mpfootins = \skip\footins

% FRAMEBOX
%
\fboxsep = 3pt    % Space left between box and text by \fbox and
                  % \framebox.
\fboxrule = .4pt  % Width of rules in box made by \fbox and \framebox.


%    ****************************************
%    *        CHAPTERS AND SECTIONS         *
%    ****************************************
%
% DEFINE COUNTERS:
%
% \newcounter{NEWCTR}[OLDCTR] : Defines NEWCTR to be a counter, which is
%                               reset to zero when counter OLDCTR is
%                               stepped.
%                               Counter OLDCTR must already be defined.


%%
%% Titles
%%

\providecommand{\DivFontShape}{\bfseries}
\providecommand{\DivFontSize}{}
\providecommand{\DivPosition}{}
%%
\providecommand{\partFontShape}{\DivFontShape}
\providecommand{\partFontSize}{\huge}
\providecommand{\partPosition}{}
%%
\providecommand{\chapterFontShape}{\DivFontShape}
\providecommand{\chapterFontSize}{\Large}
\providecommand{\chapterPosition}{}
%%
\providecommand{\sectionFontShape}{\DivFontShape}
\providecommand{\sectionFontSize}{\large}
\providecommand{\sectionPosition}{\center}
%%
\providecommand{\subsectionFontShape}{\DivFontShape}
\providecommand{\subsectionFontSize}{\large}
\providecommand{\subsectionPosition}{\center}
%%
\providecommand{\subsubsectionFontShape}{\DivFontShape}
\providecommand{\subsubsectionFontSize}{\normalsize}
\providecommand{\subsubsectionPosition}{\center}
%%
\providecommand{\paragraphFontShape}{\DivFontShape}
\providecommand{\paragraphFontSize}{\normalsize}
\providecommand{\paragraphPosition}{}
%%
\providecommand{\subparagraphFontShape}{\DivFontShape}
\providecommand{\subparagraphFontSize}{\normalsize}
\providecommand{\subparagraphPosition}{}
%%
\providecommand{\contentsnameFontShape}{\DivFontShape}
\providecommand{\contentsnameFontSize}{\Large}
\providecommand{\contentsnamePosition}{\flushleft}
%%%
%%%

%%
%% Fonts
%%
%\renewcommand{\chapterFontShape}{\scshape}
\renewcommand{\chapterFontSize}{\Large}
\renewcommand{\chapterPosition}{\center}
%
%\renewcommand{\sectionFontShape}{\scshape}
\renewcommand{\sectionFontSize}{\large}
\renewcommand{\sectionPosition}{\center}
%
%\renewcommand{\subsectionFontShape}{\scshape}
\renewcommand{\subsectionFontSize}{\normalsize}
\renewcommand{\subsectionPosition}{\center}
%
%\renewcommand{\subsubsectionFontShape}{\scshape}
\renewcommand{\subsubsectionFontSize}{\normalsize}
\renewcommand{\subsubsectionPosition}{\center}
%
%\renewcommand{\paragraphFontShape}{\scshape}
\renewcommand{\paragraphFontSize}{\normalsize}
%
%\renewcommand{\subparagraphFontShape}{\scshape}
\renewcommand{\subparagraphFontSize}{\normalsize}
%%
%%

\RequirePackage{titlesec}

\titleformat{\chapter}[block]%
{\normalfont\chapterPosition\chapterFontSize\chapterFontShape}{\chaptertitlename~\thechapter.}{1em}{\chapterFontSize}
% {\normalfont\chapterPosition\chapterFontSize\chapterFontShape}{\chaptertitlename~\thechapter.}{0.8\baselineskip}{\chapterFontSize}
\titleformat{\section}[block]%
    {\normalfont\sectionPosition\sectionFontSize\sectionFontShape}{\thesection.}{1em}{}
\titleformat{\subsection}[block]%
    {\normalfont\subsectionFontSize\subsectionFontShape}{\thesubsection.}{1em}{}
\titleformat{\subsubsection}[block]%
    {\normalfont\subsubsectionPosition\subsubsectionFontSize\subsubsectionFontShape}{\thesubsubsection.}{1em}{}
\titleformat{\paragraph}[runin]%
    {\normalfont\paragraphFontSize\paragraphFontShape}{\theparagraph.}{1em}{}
\titleformat{\subparagraph}[runin]%
    {\normalfont\subparagraphFontSize\subparagraphFontShape}{\thesubparagraph.}{1em}{}

%% Spacing

%\titlespacing*{\chapter}%
%    {\z@}%
%    {\z@}
%    {\ttl@chapafter}

\titlespacing*{\chapter}      {\z@}{-50pt}{\baselineskip}
\titlespacing*{\section}      {0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
\titlespacing*{\subsection}   {0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
\titlespacing*{\subsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
\titlespacing*{\paragraph}    {0pt}{3.25ex plus 1ex minus .2ex}{1em}
\titlespacing*{\subparagraph} {\parindent}{3.25ex plus 1ex minus .2ex}{1em}


% For any counter CTR, \theCTR is a macro that defines the printed
% version of counter CTR.  It is defined in terms of the following
% macros:
%
%  \arabic{COUNTER} : The value of COUNTER printed as an arabic numeral.
%  \roman{COUNTER}  : Its value printed as a lower-case roman numberal.
%  \Roman{COUNTER}  : Its value printed as an upper-case roman numberal.
%  \alph{COUNTER}   : Value of COUNTER printed as a lower-case letter:
%                         1 = a, 2 = b, etc.
%  \Alph{COUNTER}   : Value of COUNTER printed as an upper-case letter:
%                           1 = A, 2 = B, etc.
%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        PART                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%    ****************************************
%    *         TABLE OF CONTENTS, ETC.      *
%    ****************************************
%
% A \subsection command writes a
%       \contentsline{subsection}{TITLE}{PAGE}
% command on the .toc file, where TITLE contains the contents of the
% entry and PAGE is the page number.  If subsections are being numbered,
% then TITLE will be of the form
%       \numberline{NUM}{HEADING}
% where NUM is the number produced by \thesubsection.  Other sectioning
% commands work similarly.
%
% A \caption command in a 'figure' environment writes
%    \contentsline{figure}{\numberline{NUM}{CAPTION}}{PAGE}
% on the .lof file, where NUM is the number produced by \thefigure and
% CAPTION is the figure caption.  It works similarly for a 'table'
% environment.
%
% The command \contentsline{NAME} expands to \l@NAME.  So, to specify
% the table of contents, we must define \l@chapter, \l@section,
% \l@subsection, ... ; to specify the list of figures, we must define
% \l@figure; and so on.  Most of these can be defined with the
% \@dottedtocline command, which works as follows.
%
% \@dottedtocline{LEVEL}{INDENT}{NUMWIDTH}{TITLE}{PAGE}
%    LEVEL    : An entry is produced only if LEVEL < or = value of
%               'tocdepth' counter.  Note, \chapter is level 0, \section
%               is level 1, etc.
%    INDENT   : The indentation from the outer left margin of the start
%               of the contents line.
%    NUMWIDTH : The width of a box in which the section number is to go,
%               if TITLE includes a \numberline command.
%
% This command uses the following three parameters, which are set
% with a \def (so em's can be used to make them depend upon the font).
%   \@pnumwidth : The width of a box in which the page number is put.
%   \@tocrmarg  : The right margin for multiple line entries.  One
%                 wants \@tocrmarg > or = \@pnumwidth
%   \@dotsep    : Separation between dots, in mu units.  Should be
%                 \def'd to a number like 2 or 1.7

\KOMAoptions{toc=chapterentrydotfill}
\addtokomafont{chapterentrypagenumber}{\normalfont\chapterFontShape}

% \RequirePackage{tocloft}
\RequirePackage[titletoc]{appendix}

% \def\@pnumwidth{1.55em}
% \def\@tocrmarg {2.55em}
% \def\@dotsep{4.5}
\setcounter{tocdepth}{2}


% TABLEOFCONTENTS
%  In ucthesis style, \tableofcontents, \listoffigures, etc. are always
%  set in single-column style.  @restonecol

%\def\tableofcontents{\@restonecolfalse
%  \if@twocolumn\@restonecoltrue\onecolumn\fi
%  \chapter*{\uppercase{\contentsname}
%%%        \@mkboth{\uppercase{\contentsname}}{\uppercase{\contentsname}}
%        \@mkboth{}{}}%
%  {\@starttoc{toc}}\if@restonecol\twocolumn\fi}
%%%%  {\ssp\@starttoc{toc}}\if@restonecol\twocolumn\fi}

%\def\l@part#1#2{\addpenalty{-\@highpenalty}%
%%%   \addvspace{2.25em plus\p@}% space above part line
%   \begingroup
%   \@tempdima 3em         % width of box holding part number, used by
%     \parindent \z@ \rightskip \@pnumwidth             %% \numberline
%     \parfillskip -\@pnumwidth
%     {\large \bfseries          % set line in \large boldface
%     \leavevmode          % TeX command to enter horizontal mode.
%     #1\hfil \hbox to\@pnumwidth{\hss #2}}\par
%     \nobreak             % Never break after part entry
%    \global\@nobreaktrue                        %% Added 24 May 89 as
%    \everypar{\global\@nobreakfalse\everypar{}}%% suggested by
%                                               %% Jerry Leichter
%   \endgroup}

%% First line of l@chapter changed 24 May 89, as suggested
%% by Jerry Leichter.
%%
%\def\l@chapter#1#2{\addpenalty{-\@highpenalty}%
%   \vskip 1.0em plus\p@   % space above chapter line
%   \@tempdima 1.5em       % width of box holding chapter number
%   \begingroup
%     \parindent \z@ \rightskip \@pnumwidth
%     \parfillskip -\@pnumwidth
%%     \bfseries                  % Boldface.
%     \large \bfseries                  % Boldface.
%     \leavevmode          % TeX command to enter horizontal mode.
%      \advance\leftskip\@tempdima  %% added 5 Feb 88 to conform to
%      \hskip -\leftskip            %% 25 Jan 88 change to \numberline
%     #1\nobreak\hfil \nobreak\hbox to\@pnumwidth{\hss #2}\par
%     \penalty\@highpenalty %% added 24 May 89, suggested by J. Leichter
%   \endgroup}

%\def\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
%\def\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
%\def\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
%\def\l@paragraph{\@dottedtocline{4}{10em}{5em}}
%\def\l@subparagraph{\@dottedtocline{5}{12em}{6em}}

%% FEXME need move to kermit bundle

% \RequirePackage{titletoc}

%\titlecontents{chapter}[0pt]%
%{\vspace{1ex minus .1ex}}%
%{\thecontentslabel.\quad}%
%{}%
%{\titlerule*[1pc]{.}\contentspage}

% \titlecontents{chapter}[0pt]%
% {\vspace{1ex minus .1ex}\chapterFontShape}%
% {\chaptertitlename\space\thecontentslabel.\quad}%
% {}%
% {\titlerule*[1pc]{.}\contentspage}

% \titlecontents{section}[1pc]%
% {}%
% {\thecontentslabel.\quad}%
% {..}%
% {\titlerule*[1pc]{.}\contentspage}

% \RequirePackage{tocloft}

% \renewcommand{\@cftmaketoctitle}{%
%   \addpenalty\@secpenalty
% %  \if@cfthaschapter
% %    \vspace*{\cftbeforetoctitleskip}
% %  \else
% %    \vspace{\cftbeforetoctitleskip}
% %  \fi
%   \@cftpagestyle
%   {\interlinepenalty\@M
% %  {\cfttoctitlefont\contentsname}
%   \chapter*{\contentsname}
%   {\cftaftertoctitle}
%   \cftmarktoc
%   \par\nobreak
% %  \vskip \cftaftertoctitleskip
%   \@afterheading}}

% \renewcommand{\cftchapfont}{\normalfont}
% \renewcommand{\cftchappagefont}{\normalfont}
% \renewcommand{\cftchapdotsep}{\cftdotsep}

% \renewcommand{\cftchapaftersnum}{.}
% \renewcommand{\cftsecaftersnum}{.}
% \renewcommand{\cftsubsecaftersnum}{.}


%
% LIST OF FIGURES
%
% Single-space list of figures, add it to the table of contents.
\def\listoffigures{\@restonecolfalse
  \if@twocolumn\@restonecoltrue\onecolumn\fi
  \chapter*{\listfigurename\@mkboth{\uppercase{\listfigurename}}%
{\uppercase{\listfigurename}}}
   \addcontentsline{toc}{chapter}{\listfigurename}
   {\ssp\@starttoc{lof}}\if@restonecol
    \twocolumn\fi}

\def\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}

% LIST OF TABLES
%
\def\listoftables{\@restonecolfalse
  \if@twocolumn\@restonecoltrue\onecolumn\fi
  \chapter*{\listtablename\@mkboth{\uppercase{\listtablename}}%
   {\uppercase{\listtablename}}}\@starttoc{lot}\if@restonecol
  \twocolumn\fi}
\def\listoftables{\@restonecolfalse
  \if@twocolumn\@restonecoltrue\onecolumn\fi
  \chapter*{\listtablename\@mkboth{\uppercase{\listtablename}}%
{\uppercase{\listtablename}}}
   \addcontentsline{toc}{chapter}{\listtablename}
   {\ssp\@starttoc{lot}}\if@restonecol
  \twocolumn\fi}


\let\l@table\l@figure


%    ****************************************
%    *             BIBLIOGRAPHY             *
%    ****************************************
%
% The thebibliography environment executes the following commands:
%
%  \def\newblock{\hskip .11em plus .33em minus .07em} --
%      Defines the `closed' format, where the blocks (major units of
%      information) of an entry run together.
%
%  \sloppy  -- Used because it's rather hard to do line breaks in
%      bibliographies,
%
%  \sfcode`\.=1000\relax --
%      Causes a `.' (period) not toproduce an end-of-sentence space.

%% RmS 91/10/27 [ .. ] replaced by \@biblabel{ .. }
%% RmS 91/11/13: Changed counter enumi to enumiv,
%%               as it says in the comment in latex.tex
%% RmS 92/01/14: Set \p@enumiv to {} and \theenumiv to \arabic{enumiv}
%%               to get correct references
\def\thebibliography#1{\chapter*{\bibname\@mkboth
  {\uppercase{\bibname}}{\uppercase{\bibname}}}
  \addcontentsline{toc}{chapter}{\bibname}
  \list{\@biblabel{\arabic{enumiv}}}{\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \def\theenumiv{\arabic{enumiv}}}%
    \def\newblock{\hskip .11em plus.33em minus.07em}%
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=\@m}


%% 91/08/26 FMI & RmS: introduced warning instead of error

\def\endthebibliography{%
  \def\@noitemerr{\@warning{Empty `thebibliography' environment}}%
  \endlist}


% \def\@biblabel#1{[#1]\hfill}  % Produces the label for a \bibitem[...]
                                % command.
\def\@biblabel#1{#1.\hfill}   % Produces the label for a \bibitem as NN.
% \def\@cite#1{[#1]}            % Produces the output of the \cite
                                % command.



%    ****************************************
%    *              THE INDEX               *
%    ****************************************
%
% THE THEINDEX ENVIRONMENT
% Produces double column format, with each paragraph a separate entry.
% The user commands \item, \subitem and \subsubitem are used to
% produce the entries, and \indexspace adds an extra vertical space
% that's the right size to put above the first entry with a new letter
% of the alphabet.

\newif\if@restonecol

\def\theindex{\@restonecoltrue\if@twocolumn\@restonecolfalse\fi
\columnseprule \z@
\columnsep 35\p@\twocolumn[\@makeschapterhead{\indexname}]%
    \@mkboth{\uppercase{\indexname}}{\uppercase{\indexname}}%
    \thispagestyle{plain}\parindent\z@
    \parskip\z@ plus .3\p@\relax\let\item\@idxitem}

\def\@idxitem{\par\hangindent 40\p@}

\def\subitem{\par\hangindent 40\p@ \hspace*{20\p@}}

\def\subsubitem{\par\hangindent 40\p@ \hspace*{30\p@}}

\def\endtheindex{\if@restonecol\onecolumn\else\clearpage\fi}

\def\indexspace{\par \vskip 10\p@ plus5\p@ minus3\p@\relax}


%    ****************************************
%    *             FOOTNOTES                *
%    ****************************************
%
% \footnoterule is a macro to draw the rule separating the footnotes
% from the text.  It should take zero vertical space, so it needs a
% negative skip to compensate for any positive space taken by the rule.
% (See PLAIN.TEX.)

\def\footnoterule{\kern-3\p@
  \hrule width .4\columnwidth
  \kern 2.6\p@}                 % The \hrule has default height of .4pt.

% \newcounter{footnote}
\@addtoreset{footnote}{chapter}  % Numbers footnotes within chapters

%   \@makefntext{NOTE} :
%        Must produce the actual footnote, using \@thefnmark as the mark
%        of the footnote and NOTE as the text.  It is called when
%        effectively inside a \parbox of width \columnwidth (i.e., with
%        \hsize = \columnwidth).
%
%        The following macro indents all lines of the footnote by 10pt,
%        and indents the first line of a new paragraph by 1em.  To
%        change these dimensions, just substitute the desired value for
%        '10pt' [in both places] or '1em'.  The mark is flushright
%        against the footnote.
%          \long\def\@makefntext#1{\@setpar{\@@par\@tempdima \hsize
%             \advance\@tempdima-10pt\parshape \@ne 10pt \@tempdima}\par
%             \parindent 1em\noindent
%             \hbox to \z@{\hss$\m@th^{\@thefnmark}$}#1}
%
%        A simpler macro is used, in which the footnote text is
%        set like an ordinary text paragraph, with no indentation except
%        on the first line of a paragraph, and the first line of the
%        footnote.  Thus, all the macro must do is set \parindent
%        to the appropriate value for succeeding paragraphs and put the
%        proper indentation before mark.

\long\def\@makefntext#1{\parindent 1em\noindent
            \hbox to 1.8em{\hss$\m@th^{\@thefnmark}$}#1}

% \@makefnmark : A macro to generate the footnote marker that goes
%    in the text.  Default used.
%


% Single-space footnotes.
\long\def\@footnotetext#1{\insert\footins{\ssp\reset@font\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
   \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
    {\rule{\z@}{\footnotesep}\ignorespaces
      #1\strut}}}

%    ****************************************
%    *         FIGURES AND TABLES           *
%    ****************************************
%
% Float placement parameters.  See LaTeX manual for their definition.
%
\setcounter{topnumber}{2}
\def\topfraction{.7}
\setcounter{bottomnumber}{1}
\def\bottomfraction{.3}
\setcounter{totalnumber}{3}
\def\textfraction{.2}
\def\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\def\dbltopfraction{.7}
\def\dblfloatpagefraction{.5}

% \@makecaption{NUMBER}{TEXT} : Macro to make a figure or table caption.
%      NUMBER : Figure or table number--e.g., 'Figure 3.2'
%      TEXT   : The caption text.
%  Macro should be called inside a \parbox of right width, with
%  \normalsize.
% changed 25 Jun 86 to fix according to Howard Trickey:
% instead of \unhbox\@tempboxa\par we do #1: #2\par

% 15 Nov 93: further changes to support captions BEFORE the figure
% or table.  Changes suggested by Donald Arseneau, installed by Ethan
% Munson.  Detailed reasons are:
%       The \unhbox allows \vadjust material (\vspace) to get out;
%       the \vbox to\topskip{} is for captions at the top of top-floats;
%       the \ifdim is for captions above the figure or table;
%       the strut is for tables below the caption.

\long\def\@makecaption#1#2{% Add space only if something is ...
   \par\ifdim\prevdepth>-\p@ \vskip 10\p@\relax \fi % above the caption
%%   \setbox\@tempboxa\hbox{\vbox to\topskip{}#1: #2\unskip\strut}%
   \setbox\@tempboxa\hbox{\vbox to\topskip{}#1. #2\unskip\strut}%
   \ifdim \wd\@tempboxa >\hsize      % IF longer than one line:
%%       {\ssp#1: #2\unskip\strut\par} %   THEN set as ordinary paragraph.
       {#1. #2\unskip\strut\par} %  ASMOLIN.
     \else                           %   ELSE  center.
       \hbox to\hsize{\hfil\unhbox\@tempboxa\hfil}%
   \fi}

% To define a float of type TYPE (e.g., TYPE = figure), the document
% style must define the following.
%
%  \fps@TYPE   : The default placement specifier for floats of type
%                TYPE.
%
% \ftype@TYPE : The type number for floats of type TYPE.  Each TYPE
%                has associated a unique positive TYPE NUMBER, which
%                is a power of two.  E.g., figures might have type
%                number 1, tables type number 2, programs type number
%                4, etc.
%
% \ext@TYPE : The file extension indicating the file on which the
%                contents list for float type TYPE is stored.  For
%                example, \ext@figure = 'lof'.
%
%  \fnum@TYPE  : A macro to generate the figure number for a caption.
%                For example, \fnum@TYPE == Figure \thefigure.
%
%  The actual float-making environment commands--e.g., the commands
%  \figure and \endfigure--are defined in terms of the macros \@float
%  and \end@float, which are described below.
%
% \@float{TYPE}[PLACEMENT] : Macro to begin a float environment for a
%     single-column float of type TYPE with PLACEMENT as the placement
%     specifier.  The default value of PLACEMENT is defined by
%     \fps@TYPE.  The environment is ended by \end@float.  E.g.,
%     \figure == \@float{figure}, \endfigure == \end@float.


% FIGURE

% \newcounter{figure}[chapter]
% \def\thefigure{\thechapter.\@arabic\c@figure}
\@addtoreset{figure}{chapter}

% \def\fps@figure{tbp}
% \def\ftype@figure{1}
% \def\ext@figure{lof}
% \def\fnum@figure{\figurename~\thefigure}
% \def\figure{\@float{figure}}
% \let\endfigure\end@float
% \@namedef{figure*}{\@dblfloat{figure}}
% \@namedef{endfigure*}{\end@dblfloat}

% % TABLE
% %
% \newcounter{table}[chapter]
% \def\thetable{\thechapter.\@arabic\c@table}
\@addtoreset{table}{chapter}

% \def\fps@table{tbp}
% \def\ftype@table{2}
% \def\ext@table{lot}
% \def\fnum@table{\tablename~\thetable}
% \def\table{\@float{table}}
% \let\endtable\end@float
% \@namedef{table*}{\@dblfloat{table}}
% \@namedef{endtable*}{\end@dblfloat}


%    ****************************************
%    *            PAGE STYLES               *
%    ****************************************
%
% The page style 'foo' is defined by defining the command \ps@foo.  This
% command should make only local definitions.  There should be no stray
% spaces in the definition, since they could lead to mysterious extra
% spaces in the output.
%
% The \ps@... command defines the macros \@oddhead, \@oddfoot,
% \@evenhead, and \@evenfoot to define the running heads and
% feet---e.g., \@oddhead is the macro to produce the contents of the
% heading box for odd-numbered pages.  It is called inside an \hbox of
% width \textwidth.
%
% To make headings determined by the sectioning commands, the page style
% defines the commands \chaptermark, \sectionmark, ... , where
% \chaptermark{TEXT} is called by \chapter to set a mark, and so on.
% The \...mark commands and the \...head macros are defined with the
% help of the following macros.  (All the \...mark commands should be
% initialized to no-ops.)
%
% MARKING CONVENTIONS:
% LaTeX extends TeX's \mark facility by producing two kinds of marks
% a 'left' and a 'right' mark, using the following commands:
%     \markboth{LEFT}{RIGHT} : Adds both marks.
%     \markright{RIGHT}      : Adds a 'right' mark.
%     \leftmark  : Used in the \@oddhead, \@oddfoot, \@evenhead or
%                  \@evenfoot macro, gets the current 'left' mark.
%                  Works like TeX's \botmark command.
%     \rightmark : Used in the \@oddhead, \@oddfoot, \@evenhead or
%                  \@evenfoot macro, gets the current 'right' mark.
%                  Works like TeX's \firstmark command.
% The marking commands work reasonably well for right marks 'numbered
% within' left marks--e.g., the left mark is changed by a \chapter
% command and the right mark is changed by a \section command.  However,
% it does produce somewhat anomalous results if two \bothmark's occur on
% the same page.
%
%
% Commands like \tableofcontents that should set the marks in some
% page styles use a \@mkboth command, which is \let by the pagestyle
% command (\ps@...)  to \markboth for setting the heading or
% \@gobbletwo to do nothing.

\mark{{}{}}   % Initializes TeX's marks

% \ps@empty defined in LATEX.TEX

% Definition of 'headings' page style
%  Note the use of ##1 for parameter of \def\chaptermark inside the
%  \def\ps@headings.
%
% 91/03/26 FMi: Added extra set of braces arround |\sl| in |\@oddhead|
% to support NFSS (|\sl| is a shape |\rm| a family). Also remove
% unnecessary |\hbox{}| commands.
%
% 94/11/3 BBF: Eliminated two letter font selection commands \rm and \sl
% in favor of \rmfamily and \slshape.
%


% Definition of 'plain' page style.
%
\def\ps@plain{\let\@mkboth\markboth
\def\@oddfoot{}\def\@evenfoot{}                         % no feet
\def\@oddhead{\hfil \small\rmfamily\thepage \hfil}        % heading (right)
\def\@evenhead{\hfil \small\rmfamily\thepage \hfil}}      % heading (left)
%\def\@oddhead{\hbox{}\hfil\rmfamily\thepage}           % heading (right)
%\def\@evenhead{\rmfamily\thepage\hfil\hbox{}}}         % heading (left)


\providecommand{\headerFontSize}{\footnotesize}

\RequirePackage{fancyhdr}%

\renewcommand{\headrulewidth}{\z@}

% \AtBeginDocument{%
\AtEndOfClass{%
\pagestyle{fancy}
\fancyhead{}%
\fancyfoot{}%
\fancyhead[C]{\headerFontSize\thepage}%
\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyfoot{}
  \fancyfoot{}
  \fancyhead[C]{\headerFontSize\thepage}
}
% \geometry{nofoot}
% \fancyfoot[C]{\headerFontSize\thepage}%
}


%    ****************************************
%    *            MISCELLANEOUS             *
%    ****************************************
%
% DATE
%
%\def\today{\ifcase\month\or
%  January\or February\or March\or April\or May\or June\or
%  July\or August\or September\or October\or November\or December\fi
%  \space\number\day, \number\year}
% we define today's date in European format
\def\today{\number\day\space
     \ifcase\month\or
       января\or февраля\or марта\or апреля\or мая\or июня\or
       июля\or августа\or сентября\or октября\or ноября\or декабря\fi
     \space\number\year}

% EQUATION and EQNARRAY -- put here because it must follow \chapter
% definition
%
% \newcounter{equation}
%
\@addtoreset{equation}{chapter}   % Makes \chapter reset 'equation'
                                  % counter.

\def\theequation{\thechapter.\arabic{equation}}

% \jot = 3pt      % Extra space added between lines of an eqnarray
                  % environment

% The macro \@eqnnum defines how equation numbers are to appear in
% equations.
%
% \def\@eqnnum{(\theequation)}

%%%
%%% Captions
%%%

% \InputIfFileExists{gost/caption.cli}{}{}

%%%
%%% Captions
%%%

\RequirePackage{caption}

\captionsetup{font={small}}
\captionsetup{textfont={bf},labelfont={bf}}

% \DeclareCaptionFormat{tableRight}{\hfill#1\newline#2#3\par}
\DeclareCaptionFormat{gost1.5}{\hfill#1\newline#2#3\par}

\captionsetup[figure]{labelsep=period,position=bottom,justification=centering}

% \captionsetup[table]{format=tableRight,labelsep=none,position=top}
\captionsetup[table]{format=gost1.5,labelsep=none,position=top,justification=centering}

%\AtBeginDocument{%
% \RequirePackage{floatrow}
%\makeatletter
%\@ifpackageloaded{floatrow}{%
%    \floatsetup[table]{style=Plaintop}
%    }{}
%\makeatother
%}


%%%
%%% Theorems
%%%

% \InputIfFileExists{kermit/theorem.cli}{}{}

% ********************************************************
% * Чтобы при include не начинал новую страницу A.Smolin *
%
% \def\include#1{\relax
%   \ifnum\@auxout=\@partaux
%     \@latex@error{\string\include\space cannot be nested}\@eha
%   \else \@include#1 \fi}
% \def\@include#1 {%
% %%  \clearpage
%   \if@filesw
%     \immediate\write\@mainaux{\string\@input{#1.aux}}%
%   \fi
%   \@tempswatrue
%   \if@partsw
%     \@tempswafalse
%     \edef\reserved@b{#1}%
%     \@for\reserved@a:=\@partlist\do
%       {\ifx\reserved@a\reserved@b\@tempswatrue\fi}%
%   \fi
%   \if@tempswa
%     \let\@auxout\@partaux
%     \if@filesw
%       \immediate\openout\@partaux #1.aux
%       \immediate\write\@partaux{\relax}%
%     \fi
%     \@input@{#1.tex}%
% %%   \clearpage
%     \@writeckpt{#1}%
%     \if@filesw
%       \immediate\closeout\@partaux
%     \fi
%   \else
%     \@nameuse{cp@#1}%
%   \fi
%   \let\@auxout\@mainaux%
% }%% END OF\def\@include#1 %%

%%%
%%% Titlepage
%%%

\ExplSyntaxOn
\ExplSyntaxOff


% \AtBeginDocument{%
%\AtEndOfClass{%
%\geometry{left=20mm,right=15mm,top=20mm,bottom=20mm}
% \geometry{bindingoffset=10mm}
%\geometry{marginparwidth=0dd,marginparsep=0dd}
%}

% ,headsep=0dd

%
%    *************************************************
%    * Here I try to make Citation as /1-4/ A.Smolin *
%
%%
%% Here I try to make Citation as /1-4/ A.Smolin
\def\printcitestart{[}%         left bracket    -       will be My
\def\printcitefinish{]}%        right bracket   -       will be My
%%% from eplain.tex
% \def\printcitestart{[}%         left bracket
% \def\printcitefinish{]}%        right bracket
% \def\printbetweencitations{, }% comma, space
% \def\printcitenote#1{, #1}%     comma, space, note (if it exists)
% \let\citation = \@gobble
% \def\cite{\@getoptionalarg\@cite}%
% \def\@cite#1{%
%    \let\@citenotetext = \@optionalarg
%    \printcitestart
%    \nocite{#1}%
%    \@notfirstcitationfalse
%    \@for \@citation :=#1\do
%    {%
%      \expandafter\@onecitation\@citation\@@
%    }%
%    \ifx\empty\@citenotetext\else
%       \printcitenote{\@citenotetext}%
%    \fi
%    \printcitefinish
% }%
% \def\@onecitation#1\@@{%
%    \if@notfirstcitation
%       \printbetweencitations
%    \fi
%    \expandafter \ifx \csname\@citelabel{#1}\endcsname \relax
%       \if@citewarning
%          \message{\@linenumber Undefined citation `#1'.}%
%       \fi
%       \expandafter\gdef\csname\@citelabel{#1}\endcsname{%
%          {\tt
%             \escapechar = -1
%             \nobreak\hskip0pt
%             \expandafter\string\csname#1\endcsname
%             \nobreak\hskip0pt
%          }%
%       }%
%    \fi
%    \csname\@citelabel{#1}\endcsname
%    \@notfirstcitationtrue
% }%
% \def\@citelabel#1{b@#1}%
% \def\@citedef#1#2{\expandafter\gdef\csname\@citelabel{#1}\endcsname{#2}}%
%%% END of "from eplain.tex"
%
%%% from latex.ltx
%   ~~~~~~~~~~~~~~
%\DeclareRobustCommand\cite{%
%       \@ifnextchar [{\@tempswatrue\@citex}{\@tempswafalse\@citex[]}
%}%
%\def\@citex[#1]#2{%
%       \let\@citea\@empty
%       \@cite{\@for\@citeb:=#2\do
%                       {\@citea\def\@citea{,\penalty\@m\ }%
%                       \edef\@citeb{\expandafter\@firstofone\@citeb}%
%                       \if@filesw\immediate\write\@auxout{\string\citation{\@citeb}}\fi
%                       \@ifundefined{b@\@citeb}{\mbox{\reset@font\bfseries ?}%
%                               \G@refundefinedtrue
%                               \@latex@warning
%                                {Citation Вот `\@citeb' on page \thepage \space undefined}}%
%                       {\hbox{\csname b@\@citeb\endcsname}}}}{#1}}% def
%\expandafter\let\csname b@*\endcsname\@empty
%\def\@cite#1#2{\printcitestart{#1\if@tempswa , #2\fi}\printcitefinish}
\def\@cite#1#2{\printcitestart{#1\if@tempswa , #2\fi}\printcitefinish}
% END of "from latex.ltx"
% \DeclareRobustCommand\batchcite{%
%         \@ifnextchar [{\@tempswatrue\@batchcitex}{\@tempswafalse\@batchcitex[]}
% }%
% \def\@batchcitex[#1]#2{%
%         \let\@batchcitea\@empty
%         \@batchcite{\@for\@batchciteb:=#2\do
%                         {\@batchcitea\def\@batchcitea{~--\penalty\@m\ }%
%                         \edef\@batchciteb{\expandafter\@firstofone\@batchciteb}%
%                         \if@filesw\immediate\write\@auxout{\string\citation{\@batchciteb}}\fi
%                         \@ifundefined{b@\@batchciteb}{\mbox{\reset@font\bfseries ?}%
%                                 \G@refundefinedtrue
%                                 \@latex@warning
% {Пакетная ссылка `\@batchciteb' на странице \thepage \space неопределна}}%
%                         {\hbox{\csname b@\@batchciteb\endcsname}}}}{#1}}% def
% %\expandafter\let\csname b@*\endcsname\@empty
% \def\@batchcite#1#2{\printcitestart{#1\if@tempswa , #2\fi}\printcitefinish}
%%
%% Неудачная подмена \nocite !!!!
% \DeclareRobustCommand\hiddencite{%
%         \@ifnextchar [{\@tempswatrue\@hiddencitex}{\@tempswafalse\@hiddencitex[]}
% }%
% \def\@hiddencitex[#1]#2{%
%         \let\@hiddencitea\@empty
%         \@hiddencite{\@for\@hiddenciteb:=#2\do{%                        \edef\@hiddenciteb{\expandafter\@firstofone\@hiddenciteb}%
%                         \if@filesw\immediate\write\@auxout{\string\citation{\@hiddenciteb}}\fi
%                         \@ifundefined{b@\@hiddenciteb}{\mbox{\reset@font\bfseries ?}%
%                                 \G@refundefinedtrue
%                                 \@latex@warning
% {Скрытая ссылка `\@hiddenciteb' на странице \thepage \space неопределна}}%
%                         }}{#1}}
% \expandafter\let\csname b@*\endcsname\@empty
% \def\@hiddencite#1#2{{#1\if@tempswa , #2\fi}}
%% END of "Here I try to make Citation as /1-4/ A.Smolin"
%%

%%

%    ****************************************
%    *           INITIALIZATION             *
%    ****************************************
%
% Default initializations

%\ps@plain                   % 'plain' page style
% \ps@myheadings               % 'myheadings' page style
% \pagenumbering{arabic}      % Arabic page numbers
% \if@twoside\else\raggedbottom\fi % Ragged bottom unless twoside
%                                  % option.
% \if@twocolumn
%  \@@input twocolum.sty\relax
% \else
%  \onecolumn                 % Single-column.
% \fi


% % --------------------------------------------------------------------- %
% % Это конец ucthesis, а я добавил русификацию по КОИ8 --- А. Смолин     %
% %
% \input cyrfont.sty\relax

% % from hyphen.cfg-russian: Для переносов в КОИ8
% \def\Russian{\language\l@russian\lefthyphenmin=2\righthyphenmin=2}
% \def\English{\language\l@plain\lefthyphenmin=2\righthyphenmin=3}

% {% setup uccode/lccode/mathcode for russian characters
% \def\letter#1#2{%
% \global\catcode`#1=11\global\catcode`#2=11%
% \global\uccode`#1=`#1\global\lccode`#1=`#2%
% \global\uccode`#2=`#1\global\lccode`#2=`#2%
% \count0=`#1\advance\count0 by "7100\global\mathcode`#1=\count0%
% \count0=`#2\advance\count0 by "7100\global\mathcode`#2=\count0}%
% %
% \letter{Й}{й}\letter{Ц}{ц}\letter{У}{у}\letter{К}{к}\letter{Е}{е}%
% \letter{Н}{н}\letter{Г}{г}\letter{Ш}{ш}\letter{Щ}{щ}\letter{З}{з}%
% \letter{Э}{э}\letter{Ф}{ф}\letter{Ы}{ы}\letter{В}{в}\letter{А}{а}%
% \letter{П}{п}\letter{Р}{р}\letter{О}{о}\letter{Л}{л}\letter{Д}{д}%
% \letter{Ж}{ж}\letter{Я}{я}\letter{Ч}{ч}\letter{С}{с}\letter{М}{м}%
% \letter{И}{и}\letter{Т}{т}\letter{Ь}{ь}\letter{Б}{б}\letter{Ю}{ю}%
% \letter{Ъ}{ъ}\letter{Х}{х}%
% % special for letter yo (if any)
% \global\catcode`Е=11%
% \global\catcode`е=11%
% \global\uccode`Е=`Е%
% \global\lccode`Е=`е%
% \global\uccode`е=`Е%
% \global\lccode`е=`е%
% \count0=`Е\advance\count0 by "7100\global\mathcode`Е=\count0%
% \count0=`е\advance\count0 by "7100\global\mathcode`е=\count0%
% }%

% \def\@alph#1{\ifcase#1\or а\or б\or в\or г\else\@ialph{#1}\fi}%
% \def\@ialph#1{\ifcase#1\or \or \or \or \or д\or е\or ж\or з\or и\or й\or
%    к\or л\or м\or н\or о\or п\or р\or с\or т\or у\or ф\or х\or ц\or ч\or ш\or
%    щ\or ъ\or ы\or ь\or э\or ю\or я\else\@ctrerr\fi}%
% \def\@Alph#1{\ifcase#1\or А\or Б\or В\or Г\else\@Ialph{#1}\fi}%
% \def\@Ialph#1{\ifcase#1\or \or \or \or \or Д\or Е\or Ж\or З\or И\or Й\or
%    К\or Л\or М\or Н\or О\or П\or Р\or С\or Т\or У\or Ф\or Х\or Й\or Ч\or Ш\or
%    Щ\or Ъ\or Ы\or Ь\or Э\or Ю\or Я\else\@ctrerr\fi}%
% %
% %   macro \| might be used instead of ``-'' in complicated words
% %
% % from GERMAN.STY
% %
% \def\|{%                % Ligaturen aufbrechen (wenn nicht im math mode)
%    \ifmmode  \Vert
%    \else  \allowhyphens-\allowhyphens\fi}%
% {\catcode`\@=11\gdef\allowhyphens{\penalty\@M\hskip\z@skip}}%
% %     vorlaeufige Aenderung der Umbruchparameter -- wird bei V3.0 geaendert!
% \tolerance=2500\hbadness=1500%   % Umbruchparameter: lange deutsche Woerter
% %%
% \Russian% Русский язык
% \frenchspacing%

% FIXME Должно зависить от языка
\@ifpackageloaded{babel}{%
        \renewcommand\appendixnum{\@Asbuk\c@chapter}
}{}


% \endinput
% %

%%% Local Variables:
%%% mode: latex
%%% TeX-master: t
%%% coding: utf-8-unix
%%% End:
