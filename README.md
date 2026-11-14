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

使用フォント: Linux Libertine O / Lato / Roboto Mono / IPAex明朝 / IPAexゴシック

## 更新履歴

「Use this template」で作ったリポジトリには、テンプレート側の更新は自動では反映されません。
更新を取り込むときは、各項目の「取り込み方」を見てください。

### 2026-11-14

- 公開用に初版を作成（`thesis.cls` 2025/12/17 版）
- `thesis.tex` と `shaji.tex` の個人情報を「ここに○○」に置き換え
- `.latexmkrc` と `.vscode/settings.json` を追加し、VS Code でそのままビルドできるようにした
