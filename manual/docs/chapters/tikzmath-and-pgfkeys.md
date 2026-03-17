## `tikzmath` 和 `pgfkeys` 简介

在 `tikzlibraryeuclidea.code.tex`、 `tikzlibrarymc.code.tex` 和 `tikzlibraryvc.code.tex` 使用了 TikZ 的 `math` 库和 `pgfkeys` 处理机制，实现计算过程的编程和可复用。以下是简要介绍。

### 使用 `tikzmath`

TikZ 是 \LaTeX 中一个功能极其强大的绘图宏包，而 `tikzmath` 是 TikZ 自 3.0 版本起内置的一个专门用于执行数学计算的库，允许你在绘图过程中定义变量、执行算术运算、编写简单的循环和条件判断，从而实现参数化绘图和复杂的几何计算。

通过熟练掌握 `tikzmath`，你可以将 TikZ 从一个静态绘图工具转变为一个能够执行复杂逻辑和计算的动态绘图引擎。以下是 `tikzmath` 的详细使用教程。

要使用 `tikzmath`，首先需要在 \LaTeX 文档的导言区加载 TikZ 宏包，并调用 `math` 库。

```latex
\usepackage{tikz}
\usetikzlibrary{math}
```

随后，你可以在 `tikzpicture` 环境内部或外部使用 `tikzmath` 环境：

```latex
\tikzmath{ 
  % 在这里写代码
}
```

#### 基本用法

计算 TikZ 坐标是 `tikzmath` 最常用的功能之一，如下所示：

```latex
![[ ../snippets/tikzmath/coordinate-calculation.tikz ]]
```

![[ ../snippets/tikzmath/coordinate-calculation.tikz ]]

你也可以直接在 `\coordinate` 命令中嵌入计算，但 `tikzmath` 适合处理多步骤的复杂逻辑。

#### 循环语句：`for`

`tikzmath` 提供了 `for` 循环功能，这对于绘制重复图形（如网格、多边形、分形）非常有用。

绘制一个简单的点阵：

```latex
![[ ../snippets/tikzmath/dot-matrix.tikz ]]
```

![[ ../snippets/tikzmath/dot-matrix.tikz ]]

绘制函数上的点：

```latex
![[ ../snippets/tikzmath/plot-points.tikz ]]
```

![[ ../snippets/tikzmath/plot-points.tikz ]]

综合运用变量定义、循环和三角函数计算，绘制正多边形：

```latex
![[ ../snippets/tikzmath/regular-polygon.tikz ]]
```

![[ ../snippets/tikzmath/regular-polygon.tikz ]]

#### 条件判断：`if`-`then`-`else`

`tikzmath` 支持基本的逻辑判断。

#### 定义函数：`function`

你可以使用 `function` 关键字定义自己的数学函数。

```latex
![[ ../snippets/tikzmath/function.tikz ]]
```

![[ ../snippets/tikzmath/function.tikz ]]

#### 注意事项与技巧

使用 `tikzmath` 库与普通 TikZ 代码或 \LaTeX 数学模式有显著不同。

以下是使用 `tikzmath` 时最需要注意的关键事项：

1. **语法格式严格：必须以分号 `;` 结尾**
  
`tikzmath` 环境内的每一条语句（包括变量定义、函数定义、循环、条件判断等）**必须**以分号 `;` 结束。

2. **`\tikzmath{}` 内部严禁出现空行**

这是最容易遇到的错误（报错信息通常为 `Paragraph ended before \tikz@math@parse@...`）。

* `tikzmath` 环境内部**不能包含空行**。空行会被 \LaTeX 解释为段落结束，从而终止 `tikzmath` 的解析，导致后续代码出错。
* 即使是在注释之后，也不要留空行。

3. **变量作用域与类型**
   
