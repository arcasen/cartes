### 两直线的交点

#### 两直线的交点公式

设平面上四点坐标分别为：$A(x_1, y_1)$、$B(x_2, y_2)$、$C(x_3, y_3)$ 和 $D(x_4, y_4)$，则直线 $AB$ 和 $CD$ 的一般式方程分别为：

$$ 
\begin{cases}
(y_1 - y_2)x + (x_2 - x_1)y &= x_2 y_1 - x_1 y_2 \\
(y_3 - y_4)x + (x_4 - x_3)y &= x_4 y_3 - x_3 y_4 
\end{cases}
$$

可以通过高斯消去法解该方程组求得交点坐标。

#### 语法形式

::: {.messagebox title="Syntax"}
- `plane/intersect ll={\A,\B,\C,\D,\P}`: 计算直线 $AB$ 与 $CD$ 的交点 $P$
:::

#### 示例：求两直线的交点

```latex
![[ ../../snippets/lines-and-circles/intersect-ll.tikz ]]
```

![[ ../../snippets/lines-and-circles/intersect-ll.tikz ]]
