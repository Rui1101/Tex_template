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
更新を取り込むときは、各項目の「取り込み方」を見てください。

### 2026-11-16

- `thesis.cls` を Ver.1.00（2026/01/09）に更新
  - 欧文フォントを Linux Libertine O / Lato から TeX Gyre Termes / TeX Gyre Heros に変更
  - ヘッダーに「図目次」「表目次」「謝辞」「参考文献」が正しく出るように修正（以前はすべて「目次」になっていた）
  - 謝辞などの番号なし章用に `\prefacechapter{}` を追加
  - 参考文献の改ページ・ヘッダー・目次への追加を自動化
  - 表の文字を小さく・行間を詰め、キャプションとの間隔を調整
  - 小々節（`\subsubsection`）を太字に
  - 表紙の学籍番号・氏名欄の位置を調整
- `thesis.tex`: 謝辞を `\prefacechapter{謝辞}` に変更、参考文献の前の手動の目次追加を削除
- `.vscode/settings.json`: ビルド後に `out/` の中間ファイルを自動で削除する設定を追加

取り込み方:

1. `thesis.cls` を最新のものに置き換える。
2. `thesis.tex` の参考文献の前にある次の3行を削除する（残すと目次に「参考文献」が2回出る）。
   ```latex
   \addcontentsline{toc}{chapter}{参考文献}
   \thispagestyle{front}
   \newpage
   ```
3. 謝辞の `\section*{謝辞}` から `\thispagestyle{front}` までを `\prefacechapter{謝辞}` に置き換える（任意）。
4. TeX Gyre Termes / TeX Gyre Heros をインストールする（Notion の手順3）。

### 2026-11-14

- 公開用に初版を作成（`thesis.cls` 2025/12/17 版）
- `thesis.tex` と `shaji.tex` の個人情報を「ここに○○」に置き換え
- `.latexmkrc` と `.vscode/settings.json` を追加し、VS Code でそのままビルドできるようにした
