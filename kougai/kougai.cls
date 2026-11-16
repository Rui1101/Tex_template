% kougai.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kougai}
% [2025/12/17 Kougai class: 梗概フォーマット]

% --- ユーザーオプションは article に渡す ---
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
% 強制デフォルトオプション（ユーザーが同種オプションを渡せば上書きされる）
%\PassOptionsToClass{a4paper,10pt,twocolumn}{article}
\PassOptionsToClass{a4paper,10pt}{article}
\ProcessOptions\relax

% ベースクラス
\LoadClass{article}

% --- 基本設定 ---
\RequirePackage{ifxetex}
\RequirePackage{ifluatex}

\RequirePackage{geometry}
\geometry{
  a4paper,
  left=18mm,
  right=18mm,
  top=20mm,
  bottom=20mm
}

\setlength{\columnsep}{25pt}
\raggedbottom

% 共通パッケージ
\RequirePackage{setspace}
\RequirePackage{titlesec}
\RequirePackage{tocloft}
\RequirePackage{caption}
\RequirePackage{amsmath,amssymb}
\RequirePackage{indentfirst}
\RequirePackage{etoolbox}

\setstretch{1.1}
\setlength{\parindent}{1em}
\setlength{\parskip}{0pt}

% --- 日本語フォント（エンジン判定） ---
\ifxetex
  \RequirePackage{fontspec}
  \RequirePackage{xeCJK}

  % 環境に応じてフォント名を書き換えてください
  \setmainfont{IPAexMincho}
  \setsansfont{IPAexGothic}
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
    \PackageError{kougai}{This class requires XeLaTeX or LuaLaTeX}{Please compile with xelatex or lualatex.}
  \fi
\fi

% --- ページ番号を消す（デフォルト） ---
\AtBeginDocument{\pagestyle{empty}}

% --- キャプション設定 ---
\captionsetup{
  format=plain,
  justification=centering,
  singlelinecheck=true,
  font=small,
  labelfont=sf
}
\renewcommand{\tablename}{表}
\renewcommand{\figurename}{図}
\captionsetup[table]{labelsep=colon, position=top, skip=2pt}
\captionsetup[figure]{labelsep=colon, position=bottom, skip=2pt}

% --- section formatting ---
\titleformat{\section}[hang]{\sffamily}{\thesection.}{0.8em}{}
\renewcommand{\thesection}{\arabic{section}}
\titlespacing{\section}{0pt}{11pt}{1pt}

% --- 内部ストレージとユーザーインターフェース ---
\makeatletter
\gdef\KTitle{}%
\gdef\KStudentNo{}%
\gdef\KStudentName{}%
\gdef\KAdvisor{}%

% setters (ユーザーは preamble でこれらを呼ぶ)
\newcommand{\papertitle}[1]{\gdef\KTitle{#1}}
\newcommand{\studentno}[1]{\gdef\KStudentNo{#1}}
\newcommand{\studentname}[1]{\gdef\KStudentName{#1}}
\newcommand{\advisor}[1]{\gdef\KAdvisor{#1}}

% authinfo 互換（学籍, 指導教員）
%\newcommand{\authinfo}[2]{\gdef\KStudentNo{#1}\gdef\KAdvisor{#2}}

% タイトル出力（begin document 時に実行）
\newcommand{\makekougaititle}{%
 \twocolumn[
      \begin{center}
        {\LARGE\textsf{\KTitle}\par}
        \vspace{0.8em}
        {\normalsize \KStudentNo\ \ \KStudentName\par}
          {\normalsize 指導教員：\KAdvisor\par}
      \end{center}
      \vspace{1em}
  ]
}

% ドキュメント開始時に自動でタイトル領域を出力する（preambleで定義しておくこと）
%\AtBeginDocument{\Kprintkougaititle}
\makeatother

% --- 補助コマンド（必要なら上書きして使う） ---
\newcommand{\frameboxfigure}{\centering\begin{tabular}{|c|}\hline}
\newcommand{\frameboxfigureend}{\\\hline\end{tabular}\par}

%\renewcommand{\refname}{\bf\sffamily\centerline{文　献}}
\renewcommand{\refname}{\sffamily\hfill 文　献\hfill}

% すべての table 環境に small を入れる
\AtBeginEnvironment{tabular}{\small}
% longtable 使うなら
\AtBeginEnvironment{longtable}{\small}

\newenvironment{summary}{\vspace{0.5em}\noindent\textgt{要旨}\par\small}{\vspace{0.5em}}

% --- 最後 ---
\endinput