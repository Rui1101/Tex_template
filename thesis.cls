% thesis.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2026/01/09 Thesis class Ver.1.00]

% --- クラスオプションの継承 ---
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\PassOptionsToClass{a4paper,12pt,onecolumn}{article}
\LoadClass{article}

% --- 必須パッケージの読み込み ---
\RequirePackage{ifxetex, ifluatex}
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{titlesec}
\RequirePackage{tocloft}
\RequirePackage{caption}
\RequirePackage{amsmath, amssymb}
\RequirePackage{indentfirst}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{tikz}
\RequirePackage{chngcntr}
\RequirePackage{etoolbox}
\usetikzlibrary{calc}

% --- レイアウト設定 ---
\geometry{
  a4paper,
  left=18mm, right=18mm, top=30mm, bottom=20mm
}
\setstretch{1.08}
\setlength{\parindent}{1em}

% --- 日本語・英数フォント設定 ---
\ifxetex
  \RequirePackage{fontspec}
  \RequirePackage{xeCJK}
  \xeCJKsetup{PunctStyle=fullwidth} 
  \setmainfont{TeX Gyre Termes}
  \setsansfont{TeX Gyre Heros}[BoldFont={* Bold}]
  \setmonofont{Roboto Mono}
  \setCJKmainfont{IPAexMincho}
  \setCJKsansfont{IPAexGothic}
\else\ifluatex
  \RequirePackage{fontspec}
  \RequirePackage{luatexja}
  \RequirePackage{luatexja-fontspec}
  \ltjsetparameter{yakumono={none}}
  \setmainfont{TeX Gyre Termes}
  \setsansfont{TeX Gyre Heros}
  \setmainjfont{IPAexMincho}
  \setsansjfont{IPAexGothic}
\fi\fi

% --- 章（Chapter）の独自定義 ---
\newcounter{chapter}
\renewcommand{\thechapter}{\arabic{chapter}}

% セクション等がヘッダーを勝手に書き換えないように無効化（重要）
\renewcommand{\sectionmark}[1]{}
\renewcommand{\subsectionmark}[1]{}

