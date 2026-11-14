# 卒業論文 LaTeX テンプレート

卒業論文用の LaTeX テンプレートです。VS Code + LaTeX Workshop でビルドできます。
TeX Live はインストール済みの前提です。

> **注意**: このリポジトリを直接クローンして書き始めないでください。
> 必ず「使い方」の手順で、自分専用のコピーを作ってから使います。

- [Mac での準備](#mac-での準備)
- [Windows での準備](#windows-での準備)
- [使い方](#使い方)（Mac / Windows 共通）
- [論文の書き方](#論文の書き方)

## ファイル構成

| ファイル | 内容 |
|---|---|
| `thesis.tex` | メインファイル。タイトル・氏名などの設定と、章の読み込み |
| `chapter1.tex` 〜 `chapter5.tex` | 各章の本文 |
| `shaji.tex` | 謝辞 |
| `thesis.cls` | 体裁を決めるクラスファイル（基本的に編集不要） |
| `sample.eps` | 図のサンプル |
| `.latexmkrc` | ビルド設定（XeLaTeX を使う指定） |
| `.vscode/settings.json` | VS Code のビルド設定 |

このテンプレートは次の5つのフォントを使います。

| 用途 | フォント名 |
|---|---|
| 欧文（本文） | Linux Libertine O |
| 欧文（見出し） | Lato |
| 等幅 | Roboto Mono |
| 和文（本文） | IPAex明朝 |
| 和文（見出し） | IPAexゴシック |

---

## Mac での準備

最初の1回だけ行います。

### 1. VS Code と拡張機能を入れる

1. [Visual Studio Code](https://code.visualstudio.com/) をインストール
2. 拡張機能 **LaTeX Workshop**（James Yu）をインストール

### 2. フォントを入れる

ターミナルで次を実行します。

```bash
# Lato と Roboto Mono（Homebrew）
brew install --cask font-lato font-roboto-mono

# Linux Libertine O と IPAex（TeX Live に入っているものをコピー）
cp "$(dirname "$(kpsewhich LinLibertine_R.otf)")"/LinLibertine_*.otf ~/Library/Fonts/
cp "$(kpsewhich ipaexm.ttf)" "$(kpsewhich ipaexg.ttf)" ~/Library/Fonts/
```

> Homebrew の `font-linux-libertine` は TTF 版（フォント名が「Linux Libertine」）なので、
> このテンプレートが指定している「Linux Libertine **O**」（OTF 版）としては使えません。

インストール後、VS Code を再起動します。

---

## Windows での準備

最初の1回だけ行います。

### 1. VS Code と拡張機能を入れる

1. [Visual Studio Code](https://code.visualstudio.com/) をインストール
2. 拡張機能 **LaTeX Workshop**（James Yu）をインストール

### 2. フォントを確認する

TeX Live をフルインストールしていれば、追加作業なしでビルドできることが多いです。
**先に「使い方」の手順でビルドを試し**、`The font "..." cannot be found` というエラーが出た場合だけ、次を行ってください。

1. エラーに出たフォントのファイルをダウンロード
   - Linux Libertine O: <https://tug.ctan.org/fonts/libertine/opentype>（`LinLibertine_` で始まる `.otf`）
   - IPAex明朝 / IPAexゴシック: <https://mirrors.ctan.org/fonts/ipaex/>（`ipaexm.ttf` と `ipaexg.ttf`）
   - Lato: <https://fonts.google.com/specimen/Lato>
   - Roboto Mono: <https://fonts.google.com/specimen/Roboto+Mono>
2. zip の場合は展開する
3. フォントファイルを選択して右クリック →「すべてのユーザーに対してインストール」
4. VS Code を再起動

---

## 使い方

Mac / Windows 共通です。

### 1. 自分用のコピーを作る

どちらか一方の方法で行います。

**A. GitHub を使う場合（おすすめ）**

1. このページ右上の **Use this template** → **Create a new repository** を押す
2. 自分のアカウントに新しいリポジトリを作る（**Private** を選ぶ）
3. できあがった**自分のリポジトリ**をクローンする

**B. GitHub を使わない場合**

1. このページの **Code** → **Download ZIP** を押す
2. ダウンロードした zip を展開する

### 2. VS Code で開く

VS Code の「ファイル」→「フォルダーを開く」で、コピーしたフォルダ（`thesis.tex` が入っているフォルダ）を開きます。

### 3. ビルドする

1. `thesis.tex` を開く
2. 保存する（または右上の緑の ▷ ボタンを押す）
3. `out/thesis.pdf` ができる。右上の「View LaTeX PDF」ボタンでプレビューできます

初回のビルドは時間がかかります。

## 論文の書き方

### タイトル・氏名を設定する

`thesis.tex` の先頭にある「ここに○○」の部分を自分の情報に書き換えます。区切りの全角スペースはそのまま残してください。

```latex
\setpapertitle{論文のタイトル}
%\setpapertitlesec{タイトルが長い場合の2行目}
\setadvisor{ここに姓　ここに名　教授}
\setuniv{ここに大学名　ここに学部名}
\setdept{ここに学科名}
\setyearstr{令和7年度}
\setstudentno{ここに学籍番号}
\setstudentname{ここに姓　ここに名}
```

### 本文を書く

- 各章の本文は `chapter1.tex` 〜 `chapter5.tex` に書きます。
- 章のタイトルは `thesis.tex` の `\chapter{...}` で変更します。
- 章タイトルが長いときは `\chapter[ヘッダ用の短いタイトル]{長いタイトル}` と書くと、ヘッダには短い方が表示されます。
- 謝辞は `shaji.tex` に書きます。【ここに○○】の部分を書き換えてください。
- 参考文献は `thesis.tex` の末尾にある `thebibliography` の中に `\bibitem{キー}` で追加し、本文から `\cite{キー}` で引用します。

### 特定の章だけビルドする

`thesis.tex` の `\includeonly{...}` から不要な章を `%` でコメントアウトすると、その章を飛ばしてビルドできます。提出前に必ず元に戻してください。

## うまくいかないとき

| 症状 | 対処 |
|---|---|
| `This class requires XeLaTeX or LuaLaTeX` と出る | フォルダの開き方が違います。`thesis.tex` が入っているフォルダを VS Code で直接開いてください |
| `The font "..." cannot be found` と出る | 表示されたフォントが入っていません。自分の OS の「フォント」の手順を確認してください |
| `latexmk` が見つからないと出る | TeX Live のインストール後に VS Code を再起動していない可能性があります |
| 目次や図番号が `??` になる | もう一度ビルドしてください |

## 注意

- テンプレートが後から更新されても、すでに作った自分のコピーには反映されません。
- 自分のコピーを GitHub に置く場合は、公開範囲を **Private** にしてください。
