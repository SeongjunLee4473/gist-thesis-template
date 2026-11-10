%
%      Original Title:  kaist.cls
%      Original Author: Unknown, KAIST
%      Date:            Unknown
%
%      LaTeX class file for GIST thesis
%      (all departments; set the department with \code{} in thesis.tex)
%      Gwangju Institute of Science and Technology
%
% Modification Log:
% -----------------
% .01  11/21/96        S.H. Lee    Set page dimensions
% .02  12/30/96        Y. Chung    Redefine plain pagestyle
%                                  Reformat and rearrage cover sheets
% .03  01/14/97        Y. Chung    Added dedication page
% .04  01/17/97        S.H. Lee    Correct the page mismatching
%
% .05  11/25/98        S.H. Lee    Enable more referees up to 7
% .06  12/25/98        S.H. Lee    Respell "&" to "and"
% .07  06/30/99        S.H. Lee    Added Curriculum Vitae
% .08  07/01/99        S.H. Lee    Support Hangul thesis
% .09  01/01/00        S.H. Lee    Support doctoral dissertation
% .10  04/10/19        K.J. Yoon   Modified for Overleaf
% .11  11/10/26        S.J. Lee    Abstract starts at page i (\clearpage),
%                                  hyperlink anchors (\phantomsection);
%                                  References entry in TOC is set in thesis.tex
%                                  College printed per department (\@ecollege);
%                                  department codes updated to the current organization

%
% Redefine plain pagestyle.
%

\def\ps@plain{\def\@oddhead{}\def\@oddfoot{\rm\hfil-- \thepage\ --
     \hfil}\def\@evenhead{}\let\@evenfoot\@oddfoot}

%
% End of LaTeX customizations
%

% hyperref가 없을 때도 오류가 나지 않도록 빈 정의를 둡니다(hyperref 로드 시 덮어써짐).
\providecommand{\phantomsection}{}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gist}[2019/04/10 Document class for GIST thesis]

%\RequirePackage{hfont}
\RequirePackage{xcolor}
\RequirePackage{kotex}
\LoadClass[12pt,oneside,a4paper]{report}