* **默认实数**：`tikzmath` 中的变量默认是实数（floating point），即使你赋值为整数。
* 索引必须声明为 int, 否则导致索引错误。
* **局部变量**：在 `tikzmath` 块中定义的变量通常只在该块内部有效（除非使用了全局定义技巧，但一般不建议）。
* **无需反斜杠定义变量**：在 `tikzmath` 块**内部**定义变量时，**不需要**加反斜杠 `\`。
  *  内部：`x = 5;` (正确)
  *  外部引用：`\x` (需要在 TikZ 坐标或节点中使用该变量时，必须加反斜杠，如 `(\x, 0)`)。
  *  **特例**：如果在 `tikzmath` 内部引用已经存在的 TeX 宏或计数器，可能需要特殊处理，但通常定义新变量直接写名字即可。
* 变量名不要与其它包的命令冲突，如不要命名 `\angle`
* 运算时添加 `()`，防止负号运算错误，如 当 `\x=-3;` 时，`\x^2` 被解析成 `-3^2`。

4. **循环与条件语句的括号**
  
`for` 循环和 `if` 语句的语法比较特殊，大括号 `{}` 的使用非常关键，并注意在末尾加上`;`。

- **语法限制**：`tikzmath` 的 `for` 语句解析时，范围部分（如 `{0,...,\n}`）必须是硬编码的整数或列表，变量（如 `\n`）不会被动态解析为范围边界。
- **设计目的**：`tikzmath` 旨在提供轻量级的数学计算支持，而非完整的编程控制流，因此它不支持动态范围。

5. **单位处理**
  
`tikzmath` 计算时默认不带单位（视为纯数字，通常对应 pt 或 cm，取决于上下文），但在赋值给坐标或长度时需要注意。

*  在 `tikzmath` 内部计算时，最好使用纯数字。
*  如果需要带单位的长度，通常在输出到 TikZ 命令时添加单位，或者在 `tikzmath` 中使用 `pt`, `cm` 等单位后缀（支持有限，建议计算纯数值，使用时加单位）。
    *  例如：`\x = 5;` 然后在绘图中使用 `(\x cm, 0)`。

6. **函数定义参数不能超过 9 个**

见 <https://tikz.dev/math-algorithms>

7. **与普通 TikZ 或 \TeX 命令的混合**
   
`tikzmath` 块主要用于**计算**和**赋值**。它本身不直接绘制图形。你需要将计算结果传递给普通的 TikZ 命令。如前所述，在 `tikzmath` 代码块内部调用 `\draw`, `\node` 等命令时，必须用 `{ }` 包裹，以将其与数学计算代码区分开。使用 `\pgferror` 也是类似的。

8. **角度与弧度** 

默认情况下，`sin`, `cos` 等函数使用**角度制**。如果你需要使用弧度，可以使用 `r` 后缀或转换函数。

9. **坐标数组** 

上述多边形示例中使用了 `\x{\i}` 这种类似数组的语法来存储多个坐标，这是 TikZ 中处理循环坐标的常用技巧。`\a{\i,\j}` 可以模拟二维数组或矩阵。

10. 函数
  
- **嵌套调用**：`tikzmath` 函数完全支持嵌套调用，可以像 `f(g(x))` 这样使用。
- **嵌套定义**：不支持在一个函数体内定义另一个函数，但可以通过平级定义或临时变量实现类似逻辑。

#### 错误排除

* **`Missing character ... ignored` 或 `Paragraph ended before ...`**：90% 是因为**空行**或**缺少分号**。
* **`Undefined control sequence`**：可能在 `tikzmath` 内部错误地使用了 `\` 开头定义变量（如 `\x = 1;` 应该是 `x = 1;`），或者在外部使用时忘了加 `\`。
* **浮点数精度问题**：`tikzmath` 使用 TeX 的定点数运算或 FPU（浮点单元），对于极高精度的科学计算可能不如 Python 精确，但在绘图范围内足够。如果涉及极大/极小值，可能需要加载 `fpu` 库并在 math 环境中启用。


### `tikzmath` 的计算精度

`tikzmath` 库的计算精度主要受限于 \TeX 本身的定点数运算机制。默认情况下，\TeX 的计算精度有限，通常只能保证小数点后 4-5 位的准确性，并且数值范围也有限制。

要提高 `tikzmath` 的计算精度，主要有以下几种方法：

1. 使用 `fpu` 库（推荐）

`TikZ` 提供了一个 `fpu`（浮点单元）库，可以提供更高的精度和更大的数值范围。这是最常用的方法。

**使用方法：**

在 `tikzmath` 环境中或之前加载 `fpu` 库，并使用 `/pgf/fpu` 选项。

```latex
\documentclass{article}
\usepackage{tikz}
\usetikzlibrary{math, fpu}

