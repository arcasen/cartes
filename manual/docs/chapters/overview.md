## 概述

`tikz-cartes` 是一个功能强大的 TikZ 扩展库，专为平面几何、空间向量以及圆锥曲线的解析几何计算与绘图而设计。通过引入强大的向量运算和矩阵变换功能，彻底改变传统的 TikZ 绘图模式。在传统 TikZ 绘图中，用户往往需要手动计算坐标点，或者依赖有限的 `calc` 库进行简单的线性插值。本库填补了高级数学计算与图形绘制之间的空白，允许用户在 \LaTeX 代码中直接进行向量和矩阵等操作，能够直接在 \LaTeX 环境中完成复杂的几何运算（如交点、极点、矩阵变换等），并提供简洁的绘图命令。

### 核心特性

- 矩阵计算：支持矩阵的算术运算、线性方程组、特征值和特征向量计算等。
- 向量计算：支持平面/空间向量的点积、叉积、投影、反射及旋转运算等。
- 三角形中心计算：支持三角形的内心、外心、重心、垂心及旁心的计算。
- 圆与直线相关计算：支持根轴、公切线、反演点以及圆与直线的交点计算。
- 圆锥曲线向关计算：引入齐次坐标，支持通过五点、五线或焦点-准线定义圆锥曲线。
- 绘图命令：提供 `\segment` 和 `\conic` 命令，自动处理直线和圆锥曲线的参数化绘制。

### 平面向量运算命令

| 命令 | 描述 |
| ------------ | ------------ |
| `plane/add/origin={\A,\B,\C}` | $\overline{OC} = \overline{OA} + \overline{OB}$ |
| `plane/sub/origin={\A,\B,\C}` | $\overline{OC} = \overline{OA} - \overline{OB}$ |
| `plane/scale/origin={\A,\k,\B}` | $\overline{OB} = k \overline{OA}$ |
| `plane/dot/origin={\A,\B,\d}` | $d = \overline{OA} \cdot \overline{OB}$ |
| `plane/length/origin={\A,\a}` | $a = |\overline{OA}|$ |
| `plane/angle/origin={\A,\B,\a}` | $a = \angle{AOB}$, 有向角: $(-180^\circ,180^\circ]$ |
| `plane/normalize/origin={\A,\B}` | $OB= \overline{OA} / |\overline{OA}|$ |
| `plane/rotate/origin={\A,\a,\B}` | vector rotation |
| `plane/project/origin={\A,\B,\C}` | vector projection |
| `plane/reject/origin={\A,\B,\C}` | vector rejection |
| `plane/reflect/origin={\A,\B,\C}` | vector reflection |
: 基于原点的向量运算{.striped}

| 命令 | 描述 |
| ------------ | ------------ |
| `plane/add ={\P,\A,\B,\C}` | $\overline{OC} = \overline{OP} + \overline{PA} + \overline{PB}$ |
| `plane/sub={\P,\A,\B,\C}` | $\overline{OC} = \overline{OP} + \overline{PA} - \overline{PB}$ |
| `plane/scale={\P,\A,\k,\B}` | $\overline{OB} = \overline{OP} + k \overline{PA}$ |
| `plane/dot={\P,\A,\B,\d}` | $d = \overline{PA} \cdot \overline{PB}$ |
| `plane/length={\P,\A,\a}` | $a = |\overline{PA}|$ |
| `plane/length={\A,\B,\C,\a,\b,\c}` | 计算三角形 $ABC$ 的边长 $a,b,c$ |
| `plane/angle={\P,\A,\B,\a}` | $a = \angle{APB}$, 有向角: $(-180^\circ,180^\circ]$ |
| `plane/normalize={\P,\A,\B}` | $OB= \overline{PA} / |\overline{PA}|$ |
| `plane/rotate={\P,\A,\a,\B}` | vector rotation |
| `plane/project={\P,\A,\B,\C}` | vector projection |
| `plane/reject={\P,\A,\B,\C}` | vector rejection |
| `plane/reflect={\P,\A,\B,\C}` | vector reflection |
: 基于任意点 $P$ 的向量运算{.striped}

### 空间向量运算命令

| 命令 | 描述 |
| ------------ | ------------ |
| `space/add/origin={\A,\B,\C}` | $\overline{OC} = \overline{OA} + \overline{OB}$ |
| `space/sub/origin={\A,\B,\C}` | $\overline{OC} = \overline{OA} - \overline{OB}$ |
| `space/scale/origin={\A,\k,\B}` | $\overline{OB} = k \overline{OA}$ |
| `space/dot/origin={\A,\B,\d}` | $d = \overline{OA} \cdot \overline{OB}$ |
| `space/cross/origin={\A,\B,\C}` | $\overline{OC} = \overline{OA} \times \overline{OB}$ |
| `space/length/origin={\A,\a}` | $a = |\overline{OA}|$ |
| `space/angle/origin={\A,\B,\a}` | $a = \angle{AOB}$, 无向角: $[0^\circ,180^\circ]$ |
| `space/normalize/origin={\A,\B}` | $OB= \overline{OA} / |\overline{OA}|$ |
| `space/rotate/origin={\A,\U,\a,\B}` | vector rotation |
| `space/project/origin={\A,\B,\C}` | vector projection |
| `space/reject/origin={\A,\B,\C}` | vector rejection |
| `space/reflect/origin={\A,\B,\C}` | vector reflection |
: 基于原点的向量运算{.striped}

