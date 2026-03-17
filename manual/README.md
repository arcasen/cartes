# Euclidea Manual

## Prerequisites

github/latex-essentials

## Toubleshooting

在 Debian \LaTeX 2024 编译未通过，似乎问题在 tikz-euclidea.tex 的下面代码上(已注释掉) :

```
% Cannot pass on Debian with \LaTeX 2024
%\xpretocmd{\inputminted}{\begin{tcolorbox}}{}{}%
%\xapptocmd{\inputminted}{\end{tcolorbox}}{}{}%
```
