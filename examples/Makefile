# 使用方法: 在项目的 Makefile 先定义 TARGETS 或 SOURCES 变量
# 然后使用 include 指令包含本文件

# 当未指定 SOURCES 时, 则默认读取当前目录的所有 tex 文件
SOURCES ?= $(wildcard *.tex)

# 当未指定 TARGETS 时, 则默认将 $(SOURCES) 变为 pdf 文件
TARGETS ?= $(subst .tex,.pdf,$(SOURCES))

# latexmk 编译比较简便, 对于含 bib 的 tex 文件, 使用 xelatex 需要编译 4 遍
# 而 latexmk 等效于 xelatex -> bibtex -> xelatex -> xelatex, 即:
#	xelatex -shell-escape -no-pdf latex-essentials.tex
#	bibtex latex-essentials.aux
#	xelatex -shell-escape -no-pdf latex-essentials.tex
#	xelatex -shell-escape latex-essentials.tex

LATEXMK = latexmk -xelatex
OPTIONS = -shell-escape \
          -interaction=nonstopmode \
          -synctex=1 \
          -file-line-error

all: $(TARGETS)

%.pdf: %.tex
	$(LATEXMK) $(OPTIONS) $<

clean:
	rm -rf _minted* 
	rm -f *.aux *.bbl *.blg *.idx *.ilg *.ind *.loa *.lof *.log *.lol *.lot *.out *.toc *.xdv
	rm -f *.synctex.gz
	rm -f *.latexcode
	rm -f *.fls *.fdb_latexmk
	rm -f *.listing *.mul

cleanup: clean
	rm -f *.pdf

.PHONY: all clean cleanup