\DeclareOption{korean}{\gdef\@korean{}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions

\AtBeginDocument{\make@covertitle}

\topmargin=10mm
\oddsidemargin=4mm
\evensidemargin=\oddsidemargin
\textwidth=155mm
\textheight=224mm
\footskip=14mm
\headheight=0mm
\headsep=0mm
\topskip=0mm
\overfullrule=0pt
\def\baselinestretch{2.0}
\def\bibname{References}
\def\code#1{\def\@code{#1}}
\def\emajor#1{\def\@emajor{#1}}
\def\kmajor#1{\def\@kmajor{#1}}
\def\etitle#1{\def\@etitle{#1}}
\def\ktitle#1{\def\@ktitle{#1}}
\def\advisor#1{\def\@advisor{#1}}
\def\coadvisor#1{\def\@coadvisor{#1}}
\def\kadvisor#1{\def\@kadvisor{#1}}
\def\kcoadvisor#1{\def\@kcoadvisor{#1}}
\def\ename#1{\def\@ename{#1}}
\def\kname#1{\def\@kname{#1}}
\def\studentid#1{\def\@studentid{#1}}
\def\coveryear#1{\def\@coveryear{#1}}
\def\advisorsigndate#1#2#3{\def\@advisorsigndate{#1 #2, #3}}

\ifx\@korean\@@@@undefined@@@@
\def\refereesigndate#1#2#3{\def\@refereesigndate{#1 #2, #3}}
\def\@reftitlea{Committee Chair}
\def\@reftitleb{Committee Member}
\def\birthday#1#2#3{\def\@birthday{#1 #2, #3}}
\else
\def\refereesigndate#1#2#3{\def\@refereesigndate{#1년 #2월 #3일}}
\def\@reftitlea{심사위원장}
\def\@reftitleb{심~사~위~원}
\def\birthday#1#2#3{\def\@birthday{#1년 #2월 #3일}}
\fi

\def\refereeA#1{\def\@refereeA{#1}}
\def\refereeB#1{\def\@refereeB{#1}}
\def\refereeC#1{\def\@refereeC{#1}}
\def\refereeD#1{\def\@refereeD{#1}}
\def\refereeE#1{\def\@refereeE{#1}}
\def\refereeF#1{\def\@refereeF{#1}}
\def\refereeG#1{\def\@refereeG{#1}}
\def\npages#1{\def{\@npages{#1}}}
\def\@npages{\pageref{paperlastpagelabel}}
\def\birthplace#1{\def\@birthplace{#1}}
\def\addr#1{\def\@addr{#1}}

\def\D@char{PhD/}
\def\M@char{MS/}
\def\B@char{BS/}
\def\split@code#1#2\eop{\def\@md{#1}\def\@dept{#2}}
\def\split@kname#1#2#3#4#5#6#7\eop{\def\@korname{#1 #2 #3 #4 #5 #6 #7}}

\def\IC{IC}
\def\IM{IM}
\def\EC{EC}
\def\MS{MS}
\def\ME{ME}
\def\EN{EN}
\def\LS{LS}
\def\PH{PH}
\def\CH{CH}
\def\NA{NA}
\def\MD{MD}
\def\ET{ET}
\def\CT{CT}
\def\RT{RT}
\def\AI{AI}
\def\AX{AX}
\def\SE{SE}
\def\MA{MA}
\def\NP{NP}

\pagestyle{plain}
\def\insert@hss#1#2{#1#2\hss}
\def\maketitlebreakwork{\def\titlebreak{\\\ignorespaces}}
\def\maketitlebreaknotwork{\def\titlebreak{\ }}
\maketitlebreaknotwork
\def\make@covertitle{
  \ifx\@korean\@@@@undefined@@@@
    \def\contentsnamen{List of Contents}
    \else
    \def\contentsname{목~~~~~~~~차}
    \def\contentsnamen{목~~~~~~~~차}
    \def\listfigurename{그 림 목 차}
    \def\listtablename{표~~\,\,목~~\,차}
    \def\refname{참 고 문 헌}
    \def\bibname{참 고 문 헌}
    \def\indexname{찾 아 보 기}
    \def\figurename{그림}
    \def\tablename{표}
  \fi
\expandafter\split@code\@code\eop
\expandafter\split@kname\@kname\eop
% Department definitions (current organization, checked against www.gist.ac.kr, 2026-11-10)
% \@ecollege / \@kcollege: college printed on the cover, submission page and abstract header.
% Leave \@ecollege empty for a unit that does not belong to a college (the line is then omitted).
\def\@ecollege{}\def\@kcollege{}
%--- College of Artificial Intelligence (AI대학)
\ifx\@dept\EC \def\@edept{Electrical Engineering and Computer Science}
            \def\@kdept{전기전자컴퓨터공}
            \def\@kdeptn{전 기 전 자 컴 퓨 터 공}
            \def\@em{Science}
            \def\@edptype{Department of}
            \def\@kdptype{학과}
            \def\@kdptypesp{학 과}
            \def\@ecollege{College of Artificial Intelligence}
            \def\@kcollege{AI대학}\fi
\ifx\@dept\AI \def\@edept{AI}
            \def\@kdept{AI}
            \def\@kdeptn{A I}
            \def\@em{Science}
            \def\@edptype{Department of}
            \def\@kdptype{학과}
            \def\@kdptypesp{학 과}
            \def\@ecollege{College of Artificial Intelligence}
            \def\@kcollege{AI대학}\fi
\ifx\@dept\AX \def\@edept{AX}
            \def\@kdept{AX}
            \def\@kdeptn{A X}
            \def\@em{Science}
            \def\@edptype{Department of}
            \def\@kdptype{학과}
            \def\@kdptypesp{학 과}
            \def\@ecollege{College of Artificial Intelligence}
            \def\@kcollege{AI대학}\fi
\ifx\@dept\SE \def\@edept{Semiconductor Engineering}
            \def\@kdept{반도체공}
            \def\@kdeptn{반 도 체 공}
            \def\@em{Science}
            \def\@edptype{Department of}
            \def\@kdptype{학과}
            \def\@kdptypesp{학 과}
            \def\@ecollege{College of Artificial Intelligence}
            \def\@kcollege{AI대학}\fi
%--- College of Natural Sciences (자연과학대학)
\ifx\@dept\PH \def\@edept{Physics and Photon Science}
            \def\@kdept{물리$\cdot$광과}
            \def\@kdeptn{물 리 $\cdot$ 광 과}
            \def\@em{Science}
            \def\@edptype{Department of}
            \def\@kdptype{학과}
            \def\@kdptypesp{학 과}
            \def\@ecollege{College of Natural Sciences}
            \def\@kcollege{자연과학대학}\fi
\ifx\@dept\CH \def\@edept{Chemistry}
            \def\@kdept{화학}
            \def\@kdeptn{화학}
            \def\@em{Science}
            \def\@edptype{Department of}
            \def\@kdptype{과}
            \def\@kdptypesp{과}
            \def\@ecollege{College of Natural Sciences}
            \def\@kcollege{자연과학대학}\fi
\ifx\@dept\MA \def\@edept{Mathematical Sciences}
            \def\@kdept{수리과}
            \def\@kdeptn{수 리 과}
            \def\@em{Science}
            \def\@edptype{Department of}
            \def\@kdptype{학과}
            \def\@kdptypesp{학 과}
            \def\@ecollege{College of Natural Sciences}
            \def\@kcollege{자연과학대학}\fi
%--- College of Engineering (공과대학)
\ifx\@dept\MS \def\@edept{Materials Science and Engineering}
            \def\@kdept{신소재공}
            \def\@kdeptn{신 소 재 공}
            \def\@em{Science}
            \def\@edptype{Department of}
            \def\@kdptype{학과}
            \def\@kdptypesp{학 과}
            \def\@ecollege{College of Engineering}
            \def\@kcollege{공과대학}\fi
\ifx\@dept\ME \def\@edept{Mechanical and Robotics Engineering}
            \def\@kdept{기계로봇공}
            \def\@kdeptn{기 계 로 봇 공}
            \def\@em{Science}
            \def\@edptype{Department of}
            \def\@kdptype{학과}
            \def\@kdptypesp{학 과}
            \def\@ecollege{College of Engineering}
            \def\@kcollege{공과대학}\fi
\ifx\@dept\EN \def\@edept{Environment and Energy Engineering}
            \def\@kdept{환경$\cdot$에너지공}
            \def\@kdeptn{환 경 $\cdot$ 에 너 지 공}
            \def\@em{Science}
            \def\@edptype{Department of}
            \def\@kdptype{학과}
            \def\@kdptypesp{학 과}
            \def\@ecollege{College of Engineering}
            \def\@kcollege{공과대학}\fi
%--- College of Life Sciences and Medical Engineering (생명·의과학융합대학)
\ifx\@dept\LS \def\@edept{Life Sciences}
            \def\@kdept{생명과}
            \def\@kdeptn{생 명 과}
            \def\@em{Science}
            \def\@edptype{Department of}
            \def\@kdptype{학과}
            \def\@kdptypesp{학 과}
            \def\@ecollege{College of Life Sciences and Medical Engineering}
            \def\@kcollege{생명$\cdot$의과학융합대학}\fi
\ifx\@dept\MD \def\@edept{Biomedical Science and Engineering}
            \def\@kdept{의생명공}
            \def\@kdeptn{의 생 명 공}
            \def\@em{Science}
            \def\@edptype{Department of}
            \def\@kdptype{학과}
            \def\@kdptypesp{학 과}
            \def\@ecollege{College of Life Sciences and Medical Engineering}
            \def\@kcollege{생명$\cdot$의과학융합대학}\fi
\ifx\@dept\NP \def\@edept{Integrative Neuroscience \& Physiology}
            \def\@kdept{융합신경생리}
            \def\@kdeptn{융 합 신 경 생 리}
            \def\@em{Science}
            \def\@edptype{Department of}
            \def\@kdptype{학과}
            \def\@kdptypesp{학 과}
            \def\@ecollege{College of Life Sciences and Medical Engineering}
            \def\@kcollege{생명$\cdot$의과학융합대학}\fi
%--- Legacy codes (units no longer in the current organization).
%    Kept only so that older theses still compile with their original wording.
\ifx\@dept\IC \def\@edept{Information and Communications}
            \def\@kdept{정보통신공}
            \def\@kdeptn{정 보 통 신 공}
            \def\@em{Science}
            \def\@edptype{School of}
            \def\@kdptype{학부}
            \def\@kdptypesp{학 부}
            \def\@ecollege{College of Engineering}
            \def\@kcollege{공과대학}\fi
\ifx\@dept\IM \def\@edept{Information and Communications}
            \def\@kdept{정보기전공}
            \def\@kdeptn{정 보 기 전 공}
            \def\@em{Science}
            \def\@edptype{School of}
            \def\@kdptype{학부}
            \def\@kdptypesp{학 부}
            \def\@ecollege{College of Engineering}
            \def\@kcollege{공과대학}\fi
\ifx\@dept\NA \def\@edept{Nanobio Materials and Electronics}
            \def\@kdept{나노바이오재료전자공}
            \def\@kdeptn{나 노 바 이 오 재 료 전 자 공}
            \def\@em{Science}
            \def\@edptype{Department of}
            \def\@kdptype{학과}
            \def\@kdptypesp{학 과}
            \def\@ecollege{College of Engineering}
            \def\@kcollege{공과대학}\fi
\ifx\@dept\ET \def\@edept{Integrated Technology}
            \def\@kdept{에너지융합학제}
            \def\@kdeptn{에 너 지 융 합 학 제}
            \def\@em{Science}
            \def\@edptype{School of}
            \def\@kdptype{전공}
            \def\@kdptypesp{전 공}
            \def\@ecollege{College of Engineering}
            \def\@kcollege{공과대학}\fi
\ifx\@dept\CT \def\@edept{Integrated Technology}
            \def\@kdept{문화기술융합학제}
            \def\@kdeptn{문 화 기 술 융 합 학 제}
            \def\@em{Science}
            \def\@edptype{School of}
            \def\@kdptype{전공}
            \def\@kdptypesp{전 공}
            \def\@ecollege{College of Engineering}
            \def\@kcollege{공과대학}\fi
\ifx\@dept\RT \def\@edept{Integrated Technology}
            \def\@kdept{지능로봇프로그램}
            \def\@kdeptn{지 능 로 봇 프 로 그 램}
            \def\@em{Science}
            \def\@edptype{School of}
            \def\@kdptype{전공}
            \def\@kdptypesp{전 공}
            \def\@ecollege{College of Engineering}
            \def\@kcollege{공과대학}\fi


\ifx \D@char\@md \def\@kmd{박사}\def\@emd{Doctor of Philosophy}\fi
\ifx \M@char\@md \def\@kmd{석사} \def\@emd{Master of \@em}\fi
\ifx \B@char\@md \def\@kmd{학사} \def\@emd{Bachelor of \@em} \def\@concen{Concentration}\fi

\ifx\@korean\@@@@undefined@@@@

%
% cover sheet in English
%

  \thispagestyle{empty}
    \vspace*{24mm}
    \maketitlebreakwork
    \leavevmode{
    \fontsize{14}{1pt}\selectfont
    \ifx\D@char\@md
    Dissertation\ for\ Doctor\ of\ Philosophy\fi
    \ifx\M@char\@md
    Thesis\ for\ Master's\ Degree\fi
    \ifx\B@char\@md
    Thesis\ for\ Bachelor's\ Degree\fi} \\
    \vbox to 1mm {
      \vspace*{30mm}
      \begin{center}
        \fontsize{20}{20pt}\selectfont \@etitle
      \end{center}
    }
    \vspace*{79mm}
    \begin{center}
      \fontsize{14}{1pt}\selectfont \@ename{} \\
      \vspace*{10mm}
      \fontsize{14}{14pt}\selectfont
      \ifx\@ecollege\@empty\else\@ecollege \\\fi
      \@edptype{ }\@edept \\
      \fontsize{16}{1pt}\selectfont
      \vspace*{15mm}
      Gwangju Institute of Science and Technology\\
      \vspace*{20mm}
      \fontsize{14}{1pt}\selectfont
      %2014
      \@coveryear
      \maketitlebreaknotwork
    \end{center}

\fi

%
% Inner title page
%
\newpage
\thispagestyle{empty} 

\vspace*{20mm} 

\begin{center}
    % 영문 논문 제목 (20pt)
    {\fontsize{20}{20pt}\selectfont \@etitle \par}
    
    \vspace{30mm} % 제목 사이 간격 3cm
    
    % 국문 논문 제목 (20pt)
    {\fontsize{20}{20pt}\selectfont \@ktitle \par} 
\end{center}

%
% Submission of thesis
%

  \newpage\thispagestyle{empty}
  \vbox to\textheight{
  \begin{center}
    \fontsize{20}{12pt}\selectfont{\maketitlebreakwork
    \@etitle
    \maketitlebreaknotwork}\\
    \vspace{6mm}
    \fontsize{14}{14pt}\selectfont
    Advisor: \@advisor\\
    \ifx\@coadvisor\@@@@undefined@@@@ \else Co-Advisor: \@coadvisor\\ \fi
    \vspace{2mm} by\\\vspace{2mm}\@ename\\[6mm]
    \ifx\@ecollege\@empty\else\@ecollege \\\fi
    \@edptype{ }\@edept{ } \\%%%\mbox{(\@emajor{ }program)}\\
    Gwangju Institute of Science and Technology
  \end{center}
  \vfill
  \begin{trivlist}
    \item[]\fontsize{14}{14pt}\selectfont
    \hskip 1em A thesis submitted to the faculty of the Gwangju Institute
    of Science and Technology in partial fulfillment
    of the requirements for the degree of {\@emd} in the \ifx\D@char\@md\@edptype{ }\fi\ifx\M@char\@md\@edptype{ }\fi
    \@edept\ifx\B@char\@md{ }\@concen\fi %%%({\@emajor} program)
  \end{trivlist}
  \vfill
  \begin{flushright}
   \fontsize{14}{14pt}\selectfont
   \parbox{7cm}{
     \raggedright\noindent Gwangju, Republic of Korea\\\@advisorsigndate\\Approved by\\
     \vskip 10mm\hrule\vskip 8pt
     \noindent Professor \@advisor \\
     \noindent \@reftitlea \\
   }
  \end{flushright}
  }

%
% Acceptance of thesis
%

\ifx\@korean\@@@@undefined@@@@

  \newpage\thispagestyle{empty}
  \vbox to\textheight{
  \vspace*{5mm}
  \begin{center}\fontsize{20.74}{14pt}\selectfont{\maketitlebreakwork
    \@etitle
    \maketitlebreaknotwork}\\[1cm]
    \fontsize{17}{20pt}\selectfont
    \@ename \\
  \vspace*{10mm}
  \fontsize{14}{16pt}\selectfont
  Accepted in partial fulfillment of the requirements for \\ 
  the degree of {\@emd}
  \end{center}
  \vspace*{10mm}
  \begin{flushright}\fontsize{14}{10pt}\selectfont
    \@refereesigndate\\[1cm]
    \begin{tabular}{rlc@{}}
      \@reftitlea & \hrulefill \\[1pt] & \@refereeA \\[25pt]
      \ifx\@refereeB\@@@@undefined@@@@\else
      \@reftitleb & \hrulefill \\[1pt] & \@refereeB \\[25pt]
      \fi
      \ifx\@refereeC\@@@@undefined@@@@\else
      \@reftitleb & \hrulefill \\[1pt] & \@refereeC \\[25pt]
      \fi
      \ifx\@refereeD\@@@@undefined@@@@\else
      \@reftitleb & \hrulefill \\[1pt] & \@refereeD \\[25pt]
      \fi
      \ifx\@refereeE\@@@@undefined@@@@\else
      \@reftitleb & \hrulefill \\[1pt] & \@refereeE \\[25pt]
      \fi
      \ifx\@refereeF\@@@@undefined@@@@\else
      \@reftitleb & \hrulefill \\[1pt] & \@refereeF \\[25pt]
      \fi
      \ifx\@refereeG\@@@@undefined@@@@\else
      \@reftitleb & \hrulefill \\[1pt] & \@refereeG \\[25pt]
      \fi
    \end{tabular}
  \end{flushright}
  \vskip-9pt}

\else

  \newpage\thispagestyle{empty}
  \vbox to\textheight{
  \vspace*{5mm}
  \begin{center}\fontsize{20.74}{14pt}\selectfont{\maketitlebreakwork
    \@ktitle
    \maketitlebreaknotwork}\\[1cm]
    \fontsize{17}{20pt}\selectfont
    \@korname\\
  \vspace*{20mm}
  \fontsize{14}{16pt}\selectfont
  위 논문을 광주과학기술원
  {\@kmd}학위논문으로 인준함
  \end{center}
  \vspace*{10mm}
  \begin{flushright}\fontsize{14}{10pt}\selectfont
    \@refereesigndate\\[1cm]
    \begin{tabular}{rlc@{}}
      \@reftitlea & \@refereeA & ~~(인) \\[25pt]
      \ifx\@refereeB\@@@@undefined@@@@\else
      \@reftitleb & \@refereeB & ~~(인) \\[25pt]
      \fi
      \ifx\@refereeC\@@@@undefined@@@@\else
      \@reftitleb & \@refereeC & ~~(인) \\[25pt]
      \fi
      \ifx\@refereeD\@@@@undefined@@@@\else
      \@reftitleb & \@refereeD & ~~(인) \\[25pt]
      \fi
      \ifx\@refereeE\@@@@undefined@@@@\else
      \@reftitleb & \@refereeE & ~~(인) \\[25pt]
      \fi
      \ifx\@refereeF\@@@@undefined@@@@\else
      \@reftitleb & \@refereeF & ~~(인) \\[25pt]
      \fi
      \ifx\@refereeG\@@@@undefined@@@@\else
      \@reftitleb & \@refereeG & ~~(인) \\[25pt]
      \fi
    \end{tabular}
  \end{flushright}
  \vskip-9pt}

\fi
}

%
% abstract definition - English
%

\def\eabstract{
  \clearpage % 인준지 쪽을 먼저 끝내야 초록 첫 쪽이 i로 시작함
  \ifx\@korean\@@@@undefined@@@@
    \pagenumbering{roman}
    \setcounter{page}{1}
  \fi
  \phantomsection
  \addcontentsline{toc}{chapter}{\fontsize{12}{1pt}\selectfont
  \ifx\@korean\@@@@undefined@@@@ Abstract \else 영 문 요 약 \fi}
  {\fontsize{12}{7pt}\selectfont
  \hbox{\parbox[t]{2cm}{\strut\@code\\\@studentid}\advance\linewidth by-2cm
  \hspace{1mm}
  \parbox[t]{132mm}{\@ename~(\@kname). {\maketitlebreaknotwork \@etitle~(\@ktitle).}
  \ifx\@ecollege\@empty\else\@ecollege, \fi\@edptype{ }\@edept.
  \@coveryear. \@npages{p}. Advisor: Prof. \@advisor \ifx\@coadvisor\@@@@undefined@@@@
  \else, \@coadvisor\fi.}}}
  \vskip4cm
  \begin{center}
  {\fontsize{14}{1pt}\selectfont \bf{Abstract}}
  \end{center}
  \vskip0.5cm
  \fontsize{12}{10pt}\selectfont
  \hspace{8mm}
}
\def\endeabstract{
  \vfill
  \begin{center}
  \rm
  \ \copyright \@coveryear \\
  \@ename \\
  ALL RIGHTS RESERVED
  \end{center}
  \ifx\@korean\@@@@undefined@@@@
  \thispagestyle{plain}\pagestyle{plain}
  \newpage
  \else
  \newpage
  \thispagestyle{empty}\pagestyle{empty}
  \vbox to\textheight{}
  \newpage
  \thispagestyle{plain}\pagestyle{plain}
  \fi
}

%
% abstract definition - Korean
%

\def\kabstract{
  \clearpage % 인준지 쪽을 먼저 끝내야 초록 첫 쪽이 i로 시작함
  \ifx\@korean\@@@@undefined@@@@\else
    \pagenumbering{roman}
    \setcounter{page}{1}
  \fi
  \phantomsection
  \addcontentsline{toc}{chapter}{\fontsize{12}{1pt}\selectfont
  \ifx\@korean\@@@@undefined@@@@ Abstract (Korean) \else 국 문 요 약 \fi}
  {\fontsize{12}{7pt}\selectfont
  \hbox{\parbox[t]{2cm}{\strut\@code\\\@studentid}\advance\linewidth by-2cm
  \hspace{1mm}
  \parbox[t]{132mm}{\@kname. {\maketitlebreaknotwork \@ktitle.}
  \ifx\@kcollege\@empty\else\@kcollege{ }\fi\@kdept\@kdptype.
  \@coveryear. \@npages{p}. 지도교수: \@kadvisor \ifx\@kcoadvisor\@@@@undefined@@@@
  \else, \@kcoadvisor\fi.}}}
  \vskip4cm
  \begin{center}
  {\fontsize{14}{1pt}\selectfont \bf{국 문 요 약}}
  \end{center}
  \vskip0.5cm
  \fontsize{12}{10pt}\selectfont
  \hspace{8mm}
}
\def\endkabstract{
  \vfill
  \begin{center}
  \rm
  \ \copyright \@coveryear\\
  \@korname\\
  ALL RIGHTS RESERVED
  \end{center}
  \thispagestyle{plain}\pagestyle{plain}
  \newpage
}

%
% Figure and Table definition
%

\def\listtables{
  \phantomsection
  \addcontentsline{toc}{chapter}{\fontsize{12}{1pt}\selectfont \listtablename} % List of Tables}
  {\let\thispagestyle\@gobble \listoftables }
  \thispagestyle{plain}\pagestyle{plain}
  \newpage
}

\def\listfigures{
  \phantomsection
  \addcontentsline{toc}{chapter}{\fontsize{12}{1pt}\selectfont \listfigurename} % List of Figures}
  {\let\thispagestyle\@gobble \listoffigures }
  \thispagestyle{plain}\pagestyle{plain}
  \newpage
}