\begin{document}

\begin{tikzpicture}
  % 启用 fpu 库
  \tikzmath{
    \x = 0.1;
    \y = 0.2;
    \z = \x + \y;
    % 默认情况下，fpu 会改变计算方式
  }
  \node at (0,0) {\z}; % 输出 0.3
\end{tikzpicture}

\end{document}
```

**更精确的控制：**

```latex
\documentclass{article}
\usepackage{tikz}
\usetikzlibrary{math, fpu}

\begin{document}

\begin{tikzpicture}
  % 使用 fpu 库进行高精度计算
  \pgfkeys{/pgf/fpu=true, /pgf/fpu/output format=fixed}
  \tikzmath{
    \a = 1.0 / 3.0;
    \b = \a * 3.0;
  }
  \node at (0,0) {\b}; % 输出 1.00000（高精度）
  
  % 恢复默认设置
  \pgfkeys{/pgf/fpu=false}
\end{tikzpicture}

\end{document}
```

2. 调整 `fpu` 的精度设置

`fpu` 库允许你设置计算的精度：

```latex
\pgfkeys{
  /pgf/fpu=true,
  /pgf/fpu/precision=15, % 设置精度为15位小数
  /pgf/fpu/output format=fixed
}
```

3. 使用 `xfp` 包（LaTeX3 浮点运算）

对于需要极高精度的计算，可以使用 `xfp` 包，它提供了 LaTeX3 的浮点运算引擎。

```latex
\documentclass{article}
\usepackage{tikz}
\usepackage{xfp}
\usetikzlibrary{math}

\begin{document}

\begin{tikzpicture}
  % 使用 xfp 进行高精度计算
  \tikzmath{
    \result = \fpeval{1.0/3.0 * 3.0};
  }
  \node at (0,0) {\result}; % 输出 1.0
\end{tikzpicture}

\end{document}
```

4. 注意事项

- **性能影响**：使用 `fpu` 或 `xfp` 会增加编译时间。
- **兼容性**：某些 `TikZ` 命令可能与 `fpu` 不兼容，需要小心使用。
- **输出格式**：`fpu` 默认输出科学计数法，使用 `/pgf/fpu/output format=fixed` 可以改为固定小数点格式。

::: important
在使用 \LaTeX 的 `xfp` 宏包（或者直接用 `\fpeval`）进行数学运算时，三角函数默认确实是采用弧度制（Radians）。

- `\fpeval`：默认使用弧度制（除非用 `sind`）。
- `tikzmath`：默认使用角度制（Degrees）。
:::

示例：高精度计算圆周率

```latex
\documentclass{article}
\usepackage{tikz}
\usetikzlibrary{math, fpu}

\begin{document}

\begin{tikzpicture}
  % 使用 fpu 计算圆周率
  \pgfkeys{/pgf/fpu=true, /pgf/fpu/output format=fixed, /pgf/fpu/precision=10}
  \tikzmath{
    \pi = 3.14159265358979;
    \radius = 2.0;
    \area = \pi * \radius * \radius;
  }
  \node at (0,0) {面积: \area}; % 输出高精度结果
  
  \pgfkeys{/pgf/fpu=false}
\end{tikzpicture}

