### 齐次坐标与坐标变换

**齐次坐标 (Homogeneous Coordinates)** 是射影几何中的一个核心概念，它通过增加一个维度，将欧几里得空间中的几何问题转化为更具通用性的代数形式。

在计算机图形学、计算机视觉和几何计算中，齐次坐标是处理**平移变换**、**透视投影**以及**无穷远点**的利器。

#### 齐次坐标

对于一个 $n$ 维空间的点，齐次坐标用 $n+1$ 个分量来表示。

* **从笛卡尔到齐次：**
  二维点 $(x, y)$ 在齐次坐标下表示为 $(u, v, w)$，其中 $x=u/w,y=v/w$。
* **等价性：**
  齐次坐标具有**缩放不变性**。对于任何非零常数 $k$，$(u, v, w)$ 与 $(\lambda u, \lambda v, \lambda w)$ 表示欧几里得空间中的同一个点。

为什么要引入齐次坐标？

1. 统一变换矩阵

在欧几里得几何中，旋转和缩放可以用线性变换（矩阵乘法）表示，但平移必须通过向量加法实现。引入齐次坐标后，平移也可以写成矩阵乘法。

2. 表示**无穷远点 (Ideal Point)**

在普通坐标系中，平行线永远不相交。但在射影几何中，平行线相交于“无穷远点”。

* 当齐次分量 $w \to 0$ 时，点 $(u, v, 0)$ 就代表了方向为 $(u, v)$ 的**无穷远点**。
* 这消除了几何运算中处理“平行”这种特殊情况的需要，使公式更加鲁棒。

::: important
- 虽然 $(2, 4, 2)$ 是一个合法的齐次坐标，但在映射回二维空间前，通常需要将其除以 $w$ 得到**去齐次化**形式 $(1, 2, 1)$。
- 无穷远点无法去齐次化。
:::

#### 向量叉乘

在计算机图形学和射影几何中，齐次坐标（Homogeneous Coordinates）下的叉乘（Cross Product）是一个非常强大的工具：通过两个点的齐次坐标叉乘直接求出过这两点的直线方程，或者通过两条直线的方程叉乘求出它们的交点。

##### 点与直线的对偶性

在二维射影平面 $P^2$ 中，点和直线都可以用一个三维向量来表示：

* **点 (Point)：** $\bm{p} = [x, y, w]^T$
* **直线 (Line)：** $\bm{l} = [a, b, c]^T$（对应方程 $ax + by + c = 0$）

点 $\bm{p}$ 在直线 $\bm{l}$ 上的充要条件是它们的点积为零：

$$\bm{p} \cdot \bm{l} = ax + by + cw = 0$$

**1. 经过两点的直线**
  
如果你有两个点 $\bm{p_1}$ 和 $\bm{p_2}$，过这两点的直线 $\bm{l}$ 必须同时满足 $\bm{p_1} \cdot \bm{l} = 0$ 和 $\bm{p_2} \cdot \bm{l} = 0$。
根据向量空间性质，满足这个条件的向量 $\bm{l}$ 就是这两个点向量的**叉乘**：

$$\bm{l} = \bm{p_1} \times \bm{p_2}$$

**2. 两直线的交点**
  
同理，如果你有两条直线 $\bm{l_1}$ 和 $\bm{l_2}$，它们的交点 $\bm{p}$ 必须同时在两条直线上。根据对偶性（Duality）：

$$\bm{p} = \bm{l_1} \times \bm{l_2}$$

##### 叉乘计算公式

两个齐次向量 $\bm{a} = [a_1, a_2, a_3]$ 和 $\bm{b} = [b_1, b_2, b_3]$ 叉乘结果 $\bm{c}$ 计算如下：

$$\bm{c} = \bm{a} \times \bm{b} = \begin{vmatrix} \bm{i} & \bm{j} & \bm{k} \\ a_1 & a_2 & a_3 \\ b_1 & b_2 & b_3 \end{vmatrix} = [a_2b_3 - a_3b_2, \ a_3b_1 - a_1b_3, \ a_1b_2 - a_2b_1]$$

