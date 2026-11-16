# 卒業論文 LaTeX テンプレート

研究室の卒業論文用 LaTeX テンプレートです。XeLaTeX（latexmk）でビルドします。

導入方法と使い方は、研究室の Notion「卒論 LaTeX テンプレート 利用ガイド」を見てください。

> **注意**: このリポジトリを直接クローンして書き始めないでください。
> 「Use this template」で自分専用のリポジトリを作ってから使います。

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

使用フォント: TeX Gyre Termes / TeX Gyre Heros / Roboto Mono / IPAex明朝 / IPAexゴシック

## 更新履歴

「Use this template」で作ったリポジトリには、テンプレート側の更新は自動では反映されません。
更新があったときは、各バージョンの「取り込み方」を見てください。
自分が使っているバージョンは、リポジトリを作った日と下の日付を比べて確認できます。

### v1.0（2026-11-16）

最初の公開版です。

- `thesis.cls` Ver.1.00（2026/01/09）
- 使用フォント: TeX Gyre Termes / TeX Gyre Heros / Roboto Mono / IPAex明朝 / IPAexゴシック
- XeLaTeX（latexmk）でビルド。`.latexmkrc` と `.vscode/settings.json` を同梱し、VS Code + LaTeX Workshop でそのままビルドできる
- ビルド後に `out/` の中間ファイルを自動で削除（`thesis.pdf` と `thesis.synctex.gz` は残す）
- `thesis.tex` と `shaji.tex` の個人情報は「ここに○○」にしてある