\def\listalgorithms{
  \phantomsection
  \addcontentsline{toc}{chapter}{\fontsize{12}{1pt}\selectfont \listalgorithmcfname} % \listalgorithmname} % List of Algorithms}
  {\let\thispagestyle\@gobble \listofalgorithms }
  \thispagestyle{plain}\pagestyle{plain}
  \newpage
}

%
% contents definition
%

\def\makecontents{
  \phantomsection
  \addcontentsline{toc}{chapter}{\fontsize{12}{1pt}\selectfont \contentsnamen} % List of Contents}
  {\let\thispagestyle\@gobble
   \fontsize{12}{10}\selectfont
   \tableofcontents
  }
  \thispagestyle{plain}\pagestyle{plain}
  \newpage
}

%
% chapter definition
%

\def\@makechapterhead#1{
  {\parindent=0pt
    \ifnum \c@secnumdepth >\m@ne
      \LARGE\bf
      \ifx\@korean\@@@@undefined@@@@
        \@chapapp{} \thechapter
      \else
        제 \thechapter 장
      \fi
    \vskip0pt
    \fi
    \LARGE\bf #1 \vskip50pt
    \nobreak
  }
}

\def\@makeschapterhead#1{
  {\parindent=0pt\begin{center}
    \Large\bf #1\par
    \nobreak\vskip10pt \end{center}
  }
}