\end{document}
```

**总结**：对于大多数需要提高精度的场景，使用 `fpu` 库是最简单有效的方法。如果需要极高的精度或复杂的数学运算，可以考虑使用 `xfp` 包。

::: important
浮点数比较的陷阱：TikZ 使用的是底层的 pgfmath 引擎（通常基于固定点算术或特定的浮点库）。 残差比较不要低于 `\eps = 0.00001`。
:::

在使用 TikZ 和 PGF 进行数学运算时，你遇到的“判断错误”很大程度上源于 PGFMath 的底层设计。PGFMath 默认并不是基于现代计算机通用的 IEEE 754 双精度浮点数，而是有着自己的一套逻辑。

以下是关于 **PGFMath 运算精度**的深度解析及避坑指南：

1. 精度限制：固定点算术 (Fixed Point)
在默认情况下，PGFMath 使用的是 **16 位固定点算术**。
* **数值范围：** 它能处理的最大数值大约是 $\pm 16383.99999$。
* **精度瓶颈：** 它的最小有效位约为 $0.000015$ ($1/65536$)。
* **后果：** 你的 `\eps = 0.000001`（六位小数）已经**超出了默认引擎的辨别能力**。在 PGFMath 眼里，比 $0.00001$ 更小的数极易被舍入为 $0$，或者因为累积误差而变成一个随机的微小值。

1. 累积误差 (Cumulative Error)
当你进行矩阵运算（如坐标变换中的 $C_{1,1}$ 计算）时，每一步加减乘除都会产生舍入。
* 如果你的 $C_{1,1}$ 是通过多次乘法算出来的，它的理论值可能是 $0$，但 PGFMath 计算出的结果可能是 $0.00024$。
* 由于 $0.00024 > 0.000001$，`if` 判断会直接跳入 `else` 分支。

1. 解决方案

方案 A：调大容差（最简单）
在绘图领域，通常不需要物理级别的精度。将 `\eps` 设为一个肉眼不可见但在 PGFMath 处理范围内的值：
```latex
\tikzmath{
    \eps = 0.001; % 或者是 0.01，取决于你的坐标缩放
}
```

方案 B：使用 `fpu` 库（推荐）
如果你需要处理很大或很小的数，可以开启 PGF 的**浮点运算单元 (FPU)**。它将数值范围扩大到 $\pm 10^{300}$。
```latex
\usepackage{pgfplots}
\usepgflibrary{fpu}

\begin{tikzpicture}
    \pgfset{/pgf/fpu=true} % 开启 FPU
    \tikzmath{
        % 这里的运算将使用更高级的浮点逻辑
        \a = abs(\C{1,1});
        ...
    }
    \pgfset{/pgf/fpu=false} % 绘图前记得关闭，因为 \draw 不支持 FPU 格式
