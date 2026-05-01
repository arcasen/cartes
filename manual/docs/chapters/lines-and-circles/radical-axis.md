### 两圆的根轴与交点

#### 根轴

**根轴（Radical Axis）**是指平面上对两个不同心圆的**圆幂（Power of a Point）相等**的点的轨迹。这条轨迹是一条直线，且该直线垂直于两圆圆心的连线（连心线 $O_1O_2$）。

设平面内有两个不同心的圆：

*   圆 $C_1$：圆心为 $O_1$，半径为 $r_1$；
*   圆 $C_2$：圆心为 $O_2$，半径为 $r_2$。

如果你需要在具体问题中求出根轴方程，可以遵循以下步骤：

1.  **建立坐标系或选取基点**：
    通常以 $O_1$ 为原点，或者直接利用已知坐标。
    计算连心线向量 $\overline{d} = \overline{O_1O_2} = O_2 - O_1$。
    计算距离平方 $D^2 = |\overline{d}|^2$。

2.  **计算常数项**：
    计算 $C = \dfrac{1}{2} (D^2 + r_1^2 - r_2^2)$。

3.  **写出向量方程**：
    根轴上任意点 $P$ 满足：
    $$ \overline{O_1P} \cdot \overline{d} = C $$
    即：
    $$ (P - O_1) \cdot (O_2 - O_1) = \dfrac{1}{2} (|O_2 - O_1|^2 + r_1^2 - r_2^2) $$

特殊情况

*   **两圆相交**：根轴即为过两交点的**公共弦**所在的直线。
*   **两圆相切**：根轴即为过切点的**公切线**。
*   **两圆相离**：根轴位于两圆之间，垂直于连心线，且靠近半径较小的圆（如果 $r_1 \neq r_2$）。
*   **两圆半径相等 ($r_1 = r_2$)**：
    此时常数项 $C = \dfrac{1}{2} |\overline{O_1O_2}|^2$。
    方程变为 $\overline{O_1P} \cdot \overline{O_1O_2} = \dfrac{1}{2} |\overline{O_1O_2}|^2$。
    这意味着 $\overline{O_1P}$ 在 $\overline{O_1O_2}$ 上的投影长度是 $O_1O_2$ 长度的一半。
    此时根轴是线段 $O_1O_2$ 的**垂直平分线**。

使用向量 $\overline{O_1O_2}$ 求解根轴的核心公式为：
$$ \overline{O_1P} \cdot \overline{O_1O_2} = \dfrac{|\overline{O_1O_2}|^2 + r_1^2 - r_2^2}{2} $$
该式清晰地表明根轴是一条**法向量为 $\overline{O_1O_2}$** 的直线。

求解两圆的交点的问题可以转换为求解根轴与其中一圆的交点。

#### 语法形式

::: {.messagebox title="Syntax"}
- `plane/radical axis={\Oa,\ra,\Ob,\rb,\H,\U}`: 计算根轴的参数：根轴与连心线的交点 $H$ 和根轴的单位方向向量 $U$
- `plane/intersect cc={\Oa,\ra,\Ob,\rb,\Pa,\Pb}`: 计算两圆的交点 $P_a$ 和 $P_b$，其顺序是根轴的正方向
:::

#### 示例 1：求两圆的交点

```latex
![[ ../../snippets/lines-and-circles/intersect-cc.tikz ]]
```

![[ ../../snippets/lines-and-circles/intersect-cc.tikz ]]

#### 示例 2：根心定理

**根心定理（Radical Center Theorem）**，也称为三圆根轴定理，是平面几何中关于圆的幂（Power of a Point）的一个重要结论。当三个圆的圆心不在同一直线上时，两两圆之间的三条根轴（Radical Axes）必交于一点，这个点被称为这三个圆的**根心 (Radical Center)**。

```latex
![[ ../../snippets/lines-and-circles/radical-center.tikz ]]
```

![[ ../../snippets/lines-and-circles/radical-center.tikz ]]