%
% numbering definition
%

\def\@chapapp{Chapter}
\renewcommand{\thechapter}{\arabic{chapter}}
\renewcommand{\thesection}{\thechapter.\arabic{section}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\arabic{subsubsection})}

%
% section definition
%

\def\section{
  \@startsection {section}{1}{\z@}
  {3.5ex plus 1ex minus .2ex}
  {1.7ex plus.2ex}
  {\bf}
}

%
% subsection definition
%

\def\subsection{
  \@startsection{subsection}{2}{\z@}
  {3.25ex plus 1ex minus .2ex}
  {1.7ex plus.2ex}
%  {-1em}
  {\bf}
}

\def\subsubsection{
  \@startsection{subsubsection}{3}{\z@}
  {3ex plus 1ex minus .2ex}
  {1.5ex plus .2ex}
  {\bf}
}

%
% appendix definition
%

\def\appendix{\par\setcounter{chapter}{0}\setcounter{section}{0}
  \def\@chapapp{Appendix}
  \def\thechapter{\Alph{chapter}}
}

%
% summary definition
% yoon
\def\summary{\chapter*{Summary}
  \addcontentsline{toc}{chapter}{Summary}
  \thispagestyle{empty}\pagestyle{empty}
  \begin{center}\fontsize{15}{18}\selectfont{\maketitlebreakwork\@etitle
    \maketitlebreaknotwork}
  \end{center}\vspace{1.5cm}
}

