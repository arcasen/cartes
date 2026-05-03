### 由焦点-距离定义圆锥曲线

#### 由焦点-距离推导椭圆/双曲线的系数矩阵

先推导靠近 $F_1$ 的准线方程，然后调用 *[由焦点-准线定义圆锥曲线]* 中的公式。

准线的计算是一个**度量几何（Metric Geometry）**概念，而纯粹的叉乘运算属于**射影几何（Projective Geometry）**，为了保持运算的“齐次性”和“行列式风格”，可以通过以下步骤实现：

**第一步：计算曲线中点 $O$ 的齐次坐标**

$$O = w_2 \bm{x_1} + w_1 \bm{x_2} = \begin{bmatrix} x_1w_2 + x_2w_1 \\ y_1w_2 + y_2w_1 \\ 2w_1w_2 \end{bmatrix}$$

**第二步：将曲线中心 $O$ 进行平移，得到准线上的两点 $P$ 和 $Q$**

已知两焦点连线的方向向量为 $\bm{d} = (x_2/w_2 - x_1/w_1, y_2/w_2 - y_1/w_1)$。

与其垂直的方向向量为 $\bm{d}_\perp = (-(y_2/w_2 - y_1/w_1), x_2/w_2 - x_1/w_1)$。

靠近 $F_1$ 的准线与长轴的交点 $P$，将曲线中心 $O$ 按长轴方向平移 $-\dfrac{a^2}{c}$ 就得到 $P$，平移向量 $\bm{s}$ 为：

$$
\bm{s} = -\dfrac{a^2}{c}\dfrac{\overline{F_1F_2}}{|\overline{F_1F_2}|}=-\dfrac{1}{2e^2}\overline{F_1F_2}
$$

将 $P$ 向垂直方向平移任意非零距离就得到 $Q$。

利用平移矩阵计算 $P$ 和 $Q$ *见[坐标平移 Translation of Coordinates]*。

**第三步：使用叉乘得到准线方程**

现在，准线就是经过$P$ 和 $Q$的直线。此时可以使用叉乘：

$$\bm{l}_{directrix} = P \times Q$$

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



