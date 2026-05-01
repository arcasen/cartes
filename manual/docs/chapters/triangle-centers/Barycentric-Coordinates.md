### Barycentric Coordinates

在三角形的几何研究中，三角形内一点（通常称为 $P$ 点）与三个顶点（$A$、$B$、$C$）之间的向量关系，最核心的就是**重心坐标（Barycentric Coordinates）**表示法。

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

对于三角形的重心, 外心, 垂心 内心 外心 可以用统一的公式形式 [^1] [^2] [^3].

[^1]: <https://en.wikipedia.org/wiki/Triangle_center>

[^2]: <https://mathworld.wolfram.com/TriangleCenter.html>

[^3]: <https://mathworld.wolfram.com/BarycentricCoordinates.html>

1.  重心 (Centroid) $G$

    $$\overline{GA}+\overline{GB}+\overline{GC}=\boldsymbol{0}$$

2.  外心 (Circumcenter) $O$

    $$\sin{2A} \cdot \overline{OA}+\sin{2B} \cdot \overline{OB}+\sin{2C} \cdot \overline{OC}=\boldsymbol{0}$$

3.  垂心 (Orthocenter) $H$

    $$\tan{A} \cdot \overline{HA}+\tan{B} \cdot \overline{HB}+\tan{C} \cdot \overline{HC}=\boldsymbol{0}$$

    由于直角的正切不存在，此时需要使用 $\tan{\theta} = \sin{\theta}/\cos{\theta}$ 进行转化。

4.  内心 (Incenter) I

    $$a \cdot \overline{IA}+b \cdot \overline{IB}+c \cdot \overline{IC}=\boldsymbol{0}$$

    $a,b,c$ 是对应边长

5.  旁心 (Excenter) J

    $$-a \cdot \overline{J_AA}+b \cdot \overline{J_AB}+c \cdot \overline{J_AC}=\boldsymbol{0}$$

    上面是顶点 $A$ 对应的外心，其它两个系数分别是 $(a,-b,c)$ 和 $(a,b,-c)$。

#### 语法形式

::: {.messagebox title="Syntax"}
- `plane/barycenter={\A,\B,\C,\x,\y,\z,\H}`: 计算重心坐标 $(x:y:z)$ 对应的点 `\H`
:::
