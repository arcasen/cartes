BeginPackage["Utils`"];

Cofactors::usage = "Cofactors[m] gives the cofactors of a matrix m.";

QuadraticMatrix::usage = "QuadraticMatrix[coeffs] gives the matrix of a quadratic form.";

ConicTranslationMatrix::usage = "ConicTranslationMatrix[Q] gives the translation matrix of a quadratic form Q.";

ConicRotationMatrix::usage = "ConicRotationMatrix[Q] gives the rotation matrix of a quadratic form Q.";

ReduceConicMatrix::usage = "ReduceConicMatrix[Q] gives the standard form matrix of a quadratic form Q.";

Begin["Private`"];

(* 定义代数余子式函数 *)
Cofactors[M_] := Module[
  {minors,size,i,j,n},
   minors = Map[Reverse, Minors[M], {0,1}];
   size = Dimensions[M];
   n = size[[1]];
  (* 构造代数余子式 *)
  Table[(-1)^(i + j) * minors[[i, j]], {i, 1, n}, {j, 1, n}]
];

(* the matrix of quadratic form *)
QuadraticMatrix[Coeffs_] := Module[
  {},
  {
    {Coeffs[[1]],   Coeffs[[2]]/2, Coeffs[[4]]/2},
    {Coeffs[[2]]/2, Coeffs[[3]],   Coeffs[[5]]/2},
    {Coeffs[[4]]/2, Coeffs[[5]]/2, Coeffs[[6]]}
  }
];

(* 
求圆锥曲线的中心, Q 为系数矩阵
对于椭圆或双曲线, Q[[1,2]] 可以不为 0;
对于抛物线, 为了避免重复消除交叉项的运算, Q 为消除交叉项后的系数矩阵
对于抛物线, cofactors[[3,3]] = 0, 没有中心(中心在无穷远) 
*)
ConicTranslationMatrix[Q_] := Module[
  {cofactors,xshift,yshift},
  (* 定义代数余子式函数 *)
  cofactors = Cofactors[Q];
  Which[cofactors[[3,3]] != 0,
    { (* ellipse or hyperbola: 返回中心坐标*)
      xshift = cofactors[[3,1]]/cofactors[[3,3]];
      yshift = cofactors[[3,2]]/cofactors[[3,3]];
    },
    Q[[1,1]] != 0 && Q[[2,2]] == 0,
    { (* parabola: 返回顶点坐标 *)
      (* 此时的方程为: ax^2+dx+ef+f=0*)
      a = Q[[1,1]]; d = 2 * Q[[1,3]]; e = 2 * Q[[2,3]]; f = Q[[3,3]];
      xshift = -d/(2*a);
      yshift = (d^2-4*a*f)/(4*a*e);
    },
    Q[[1,1]] == 0 && Q[[2,2]] != 0,
    { (* parabola: 返回顶点坐标 *)
      (* 此时的方程为: cy^2+dx+ef+f=0*)
      c = Q[[2,2]]; d = 2 * Q[[1,3]]; e = 2 * Q[[2,3]]; f = Q[[3,3]];
      xshift = -e/(2*c);
      yshift = (e^2-4*c*f)/(4*c*d);
    }
  ];
  (* 返回坐标轴平移矩阵 *)
  {{1,0,xshift},{0,1,yshift},{0,0,1}}
];

(* 
旋转变换: 将新坐标系的坐标轴与圆锥曲线的轴重合,
旋转角度 theta, 则 tan(2theta) = Q[1,2]/(Q[1,1]-Q[2,2]) 
注意: 这里规定旋转角度 theta 的范围是 [-pi/4,pi/4]
因为每次取 tan(theta) 为绝对值的最小的根
*)
(* RotationMatrix is protected. *)
ConicRotationMatrix[Q_] := Module[
  {tau,cos,sin},
  If[Q[[1,2]]==0,
    {
      cos = 1; sin = 0;
    },
    {(* rotate *)
      tau = (Q[[1,1]]-Q[[2,2]])/(2*Q[[1,2]]); 
      sign = If[tau >= 0, 1, -1];
      tan = sign/(Abs[tau]+Sqrt[1+tau^2]);
      cos = 1/Sqrt[1+tan^2];
      sin = tan * cos;
    }
  ]; 
  (* 返回坐标轴旋转矩阵 *)
  {{cos, -sin, 0},{sin, cos, 0},{0, 0, 1}}
];

(* 将圆锥曲线方程从一般形式化简为标准形式: *)
ReduceConicMatrix[Q_] := Module[
  {R,T},
  (* 
  第 1 步: 旋转变换
  通过旋转系数矩阵, 消除交叉项
  *)
  R = Simplify[ConicRotationMatrix[Q]];
  (* 不要写成下面的形式, 否则出现   Set::setraw: Cannot assign to raw object ...
  Q = Simplify[Transpose[R] . Q . R]; *)
  QR = Simplify[Transpose[R] . Q . R];
  (* Print["the rotation matrix:"]
  MatrixForm[R]
  Print["the coefficents matrix after rotation:"]
  MatrixForm[QR] *)

  (* 
  第 2 步: 平移变换
  平移坐标轴到圆锥曲线的中心或抛物线的顶点, 
  注意: 抛物线没有中心(中心在无穷远) 
  *)
  Unprotect[T];
  T = ConicTranslationMatrix[QR];
  QT = Simplify[Transpose[T] . QR . T];
  (* Print["the translation matrix:"]
  MatrixForm[T]
  Print["the coefficents matrix after translation:"]
  MatrixForm[QT] *)
  QT
];

End[];

EndPackage[];