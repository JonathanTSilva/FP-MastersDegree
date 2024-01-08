\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uspBeamer}[February 7th 2023, v1.0.0]

\PassOptionsToPackage{svgnames}{xcolor}
\LoadClass[compress, 8pt, aspectratio=169]{beamer}

%============================================================
%------------------------- PACKAGES -------------------------
%============================================================

\usepackage[portuguese, brazilian, english]{babel}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{pdfpages}
\usepackage{graphicx}
\usepackage[footnotesize, hang]{caption} 
\usepackage{hyperref}
\usepackage{listings}
\usepackage{etoolbox}
\usepackage{tcolorbox}
\usepackage{tabularx}
\usepackage{array}
\usepackage{colortbl}
\tcbuselibrary{skins}
\usepackage{ragged2e}
\usepackage{tikz}
\usepackage{multicol, multirow}
\usepackage{hhline}
\usepackage{multimedia}
\usepackage{natbib}

% LIBRARIES
\usetikzlibrary{shadings}

% FONTS
% ----- COURIER
\usepackage{courier}

% ----- HELVET
\usepackage{helvet}

% ----- LMODERN
\usepackage{lmodern}

%============================================================
%-------------------------- COLORS --------------------------
%============================================================

% BLUE
\definecolor{airforceblue}{rgb}{0.36, 0.54, 0.66}
\definecolor{aliceblue}{rgb}{0.94, 0.97, 1.0}
\definecolor{eescblue}{HTML}{003c78}
\definecolor{eescdarkblue}{HTML}{002561}
\definecolor{eescmidblue}{HTML}{055488}
\definecolor{eesclightblue}{HTML}{007db8}

% GREEN
\definecolor{cadmiumgreen}{rgb}{0.0, 0.42, 0.24}
\definecolor{honeydew}{rgb}{0.94, 1.0, 0.94}

% RED
\definecolor{carnelian}{rgb}{0.7, 0.11, 0.11}
\definecolor{melon}{rgb}{0.99, 0.74, 0.71}
\definecolor{codefore}{HTML}{f92763}

% ORANGE
\definecolor{orange-red}{rgb}{1.0, 0.27, 0.0}
\definecolor{peach-orange}{rgb}{1.0, 0.8, 0.6}
\definecolor{eescorange}{RGB}{246, 164, 28}
\definecolor{eescdarkorange}{RGB}{195, 129, 22}
\definecolor{eesclightorange}{RGB}{255, 185, 29}

% YELLOW
\definecolor{pastelyellow}{rgb}{1.0, 0.92, 0.71}
\definecolor{uscgold}{rgb}{1.0, 0.8, 0.0}

% PURPLE
\definecolor{purpleheart}{rgb}{0.41, 0.21, 0.61}
\definecolor{lightmauve}{rgb}{0.86, 0.82, 1.0}

% BROWN
\definecolor{darkbrown}{rgb}{0.4, 0.26, 0.13}
\definecolor{moccasin}{rgb}{0.98, 0.92, 0.84}

% GREY SCALE
\definecolor{ashgrey}{rgb}{0.38, 0.38, 0.38}
\definecolor{lightgray}{rgb}{0.90, 0.90, 0.90}
\definecolor{cadetgrey}{rgb}{0.57, 0.64, 0.69}
\definecolor{codeback}{HTML}{ededeb}

% BLACK AND WHITE
\definecolor{black}{rgb}{0.0, 0.0, 0.0}
\definecolor{white}{rgb}{1.0, 1.0, 1.0}

%============================================================
%------------------------ SET COLORS ------------------------
%============================================================

% MAIN COLORS
\colorlet{mainColor1}{eescblue} % DARK
\colorlet{mainColor2}{eesclightblue} % LIGHT

% MAIN STRUCTURE COLORS
\colorlet{bodyColor}{white}
\colorlet{titleColor}{mainColor1}
\colorlet{chipColor}{mainColor1}

% SECTION COLORS
\colorlet{sectionColor}{eescdarkblue}
\colorlet{subsectionColor}{eesclightblue}
\definecolor{shadowbg}{RGB}{51,51,51}

