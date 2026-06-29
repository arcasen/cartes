# 从 .tex 文件中提取所有 tikzpicture 环境的内容，并保存到 .tikz 文件中
# 命令说明
# ^%	                      行首的 % 符号
# [[:space:]]*	            匹配任意数量的空白字符（空格、Tab 等）
# begin_snippet	end_snippet 固定的关键字
%.tikz: %.tex
	@echo "Creating $@ ..."
	@sed -n '/^%[[:space:]]*begin_snippet/,/^%[[:space:]]*end_snippet/{//!p}' $< > $@