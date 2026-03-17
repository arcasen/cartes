### 由焦点-距离定义推导椭圆/双曲线的系数矩阵

#### 焦点-距离定义圆锥曲线

先推导靠近 $F_1(x_1, y_1)$ 的准线方程

核心参数定义：

* **中心 $O$**：两焦点的中点 $O = \left( \dfrac{x_1+x_2}{2}, \dfrac{y_1+y_2}{2} \right)$。
* **焦距的一半 $c$**：$c = \dfrac{1}{2} \sqrt{(x_2-x_1)^2 + (y_2-y_1)^2}$。
* **离心率 $e$**：$e = \dfrac{c}{a}$。

准线与长轴 $F_1F_2$ 垂直，因此准线的**法向量**可以取为 $\overline{F_1F_2} = (x_2-x_1, y_2-y_1)$。

靠近 $F_1$ 的准线与长轴的交点 $P$，将 $F_2$ 绕中心 $O$ 旋转 $90^\circ$ 得到 $Q$，将$PQ$ 按长轴方向平移 $-\dfrac{a^2}{c}$ 就得到准线，平移向量 $\bm{s}$ 为：

$$
\bm{s} = -\dfrac{a^2}{c}\dfrac{\overline{F_1F_2}}{|\overline{F_1F_2}|}=-\dfrac{1}{2e^2}\overline{F_1F_2}
$$

准线的方程可由 $P,Q$ 两点的齐次坐标叉乘得到：

$$
\bm{d} = \bm{P} \times \bm{Q}
$$

#### 语法形式

::: {.messagebox title="Syntax"}
- `conics/define/foci={\Fa,\Fb,\a,\C}`: 由焦点-准线定义推导圆锥曲线的系数矩阵
  - `\Fa,\Fb`: 焦点的齐次坐标（列向量），如果 $F_a,F_b$ 重合，返回圆的系数矩阵
  - `\a`: 半长轴长 Semi-major axis length，如果 $a>c$，返回椭圆的系数矩阵；如果 $a<c$，返回双曲线的系数矩阵；如果 $a=c$，报错（其中 $2c = |\overline{F_aF_b}|$）。
  - `\C`: 返回的圆锥曲线的系数矩阵
- `conics/define/ellipse/foci-point={\Fa,\Fb,\P,\C}`: 由焦点和曲线上一点确定一个椭圆
  - `\Fa,\Fb`: 焦点的齐次坐标（列向量），如果 $F_a,F_b$ 重合，返回圆的系数矩阵
  - `\P`: 椭圆上的一点
  - `\C`: 返回的圆锥曲线的系数矩阵
- `conics/define/hyperbola/foci-point={\Fa,\Fb,\P,\C}`: 由焦点和曲线上一点确定一个双曲线
  - `\Fa,\Fb`: 焦点的齐次坐标（列向量）
  - `\P`: 双曲线上的一点
  - `\C`: 返回的圆锥曲线的系数矩阵
:::

#### 示例 1：椭圆和双曲线的双焦点定义

```latex
![[ ../../snippets/conics/definition-2-foci.tikz ]]
```

![[ ../../snippets/conics/definition-2-foci.tikz ]]

#### 示例 2：由焦点和曲线上一点确定椭圆或双曲线

```latex
![[ ../../snippets/conics/definition-3-foci-point.tikz ]]
```

![[ ../../snippets/conics/definition-3-foci-point.tikz ]]