% FOOTLINE COLORS
\colorlet{authorFootlineColor}{black}
\colorlet{instituteFootlineColor}{black}
\colorlet{titleFootlineColor}{ashgrey}
\colorlet{pageFootlineColor}{black}
\colorlet{dateFootlineColor}{black}

% BLOCK COLORS
\colorlet{normalTitleBlockColor}{mainColor1}
\colorlet{normalBlockColor}{eescorange!0}
\colorlet{exampleTitleBlockColor}{airforceblue}
\colorlet{exampleBlockColor}{aliceblue}
\colorlet{alertTitleBlockColor}{carnelian}
\colorlet{alertBlockColor}{melon}

% CODE COLORS
\definecolor{CodeGreen}{rgb}{0,0.6,0}
\definecolor{CodePurple}{rgb}{0.58,0,0.82}
\definecolor{CodeOrange}{rgb}{1,.45,0}
\definecolor{CodeGrey}{rgb}{0.92,0.92,0.92}

% TEXT COLORS
% ├---- MAIN STRUCTURE
	\colorlet{normalTextColor}{black}
	\colorlet{titleTextColor}{white}
	\colorlet{chipTextColor}{white}

% ├---- SECTIONS
	\colorlet{sectionTextColor}{white}
	\colorlet{subsectionTextColor}{white}

% ├---- SPECIALS
	\colorlet{exampleTextColor}{airforceblue}
	\colorlet{emphaseTextColor}{orange-red}
	\colorlet{alertTextColor}{carnelian}

% ├---- FOOTLINE
	\colorlet{authorFootlineTextColor}{white}
	\colorlet{instituteFootlineTextColor}{white}
	\colorlet{titleFootlineTextColor}{white}
	\colorlet{pageFootlineTextColor}{mainColor1}
	\colorlet{dateFootlineTextColor}{white}
    \colorlet{advisorFootlineTextColor}{mainColor1}
	\colorlet{supervisorFootlineTextColor}{mainColor1}

% ├---- BLOCKS
	\colorlet{blockTitleTextColor}{white}
	\colorlet{blockBodyTextColor}{black}

% ├---- TABLES
	\colorlet{tableTitleTextColor}{white}
	\colorlet{tableBodyTextColor}{black}
	
%============================================================
%------------------------ STRUCTURE -------------------------
%============================================================
% http://www.cpt.univ-mrs.fr/~masson/latex/Beamer-appearance-cheat-sheet.pdf

% MAIN
\usecolortheme[named=mainColor1]{structure}
\usefonttheme{default}
\useinnertheme{rectangles}
\useoutertheme[subsection=false]{miniframes}
\setbeamercovered{transparent}
\setbeamertemplate{navigation symbols}{}

