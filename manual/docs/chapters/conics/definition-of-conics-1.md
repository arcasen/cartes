### 由焦点-准线定义推导圆锥曲线的系数矩阵

#### 焦点-准线定义圆锥曲线

设焦点 $F$ 在齐次坐标为 $\bm{f} = [f_x, f_y, 1]^T$。  
设准线为一般直线 $l: n_x x + n_y y + n_z = 0$，在齐次坐标下可记为法向量 $\bm{n} = [n_x, n_y, n_z]^T$，满足对于直线上的点 $\bm{x}$ 有 $\bm{n}^T \bm{x} = 0$。

根据圆锥曲线的定义：

$$
\frac{\text{dist}(\bm{x}, F)}{\text{dist}(\bm{x}, l)} = e, \quad 0 < e < 1
$$

$\text{dist}(\bm{x}, l)$ 是点到直线的**有向距离**（或绝对值距离），平方后可避免符号。

点到焦点的距离平方：

$$
d_F^2 = (x - f_x)^2 + (y - f_y)^2 = \bm{x}^T P \bm{x}
$$

其中

$$
P = \begin{bmatrix}
1 & 0 & -f_x \\
0 & 1 & -f_y \\
-f_x & -f_y & f_x^2 + f_y^2
\end{bmatrix}.
$$

将 $\bm{x} = [x, y, 1]^T$ 代入后，展开即得。

点到直线 $l$ 的距离平方（有向）：
直线方程 $n_x x + n_y y + n_z = 0$，法向量 $\bm{n} = [n_x, n_y, n_z]^T$。  
有向距离

$$
d_l = \frac{\bm{n}^T \bm{x}}{\sqrt{n_x^2 + n_y^2}}.
$$

平方得：

$$
d_l^2 = \frac{ (\bm{n}^T \bm{x})^2 }{n_x^2 + n_y^2} = \bm{x}^T Q \bm{x}
$$

其中
$$
Q = \frac{1}{n_x^2 + n_y^2} \, \bm{n} \bm{n}^T.
$$

注意，$\bm{n} \bm{n}^T$ 是 $3\times 3$ 矩阵，注意它秩为 1，且 $\bm{x}^T (\bm{n} \bm{n}^T) \bm{x} = (\bm{n}^T \bm{x})^2$。

根据圆锥曲线的定义平方并移项：
$$
d_F^2 = e^2 d_l^2
$$
即
$$
\bm{x}^T P \bm{x} = e^2 \cdot \bm{x}^T Q \bm{x}.
$$
$$
\bm{x}^T (P - e^2 Q) \bm{x} = 0.
$$

于是系数矩阵

$$
C = P - e^2 Q.
$$
其中 $P$ 仅依赖于焦点 $F$，$Q$ 仅依赖于准线 $l$（且已归一化使分母 $n_x^2 + n_y^2$ 融入）。

重要说明

- $C$ 是一个对称矩阵，它的二次型 $\bm{x}^T C \bm{x} = 0$ 给出了根据圆锥曲线的次方程。
- 此 $C$ 是**直接**由几何参数（$F$、$l$、$e$）通过矩阵减法得到的，无需预先假设根据圆锥曲线的齐或中心在原点。
- 注意这里 $C$ 不一定是对角矩阵，它包含了旋转信息（来自斜准线和焦点位置）。
- 得到的根据圆锥曲线的定是标准位置，可能是任意位置、任意方向的根据圆锥曲线的

#### 语法形式

::: {.messagebox title="Syntax"}
- `conics/define/focus-directrix={\F,\D,\e,\C}`: 由焦点-准线定义推导圆锥曲线的系数矩阵
  - `\F`: 焦点的齐次坐标（列向量）
  - `\D`: 准线的齐次坐标（列向量）
  - `\e`: 离心率
  - `\C`: 返回的圆锥曲线的系数矩阵 $C$
:::

#### 示例：椭圆、抛物线和双曲线的焦点-准线定义

```latex
![[ ../../snippets/conics/definition-1-focus-directrix.tikz ]]
```

![[ ../../snippets/conics/definition-1-focus-directrix.tikz ]]
