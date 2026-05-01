### 三角形的垂心 Orthocenter

#### 垂心及其性质

从三角形的每个顶点向其对边（或对边的延长线）引垂线，这三条垂线一定会交于一点，这个点就是**垂心**。
  
垂心的坐标由下面的公式计算：

$$\tan{A} \cdot \overline{HA}+\tan{B} \cdot \overline{HB}+\tan{C} \cdot \overline{HC}=\boldsymbol{0}$$

仿照三角形外心的推导过程（见*[三角形的外心 Circumcenter]*），可以由正弦定理和余弦定理得到坐标公式为：

$$
\left((a^2+b^2-c^2)(c^2+a^2-b^2),
(b^2+c^2-a^2)(a^2+b^2-c^2),
(c^2+a^2-b^2)(b^2+c^2-a^2)
\right)
$$

**垂心的性质**

1.  三角形三个顶点，三个垂足，垂心这 7 个点可以得到 6 个四点圆。

2.  三角形外心 $O$，重心 $G$ 和垂心 $H$ 三点共线（**欧拉线**），且$OG:GH=1:2$。

3.  垂心到三角形一顶点距离为此三角形外心到此顶点对边距离的 2 倍。

4.  垂心分每条高线的两部分乘积相等。

#### 语法形式

::: {.messagebox title="Syntax"}
- `plane/orthocenter={\A,\B,\C,\H}`: 三角形 $ABC$ 的垂心
:::

#### 示例

```latex
![[ ../../snippets/triangle-centers/orthocenter.tikz ]]
```

![[ ../../snippets/triangle-centers/orthocenter.tikz ]]