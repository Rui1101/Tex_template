% thesis.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2025/12/17 Thesis class] 

% === 基本：article に必要オプションを渡す === 
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\PassOptionsToClass{a4paper,12pt,onecolumn}{article}
\LoadClass{article}

% === 共通パッケージ === 
\RequirePackage{ifxetex} 
\RequirePackage{ifluatex}
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{titlesec}
\RequirePackage{tocloft}
\RequirePackage{caption}
\RequirePackage{amsmath,amssymb}
\RequirePackage{indentfirst}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{tikz}
\usetikzlibrary{calc}

% === レイアウト === 
\geometry{
  a4paper,
  left=18mm, right=18mm, top=30mm, bottom=20mm
}
\setlength{\columnsep}{20pt}
\raggedbottom
\setstretch{1.08}
\setlength{\parindent}{1em}
\setlength{\parskip}{0pt}

% === 日本語フォント（XeLaTeX / LuaLaTeX 両対応） ===
\ifxetex
 \RequirePackage{fontspec}
 \RequirePackage{xeCJK}
 % 必要に応じて環境のフォント名に変更してください
% \setmainfont{Noto Serif} % 英字用フォールバック
% \setsansfont{Noto Sans}
 \setmainfont{Linux Libertine O} % メインのセリフ体（本文） 
 \setsansfont{Lato}  % サンセリフ体（見出しなど）
 \setmonofont{Roboto Mono}  % 等幅フォント（コードなど）
 \setCJKmainfont{IPAexMincho}
 \setCJKsansfont{IPAexGothic}
\else
 \ifluatex
  \RequirePackage{fontspec}
  \RequirePackage{luatexja}
  \RequirePackage{luatexja-fontspec}
  \setmainjfont{IPAexMincho}
  \setsansjfont{IPAexGothic}
 \else
  \PackageError{thesis}{This class requires XeLaTeX or LuaLaTeX}{Use xelatex or lualatex.}
 \fi
\fi

% === ヘッダー / フッター（PDF 見本風：上にセクション名と両端にページ） ===
\fancypagestyle{fancy}{
  \fancyhf{} 
  % ページ番号を右上・左上に表示（偶数/奇数で分けるなら later）
  %\fancyhead[L]{\nouppercase{\leftmark}}
  \fancyhead[L]{\nouppercase{　第\thechapter{}章　\@chapshort}}
  \fancyhead[R]{\thepage}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0pt} 
}

% --- frontmatter / mainmatter サポート & front pagestyle ---
% 前付用のページスタイル（右上にページ番号）
\makeatletter
\fancypagestyle{front}{%
  \fancyhf{}%
  \fancyhead[L]{\nouppercase{　目　次}}
  \fancyhead[R]{\thepage}%
  \renewcommand{\headrulewidth}{0.4pt}%
  \renewcommand{\footrulewidth}{0pt}%
}

% frontmatter: 目次等（ローマ数字、小文字）
\newcommand{\frontmatter}{%
  \fancyhf{}%
%  \cleardoublepage
  \fancyhead[L]{\nouppercase{\@chapshort}}
  \fancyhead[R]{\thepage}%
  \pagenumbering{roman}%
  \pagestyle{front}%
}

% mainmatter: 本文開始（算用数字1から）
\newcommand{\mainmatter}{%
  \clearpage
  \pagenumbering{arabic}%
  \setcounter{page}{1}%
  \pagestyle{fancy}%
}
\makeatother

% === 目次（toc）微調整 ===
\setlength{\baselineskip}{0.7cm}
\setlength{\cftbeforesecskip}{4pt}
\setlength{\cftbeforesubsecskip}{3pt}
\setlength{\cftsecindent}{2em} % セクションのインデント
\setlength{\cftsubsecindent}{4em}
\setlength{\cftsubsubsecindent}{6em}
\setlength{\cftsecnumwidth}{2em}  
\setlength{\cftsubsecnumwidth}{3em}  
\setlength{\cftsubsubsecnumwidth}{4em}  
\setlength{\cftbeforesecskip}{4pt}   % 小さくすると詰まる、デフォルトはもう少しあるかも
\makeatletter
% chapter の TOC 行の前に縦スペースを追加する
\newcommand{\l@chapter}{%
  \addpenalty{-\@highpenalty}%
  \vspace{1.2em}% ← ここが「chapter 前の空き」
  \@dottedtocline{0}{0pt}{1.5em}%first
}
\makeatother
\renewcommand{\cftsecfont}{\normalfont\small}      % 目次中のタイトル部分
\renewcommand{\cftsecpagefont}{\normalfont\small}  % 目次中のページ番号部分