| 命令 | 描述 |
| ------------ | ------------ |
| `space/add ={\P,\A,\B,\C}` | $\overline{OC} = \overline{OP} + \overline{PA} + \overline{PB}$ |
| `space/sub={\P,\A,\B,\C}` | $\overline{OC} = \overline{OP} + \overline{PA} - \overline{PB}$ |
| `space/scale={\P,\A,\k,\B}` | $\overline{OB} = \overline{OP} + k \overline{PA}$ |
| `space/dot={\P,\A,\B,\d}` | $d = \overline{PA} \cdot \overline{PB}$ |
| `space/cross={\P,\A,\B,\C}` | $\overline{OC} = \overline{OP} + \overline{PA} \times \overline{PB}$ |
| `space/length={\P,\A,\a}` | $a = |\overline{PA}|$ |
| `space/angle={\P,\A,\B,\a}` | $a = \angle{APB}$, 无向角: $[0^\circ,180^\circ]$ |
| `space/normalize={\P,\A,\B}` | $OB= \overline{PA} / |\overline{PA}|$ |
| `space/rotate={\P,\A,\U,\a,\B}` | vector rotation |
| `space/project={\P,\A,\B,\C}` | vector projection |
| `space/reject={\P,\A,\B,\C}` | vector rejection |
| `space/reflect={\P,\A,\B,\C}` | vector reflection |
: 基于任意点 $P$ 的向量运算{.striped}

### 直线与圆的相关运算

| 命令 | 描述 |
| ------------ | ------------ |
| `plane/anchor={\a,\b,\c,\P}` | 计算原点在直线 $ax+by+c=0$ 上的投影 $P$ |
| `plane/direct={\a,\b,\c,\v}` | 计算直线 $ax+by+c=0$ 的方向向量 $\bm{v}$ (注意未单位化) |
| `plane/intersect ll={\A,\B,\C,\D,\P}` | 计算直线 $AB$ 与 $CD$ 的交点 $P$ |
| `plane/intersect cl={\O,\r,\A,\B,\Pa,\Pb}` | 计算圆（圆心为 $O$，半径为 $r$）与直线 $AB$ 的交点 $P_a$ 和 $P_b$，交点的顺序是从 $A$ 至 $B$ |
| `plane/intersect cn={\O,\r,\a,\b,\c,\Pa,\Pb}` | 计算圆（圆心为 $O$，半径为 $r$）与直线 $ax+by+c=0$ 的交点 $P_a$ 和 $P_b$，交点的顺序是直线的正方向 |
| `plane/radical axis={\Oa,\ra,\Ob,\rb,\H,\U}` | 计算根轴的参数：根轴与连心线的交点 $H$ 和根轴的单位方向向量 $U$ |
| `plane/intersect cc={\Oa,\ra,\Ob,\rb,\Pa,\Pb}` | 计算两圆的交点 $P_a$ 和 $P_b$，其顺序是根轴的正方向 |
| `plane/tangents={\O,\r,\P,\Ta,\Tb}` | 计算过 $P$ 作圆 $O$ 的切线与圆的切点 $T_a$ 和 $T_b$，其顺序是圆 $O$ 与辅助圆的根轴的正方向 |
| `plane/external center={\Oa,\ra,\Ob,\rb,\center}` | 两圆的外位似中心 |
| `plane/internal center={\Oa,\ra,\Ob,\rb,\center}` | 两圆的内位似中心 |
| `plane/inverse={\O,\r,\P,\Q}` | 计算点 $P$ 关于圆 $O$ 的反演点 $Q$ |
: 直线与圆的相关运算{.striped}

### 三角形的相关运算

| 命令 | 描述 |
| ------------ | ------------ |
| `plane/barycenter={\A,\B,\C,\x,\y,\z,\H}` | 计算重心坐标 $(x:y:z)$ 对应的点 `\H` |
| `plane/incenter={\A,\B,\C,\I}` | 三角形 $ABC$ 的内心 |
| `plane/excenter={\A,\B,\C,\Ja}` | 顶点 $A$ 的对面区域（即跨越边 $BC$ 的一侧）的旁心，改变参数位置可以得其它旁心 |
| `plane/circumcenter = {\A,\B,\C,\O}` | 三角形 $ABC$ 的外心 |
| `plane/orthocenter={\A,\B,\C,\H}` | 三角形 $ABC$ 的垂心 |
| `plane/centroid ={\A,\B,\C,\G}` | 三角形 $ABC$ 的重心 |
: 三角形相关的运算{.striped}

### 圆锥曲线相关的运算