齐次坐标统一处理无穷远点（平行线交点），这是齐次坐标最迷人的地方。
   
在**笛卡尔坐标系（Cartesian coordinates）**下两条平行线 $x=1$ 和 $x=2$ 没有交点，但是在齐次坐标下，两直线的交点为：

$$
[1, 0, -1] \times [1, 0, -2] = [0, 1, 0]
$$

结果 $[0, 1, 0]$ 表示这是一个**方向向量**（$w=0$），即指向 $y$ 轴正方向的**无穷远点**。这完美解释了平行线在无穷远处相交的概念。

##### 截距点

在解析几何中，直线与坐标轴的交点统称为**截距点**。根据具体的坐标轴，可以细分为以下两种情况：

1. **$x$ 轴截距点**：直线与 $x$ 轴的交点。该点的纵坐标始终为 $0$，坐标形式通常为：
   
   $$[0,1,0]^T \times \bm{l}$$
   
2. **$y$ 轴截距点**：直线与 $y$ 轴的交点。该点的横坐标始终为 $0$，坐标形式通常为：
   
   $$[1,0,0]^T \times \bm{l}$$

::: note
在给定直线方程，任取直线上两点时，可以采用求截距点的方法。
:::

#### 坐标变换 Transformations of Coordinates

##### 坐标平移 Translation of Coordinates

![[ ../../snippets/coordinate-transformations/coordinate-translation.tikz ]]

$$
\begin{cases}
  x' = x + t_x\\
  y' = y + t_y
\end{cases}$$

$$
\begin{bmatrix}
  x'\\
  y'\\
  1
\end{bmatrix}
=
\begin{bmatrix}
  1 & 0 & t_x\\
  0 & 1 & t_y\\
  0 & 0 & 1
\end{bmatrix}
\begin{bmatrix}
  x\\
  y\\
  1
\end{bmatrix}
$$

$$
\begin{bmatrix}
  x\\
  y\\
  1
\end{bmatrix}
=
\begin{bmatrix}
  1 & 0 & -t_x\\
  0 & 1 & -t_y\\
  0 & 0 & 1
\end{bmatrix}
\begin{bmatrix}
  x'\\
  y'\\
  1
\end{bmatrix}
$$

##### 坐标旋转 Rotation of Coordinates

![[ ../../snippets/coordinate-transformations/coordinate-rotation.tikz ]]

$$
\begin{cases}
  x = r\cos\phi\\
  y = r\sin\phi
\end{cases}
$$

$$
\begin{cases}
  x' = r\cos(\phi+\theta)\\
  y' = r\sin(\phi+\theta)
\end{cases}
$$

$$
\begin{cases}
  x' = x\cos\theta-y\sin\theta\\
  y' = y\cos\theta+x\sin\theta
\end{cases}
$$

$$
\begin{bmatrix}
  x'\\
  y'\\
  1
\end{bmatrix}
=
\begin{bmatrix}
  \cos\theta & -\sin\theta & 0\\
  \sin\theta & \cos\theta & 0\\
  0 & 0 & 1
\end{bmatrix}
\begin{bmatrix}
  x\\
  y\\
  1
\end{bmatrix}
$$

$$
\begin{bmatrix}
  x\\
  y\\
  1
\end{bmatrix}
=
\begin{bmatrix}
  \cos\theta & \sin\theta & 0\\
  -\sin\theta & \cos\theta & 0\\
  0 & 0 & 1
\end{bmatrix}
\begin{bmatrix}
  x'\\
  y'\\
  1
\end{bmatrix}
$$

#### 坐标轴变换 Transformations of Axes

下面讨论坐标轴平移和旋转后坐标的变化。

##### 坐标轴平移 Translation of Axes

![[ ../../snippets/coordinate-transformations/coordinate-system-translation.tikz ]]

