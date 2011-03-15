% Identification
\NeedsTeXFormat{LaTeX2e} 
\ProvidesClass{ukletter}

% Load Artice Class
\LoadClassWithOptions{letter}

\RequirePackage[a4paper, top=24mm, left=25mm, right=25mm, bottom=25mm]{geometry}
\RequirePackage{mathpazo}
\RequirePackage{microtype}
\RequirePackage{eqparbox}
\RequirePackage{printlen}
\RequirePackage{calc}
\RequirePackage[nodayofweek]{datetime}

%Set date format
\newdateformat{britishdate}{%
\ordinal{DAY} \monthname[\THEMONTH] \THEYEAR}
\britishdate

%Pull signature across to left
\longindentation=0pt

%Keep text at top of page
\makeatletter
\let\@texttop\relax
\makeatother

%Variable to show the BS1808 defined areas
\newif\ifframes
%\framestrue

%Define new commands for heading information
\newcommand*{\myref}[2][My Ref:]{\def\myreftext{#2}\def\myreflabel{#1}}
\newcommand*{\yourref}[2][Your Ref:]{\def\yourreftext{#2}\def\yourreflabel{#1}}
\newcommand*{\logo}[1]{\def\logotext{#1}}
\newcommand*{\subject}[1]{\def\subjecttext{#1}}
\newcommand*{\email}[1]{\def\emailaddr{#1}}

\logo{}

%Set up savebox to carry toaddress (height needed for calculation)
\newsavebox{\addressbox}
\newlength{\addressboxheight}
\newlength{\topmargintoaddressbox}

\renewcommand*{\opening}[1]{
	\savebox{\addressbox}{\parbox[t]{75mm}{\toname\\\toaddress\raisebox{-1ex}{\rule{0mm}{1ex}}}}%
	\settototalheight{\addressboxheight}{\usebox{\addressbox}}%
	\addtolength{\topmargintoaddressbox}{17mm+9mm+(30mm-\addressboxheight)*\real{0.5}}%
	%
	\thispagestyle{empty}%
	\begin{minipage}{86mm}%
	\vspace{0pt}%
	\raggedright%
	\noindent%
	\parbox[t][17mm]{86mm}{\logotext\hfill}

	\ifframes
	\frame{
	\fi
		\parbox[t][48mm]{86mm}{%BS1808 Large Exclusion Zone
			\vspace{9mm}
			\ifframes
			\frame{
			\fi
				\parbox[t][30mm]{75mm}{%BS1808 Large Address Panel
				\vfill%
				\usebox{\addressbox}%
				\vfill
				}
			\ifframes
			}
			\fi
		}
	\ifframes	
	}
	\fi
	\end{minipage}%
	\hfill%
	%
	%
	% RIGHT-HAND-SIDE
	\begin{minipage}{72mm}
	\vspace{0pt}
	\parbox[t][65mm]{72mm}{
		\parbox[t][\addressboxheight+\topmargintoaddressbox]{72mm}{
			\raggedleft
			\eqparbox[t]{lhs}{\null}\hspace{0.5em}\eqparbox[t]{rhs}{\small%
				\fromaddress\\ \\
				\telephonenum\\
				\ifdefined\emailaddr
				\emailaddr\\
				\fi
				}\\
			\vfill%
			%Your Ref
			\ifdefined\yourreflabel
				\eqparbox[t]{lhs}{\raggedleft \yourreflabel}%
				\hspace{0.5em}%
				\eqparbox[t]{rhs}{\yourreftext%
				\ifdefined\myreflabel
				\null
				\else
				\raisebox{-1ex}{\rule{0mm}{1ex}}
				\fi
				}\\
			\fi
			%My Ref	
			\ifdefined\myreflabel
				\eqparbox[t]{lhs}{\raggedleft \myreflabel}%
				\hspace{0.5em}%
				\eqparbox[t]{rhs}{\myreftext\raisebox{-1ex}{\rule{0mm}{1ex}}}%
			\fi
	}
	\raggedleft
	\vfill
	\eqparbox{lhs}{\hfill}\hspace{0.5em}\eqparbox{rhs}{\today}\\
	\vfill
	}
	\end{minipage}
	#1

	\ifdefined\subjecttext
	\vspace{-0.15em}
	\textbf{\subjecttext}
	\vspace{-0.15em}

	\fi
}

%personal details
\name{Giles Robertson}
\address{54 The Vineyard \\ Richmond \\ Surrey \\ TW10 6AT}%
\telephone{07719 713332}%
\email{gilesr@gmail.com}