| 命令 | 描述 |
| ------------ | ------------ |
| `conics/homogenize={\P,\Q}` | 将二维笛卡尔坐标齐次化，`\P` 为笛卡尔坐标，`\Q` 为齐次坐标 |
| `conics/dehomogenize={\P,\Q}` | 将齐次坐标去齐次化，`\P` 为齐次坐标，`\Q` 为笛卡尔坐标 |
| `conicss/distance={\P,\Q,\d}` | 求齐次坐标下的两点 $P,Q$ 的距离 |
| `conics/cross={\U,\V,\W}` | 向量叉乘，`\U,\V,\W` 为点或直线的齐次坐标 |
| `conics/x-intercept={\l,\P}` | 直线 $l$ 在 $x$ 轴上的截距点（齐次坐标） |
| `conics/y-intercept={\l,\P}` | 直线 $l$ 在 $y$ 轴上的截距点（齐次坐标） |
| `conics/translation matrix={\xshift,\yshift,\T}` | 构造平移矩阵 |
| `conics/rotation matrix={\ang,\R}` | 构造旋转矩阵，`\ang` 是旋转角度（deg） |
| `conics/define/quadratic={\coefs,\C}` | 由二次曲线方程系数计算系数矩阵 |
| `conics/define/focus-directrix={\F,\D,\e,\C}` | 由焦点-准线定义推导圆锥曲线的系数矩阵 |
| `conics/define/foci={\Fa,\Fb,\a,\C}` | 由焦点-准线定义推导圆锥曲线的系数矩阵 |
| `conics/define/ellipse/foci-point={\Fa,\Fb,\P,\C}` | 由焦点和曲线上一点确定一个椭圆 |
| `conics/define/hyperbola/foci-point={\Fa,\Fb,\P,\C}` | 由焦点和曲线上一点确定一个双曲线 |
| `conics/define/circle={\A,\B,\C,\Circle}` | 求过 $A,B,C$ 三点的圆的系数矩阵 |
| `conics/define/circle={\O,\r,\Circle}` | 求以 $O$ 为圆心，$r$ 为半径的圆的系数矩阵 |
| `conics/define/five points={\Pa,\Pb,\Pc,\Pd,\Pe,\C}` | 由五点确定的圆锥曲线的系数矩阵 |
| `conics/define/five tangents={\La,\Lb,\Lc,\Ld,\Le,\C}` | 由五条切线确定的圆锥曲线的系数矩阵 |
| `conics/rotate={\CO,\CR,\R,\ang}` | 将含 $xy$ 交叉项的二次曲线系数矩阵通过旋转变换消除交叉项 |
| `conics/translate={\CR,\CT,\T,\shift}` | 将已消除 $xy$ 交叉项的二次曲线系数矩阵通过平移变换成标准形 |
| `conics/polar={\C,\P,\L}` | 计算极线的齐次坐标 |
| `conics/pole={\C,\L,\P}` | 计算极点的齐次坐标 |
| `conics/intersect cl={\C,\U,\V,\P,\Q}` | 采用参数化方法求圆锥曲线与直线的交点 |
| `conics/intersect cn={\C,\l,\P,\Q}` | 采用 Richter-Gebert 算法求圆锥曲线与直线的交点 |
| `conics/decompose={\C,\l,\m}` | 分解退化二次曲线为两条直线，$C=\bm{l}\cdot\bm{m}^T$ |
| `conics/intersect cc={\Ca,\Cb,\C,\l,\m}` | 采用 Richter-Gebert 算法求过两圆锥曲线的交点的退化二次曲线（两条直线）|
: 圆锥曲线相关的运算{.striped}

### `\segment` 和 `\conic` 绘图命令

::: {.messagebox title="Syntax"}
- `\segment[options,clip=(xmin:xmax,ymin:ymax)] (\l)`：用于 `tikzpicture` 环境内绘制直线（线段）
  - `\l`：直线的齐次坐标，列向量 |
- `\conic[opitons] (\C)`：用于 `tikzpicture` 环境内绘制圆锥曲线（非退化），对于双曲线和抛物线，可以在 `options` 中设置 `domain`
  - `C`：圆锥曲线的系数矩阵
:::

::: note

在绘制双曲线或抛物线时，`doamin` 默认为 `domain=(-2:2)`，可以在调用时重新设置。

- 在绘制双曲线（$\dfrac{x^2}{a^2}-\dfrac{y^2}{b^2}=1$）时，`domain` 是下列双曲线参数方程中 $t$ 的取值范围:

  $$
  \begin{cases}
  x = \pm a \cosh t\\y = b \sinh t
  \end{cases}
  $$

  $t$ 的几何意义: 射线出原点交单位双曲线 $x^2-y^2=1$ 于 $(x = \cosh t, y = \sinh t)$,

  $t$ 是射线,双曲线和 $x$ 轴围成的面积的二倍. 对于双曲线上位于 $x$ 轴下方的点, 这个面积被认为是负值.

- 在绘制抛物线（$y^2=2px$）时，`domain` 是下列抛物线参数方程中 $t$ 的取值范围:
  
  $$
  \begin{cases}
  x = 2 p t^2\\y = 2 p t
  \end{cases}
  $$

  $p$ 表示焦准距（焦点到准线的距离，$p > 0$）。
:::