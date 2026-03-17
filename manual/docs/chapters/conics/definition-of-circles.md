### 由圆心-半径或三点确定圆的方程

#### 三点确定的圆

假设这三个点不共线（否则无法确定一个圆），则存在唯一一个圆通过这三点。

用齐次坐标直接表达（射影几何方法）

若希望保留齐次形式，可将圆的方程写成**齐次二次曲线**的形式：

$$
x^2 + y^2 + a x w + b y w + c w^2 = 0,
$$

其中 $(x:y:w)$ 是齐次坐标，且该方程在仿射部分（$w \ne 0$）对应于上述笛卡尔圆方程。

将三个齐次点 $(x_i, y_i, w_i)$ 代入：

$$
x_i^2 + y_i^2 + a x_i w_i + b y_i w_i + c w_i^2 = 0, \quad i=1,2,3.
$$

同样得到关于 $a, b, c$ 的线性方程组：

$$
\begin{bmatrix}
x_1 w_1 & y_1 w_1 & w_1^2 \\
x_2 w_2 & y_2 w_2 & w_2^2 \\
x_3 w_3 & y_3 w_3 & w_3^2
\end{bmatrix} 
\begin{bmatrix}
a \\ b \\ c
\end{bmatrix}
= - \begin{bmatrix}
x_1^2 + y_1^2 \\
x_2^2 + y_2^2 \\
x_3^2 + y_3^2
\end{bmatrix}
$$

解出 $a, b, c$，或等价地用上述行列式形式直接写出。

#### 语法形式

::: {.messagebox title="Syntax"}
- `conics/define/circle={\A,\B,\C,\Circle}`: 求过 $A,B,C$ 三点的圆的系数矩阵
  - `\A,\B,\C`: 三点的齐次坐标（列向量 $3 \times 1$）
  - `\Circle`: 圆的系数矩阵
- `conics/define/circle={\O,\r,\Circle}`: 求以 $O$ 为圆心，$r$ 为半径的圆的系数矩阵
  - `\O`: 圆心的齐次坐标（列向量 $3 \times 1$）
  - `\r`: 半径
  - `\Circle`: 圆的系数矩阵
:::

::: note
`conics/define/circle` 根据参数的个数选择不同的构造方法，在 \LaTeX 或 TikZ 中，要实现根据参数类型重载是比较困难的。
:::

#### 示例：圆的定义

```latex
![[ ../../snippets/conics/definition-4-circle.tikz ]]
```

![[ ../../snippets/conics/definition-4-circle.tikz ]]