### 射影变换

<!--Four points define a planar projective transformation

https://homepages.inf.ed.ac.uk/rbf/CVonline/LOCAL_COPIES/EPSRC_SSAZ/node7.html
-->

已知投影中心 $C$ 和 空间平面 $\pi$ 和 $\pi'$，求射影变换矩阵 $H$，即

$$ \bm{x}' = H \bm{x} $$

#### 计算射影变换矩阵 $H$ 的步骤

**1. 建立 $\pi$ 上的局部坐标**

在 $\pi$ 上：

$$
P = O + u \bm{e}_1 + v \bm{e}_2
$$

且：

$$ \bm{n}^T (P-O) = 0$$ 

其中：

- $O$ 是 $\pi$ 上原点
- $\bm{n}$ 是法向量
- $\bm{e}_1, \bm{e}_2$ 是 $\pi$ 上两个正交基向量。
- $\bm{n},\bm{e}_1, \bm{e}_2$ 构成三维正交基

**2. 建立 $\pi'$ 上的局部坐标**

在 $\pi'$ 上：

$$
P' = O' + u' \bm{e}_1' + v' \bm{e}_2'
$$

且：

$$ \bm{n'}^T (P'-O') = 0$$ 

其中：

- $O'$ 是 $\pi'$ 上原点
- $\bm{n'}$ 是法向量
- $\bm{e}_1', \bm{e}_2'$ 是 $\pi'$ 上两个正交基向量。
- $\bm{n'},\bm{e}_1', \bm{e}_2'$ 构成三维正交基

**3. 求解射线 $CP$ 与 平面 $\pi'$ 的交点**

射线上的点 $P'$ 满足射线方程: 

$$ P' = C + \lambda (P-C) $$

代入 $\pi'$ 方程：

$$
\bm{n}'^T [C + \lambda(P - C) - O'] = 0
$$

$$
\lambda = \cfrac{\bm{n}'^T(O'-C)}{\bm{n}'^T (P - C)}
$$

**4. 解出 $u',v'$ 写出分式线性形式**

将 $\lambda$ 代入射线方程中，得到：

$$P' = C + \cfrac{\bm{n}'^T(O'-C)}{\bm{n}'^T (P - C)}(P-C)$$

将 $P,P'$的局部坐标表达式代入上式，得到：

$$u' \bm{e}_1' + v' \bm{e}_2' =-(O'-C) + \cfrac{\bm{n}'^T(O'-C)}{\bm{n}'^T [u \bm{e}_1 + v \bm{e}_2 + (O - C)]}[u \bm{e}_1 + v \bm{e}_2 + (O - C)]$$

上式分别左乘 $\bm{e}_1'^T,\bm{e}_2'^T$ 就可以得到$u',v'$ 写出分式线性形式。（注意：$\bm{e}_1'^T,\bm{e}_2'^T$ 正交）

$$
\begin{aligned}
  \alpha_1 &= \bm{n}'^T \bm{e}_1\\
  \alpha_2 &= \bm{n}'^T \bm{e}_2\\
  \alpha_3 &= \bm{n}'^T (O-C)\\
  \alpha_4 &= \bm{n}'^T (O'-C)\\
  \beta_1 &= \bm{e}_1'^T \bm{e}_1\\
  \beta_2 &= \bm{e}_1'^T \bm{e}_2\\
  \beta_3 &= \bm{e}_1'^T (O-C)\\
  \beta_4 &= \bm{e}_1'^T (O'-C)\\
  \gamma_1 &= \bm{e}_2'^T \bm{e}_1\\
  \gamma_2 &= \bm{e}_2'^T \bm{e}_2\\
  \gamma_3 &= \bm{e}_2'^T (O-C)\\
  \gamma_4 &= \bm{e}_2'^T (O'-C)
\end{aligned}
$$

$$
\begin{aligned}
  H_{11} = \alpha_4 \beta_1 - \alpha_1 \beta_4\\
  H_{12} = \alpha_4 \beta_2 - \alpha_2 \beta_4\\
  H_{13} = \alpha_4 \beta_3 - \alpha_3 \beta_4\\
  H_{21} = \alpha_4 \gamma_1 - \alpha_1 \gamma_4\\
  H_{22} = \alpha_4 \gamma_2 - \alpha_2 \gamma_4\\
  H_{23} = \alpha_4 \gamma_3 - \alpha_3 \gamma_4
\end{aligned}
$$

**5. 写成齐次坐标形式**

将 $P$ 表示为 $\pi$ 上的点 $(u, v, 1)^T$ 在 **齐次坐标** 下，同理 $X$ 在 $\pi'$ 下的齐次坐标 $(u', v', 1)^T$。  
从推导中，解 $(u', v')$ 为 $(u, v)$ 的分式线性函数：

因为 $t$ 是分母为 $\bm{n}_2^T P - \bm{n}_2^T C$ 的形式，  
而且 $P = O + M_1 (u, v)^T$，那么代入后：

$$
u' = \cfrac{A u + B v + C}{D u + E v + F}, \quad
v' = \cfrac{A' u + B' v + C'}{D u + E v + F}
$$

这正是 **单应矩阵** 的形式。  
写成 $3\times 3$ 矩阵 $H$：

$$
\begin{bmatrix}
u' \\ v' \\ 1
\end{bmatrix}
\sim H
\begin{bmatrix}
u \\ v \\ 1
\end{bmatrix}
$$
其中：
$$
H =
\begin{bmatrix}
A & B & C \\
A' & B' & C' \\
D & E & F
\end{bmatrix}
$$
$A, B, C, A', B', C', D, E, F$ 由 $\bm{n}_1, \bm{n}_2, C, \bm{e}_1, \bm{e}_2, \bm{e}_1', \bm{e}_2', C_{0,1}, O'$ 组合得出（可通过坐标变换、投影公式 t 展开求得）。

#### 语法形式

::: {.messagebox title="Syntax"}
- `space/intersect pl={\P,\n,\A,\B,\C}`: $P,n$ 是平面的一点和法向量（空间向量），$A,B$是直线上一点，$C$ 返回直线与平面的交点
- `space/perspective transform={\Center,\S,\m,\T,\n,\H}`: 求平面摄影变换矩阵 $H$，$Center$ 是射影中心，$S,m,T,n$ 是源平面 $\pi$和目标平面 $\pi'$ 的原点和法向量（空间向量
:::

#### 示例：将圆变换为圆锥曲线

examples/planar-perspective-transformation/circles-and-conic-sections

```latex
![[ ../../../../examples/planar-perspective-transformation/circles-and-conic-sections.tikz ]]
```

![[ ../../../../examples/planar-perspective-transformation/circles-and-conic-sections.tikz ]]
