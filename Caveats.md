# Caveats

1. Tikzmath is mainly used for handling numerical computations and variable 
assignments, supporting basic mathematical operations and conditional 
statements, but it does not support arrays or lists as function parameters.
2. Tikzmath internally requires semicolons for separation, allows comments, 
but cannot have blank lines.
3. The for statement does not have loop interruption commands like 'break' or 'continue'.
4. The first iteration of a for loop is always executed without evaluating the 
loop variable; to restrict the range of the loop variable, it must be 
explicitly limite
5. Integer "subscripts" (not true subscripts) must be defined as int; otherwise, 
they default to floating-point numbers, and defined macros cannot be found.
6. Changes to variables inside a function do not propagate to the outside.
7. When defining functions, there should be no spaces between parameters.
8. The return statement does not interrupt the execution of subsequent 
statements within the function.
9. The maximum number of function parameters is 9.
10. Function parameters cannot directly use array
11. Extremely difficult to debug.
12. Given the limitations of tikzmath’s function, you can use tikzset 
with handlers(.code) to execute some code.
13. Call tikzmath within the code, but note that this may generate 
some global variables; to avoid conflicts with user-defined variables, 
add the prefix mc@.
14. Modifications of variables inside a foreach statement will vanish outside.
15. Special attention should be paid to variables in tikzmath, as these 
variables are global. If they are used directly without declaration, 
it may pose risks. For example, \mc@c might be declared as an int in one 
place, but if it is assigned a floating-point number elsewhere without 
declaration, it will automatically be converted to an intege

1. tikzmath 主要用于处理数值计算和变量赋值, 支持基本的数学运算和条件语句,
但不支持数组或列表作为函数参数.
2. tikzmath 内部要以分号分隔, 可以有注释, 但不能有空行.
3. for 语句没有类似 break, continue 之类的中断循环的语句.
4. for 的第一次总是执行的, 不对循环变量作判断, 要限制循环变量的范围.
5. 整数"下标"(非真正下标), 必须定义为 int, 否则默认为浮点数, 无法找到定义的宏.
6. 函数内部对变量的修改不会传导至外部.
7. 函数定义时, 参数之间不要有空格.
8. return 语句不会中断函数内部下面语句的执行.
9. 函数参数个数最大为 9.
10. 函数参数不能直接使用数组.
11. 极难调试.
12. 鉴于 tikzmath 的 function 存在一些缺陷, 可以使用 tikzset 的 /.code 来执行一些代码
13. 在代码中调用 tikzmath, 但是注意这里会产生一些全局的变量, 
为了避免与用户的变量冲突, 添加前缀 mc@
14. foreach 中的修改在循环外面是失效的
https://tex.stackexchange.com/questions/196065/pgfkeys-computed-i-e-dynamically-defined-key
15. 要特别注意 tikzmath 中的变量, 这些变量是全局的, 如果不加声明就直接使用
 可能会带来风险, 如 \mc@c 可能在某处被声明为 int, 在另一处不声明就赋值浮点数时则会
 自动转换为整数, 
16. 此外重名可能导致一些计算结果被误修改
17. 当.code args 或 .style args 中的参数本身是一个算式时, 必须加括号以保证计算的正确性.
18. % 绝对不要在 \tikzmath 和 \tikzset 块内留空行
19. Paragraph ended before \tikz@math@parse@keyword@check was complete. 有可能是未添加分号, if ... then ... else ... 之后也需要分号
20. 特别注意: 类似 \vc@temp 是全局的, 如果在不同的 \tikzmath \tikzset 中使用会出现交叉引用, 导致错误结果!