% 通常の章（扉ページあり）
\newcommand{\chapter}[2][]{%
  \clearpage
  \refstepcounter{chapter}
  \setcounter{section}{0}
  \def\temp{#1}%
  \ifx\temp\empty \def\@chapshort{#2} \else \def\@chapshort{#1} \fi
  % ヘッダーに「第N章 タイトル」を固定
  \markboth{第\thechapter{}章\quad \@chapshort}{}%
  \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#2}%
  \begingroup
    \thispagestyle{empty}
    \begin{center}
      \vspace*{60mm}
      {\Huge\sffamily\bfseries 第\thechapter{}章\par}
      \vspace{35pt}
      {\Huge\sffamily\bfseries #2\par}
    \end{center}
    \newpage
  \endgroup
}

% 謝辞などの番号なし章用（扉ページなし・すぐ本文開始）
\newcommand{\prefacechapter}[1]{%
  \clearpage
  \markboth{#1}{}%
  \addcontentsline{toc}{chapter}{#1}%
  {\Huge\sffamily\bfseries #1\par}
  \vspace{20pt}
  \@afterheading
}

% 図表番号を "章.番号" に
\counterwithin{figure}{chapter}
\counterwithin{table}{chapter}
\renewcommand{\thefigure}{\thechapter.\arabic{figure}}
\renewcommand{\thetable}{\thechapter.\arabic{table}}

% --- セクション書式 ---
\titleformat{\section}[hang]{\sffamily\LARGE}{\thesection\quad}{0pt}{}
\renewcommand{\thesection}{\thechapter.\arabic{section}}
\titleformat{\subsection}[hang]{\Large\sffamily}{\thesubsection\quad}{0pt}{}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
% 小々節：large（本文より一回り大きい）＋太字＋サンセリフ
\titleformat{\subsubsection}[hang]{\sffamily\large\bfseries}{\thesubsubsection\quad}{0pt}{}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}

% --- ヘッダー・フッターの設定 ---
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\nouppercase{\leftmark}} 
\fancyhead[R]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}

\fancypagestyle{fancy}{
  \fancyhf{}
  \fancyhead[L]{\nouppercase{\leftmark}}
  \fancyhead[R]{\thepage}
}

\fancypagestyle{front}{
  \fancyhf{}
  \fancyhead[L]{\nouppercase{\leftmark}} 
  \fancyhead[R]{\thepage}
}

\newcommand{\frontmatter}{%
  \clearpage
  \pagenumbering{roman}
  \pagestyle{front}
}

\newcommand{\mainmatter}{%
  \clearpage
  \pagenumbering{arabic}
  \setcounter{page}{1}
  \pagestyle{fancy}
}

% --- 目次（TOC）の書式設定 ---
\setlength{\cftsecindent}{2em}
\setlength{\cftsubsecindent}{4em}
\setlength{\cftsubsubsecindent}{5.5em}
\setlength{\cftsecnumwidth}{2.5em}
\setlength{\cftsubsecnumwidth}{3em}
\setlength{\cftsubsubsecnumwidth}{4.5em}

\newcommand{\cftchapfont}{\normalfont}
\newcommand{\cftchappagefont}{\normalfont}
\newcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsecfont}{\normalfont}
\renewcommand{\cftsecpagefont}{\normalfont}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsubsecfont}{\normalfont}
\renewcommand{\cftsubsecpagefont}{\normalfont}

\newcommand{\l@chapter}{%
  \addpenalty{-\@highpenalty}%
  \vspace{0.5em}%
  \@dottedtocline{0}{0pt}{1.5em}
}

\renewcommand{\cfttoctitlefont}{\LARGE\sffamily}
\renewcommand{\cftaftertoctitle}{\vspace*{5mm}}
\renewcommand{\cftloftitlefont}{\LARGE\sffamily}
\renewcommand{\cftafterloftitle}{\vspace*{5mm}}
\renewcommand{\cftlottitlefont}{\LARGE\sffamily}
\renewcommand{\cftafterlottitle}{\vspace*{5mm}}

% --- キャプション ---
\captionsetup{format=plain, justification=centering, font=small, labelfont=bf}
\renewcommand{\tablename}{表}
\renewcommand{\figurename}{図}
\captionsetup[table]{labelsep=colon, position=top, skip=0pt}
\captionsetup[figure]{labelsep=colon, position=bottom, skip=4pt}

% --- 文書開始時の自動設定 ---
\AtBeginDocument{
  \renewcommand{\contentsname}{目　次}
  \renewcommand{\listfigurename}{図　目　次}
  \renewcommand{\listtablename}{表　目　次}
  \renewcommand{\refname}{参　考　文　献}
  
  \setlength{\baselineskip}{0.6cm}
  
  \pretocmd{\tableofcontents}{\markboth{目　次}{}}{}{}
  \pretocmd{\listoffigures}{\markboth{図目次}{}}{}{}
  \pretocmd{\listoftables}{\markboth{表目次}{}}{}{}
}

% 参考文献のヘッダー・目次追加
\AtBeginEnvironment{thebibliography}{%
  \clearpage
  \markboth{\refname}{}%
%  \addcontentsline{toc}{chapter}{\refname}%
  \addcontentsline{toc}{chapter}{参考文献}%
}

% --- 表の中の調整 ---
\AtBeginEnvironment{tabular}{\small\setstretch{1.0}}
\AtBeginEnvironment{longtable}{\small\setstretch{1.0}}

% --- 表紙用データ定義 ---
\newcommand{\setuniv}[1]{\def\@univ{#1}}
\newcommand{\setdept}[1]{\def\@dept{#1}}
\newcommand{\setpapertitle}[1]{\def\@papertitle{#1}}
\newcommand{\setpapertitlesec}[1]{\def\@papertitlesec{#1}}
\newcommand{\setstudentno}[1]{\def\@studentno{#1}}
\newcommand{\setstudentname}[1]{\def\@studentname{#1}}
\newcommand{\setadvisor}[1]{\def\@advisor{#1}}
\newcommand{\setyearstr}[1]{\def\@yearstr{#1}}

\setuniv{} \setdept{} \setpapertitle{} \setpapertitlesec{}
\setstudentno{} \setstudentname{} \setadvisor{} \setyearstr{}

% --- 表紙の生成 ---
\newcommand{\makethesistitle}{%
  \thispagestyle{empty}
  \begin{tikzpicture}[remember picture,overlay]
    \node[draw, line width=0.4pt, inner sep=12pt, anchor=north east, align=left]
      at ($(current page.north east)+(-23mm,-22mm)$) 
      {No. \underline{\hspace{6mm} \@studentno\hspace{6mm}}};
    
    \node[draw, double distance=1pt, line width=0.7pt, inner sep=8pt,
          minimum width=120mm, minimum height=42mm, anchor=north, align=center]
      at ($(current page.north)+(0mm,-60mm)$)
      {\sffamily\LARGE{卒　業　論　文}\\[8mm]
       \sffamily\large{題目：\@papertitle} \\
       \sffamily\large{\@papertitlesec}};
       
    \node[draw, line width=0.7pt, inner sep=16pt, anchor=north, minimum width=90mm, align=center]
      at ($(current page.north)+(0mm,-125mm)$) 
      {指導教員：　　\@advisor};
    
    \node[anchor=north, align=center, font=\Large] at ($(current page.north)+(0mm,-165mm)$) {\sffamily\@univ};
    \node[anchor=north, align=center, font=\Large] at ($(current page.north)+(0mm,-175mm)$) {\sffamily\@dept};

    \node[anchor=north, minimum width=90mm, align=left] at ($(current page.north)+(-30mm,-190mm)$) {\large 年度：};
    \node[draw, line width=0.6pt, inner sep=20pt, anchor=north, minimum width=90mm, align=center]
      at ($(current page.north)+(0mm,-190mm)$) {\@yearstr};
    
    \node[anchor=north, minimum width=90mm, align=left] at ($(current page.north)+(-30mm,-225mm)$) {\large 氏名：};
    \node[draw, double distance=1pt, line width=0.6pt, anchor=north, minimum width=90mm, minimum height=30mm, align=center]
      at ($(current page.north)+(0mm,-225mm)$) {\Large\sffamily\@studentname};
  \end{tikzpicture}
  \clearpage
}
\endinput