\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\AtBeginDocument{
\renewcommand{\contentsname}{\LARGE\textsf{目　次}\vspace*{5mm}\\}
\renewcommand{\listfigurename}{\LARGE\textsf{図　目　次}\vspace*{5mm}\\}%
\renewcommand{\listtablename}{\LARGE\textsf{表　目　次}\vspace*{5mm}\\}%
}

% === キャプション === 
\captionsetup{
 format=plain,
 justification=centering,
 singlelinecheck=true,
 font=small,
 labelfont=bf
}
\renewcommand{\tablename}{表}
\renewcommand{\figurename}{図}
\captionsetup[table]{labelsep=colon, position=top, skip=4pt}
\captionsetup[figure]{labelsep=colon, position=bottom, skip=4pt} 

% define chapter counter and appearance
\makeatletter
\newcounter{chapter}
\renewcommand{\thechapter}{\arabic{chapter}}

% reset section counter when chapter increments
\@addtoreset{section}{chapter}

% mark for headers
\newcommand{\chaptermark}[1]{\markboth{第\thechapter{}章\ #1}{}}

% \chapter command
\makeatletter
\newcommand{\chapter}[2][]{%
  % optional argument #1 for short toc/header title
  \clearpage
  \refstepcounter{chapter}%
  \setcounter{section}{0}%
  % choose title text: optional short (#1) else full (#2)
  \if\relax\detokenize{#1}\relax
    \edef\@chapshort{#2}%
  \else
    \edef\@chapshort{#1}%
  \fi
  
  % header mark
  \chaptermark{\@chapshort}%
  % add to toc as chapter-level
  \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#2}%
  % typeset chapter title: simple layout (customize for your style)
  \vspace*{2mm} % small vertical gap; Cvs is not standard—use explicit mm if needed

  \begingroup
    % このページだけヘッダ/フッタを消す
    \thispagestyle{empty}%
    \begin{center}
      \vspace{60mm}
      {\Huge\sffamily 第\thechapter{}章\par}
      \vspace{38pt}
      {\Huge\bfseries\sffamily #2\par}
    \end{center}
    \newpage
  \endgroup
}
\makeatother

% ensure \leftmark shows chapter in fancyhdr
\makeatletter
\renewcommand{\leftmark}{\protect\nouppercase{\@firstmark}}
% if using fancyhdr: update what \chaptermark sets
\makeatother

%=== セクション書式 === 
\titleformat{\section}[hang]{\sffamily\LARGE}{\thesection\quad}{0pt}{} 
\renewcommand{\thesection}{\thechapter.\arabic{section}}
%=== サブセクション書式 === 
\titleformat{\subsection}[hang]{\Large\sffamily}{\thesubsection\quad}{0pt}{} 
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
%=== サブサブセクション書式 === 
\titleformat{\subsubsection}[hang]{\large\sffamily}{\thesubsubsection\quad}{0pt}{} 
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}

% === タイトルページ用インターフェース（PDFの見本に合わせる） === 
\makeatletter
\newcommand{\univ}{}
\newcommand{\dept}{} 
\newcommand{\papertitle}{} 
\newcommand{\papertitlesec}{}   % タイトルが2秒に渡る時
\newcommand{\studentno}{}
\newcommand{\studentname}{}
\newcommand{\advisor}{} 
\newcommand{\yearstr}{} 
\makeatother

% setter 
\newcommand{\setuniv}[1]{\def\univ{#1}}
\newcommand{\setdept}[1]{\def\dept{#1}}
\newcommand{\setpapertitle}[1]{\def\papertitle{#1}} 
\newcommand{\setpapertitlesec}[1]{\def\papertitlesec{#1}} 
\newcommand{\setstudentno}[1]{\def\studentno{#1}} \newcommand{\setstudentname}[1]{\def\studentname{#1}}
\newcommand{\setadvisor}[1]{\def\advisor{#1}} 
\newcommand{\setyearstr}[1]{\def\yearstr{#1}} 

\makeatletter
% chapter カウンタがある前提で設定（articleベースで自作chapterしている場合OK）
\@ifundefined{chapter}{%
  \PackageWarning{thesis}{chapter counter undefined: skipping per-chapter figure/table numbering}%
}{%
  % chngcntr が読み込まれていること（あなたのクラスでは既に \RequirePackage{chngcntr} している想定）
  \counterwithin{figure}{chapter}
  \counterwithin{table}{chapter}
  % 表示形式を "章.番号" にする
  \renewcommand{\thefigure}{\thechapter.\arabic{figure}}
  \renewcommand{\thetable}{\thechapter.\arabic{table}}
}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%    表紙--------------------------------------
%%%
\makeatletter
\newcommand{\makethesistitle}{%
 \thispagestyle{empty}%

% --- ページ内余白に合わせたフレーム基準値（必要に応じて調整） --- 
 \def\LM{18mm} % 左余白（geometryと合わせる）
 \def\RM{18mm} % 右余白
 \def\TM{20mm} % 上余白
 \def\BM{20mm} % 下余白
 
 % 全体外枠（ページ余白に合わせる） 
 \begin{tikzpicture}[remember picture,overlay]

% --- 複数ボックス配置例 --- 
 % (A) 左上小ボックス：学籍番号
 \node[draw, line width=0.4pt, inner sep=12pt, anchor=north east, align=left, font=\normalsize]
 at ($(current page.north east)+(\RM-35mm,-\TM-2mm)$) (boxA) 
 {No. \underline{\hspace{6mm} \studentno\hspace{6mm}}};
 
 % (B) 中央大ボックス：タイトル（大きく）
 \node[draw, double distance=1pt, line width=0.7pt, inner sep=8pt,
    minimum width=120mm, minimum height=42mm, 
    anchor=north, align=center, font=\large]
    at ($(current page.north)+(0mm,-60.0mm)$)
    (boxB) {\sffamily\LARGE{卒　業　論　文}\\ \vspace*{0mm}\\ 
    \sffamily\large{ 題目：\papertitle} \\ \sffamily\large{\papertitlesec}\vspace{6mm}};
  % twocolumn の両カラム幅タイトルブロックを出力

 % (C) 右上中ボックス：指導教員
 \node[draw, line width=0.7pt, inner sep=16pt, anchor=north, minimum width=90mm,align=center, font=\large]
 at ($(current page.north)+(0mm,-125.0mm)$) 
 (boxB) {指導教員：　　\advisor};
 
 % (D) 右下縦に並ぶ情報ボックス群（大学/学部/年度/氏名） 
 \node[anchor=north, align=center, font=\Large]
 at ($(current page.north)+(0mm,-165mm)$) 
 (boxD1) {\sffamily\univ};
 
 \node[anchor=north, align=center, font=\Large]
 at ($(current page.north)+(0mm,-175mm)$) 
 (boxD2) {\sffamily\dept};

\node[anchor=north, minimum width=90mm, inner sep=20pt, align=right, font=\small]
 at ($(current page.north)+(-30mm,-190mm)$) 
 (boxD3) {\raggedright\large 年度：};

\node[draw, line width=0.6pt, inner sep=20pt, anchor=north, minimum width=90mm, align=right, font=\large]
 at ($(current page.north)+(0mm,-190mm)$) 
(boxD4) {\yearstr};
 
 \node[anchor=north, minimum width=90mm, minimum height=30mm, align=left, font=\small]
 at ($(current page.north)+(-30mm,-210mm)$) 
 (boxD5) {\raggedright\large 氏名：};

 \node[draw, double distance=1pt, line width=0.6pt, inner sep=4pt, anchor=north, minimum width=90mm, minimum height=30mm, align=left, font=\small]
 at ($(current page.north)+(0mm,-220mm)$) 
 (boxD6) {\centering\Large\sffamily\studentname};
   
 \end{tikzpicture}

 \clearpage
}
\makeatother

% === 便利コマンド === 
% 参考文献日本語化（標準thebibliography向け） 
\AtBeginDocument{
\setlength{\baselineskip}{0.6cm}
\renewcommand{\refname}{
\sffamily\LARGE{参　考　文　献}}
}
% === 最後 ===
\endinput