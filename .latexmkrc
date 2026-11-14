# 卒論用 latexmk 設定（XeLaTeX）
$pdf_mode = 5;
$xelatex = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape %O %S';
$bibtex = 'upbibtex %O %B';
$out_dir = 'out';
$max_repeat = 5;