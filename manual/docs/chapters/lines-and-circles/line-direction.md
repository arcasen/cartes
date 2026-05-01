### 直线

#### 原点在直线上的投影

将原点 $(0, 0)$ 投影到直线 $ax + by + c = 0$ 上，实质上是求从原点向直线作垂线，垂足 $P(x_0, y_0)$ 的坐标。

这个投影点具有两个特性：

1. **在直线上：** 满足 $ax_0 + by_0 + c = 0$。
2. **方向垂直：** 向量 $\vec{OP}$ 与直线的法向量 $(a, b)$ 平行。

对于直线 $ax + by + c = 0$，原点的投影点 $P$ 的坐标公式为：

$$
\left(\dfrac{-ac}{a^2 + b^2},\dfrac{-bc}{a^2 + b^2}\right)
$$

#### 直线的方向向量

普通的直线 $ax + by + c = 0$ 是没有方向的，但当我们把它变为**有向直线**时，通常遵循标准参数化定义的正方向。当我们把直线方程写成**参数方程**时，正方向由参数 $t$ 增加的方向决定。规定直线与 $x$ 轴正方向所成的角 $\alpha$ 为倾斜角（$\alpha \in [0, \pi)$），直线的参数方程为：

$$
\begin{cases} 
x = x_0 + t \cos \alpha \\ 
y = y_0 + t \sin \alpha 
\end{cases}
$$

定义直线的方向向量为：
$$
\bm{v}=\begin{cases}
(-b,a)\quad a>0\\
(|b|,0)\quad a=0\\
(b,-a)\quad a<0
\end{cases}
$$

#### 语法形式

::: {.messagebox title="Syntax"}
- `plane/anchor={\a,\b,\c,\P}`: 计算原点在直线 $ax+by+c=0$ 上的投影 $P$
- `plane/direct={\a,\b,\c,\v}`: 计算直线 $ax+by+c=0$ 的方向向量 $\bm{v}$ (注意未单位化)
:::

#### 示例

```latex
![[ ../../snippets/lines-and-circles/line-direction.tikz ]]
```

![[ ../../snippets/lines-and-circles/line-direction.tikz ]]