% TITLE PAGE
\defbeamertemplate*{title page}{eesc}[1][] {
	\vbox{}
	\vskip 0pt plus 1filll
	\begin{centering}
		\begin{beamercolorbox}[sep=8pt,center,#1]{Titlelike}
			\textbf{\usebeamerfont{title}\inserttitle}\par%
			\ifx\insertsubtitle\@empty%
			\else%
				\vskip0.50em%
				{\usebeamerfont{subtitle}\usebeamercolor[fg]{Titlelike}\insertsubtitle\par}%
			\fi%     
		\end{beamercolorbox}%
		\vskip1em\par
		\begin{beamercolorbox}[sep=8pt,center,#1]{author}
			\usebeamerfont{author}\usebeamercolor[fg]{Titlelike2}\insertauthor
		\end{beamercolorbox}
		{\usebeamercolor[fg]{titlegraphic}\usebeamercolor[fg]{title}\inserttitlegraphic\par}
	\end{centering}
	\vskip 0pt plus 1filll
    \begin{centering}
        \begin{beamercolorbox}[sep=8pt,center,#1]{advisor}
            \usebeamerfont{advisor} \usebeamercolor[fg]{Titlelike2}\advisor \\ 
            \usebeamercolor[fg]{titlelike}\textsc{\small Orientador}
        \end{beamercolorbox}
        \begin{beamercolorbox}[sep=8pt,center,#1]{supervisor}
            \usebeamerfont{supervisor} \usebeamercolor[fg]{Titlelike2}\supervisor \\ 
            \usebeamercolor[fg]{titlelike}\textsc{\small Coorientador}
        \end{beamercolorbox}\vskip0.5em
    \end{centering}
	\begin{beamercolorbox}[sep=8pt,right,#1]{date}
		\usebeamerfont{date}\usebeamercolor[fg]{Titlelike2}\insertdate
	\end{beamercolorbox}\vskip0.5em
}

% TEXT
\setbeamercolor{Titlelike}{fg=titleTextColor,bg=titleColor}
\setbeamercolor{Titlelike2}{fg=eescblue}
\setbeamercolor{titlelike}{fg=eescorange}
\setbeamercolor*{normal text}{fg=normalTextColor,bg=bodyColor}
\setbeamercolor*{example text}{fg=exampleTextColor}
\setbeamercolor*{alerted text}{fg=alertTextColor}

\newcommand{\exemple}[1]{{\color{example text.fg} #1}}
\renewcommand{\emph}[1]{\textcolor{orange-red}{\textbf{#1}}}
\newcommand{\code}[1]{{\color{codefore} \colorbox{codeback}{\texttt{#1}}}}

% \setbeamerfont{frametitle}{
% 	shape=\itshape, 
% 	series=\bfseries, 
% 	family=\rmfamily, 
% 	size={\fontsize{20pt}{1em}} % ou \Large, eg.
% }

% ITEMS
\setbeamercolor{itemize item}{fg=eescorange}
\setbeamercolor{enumerate item}{bg=eescorange}
\setbeamercolor{description item}{fg=eescorange}

% TABLE OF CONTENTS
\setbeamercolor{section number projected}{bg=eescorange}
\setbeamercolor{subsection number projected}{bg=eescorange}
\setbeamercolor{section in toc}{fg=eescorange}

% SECTIONS
% TODO Create a gradient color for head, following the EESC logo
\setbeamercolor{section in head/foot}{bg=sectionColor, fg=sectionTextColor}
\setbeamercolor{subsection in head/foot}{bg=subsectionColor, fg=subsectionTextColor}

\useinnertheme{default}
\setbeamercolor{item projected}{bg=chipColor,fg=chipTextColor}
\beamer@compresstrue
\defbeamertemplate*{headline}{smoothbars theme}{%
    
    \begin{beamercolorbox}[ht=2.125ex,dp=3.150ex]{section in head/foot}
        \insertnavigation{\paperwidth}
    \end{beamercolorbox}%
    
    \begin{beamercolorbox}[ht=2.125ex,dp=1.125ex,%
        leftskip=.3cm,rightskip=.3cm plus1fil]{subsection in head/foot}
        \usebeamerfont{subsection in head/foot}\insertsubsectionhead
    \end{beamercolorbox}%

}
% \defbeamertemplate*{headline}{smoothbars theme}{%
%     \begin{beamercolorbox}[ht=2.125ex,dp=3.150ex]{section in head/foot}
%         \insertnavigation{\paperwidth}
%     \end{beamercolorbox}%
    
%     \begin{beamercolorbox}[ht=2.125ex,dp=1.125ex,%
%         leftskip=.3cm,rightskip=.3cm plus1fil]{subsection in head/foot}
%         \usebeamerfont{subsection in head/foot}\insertsubsectionhead
%     \end{beamercolorbox}%
%     \vskip-1pt%
%     \hbox{%
%         \tikz\draw[draw=none,top color=eescmidblue,bottom color=eesclightblue] (0,0) rectangle (\paperwidth,1.5ex);
%     }%
% }

% FOOTLINE
\setbeamercolor{author in head/foot}{bg=, fg=authorFootlineTextColor}
\setbeamercolor{title in head/foot}{bg=, fg=titleFootlineTextColor}
\setbeamercolor{institute in head/foot}{bg=, fg=instituteFootlineTextColor}
\setbeamercolor{date in head/foot}{bg=, fg=dateFootlineTextColor}
\setbeamercolor{page in head/foot}{bg=, fg=pageFootlineTextColor}
\setbeamercolor{advisor in head/foot}{bg=, fg=advisorFootlineTextColor}
\setbeamercolor{supervisor in head/foot}{bg=, fg=supervisorFootlineTextColor}

\defbeamertemplate*{footline}{infolines theme}{
	\leavevmode%
    \hbox{%
        \begin{beamercolorbox}[wd=.30\paperwidth,ht=2.25ex,dp=2.8ex,center]{}%
        \end{beamercolorbox}%

		\begin{beamercolorbox}[wd=.40\paperwidth,ht=2.25ex,dp=2.8ex,center]{title in head/foot}%
			\usebeamerfont{title in head/foot}\insertshorttitle
		\end{beamercolorbox}%
		
		\begin{beamercolorbox}[wd=.30\paperwidth,ht=2.25ex,dp=2.8ex,right]{date in head/foot}%
			\usebeamerfont{date in head/foot}\insertshortdate{}\hspace*{2ex}
		\end{beamercolorbox}
	}%
    \vskip0pt%
	\hbox{%
		\begin{beamercolorbox}[wd=.30\paperwidth,ht=2.25ex,dp=1.9ex,center]{}%
		\end{beamercolorbox}%
		
		\begin{beamercolorbox}[wd=.40\paperwidth,ht=2.25ex,dp=1.9ex,center]{}%
		\end{beamercolorbox}%
		
		\begin{beamercolorbox}[wd=.30\paperwidth,ht=2.25ex,dp=1.9ex,right]{page in head/foot}%
			\usebeamerfont{page in head/foot} \insertframenumber{} / \inserttotalframenumber\hspace*{2ex}
		\end{beamercolorbox}
	}%
	\vskip0pt%
}

\mode
<all>

% BUTTONS
\setbeamercolor{button border}{fg=eescorange}
\setbeamercolor{button}{fg=white, bg=eescorange}
% \renewcommand{\insertgotosymbol}{$\rightarrow$} % Para mudar os simbolos dos botões

%============================================================
%--------------------- (RE)NEW COMMANDS ---------------------
%============================================================

\apptocmd{\frame}{}{\justifying}{} % Allow optional arguments after frame.

\renewcommand{\arraystretch}{1.5} % Space between lines in table

\newcommand{\urlcolor}[1]{\textcolor{magenta}{#1}}
\newcommand{\cref}[2]{\urlcolor{\href{#1}{#2}}} % margenta href

\newcommand{\codebox}[1]{\boxcode{\centering\texttt{#1}}}

% footnote whitout index number
\newcommand\blfootnote[1]{%
	\begingroup
	\renewcommand\thefootnote{}\footnote{#1}%
	\addtocounter{footnote}{-1}%
	\endgroup
}

\newenvironment{wideitemize}{
	\itemize\addtolength{\itemsep}{10pt}
}{
	\enditemize
}

%============================================================
%---------------------- ATBEGIN FRAMES ----------------------
%============================================================

\AtBeginPart{
	\begin{frame}{Part \insertromanpartnumber: \insertpart}
		\tableofcontents
	\end{frame}
}

\AtBeginSection[]{
	\begin{frame}
		\vfill
		\centering
		\begin{beamercolorbox}[sep=8pt,center,shadow=true,rounded=true]{Titlelike}
			\texttt{\usebeamerfont{title} \Huge \textcolor{eesclightblue}{------|} \insertsectionhead \ \textcolor{eesclightblue}{|------} }\par%
		\end{beamercolorbox}
		\vfill
	\end{frame}
}

% \AtBeginSection[]{
% 	\begin{frame}
% 		\tableofcontents[currentsection, hideallsubsections]
% 		%\tableofcontents[currentsection, hideothersubsections]
% 	\end{frame}
% }

% \AtBeginSubsection[]{
% 	\begin{frame}
% 		\tableofcontents[currentsubsection]
% 	\end{frame}
% }

%============================================================
%-------------------------- TABLES --------------------------
%============================================================

\newcolumntype{Y}{>{\raggedleft\arraybackslash}X}
\newcolumntype{Z}{>{\centering\arraybackslash}X}

\tcbset{tablered/.style={enhanced,
		arc=0em,
		fonttitle=\bfseries,
		fontupper=\normalsize\sffamily,
		colback=melon!100!white,
		colframe=carnelian!70!black,
		colbacktitle=carnelian!100!white,
		coltitle=white,
		center title}}

\tcbset{tableorange/.style={enhanced,
		arc=0em,
		fonttitle=\bfseries,
		fontupper=\normalsize\sffamily,
		colback=peach-orange!100!white,
		colframe=orange-red!70!black,
		colbacktitle=orange-red!100!white,
		coltitle=white,
		center title}}        


\tcbset{tablegreen/.style={enhanced,
		arc=0em,
		fonttitle=\bfseries,
		fontupper=\normalsize\sffamily,
		colback=honeydew!100!white,
		colframe=cadmiumgreen!70!black,
		colbacktitle=cadmiumgreen!100!white,
		coltitle=white,
		center title}}

\tcbset{tableblue/.style={enhanced,
		arc=0em,
		fonttitle=\bfseries,
		fontupper=\normalsize\sffamily,
		colback=aliceblue!100!white,
		colframe=airforceblue!70!black,
		colbacktitle=airforceblue!100!white,
		coltitle=white,
		center title}}

\tcbset{tableyellow/.style={enhanced,
		arc=0em,
		fonttitle=\bfseries,
		fontupper=\normalsize\sffamily,
		colback=pastelyellow!100!white,
		colframe=uscgold!70!black,
		colbacktitle=uscgold!100!white,
		coltitle=white,
		center title}}

\tcbset{tablebrown/.style={enhanced,
		arc=0em,
		fonttitle=\bfseries,
		fontupper=\normalsize\sffamily,
		colback=moccasin!100!white,
		colframe=darkbrown!70!black,
		colbacktitle=darkbrown!100!white,
		coltitle=white,
		center title}}

\tcbset{tablepurple/.style={enhanced,
		arc=0em,
		fonttitle=\bfseries,
		fontupper=\normalsize\sffamily,
		colback=lightmauve!100!white,
		colframe=purpleheart!70!black,
		colbacktitle=purpleheart!100!white,
		coltitle=white,
		center title}}

\tcbset{tablegrey/.style={enhanced,
		arc=0em,
		fonttitle=\bfseries,
		fontupper=\normalsize\sffamily,
		colback=lightgray!100!white,
		colframe=cadetgrey!70!black,
		colbacktitle=cadetgrey!100!white,
		coltitle=white,
		center title}}

\tcbset{tableblack/.style={enhanced,
		arc=0em,
		fonttitle=\bfseries,
		fontupper=\normalsize\sffamily,
		colback=white!100!white,
		colframe=black!70!black,
		colbacktitle=black!100!white,
		coltitle=white,
		center title}}

\tcbset{tableeesc/.style={enhanced,
		arc=0em,
		fonttitle=\bfseries,
		fontupper=\normalsize\sffamily,
		colback=white,
		colframe=eescdarkblue,
		colbacktitle=eescdarkblue,
		coltitle=white,
		center title,
		frame hidden,
		boxrule=0pt,
        titlerule=1mm,
		titlerule style=eescdarkblue}}

%============================================================
%-------------------------- BLOCKS --------------------------
%============================================================

\setbeamertemplate{blocks}[rounded][shadow=true]

\setbeamercolor*{block title}{
	fg=blockTitleTextColor,
	bg=normalTitleBlockColor}
\setbeamercolor*{block body}{
	fg=blockBodyTextColor,
	bg=}

\setbeamercolor*{block title alerted}{
	fg=blockTitleTextColor,
	bg=alertTitleBlockColor}
\setbeamercolor*{block body alerted}{
	fg=blockBodyTextColor,
	bg=alertBlockColor}

\setbeamercolor*{block title example}{
	fg=blockTitleTextColor,
	bg=exampleTitleBlockColor}
\setbeamercolor*{block body example}{
	fg=blockBodyTextColor,
	bg=exampleBlockColor}

\setbeamerfont{block title}{size={}}

\AtBeginEnvironment{block}{%
	\setbeamercolor{itemize item}{fg=normalTitleBlockColor!70}
}
\AtBeginEnvironment{exampleblock}{%
	\setbeamercolor{itemize item}{fg=exampleTitleBlockColor!70}
}
\AtBeginEnvironment{alertblock}{%
	\setbeamercolor{itemize item}{fg=alertTitleBlockColor!70}
}

%============================================================
%-------------------------- BOXES ---------------------------
%============================================================

\newcommand{\boxcode}[1]{
	\begin{center}
		\begin{tcolorbox}[colback=codeback,
			colframe=mainColor1,
            fontupper=\color{codefore},
			arc=1mm, auto outer arc,
			boxrule=0.5pt]
			#1
		\end{tcolorbox}
	\end{center}
}

\newcommand{\boxeesc}[1]{
	\begin{center}
		\fcolorbox{eescdarkblue}{eesclightblue!20}{
			\begin{minipage}{0.5\textwidth}
				#1
			\end{minipage}
		}
	\end{center}
}

\newcommand{\boxyellow}[1]{
	\begin{center}
		\fcolorbox{uscgold}{pastelyellow}{
			\begin{minipage}{0.5\textwidth}
				#1
			\end{minipage}
		}
	\end{center}
}

\newcommand{\boxpurple}[1]{
	\begin{center}
		\fcolorbox{purpleheart}{lightmauve}{
			\begin{minipage}{0.5\textwidth}
				#1
			\end{minipage}
		}
	\end{center}
}

\newcommand{\boxorange}[1]{
	\begin{center}
		\fcolorbox{orange-red}{peach-orange}{
			\begin{minipage}{0.5\textwidth}
				#1
			\end{minipage}
		}
	\end{center}
}

\newcommand{\boxbrown}[1]{
	\begin{center}
		\fcolorbox{darkbrown}{moccasin}{
			\begin{minipage}{0.5\textwidth}
				#1
			\end{minipage}
		}
	\end{center}
}

\newcommand{\boxgrey}[1]{
	\begin{center}
		\fcolorbox{cadetgrey}{lightgray}{
			\begin{minipage}{0.5\textwidth}
				#1
			\end{minipage}
		}
	\end{center}
}

\newcommand{\boxblue}[1]{
	\begin{center}
		\fcolorbox{airforceblue}{aliceblue}{
			\begin{minipage}{0.5\textwidth}
				#1
			\end{minipage}
		}
	\end{center}
}

\newcommand{\boxgreen}[1]{
	\begin{center}
		\fcolorbox{cadmiumgreen}{honeydew}{
			\begin{minipage}{0.5\textwidth}
				#1
			\end{minipage}
		}
	\end{center}
}

\newcommand{\boxblack}[1]{
	\begin{center}
		\fcolorbox{black}{white}{
			\begin{minipage}{0.5\textwidth}
				#1
			\end{minipage}
		}
	\end{center}
}

%============================================================
%------------------------- LISTINGS -------------------------
%============================================================

\definecolor{backcolour}{RGB}{245,245,245}
\definecolor{commentcolour}{RGB}{0,128,0}
\definecolor{keywordcolour}{RGB}{249,38,114}
\definecolor{stringcolour}{RGB}{255,102,0}

\renewcommand\lstlistingname{Algoritimo} 
\lstdefinestyle{mystyle}{
	backgroundcolor=\color{backcolour},   
	commentstyle=\color{commentcolour},
	keywordstyle=\color{keywordcolour}\bfseries,
	numberstyle=\tiny\color{black},
	stringstyle=\color{stringcolour},
	emphstyle=\color{red},
	basicstyle=\footnotesize,
	breakatwhitespace=false,         
	breaklines=true,                 
	captionpos=t,                    
	keepspaces=true,                 
	numbers=left,                    
	numbersep=5pt,                  
	showspaces=false,                
	showstringspaces=false,
	showtabs=false,                  
	tabsize=2
}

\lstset{style=mystyle}

% \lstset
% {
	%   literate=%
	%   {0}{{{\color{CodeOrange}0}}}1
	%   {1}{{{\color{CodeOrange}1}}}1
	%   {2}{{{\color{CodeOrange}2}}}1
	%   {3}{{{\color{CodeOrange}3}}}1
	%   {4}{{{\color{CodeOrange}4}}}1
	%   {5}{{{\color{CodeOrange}5}}}1
	%   {6}{{{\color{CodeOrange}6}}}1
	%   {7}{{{\color{CodeOrange}7}}}1
	%   {8}{{{\color{CodeOrange}8}}}1
	%   {9}{{{\color{CodeOrange}9}}}1
	% }