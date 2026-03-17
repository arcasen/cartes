# https://raw.githubusercontent.com/arcasen/tikz-cookbook/refs/heads/main/examples/Makefile
# version: 20260228

# Package Required:
# https://raw.githubusercontent.com/arcasen/latex-essentials/refs/heads/main/tikzplot.sty

# 使用方法: 在项目的 Makefile 先定义 TARGETS 或 SOURCES 变量
# 然后使用 include 指令包含本文件

# 当未指定 SOURCES 时, 则默认读取当前目录的所有 tex 文件
SOURCES ?= $(shell find . -name "*.tikz")

# 当未指定 PDFS 时, 则默认将 $(SOURCES) 变为 pdf 文件
PDFS ?= $(subst .tikz,.pdf,$(SOURCES))

TEXS ?= $(subst .tikz,.tex,$(SOURCES))

PNGS ?= $(subst .tikz,.png,$(SOURCES))

# latexmk 编译比较简便, 对于含 bib 的 tex 文件, 使用 xelatex 需要编译 4 遍
# 而 latexmk 等效于 xelatex -> bibtex -> xelatex -> xelatex

LATEXMK = latexmk -xelatex
LATEXMK_OPTIONS = -shell-escape \
          -quiet \
          -interaction=nonstopmode \
          -synctex=1 \
          -file-line-error

# 默认目标 pdf 文件
all: $(PDFS)

png: $(PNGS)

tex: $(TEXS)

# 不要自动删除中间生成的 .tex 和 .pdf 文件
.PRECIOUS: %.tex

%.png: %.pdf
	inkscape $< --export-type="png" --export-dpi=600 --export-background="white" --pdf-poppler -o $@

%.pdf: %.tex
	$(LATEXMK) $(LATEXMK_OPTIONS) $< -outdir=$(dir $<) -jobname=$(notdir $(basename $<))
	
# 通用规则: 从 .tikz 生成 .pdf
# 注意: 在 Makefile 中，反斜杠 \ 是非常特殊的字符：
# 第一层 (Make 解析): Make 读取行时，会先处理一次转义。\n 会被 Make 吃掉变成换行，\\ 会变成 \。
# 第二层 (Shell 解析): Make 把处理后的字符串传给 Shell（如 bash），Shell 再处理一次转义。
%.tex: %.tikz
	@echo "Creating temporary TeX file ..."
	@echo "\\\\documentclass[tikz]{standalone}\\n\\\\usepackage{tikzplot}\\n\\\\begin{document}\\n\\\\input{$<}\\n\\\\end{document}" > $@

# 定义要删除的文件扩展名
LATEX_EXTS = aux bbl blg idx ilg ind \
             loa lof log lol lot out \
             toc xdv synctex.gz \
						 latexcode \
						 fls fdb_latexmk \
	           listing mul

# 在扩展名之间加入 -o (OR) 使用 firstword 技巧来避免在第一个参数前加 -o
FIND_ARGS := -name "*.$(firstword $(LATEX_EXTS))" $(foreach ext, $(wordlist 2, $(words $(LATEX_EXTS)), $(LATEX_EXTS)), -o -name "*.$(ext)")

# 定义清理目标
clean:
	@echo "Cleaning LaTeX auxiliary files and minted directories..."
	@find . \( \
	    \( -type f \( $(FIND_ARGS) \) \) -o \
	    \( -type d -name "_minted*" \) \
	\) -exec rm -rf {} +

cleanup: clean
	rm -f $(TEXS) $(PDFS) $(PNGS)

.PHONY: all clean cleanup png


 