### Gram-Schmidt 正交化

Gram-Schmidt 正交化（Gram-Schmidt Orthogonalization）是一种将一组线性无关的向量转化为**正交向量组**（或单位正交向量组）的经典算法。

对于三维空间中的三个线性无关向量 $\alpha_1, \alpha_2, \alpha_3$，我们的目标是构建三个两两正交的向量 $\beta_1, \beta_2, \beta_3$。

#### 核心计算步骤

**1. 确定第一个正交向量**

直接让第一个新向量等于原向量：


$$\beta_1 = \alpha_1$$

**2. 确定第二个正交向量**

从 $\alpha_2$ 中减去它在 $\beta_1$ 方向上的投影，使得剩余的部分与 $\beta_1$ 垂直：


$$\beta_2 = \alpha_2 - \cfrac{\langle \alpha_2, \beta_1 \rangle}{\langle \beta_1, \beta_1 \rangle} \beta_1$$

**3. 确定第三个正交向量**

同理，从 $\alpha_3$ 中减去它在 $\beta_1$ 和 $\beta_2$ 方向上的投影，使得剩余的部分同时与 $\beta_1$ 和 $\beta_2$ 垂直：


$$\beta_3 = \alpha_3 - \cfrac{\langle \alpha_3, \beta_1 \rangle}{\langle \beta_1, \beta_1 \rangle} \beta_1 - \cfrac{\langle \alpha_3, \beta_2 \rangle}{\langle \beta_2, \beta_2 \rangle} \beta_2$$

> **说明：** $\langle \cdot, \cdot \rangle$ 表示向量的内积（点积）。例如 $\langle \alpha_2, \beta_1 \rangle = \alpha_2 \cdot \beta_1$。

#### 单位化（Orthogonalization $\to$ Orthonormalization）

如果你需要得到**标准正交基**（即长度全部为 1 的正交向量），只需要将得到的 $\beta_1, \beta_2, \beta_3$ 分别除以它们各自的模长（范数）：

$$e_1 = \cfrac{\beta_1}{\|\beta_1\|}, \quad e_2 = \cfrac{\beta_2}{\|\beta_2\|}, \quad e_3 = \cfrac{\beta_3}{\|\beta_3\|}$$

具体计算示例

假设已知三维向量：
$\alpha_1 = (1, 1, 1)^T$
$\alpha_2 = (0, 1, 1)^T$
$\alpha_3 = (0, 0, 1)^T$

计算 $\beta_1$：

$$\beta_1 = \alpha_1 = (1, 1, 1)^T$$

计算 $\beta_2$：

* 内积 $\langle \alpha_2, \beta_1 \rangle = 0\times1 + 1\times1 + 1\times1 = 2$
* 内积 $\langle \beta_1, \beta_1 \rangle = 1^2 + 1^2 + 1^2 = 3$

$$\beta_2 = (0, 1, 1)^T - \cfrac{2}{3} (1, 1, 1)^T = \left(-\cfrac{2}{3}, \cfrac{1}{3}, \cfrac{1}{3}\right)^T$$

*(为了后续计算方便，通常也可以对 $\beta_2$ 进行按比例放大消除分母，比如取 $(-2, 1, 1)^T$，但这里我们严格按照公式继续)*

计算 $\beta_3$：

* 内积 $\langle \alpha_3, \beta_1 \rangle = 1$，$\langle \beta_1, \beta_1 \rangle = 3$
* 内积 $\langle \alpha_3, \beta_2 \rangle = \cfrac{1}{3}$，$\langle \beta_2, \beta_2 \rangle = \cfrac{4}{9} + \cfrac{1}{9} + \cfrac{1}{9} = \cfrac{2}{3}$

$$\beta_3 = (0, 0, 1)^T - \cfrac{1}{3}(1, 1, 1)^T - \cfrac{1/3}{2/3}\left(-\cfrac{2}{3}, \cfrac{1}{3}, \cfrac{1}{3}\right)^T$$

$$\beta_3 = (0, 0, 1)^T - \left(\cfrac{1}{3}, \cfrac{1}{3}, \cfrac{1}{3}\right)^T - \left(-\cfrac{1}{3}, \cfrac{1}{6}, \cfrac{1}{6}\right)^T = \left(0, -\cfrac{1}{2}, \cfrac{1}{2}\right)^T$$

最终得到的正交向量组为：

$$\beta_1 = \begin{bmatrix} 1 \\ 1 \\ 1 \end{bmatrix}, \quad \beta_2 = \begin{bmatrix} -2/3 \\ 1/3 \\ 1/3 \end{bmatrix}, \quad \beta_3 = \begin{bmatrix} 0 \\ -1/2 \\ 1/2 \end{bmatrix}$$

#### 由平面的法向量求平面上的一组正交基

已知平面的法向量，要求平面上的一组正交基，本质上是寻找**两个两两正交且都与法向量垂直的单位向量**。