%
% bibliography definition
%
\def\thebibliography#1{\chapter*{\bibname\@mkboth
 {\uppercase{\bibname}}{\uppercase{\bibname}}}
 \addcontentsline{toc}{chapter}{\bibname}\list
 {\arabic{enumi}.~}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
 \advance\leftmargin\labelsep
 \usecounter{enumi}}
 \def\newblock{\hskip .11em plus .33em minus .07em}
 \sloppy\clubpenalty4000\widowpenalty4000
 \sfcode`\.=1000\relax\thispagestyle{plain}\pagestyle{plain}\relax
}

\def\endthebibliography{\label{paperlastpagelabel}
  \def\@noitemerr{\@warning{Empty `thebibliography' environment}}
  \thispagestyle{plain}\pagestyle{plain}
  \endlist
}
%
% Acknowledgements definition
%

\def\acknowledgements{\chapter*{\ifx\@korean\@@@@undefined@@@@ Acknowledgements \else 감 사 의 말 \fi}
  \addcontentsline{toc}{chapter}{\fontsize{12}{1pt}\selectfont
  \ifx\@korean\@@@@undefined@@@@ Acknowledgements \else 감 사 의 말 \fi }
}
\def\endacknowledgements{
    \thispagestyle{plain}
    \pagestyle{plain}
    \newpage
}

