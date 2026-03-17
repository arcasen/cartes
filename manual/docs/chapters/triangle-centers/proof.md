#### 重心坐标形式

设三角形为 $ABC$，其顶点对应的坐标分别为 $A, B, C$。若点 $P$ 在三角形 $ABC$ 内部（或边界上），则存在实数 $x, y, z$ 使得：

$$ P = xA + yB + zC $$

其中满足条件：

$$ x + y + z = 1 $$

且若 $P$ 严格在三角形内部，则：
$$ x > 0, \quad y > 0, \quad z > 0 $$

这里的 $x, y, z$ 称为点 $P$ 关于 $\triangle ABC$ 的**重心坐标（Barycentric Coordinates）**。

这些系数的具体物理意义是：$x = \dfrac{S_{\triangle PBC}}{S_{\triangle ABC}}$，$y = \dfrac{S_{\triangle PAC}}{S_{\triangle ABC}}$，$z = \dfrac{S_{\triangle PAB}}{S_{\triangle ABC}}$。即系数代表了对侧小三角形面积与总面积的比值。

主要包含两个部分：

1.  **存在性与唯一性**：证明平面内任意一点 $P$ 都可以唯一地表示为 $P = xA + yB + zC$ 且 $x+y+z=1$。
2.  **内部点的充要条件**：证明点 $P$ 位于三角形**内部**（不含边界）当且仅当系数 $x, y, z$ 均大于 0。
  
以下是详细的数学证明过程。

**重心坐标的存在性与唯一性**

**命题**：对于平面上不共线的三点 $A, B, C$ 和任意一点 $P$，存在唯一的实数 $x, y, z$ 满足：

$$ P = xA + yB + zC \quad \text{且} \quad x + y + z = 1 $$

**证明**：

1.  **构建基底**：
    由于 $A, B, C$ 不共线，向量 $\overline{AB} = B - A$ 和 $\overline{AC} = C - A$ 线性无关，构成平面的一组基底。
    因此，对于平面内任意向量 $\overline{AP}$，存在唯一的实数对 $(u, v)$ 使得：
    $$ \overline{AP} = u\overline{AB} + v\overline{AC} $$

2.  **展开向量**：
    将 $\overline{AP}, \overline{AB}, \overline{AC}$ 用位置向量表示（设原点为 $O$，则 $\overline{AP} = P - A$ 等）：
    $$ P - A = u(B - A) + v(C - A) $$

3.  **整理项**：
    $$ P = A + uB - uA + vC - vA $$
    $$ P = (1 - u - v)A + uB + vC $$

4.  **定义系数**：
    令：
    $$ x = 1 - u - v$$
    $$ y = u $$
    $$ z = v $$
    
    此时，$P = xA + yB + zC$。
    
5.  **验证和为1**：
    计算系数之和：
    $$ x + y + z = (1 - u - v) + u + v = 1 $$
    
6.  **唯一性**：
    由于 $(u, v)$ 是基于基底 $\overline{AB}, \overline{AC}$ 的唯一分解，而 $x, y, z$ 与 $u, v$ 是一一对应的线性变换，因此 $x, y, z$ 也是唯一的。

**结论**：平面内任意一点均可唯一表示为该形式。

**点在三角形内部的充要条件 ($x, y, z > 0$)**

**命题**：点 $P$ 位于 $\triangle ABC$ **内部**（不包含边界）的充要条件是 $x > 0, y > 0, z > 0$。

**1. 充分性证明 ($\Leftarrow$)**
**假设**：$x > 0, y > 0, z > 0$ 且 $x+y+z=1$。
**求证**：$P$ 在 $\triangle ABC$ 内部。

* 由 $x+y+z=1$，可得 $x = 1 - (y+z)$。
* 代入向量公式：
    $$ P = (1 - y - z)A + yB + zC $$
    $$ P - A = y(B - A) + z(C - A) $$
    $$ \overline{AP} = y\overline{AB} + z\overline{AC} $$

* 因为 $y > 0, z > 0$，向量 $\overline{AP}$ 落在由 $\overline{AB}$ 和 $\overline{AC}$ 张成的角 $\angle BAC$ 的内部区域。
* 同理，通过轮换对称性（或重写公式以 $B$ 或 $C$ 为基准），可以证明 $P$ 也在 $\angle ABC$ 内部，以及在 $\angle ACB$ 内部。

**结论**：$P$ 同时满足三个角的内部约束，故 $P$ 在三角形内部。

**2. 必要性证明 ($\Rightarrow$)**
**假设**：$P$ 在 $\triangle ABC$ 内部。
**求证**：$x > 0, y > 0, z > 0$。

我们可以利用**面积法**（这是最直观的几何解释）来证明系数的具体含义。

* **引理**：系数 $x, y, z$ 分别等于子三角形面积与总面积的比值。
    即：$x = \dfrac{S_{\triangle PBC}}{S_{\triangle ABC}}, \quad y = \dfrac{S_{\triangle PCA}}{S_{\triangle ABC}}, \quad z = \dfrac{S_{\triangle PAB}}{S_{\triangle ABC}}$。

    *证明引理*：
    利用向量叉积（二维外积）计算面积。设 $S_{\triangle ABC} = \dfrac{1}{2} |(B-A) \times (C-A)|$。
    考虑 $S_{\triangle PBC}$：
    $$ 2S_{\triangle PBC} = |(B-P) \times (C-P)| $$
    将 $P = xA + yB + zC$ 代入（利用 $x=1-y-z$）：
    $$ B-P = B - ((1-y-z)A + yB + zC) = (1-y)(B-A) - z(C-A) $$
    $$ C-P = C - ((1-y-z)A + yB + zC) = -y(B-A) + (1-z)(C-A) $$
    经过繁琐但直接的代数运算（利用 $\overline{u} \times \overline{u} = 0$ 和分配律），可以得出：
    $$ (B-P) \times (C-P) = (1-y-z) [(B-A) \times (C-A)] = x [(B-A) \times (C-A)] $$
    取模长并除以2，得 $S_{\triangle PBC} = |x| S_{\triangle ABC}$。
    由于 $P$ 在内部，$P$ 与 $A$ 在 $BC$ 同侧，方向一致，故 $x$ 为正，即 $x = \dfrac{S_{\triangle PBC}}{S_{\triangle ABC}}$。
    同理可证 $y, z$。

* **推导**：
    既然 $P$ 在三角形**内部**：
    1.  $P$ 不与 $B, C$ 共线（否则面积为0），所以 $S_{\triangle PBC} > 0 \implies x > 0$。
    2.  $P$ 不与 $A, C$ 共线，所以 $S_{\triangle PCA} > 0 \implies y > 0$。
    3.  $P$ 不与 $A, B$ 共线，所以 $S_{\triangle PAB} > 0 \implies z > 0$。

**结论**：若 $P$ 在内部，则 $x, y, z$ 必须严格大于 0。

**总结**

1.  **公式来源**：基于平面向量基本定理，任意点可分解为两个不共线向量的线性组合，进而转化为三个顶点的仿射组合（系数和为1）。
2.  **几何意义**：系数 $x, y, z$ 本质上是**面积比**（重心坐标）。
3.  **判定法则**：
    * $x, y, z > 0 \iff$ 点在三角形**内部**。
    * $x, y, z \ge 0 \iff$ 点在三角形**内部或边界上**。
    * 若有系数 $<0 \iff$ 点在三角形**外部**。

这个证明不仅确立了公式的正确性，也解释了为什么该公式是判断点与三角形位置关系的最优方法之一。