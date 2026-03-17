### 圆锥曲线方程的一般形式

#### 圆锥曲线的系数矩阵

设二次曲线的方程为:

$$ax^2 + bxy + cy^2 + dx + ey + f = 0$$

记

$$C = \begin{bmatrix}
    a & b/2 & d/2\\
    b/2 & c & e/2\\
    d/2 & e/2 & f
  \end{bmatrix}$$

$$\bm{x} = [x,y,1]^T$$

则:

$$\bm{x}^T C \bm{x} = 0$$

$C$ 称为圆锥曲线的系数矩阵。

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