# 卒論用 latexmk 設定（XeLaTeX）
$pdf_mode = 5;
$xelatex = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape %O %S';
$bibtex = 'upbibtex %O %B';
# 文献の相対パスを .tex のあるディレクトリから解決する。
$bibtex_fudge = 0;
$out_dir = 'out';
$max_repeat = 5;