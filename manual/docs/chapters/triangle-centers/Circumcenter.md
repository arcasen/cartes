### 三角形的外心 Circumcenter

#### 外心及其性质

三角形三条边的垂直平分线相交于一点，这个点到三角形三个顶点的距离相等。由于外心到三个顶点的距离相等，因此以该点为圆心、以该距离为半径可以画出一个经过三角形所有顶点的圆，称为外接圆。

外心的坐标由下面的公式计算:

$$
  \sin{2A} \cdot \overline{OA}+\sin{2B} \cdot \overline{OB}+\sin{2C} \cdot \overline{OC}=\boldsymbol{0}
$$

由正弦定理可知：

$$
\sin{A}:\sin{B}:\sin{C} = a:b:c
$$

由余弦定理可知：

$$
\cos{A}:\cos{B}:\cos{C} = \dfrac{b^2+c^2-a^2}{2bc}:\dfrac{c^2+a^2-b^2}{2ca}:\dfrac{a^2+b^2-c^2}{2ab}
$$

由这些式子可以计算：

$$
\sin{2A}:\sin{2B}:\sin{2C} = a^2(b^2+c^2-a^2):b^2(c^2+a^2-b^2):c^2(a^2+b^2-c^2)$$

**外心的性质**

1.  当三角形为锐角三角形时，外心在三角形内部。

2.  当三角形为钝角三角形时，外心在三角形外部。

3.  当三角形为直角三角形时，外心在斜边上，与斜边的中点重合。

4.  外心到三顶点的距离相等。
  
#### 语法形式

::: {.messagebox title="Syntax"}
- `plane/circumcenter={\A,\B,\C,\O}`: 三角形 $ABC$ 的外心
:::

#### 示例

```latex
![[ ../../snippets/triangle-centers/circumcenter.tikz ]]
```

![[ ../../snippets/triangle-centers/circumcenter.tikz ]]