$$
\begin{cases}
  x' = x - t_x\\
  y' = y - t_y
\end{cases}
$$

$$
\begin{bmatrix}
  x'\\ 
  y'\\ 
  1 
\end{bmatrix}=
\begin{bmatrix}
  1 & 0 & -t_x\\
  0 & 1 & -t_y\\
  0 & 0 & 1
\end{bmatrix}
\begin{bmatrix}
  x\\
  y\\
  1
\end{bmatrix}
$$

$$
\begin{bmatrix}
  x\\
  y\\
  1
\end{bmatrix}
=
\begin{bmatrix}
  1 & 0 & t_x\\
  0 & 1 & t_y\\
  0 & 0 & 1
\end{bmatrix}
\begin{bmatrix}
  x'\\
  y'\\
  1
\end{bmatrix}
$$

##### 坐标轴旋转 Rotation of Axes

![[ ../../snippets/coordinate-transformations/coordinate-system-rotation.tikz ]]

$$
\begin{cases}
  x = r\cos\phi\\
  y = r\sin\phi
\end{cases}
$$

$$
\begin{cases}
  x' = r\cos(\phi-\theta)\\
  y' = r\sin(\phi-\theta)
\end{cases}$$

$$
\begin{cases}
  x' = x\cos\theta+y\sin\theta\\
  y' = y\cos\theta-x\sin\theta
\end{cases}$$

$$
\begin{bmatrix}
  x'\\
  y'\\
  1
\end{bmatrix}=
\begin{bmatrix}
  \cos\theta & \sin\theta & 0\\
  -\sin\theta & \cos\theta & 0\\
  0 & 0 & 1
\end{bmatrix}
\begin{bmatrix}
  x\\
  y\\
  1
\end{bmatrix}
$$

$$
\begin{bmatrix}
  x\\
  y\\
  1
\end{bmatrix}
=
\begin{bmatrix}
  \cos\theta & -\sin\theta & 0\\
  \sin\theta & \cos\theta & 0\\
  0 & 0 & 1
\end{bmatrix}
\begin{bmatrix}
  x'\\
  y'\\
  1
\end{bmatrix}
$$

#### 齐次坐标在 `cartes` 包中的表示

在 `cartes` 包中，使用矩阵来表示齐次坐标，如：

```latex
\tikzmath{
  % 定义点
  \P{1,1} = 1.5; \P{2,1} = 5.0; \P{3,1} = 1.0;
  \Q{1,1} = 0.5; \Q{2,1} = 3.0; \Q{3,1} = 1.0;
  % 定义直线 2 x - y + 3 = 0
  \l{1,1} = 2; \l{2,1} = -1; \l{3,1} = 3;
}
```

#### 语法形式

::: {.messagebox title="Syntax"}
- `conics/homogenize={\P,\Q}`: 将二维笛卡尔坐标齐次化，`\P` 为笛卡尔坐标，`\Q` 为齐次坐标
- `conics/dehomogenize={\P,\Q}`: 将齐次坐标去齐次化，`\P` 为齐次坐标，`\Q` 为笛卡尔坐标
- `conicss/distance={\P,\Q,\d}`: 求齐次坐标下的两点 $P,Q$ 的距离
- `conics/cross={\U,\V,\W}`: 向量叉乘，`\U,\V,\W` 为点或直线的齐次坐标
- `conics/x-intercept={\l,\P}`: 直线 $l$ 在 $x$ 轴上的截距点（齐次坐标）
- `conics/y-intercept={\l,\P}`: 直线 $l$ 在 $y$ 轴上的截距点（齐次坐标）
- `conics/translation matrix={\xshift,\yshift,\T}`: 构造平移矩阵
- `conics/rotation matrix={\ang,\R}`: 构造旋转矩阵，`\ang` 是旋转角度（deg）
:::

#### 示例：Desargues's Theorem

```latex
![[ ../../../../gallery/desargues-theorem.tikz ]]
```

![[ ../../../../gallery/desargues-theorem.tikz ]]