%
% Curriculum Vitae definition
%

\ifx\@korean\@@@@undefined@@@@

\def\vitae{\chapter*{Curriculum Vitae}
\thispagestyle{empty}\pagestyle{empty}
\begin{tabular}{@{}ccl}
\hbox to 35mm{Name\hss}&:& \@ename \\[-10pt]
\hbox to 35mm{Birth Date\hss}&:& \@birthday \\[-10pt]
\hbox to 35mm{Birth Place\hss}&:& \@birthplace \\[-10pt]
\hbox to 35mm{Permanent Address\hss}&:& \@addr \\
\end{tabular}}
\newlength{\temp@len}

\else

\def\vitae{\chapter*{이 력 서}
\thispagestyle{empty}\pagestyle{empty}
\begin{tabular}{@{}ccl}
\hbox to 20mm{성~~~~~~~~~명\hss}&:& \@korname\\[-10pt]
\hbox to 20mm{생 년 월 일\hss}&:& \@birthday \\[-10pt]
\hbox to 20mm{출~~~생~~~지\hss}&:& \@birthplace \\[-10pt]
\hbox to 20mm{본~~~~~~~~~적\hss}&:& \@addr \\
\end{tabular}}
\newlength{\temp@len}

\fi

\def\education#1{\vspace{.5cm}
\begin{center} \fontsize{14}{1pt}\selectfont\bf \ifx\@korean\@@@@undefined@@@@ Education \else 학~~~~~~~~력 \fi
\end{center}\vspace{.1cm}\settowidth{\temp@len}{#1}
\begin{list}{}{\labelwidth=\temp@len\labelsep=.5cm
\advance\temp@len by.5cm\leftmargin=\temp@len
\def\makelabel##1{##1\hss}} \fontsize{12}{8pt}\selectfont}
\def\endeducation{\end{list}}

\def\experience#1{\vspace{.5cm}
\begin{center} \fontsize{14}{1pt}\selectfont\bf \ifx\@korean\@@@@undefined@@@@ Work Experience \else 경~~~~~~~~력 \fi
\end{center}\vspace{.1cm}\settowidth{\temp@len}{#1}
\begin{list}{}{\labelwidth=\temp@len\labelsep=.5cm
\advance\temp@len by.5cm\leftmargin=\temp@len
\def\makelabel##1{##1\hss}} \fontsize{12}{8pt}\selectfont}
\def\endexperience{\end{list}}

%\def\activity{%\vspace{.5cm}
%\begin{center} \ifx\@korean\@@@@undefined@@@@ Professional Activities \else 학 회 활 동 \fi
%\end{center}\vspace{.5cm} \fontsize{12}{8pt}\selectfont}
%\def\endactivity{}

\def\activity#1{\vspace{.5cm}
\begin{center} \fontsize{14}{1pt}\selectfont\bf \ifx\@korean\@@@@undefined@@@@ Professional Activities \else 학 회 활 동 \fi
\end{center}\vspace{.1cm}\settowidth{\temp@len}{#1}
\begin{list}{}{\labelwidth=\temp@len\labelsep=.5cm
\advance\temp@len by.5cm\leftmargin=\temp@len
\def\makelabel##1{##1\hss}} \fontsize{12}{8pt}\selectfont}
\def\endactivity{\end{list}}

\def\patents#1{\vspace{.5cm}
\begin{center} \fontsize{14}{1pt}\selectfont\bf \ifx\@korean\@@@@undefined@@@@ Patents \else 특 허 \fi
\end{center}\vspace{.1cm}\settowidth{\temp@len}{#1}
\begin{list}{}{\labelwidth=\temp@len\labelsep=.5cm
\advance\temp@len by.5cm\leftmargin=\temp@len
\def\makelabel##1{##1\hss}} \fontsize{12}{8pt}\selectfont}
\def\endpatents{\end{list}}

%\def\awards{\vspace{.5cm}
%\begin{center} \ifx\@korean\@@@@undefined@@@@ Honors and Awards \else 수 상 경 력 \fi
%\end{center}\vspace{.5cm} \fontsize{12}{8pt}\selectfont}
%\def\endawards{}

\def\awards#1{\vspace{.5cm}
\begin{center} \fontsize{14}{1pt}\selectfont\bf \ifx\@korean\@@@@undefined@@@@ Honors and Awards \else 수 상 경 력 \fi
\end{center}\vspace{.1cm}\settowidth{\temp@len}{#1}
\begin{list}{}{\labelwidth=\temp@len\labelsep=.5cm
\advance\temp@len by.5cm\leftmargin=\temp@len
\def\makelabel##1{##1\hss}} \fontsize{12}{8pt}\selectfont}
\def\endawards{\end{list}}


%\def\publication#1{\vspace{.5cm}
%\begin{center} \ifx\@korean\@@@@undefined@@@@ Publications \else 출~~~~~~~~판 \fi
%\end{center}\vspace{.1cm}\settowidth{\temp@len}{#1}
%\begin{enumerate}{}{\labelwidth=\temp@len\labelsep=.5cm
%\advance\temp@len by.5cm\leftmargin=\temp@len
%\def\makelabel##1{##1\hss}} \fontsize{12}{8pt}\selectfont}
%\def\endpublication{\end{enumerate}}


%\def\paperList{\chapter*{Publications}
%\thispagestyle{empty}\pagestyle{empty}}
%\newlength{\temp@len}


%
% Publication definition
%

\ifx\@korean\@@@@undefined@@@@

\def\paperList{\chapter*{Publications}
\thispagestyle{empty}\pagestyle{empty}}

\else

\def\paperList{\chapter*{논문목록}
\thispagestyle{empty}\pagestyle{empty}}

\fi


\def\InterJournal#1{\vspace{.5cm}
\underline{\bf \ifx\@korean\@@@@undefined@@@@ International Journal Papers (SCI)\else 국제학회지\fi}
\vspace{.1cm}\settowidth{\temp@len}{#1}
\begin{enumerate}{}{\labelwidth=\temp@len\labelsep=.5cm
\advance\temp@len by.5cm\leftmargin=\temp@len
\def\makelabel##1{##1\hss}} \fontsize{12}{12pt}\selectfont}
\def\endInterJournal{\end{enumerate}}

\def\InterConference#1{\vspace{.5cm}
\underline{\bf \ifx\@korean\@@@@undefined@@@@ International Conference Papers\else 국제학술회의\fi}
\vspace{.1cm}\settowidth{\temp@len}{#1}
\begin{enumerate}{}{\labelwidth=\temp@len\labelsep=.5cm
\advance\temp@len by.5cm\leftmargin=\temp@len
\def\makelabel##1{##1\hss}} \fontsize{12}{12pt}\selectfont}
\def\endInterConference{\end{enumerate}}

\def\DomesJournal#1{\vspace{.5cm}
\underline{\bf \ifx\@korean\@@@@undefined@@@@ Domestic Journal Papers\else 국내학술지\fi}
\vspace{.1cm}\settowidth{\temp@len}{#1}
\begin{enumerate}{}{\labelwidth=\temp@len\labelsep=.5cm
\advance\temp@len by.5cm\leftmargin=\temp@len
\def\makelabel##1{##1\hss}} \fontsize{12}{12pt}\selectfont}
\def\endDomesJournal{\end{enumerate}}

\def\DomesConference#1{\vspace{.5cm}
\underline{\bf \ifx\@korean\@@@@undefined@@@@ Domestic Conference Papers\else 국내학술회의\fi}
\vspace{.1cm}\settowidth{\temp@len}{#1}
\begin{enumerate}{}{\labelwidth=\temp@len\labelsep=.5cm
\advance\temp@len by.5cm\leftmargin=\temp@len
\def\makelabel##1{##1\hss}} \fontsize{12}{12pt}\selectfont}
\def\endDomesConference{\end{enumerate}}

\def\Book#1{\vspace{.5cm}
\underline{\bf \ifx\@korean\@@@@undefined@@@@ Book Chapter\else 저 서\fi}
\vspace{.1cm}\settowidth{\temp@len}{#1}
\begin{enumerate}{}{\labelwidth=\temp@len\labelsep=.5cm
\advance\temp@len by.5cm\leftmargin=\temp@len
\def\makelabel##1{##1\hss}} \fontsize{12}{12pt}\selectfont}
\def\endBook{\end{enumerate}}

\def\Thesis#1{\vspace{.5cm}
\underline{\bf \ifx\@korean\@@@@undefined@@@@ Thesis\else 학위논문\fi}
\vspace{.1cm}\settowidth{\temp@len}{#1}
\begin{description}{}{\labelwidth=\temp@len\labelsep=.5cm
\advance\temp@len by.5cm\leftmargin=\temp@len
\def\makelabel##1{##1\hss}} \fontsize{12}{12pt}\selectfont}
\def\endThesis{\end{description}}

% end of the default gist.cls


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 아래의 정의는 벡터 표시 형태를 bold-type으로 나타낼 수 있도록 하는 것이다.
% redefines the \vec accent to a bold character - if desired
\iffalse % yoon
\def\fig@type{arrow}% temporarily abused
\ifx\vec@style\fig@type\else
\@ifundefined{vec@style}{%
 \def\vec#1{\ensuremath{\mathchoice
                     {\mbox{\boldmath$\displaystyle\mathbf{#1}$}}
                     {\mbox{\boldmath$\textstyle\mathbf{#1}$}}
                     {\mbox{\boldmath$\scriptstyle\mathbf{#1}$}}
                     {\mbox{\boldmath$\scriptscriptstyle\mathbf{#1}$}}}}%
}
{\def\vec#1{\ensuremath{\mathchoice
                     {\mbox{\boldmath$\displaystyle#1$}}
                     {\mbox{\boldmath$\textstyle#1$}}
                     {\mbox{\boldmath$\scriptstyle#1$}}
                     {\mbox{\boldmath$\scriptscriptstyle#1$}}}}%
}
\fi
\fi % yoon
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% end of gist.cls
%
