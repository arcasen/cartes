### 三角形的内心 Incenter

#### 内心及其性质

三角形三个内角的平分线相交于一点，这个点到三角形三条边的垂直距离相等。由于内心到三边的距离相等，因此以该点为圆心、以该距离为半径可以画出一个与三角形三边都相切的圆，称为**内切圆（Incircle）**。


**内心的性质**

1.  直角三角形的内心到边的距离等于两直角边的和与斜边的差的二分之一。

2.  **欧拉定理**指出，$\triangle ABC$ 中，$R$ 和 $r$ 分别为外接圆为和内切圆的半径，
    $O$和$I$分别为其外心和内心，则 $OI^2=R^2-2Rr$。

3.  内心到三角形三边距离相等。
  
#### 语法形式

::: {.messagebox title="Syntax"}
- `plane/incenter={\A,\B,\C,\I}`: 三角形 $ABC$ 的内心
:::

#### 示例

```latex
![[ ../../snippets/triangle-centers/incenter.tikz ]]
```

![[ ../../snippets/triangle-centers/incenter.tikz ]]