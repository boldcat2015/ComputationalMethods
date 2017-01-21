2016.09.18

##### §4 算法设计
理论

1. 存在性唯一性
2. 适定性

算法

1. 相容性
2. 稳定性（条件数）
3. 收敛性

##### §5 数学软件
主要是$\mathrm{MATLAB}^®$

Intel: MKL  
AMD: ACML  
NAG(贵)  

   |$\cdots$  
:--|:-:  
高层| PED Numer
   | Pot++
   | LAPACK./FFT（并行）(稠密／稀疏)
底层| BLAS

高性能计算  
Numerical Recipe www.netlib.org

#### 第二章 插值问题
##### §1 插值问题提法
给定节点$x_0,x_1,\cdots,x_n$  
函数值$f_0,f_1,\cdots,f_n$，  
构造$p(x)\in \mathrm{span}\left\{g_1(x),\cdots,g_{n+1}(x)\right\}$，  
使得$p(x_i)=f_i, ~i=0,\cdots,n$

线性插值

假设$\mathcal{L} = \mathrm{span}\left\{g_1(x),\cdots,g_{n+1}(x)\right\}$  
$p(x)\in\mathcal{L}\Rightarrow p(x)=a_0+a_1x+\cdots+a_nx^n$

$\left(
\begin{matrix}
1 & x_0 & \cdots & x_0^n \\
1 & x_1 & \cdots & x_1^n \\
\vdots\\
1 & x_n & \cdots & x_n^n \\
\end{matrix}
\right)
\cdot
\left(
\begin{matrix}
a_0 \\
a_1 \\
\vdots\\
a_n \\
\end{matrix}
\right)=
\left(
\begin{matrix}
f_0 \\
f_1 \\
\vdots\\
f_n \\
\end{matrix}
\right)$

由van der Monde矩阵，只要x互不相同，解存在唯一

##### §2 Lagrange插值问题
插值条件为函数值称为～。（没有导数）

1. 求解线性方程组
2. Lagrange插值公式

定义$l_0(x)=\frac{(x-x_1)(x-x_2)\cdots(x-x_n)}{(x_0-x_1)(x_0-x_2)\cdots(x_0-x_n)}\in\mathrm{span}\left\{1,x,\cdots,x^n\right\}$  
有$l_0(x_0)=1, ~l_0(x_i)=0, ~i=1,\cdots,n$  
同样，定义$l_i(x_j)=\delta_{ij}$

$p_n(x)=f_0l_0(x)+\cdots+f_nl_n(x)$满足插值条件。

显式写了出来，不用解那个Ax=b的线性方程组了。

##### §3 Newton型插值公式

Lagrange法换了点要重新做，希望每次新加点不用重做。

$p_0(x)=f_0 \\
p_1(x)=p_0(x)+\frac{f_1-f_0}{x_1-x_0}(x-x_0) \\
p_2(x)=p_1(x)+(?)(x-x_0)(x-x_1)$

看书吧P30

##### §3 Neville途径

**作业：** P48/2,7,9