假设平面的法向量为 $n = (a, b, c)^T$（为了计算方便，通常先将其单位化，即 $\|n\| = 1$）。由于平面上的任意向量 $v$ 都与法向量垂直，因此满足内积为零：$n \cdot v = 0$。

我们可以通过以下两个步骤高效地求出平面的一组正交基 $\{e_1, e_2\}$：

**第一步：寻找平面上的第一个向量 $v_1$**

我们需要找到一个非零向量 $v_1 = (x, y, z)^T$，使得：

$$a x + b y + c z = 0$$

为了避免分母为零的特殊情况，通常根据法向量 $n$ 中绝对值较小的分量来构造。以下是一种经典的鲁棒（Robust）构造方法：

* **如果 $|a| < |b|$ 且 $|a| < |c|$**（$a$ 的绝对值最小），说明法向量在 $x$ 轴方向投影最小。我们可以令 $x = 0$，则有 $by + cz = 0$。可取：

$$v_1 = (0, -c, b)^T$$

* **如果 $|b|$ 最小**，令 $y = 0$，可取：

$$v_1 = (-c, 0, a)^T$$


* **如果 $|c|$ 最小**，令 $z = 0$，可取：

$$v_1 = (-b, a, 0)^T$$

**单位化 $v_1$**：

$$e_1 = \cfrac{v_1}{\|v_1\|}$$

**第二步：利用向量外积（叉乘）直接求出 $e_2$**

在三维空间中，我们已经有了两个互相垂直的单位向量：法向量 $n$ 和平面上的向量 $e_1$。

根据叉乘的几何性质，**两个向量的叉乘结果必然同时垂直于这两个向量**。因此，平面上的第二个正交基向量 $e_2$ 可以直接通过 $n$ 和 $e_1$ 的外积得到：

$$e_2 = n \times e_1$$

因为 $n$ 和 $e_1$ 都是互垂直的单位向量，所以它们叉乘得到的 $e_2$ 自动就是一个**单位向量**，无需再次单位化。

此时，$\{e_1, e_2\}$ 就是该平面的一组标准正交基。

具体计算示例

假设平面的法向量为 $n = (1, 1, 2)^T$。

**1. 单位化法向量**

$$\|n\| = \sqrt{1^2 + 1^2 + 2^2} = \sqrt{6}$$

$$n = \left(\cfrac{1}{\sqrt{6}}, \cfrac{1}{\sqrt{6}}, \cfrac{2}{\sqrt{6}}\right)^T$$

**2. 构造第一个向量 $v_1$**

法向量中 $a=1, b=1$ 绝对值最小，我们任选 $a$ 这一维令其为 0（即 $x=0$）：


$$v_1 = (0, -2, 1)^T$$


验证内积：$n \cdot v_1 = 1\times0 + 1\times(-2) + 2\times1 = 0$（确实在平面上）。

**单位化 $v_1$**：

$$\|v_1\| = \sqrt{0^2 + (-2)^2 + 1^2} = \sqrt{5}$$

$$e_1 = \left(0, -\cfrac{2}{\sqrt{5}}, \cfrac{1}{\sqrt{5}}\right)^T$$

**3. 叉乘求第二个向量 $e_2$**

$$e_2 = n \times e_1 = \begin{vmatrix} \mathbf{i} & \mathbf{j} & \mathbf{k} \\ \cfrac{1}{\sqrt{6}} & \cfrac{1}{\sqrt{6}} & \cfrac{2}{\sqrt{6}} \\ 0 & -\cfrac{2}{\sqrt{5}} & \cfrac{1}{\sqrt{5}} \end{vmatrix}$$

$$e_2 = \begin{bmatrix} \cfrac{1}{\sqrt{6}} \cdot \cfrac{1}{\sqrt{5}} - \cfrac{2}{\sqrt{6}} \cdot \left(-\cfrac{2}{\sqrt{5}}\right) \\ -\left( \cfrac{1}{\sqrt{6}} \cdot \cfrac{1}{\sqrt{5}} - 0 \right) \\ \cfrac{1}{\sqrt{6}} \cdot \left(-\cfrac{2}{\sqrt{5}}\right) - 0 \end{bmatrix} = \begin{bmatrix} \cfrac{5}{\sqrt{30}} \\ -\cfrac{1}{\sqrt{30}} \\ -\cfrac{2}{\sqrt{30}} \end{bmatrix}$$

最终，平面的一组标准正交基为：

$$e_1 = \begin{bmatrix} 0 \\ -2/\sqrt{5} \\ 1/\sqrt{5} \end{bmatrix}, \quad e_2 = \begin{bmatrix} 5/\sqrt{30} \\ -1/\sqrt{30} \\ -2/\sqrt{30} \end{bmatrix}$$

#### 语法形式

::: {.messagebox title="Syntax"}
- `space/orthonormal basis={\U,\V,\W}`: 由空间单位向量 $U$， 由 Gram-Schmidt 算法构造一组正交基 $(U,V,W)$
:::