\end{tikzpicture}
```

方案 C：调用 LuaTeX（终极方案）
如果你使用的是 `lualatex` 编译，你可以利用 Lua 的双精度浮点数处理逻辑，这比任何 PGF 内部库都要快且准。
```latex
\directlua{
    local eps = 1e-7
    if math.abs(\Coneone) < eps then
        -- 执行逻辑
    end
}
```

4. 调试小技巧
为了看清到底发生了什么，可以在 `\tikzmath` 中利用 `\typeout` 打印出当前的真实数值：

```latex
\tikzmath{
    \a = abs(\C{1,1});
    print {\typeout{DEBUG: a is \a, eps is \eps}};
}
```
如果在控制台（Log文件）里看到 `DEBUG: a is 0.00005, eps is 0.00000`，你就立刻明白为什么判断会失败了。

### 使用 `pgfkeys`

`pgfkeys` 是 \LaTeX 中 `pgf` (Portable Graphics Format) 和 TikZ 宏包提供的一个极其强大的键值对（key-value）处理系统。它由 Till Tantau 开发，主要用于配置复杂的选项，是 TikZ 绘图功能的核心基础，但也可以独立用于任何需要灵活选项管理的 \LaTeX 宏包或文档类。

::: important
`\tikzset{}` 内部不要出现空行。
:::

以下是对 `pgfkeys` 的详细介绍：

#### 核心概念

`pgfkeys` 允许用户定义“键”（keys），并为这些键分配“值”（values）或特定的“代码”（code）。当用户设置一个键时，系统会执行与该键关联的操作。

它的语法结构通常如下：
```latex
\pgfkeys{
  /家族/子家族/键名 = 值,
  /家族/子家族/另一个键 = 另一段代码
}
```

#### 主要功能特性

##### 命名空间（Families/Path）

为了避免键名冲突，`pgfkeys` 使用类似文件系统的路径结构。

- 例如：`/tikz/fill=red` 和 `/pgf/number format/fixed` 属于不同的命名空间。
- 用户可以自定义自己的路径，如 `/myapp/config/color`。

##### 处理器（Handlers）

这是 `pgfkeys` 最强大的地方。处理器是附加在键名后面的特殊标记（以 `.` 开头），用于改变键的行为。常见的处理器包括：

- **`.store in`**: 将值存储到一个 TeX 宏中。
  ```latex
  \pgfkeys{/mymacro/name/.store in=\myname}
  \pgfkeys{/mymacro/name=Bob} 
  % 现在 \myname 的内容是 "Bob"
  ```

- **`.code`**: 当键被设置时，直接执行一段 TeX 代码。
  ```latex
  \pgfkeys{/action/print/.code={\typeout{Hello World!}}}
  \pgfkeys{/action/print} % 输出 Hello World!
  ```

- **`.initial`**: 设置键的默认值。
- **`.default`**: 如果用户调用键时不提供值（即只写 key 而不写 =value），则使用此默认值。
- **`.style`**: 将一个键定义为一系列其他键的缩写（类似于 CSS 类）。
  ```latex
  \pgfkeys{
    /tikz/myline/.style={draw=blue, thick, ->}
  }
  % 使用 /tikz/myline 等同于同时设置 draw=blue, thick, ->
  ```

- **`.is choice`**: 用于创建枚举选项。
  ```latex
  \pgfkeys{
    /shape/type/.is choice,
    /shape/type/circle/.code={\def\shapetype{circle}},
    /shape/type/rect/.code={\def\shapetype{rectangle}},
    /shape/type=circle % 执行 circle 对应的代码
  }
  ```

- **`.forward to`**: 将设置转发给另一个键（常用于兼容性或简化接口）。

##### 值的解析

`pgfkeys` 能够智能地处理逗号分隔的列表。如果在值内部需要包含逗号，必须用花括号 `{}` 将值包裹起来。

```latex
\pgfkeys{key={value, with, commas}}
```

#### 基本用法示例

下面是一个完整的、独立的 \LaTeX 示例，展示了如何定义和使用 `pgfkeys`：

```latex
\documentclass{article}
\usepackage{pgfkeys}

% 1. 定义键及其行为
\pgfkeys{
  /student/.cd, % 进入 /student 命名空间
  name/.store in=\stuName,      % 将名字存入 \stuName
  age/.store in=\stuAge,        % 将年龄存入 \stuAge
  grade/.initial=A,             % 设置默认等级为 A
  info/.code={                  % 定义一个动作键
    学生姓名: \stuName, 年龄: \stuAge, 等级: \pgfkeysvalueof{/student/grade}
  },
  % 定义一个样式，一次性设置多个键
  set default student/.style={
    name=Unknown,
    age=0,
    grade=C
  }
}

% 方便调用的命令
\newcommand{\setStudent}[1]{\pgfkeys{/student/#1}}
\newcommand{\printStudent}{\pgfkeys{/student/info}}

\begin{document}

% 使用默认样式
\setStudent{set default student}
\printStudent

\vspace{1cm}

% 自定义设置
\setStudent{
  name=Alice,
  age=20,
  grade=A+
}
\printStudent

\vspace{1cm}

% 只修改部分属性（grade 保持上次的 A+，或者如果想重置需显式声明）
\setStudent{name=Bob, age=22}
\printStudent

\end{document}
```
  