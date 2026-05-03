### 圆锥曲线方程的一般形式

#### 圆锥曲线的系数矩阵

在二次曲线与圆锥曲线中的应用，齐次坐标可以将其方程统一表示为二次型：

$$ax^2 + bxy + cy^2 + dxw + eyw + fw^2 = 0$$

记

$$C = \begin{bmatrix}
    a & b/2 & d/2\\
    b/2 & c & e/2\\
    d/2 & e/2 & f
  \end{bmatrix}$$

$$\bm{x} = [x,y,w]^T$$

则:

$$\bm{x}^T C \bm{x} = 0$$

$C$ 是一个 $3 \times 3$ 的对称矩阵,称为圆锥曲线的**系数矩阵**。圆锥曲线方程的矩阵形式为计算带来便利，如：

* **切线计算：** 若已知曲线上一点 $\bm{p}$，其切线方程直接为 $\bm{l} = C\bm{p}$。
* **退化情况：** 通过检查矩阵 $C$ 的行列式（$\det(C)$），可以轻松判断曲线是圆、椭圆、双曲线，还是退化成了直线对。

#### 语法形式

::: {.messagebox title="Syntax"}
- `conics/define/quadratic={\coefs,\C}`: 由二次曲线方程系数计算系数矩阵
  - `\coefs`: 二次曲线方程系数 $a,b,c,d,e,f$（数组）
  - `\C`: 返回的圆锥曲线的系数矩阵 $C$
:::

#### 示例：由方程系数确定的二次曲线

```latex
![[ ../../snippets/conics/definition-0-quadratic.tikz ]]
```

![[ ../../snippets/conics/definition-0-quadratic.tikz ]]