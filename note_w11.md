2016.11.18

引理：n阶浮点数矩阵A用Gauss消去法计算得到下三角矩阵$\widetilde{L}$和上三角矩阵$\widetilde{U}$满足$\widetilde{L}\widetilde{U}=A+E$  
其中$|E|\leqslant3n\varepsilon(|A|+|\widetilde{L}||\widetilde{U}|)$,$\varepsilon$为机器精度。用归纳法证明。

### 第六章 线性方程组的迭代法

定常迭代法

$x_{k+1}=Bx_k+f$对任意初值$x_0$收敛$\Leftrightarrow\rho(B)<1$

基本迭代法

$A=D-L-U\Rightarrow(D-L-U)x=b$

Jacobi迭代法

$Dx_{k+1}=(L+U)x_k+b$  
$\Rightarrow x_{k+1}=D^{-1}(L+U)x_k+D^{-1}b$

Gauss-Serdel迭代法

$(D-L)x_{k+1}=Ux_k+b$  
$\Rightarrow x_{k+1}=(D-L)^{-1}Ux_k+(D-L)^{-1}b$

SOR($\omega$)(SOR($(\omega$)=GS)

$(D-\omega L)x_{k+1}=((1-\omega)D+\omega U)x_k+\omega b$  
$\Rightarrow x_{k+1}=(D-\omega L)^{-1}((1-\omega)D+\omega U)x_k+(D-\omega L)^{-1}b$

#### 基本迭代法的收敛性分析

两种矩阵类型

1. 对称正定矩阵
2. 严格对角占优矩阵（$|a_{ii}|>\sum_{j\ne i}|a_{ij}|$）  
对角占优不可约矩阵（可约：$\exists$排列阵$P ~s.t.P^TAP$为一个分块上三角阵）

定理：不可约对角占优矩阵非奇异（反证）

 迭代法\矩阵|对称正定|严格对角占优／不可约对角占优
:--:|:--:|:--:
Jacobi|2D-A>0(正定)定理10|√定理9
GS|√|√定理9
SOR($\omega$)$0<\omega<2$|√定理12|$0<\omega\leqslant1$定理13

定理11:SOR($\omega$)收敛，则$0<\omega<2$。

证：迭代矩阵为  
$\begin{align}
&~|(D-\omega L)^{-1}((1-\omega)D+\omega U)|\\
&=|(I-\omega D^{-1}L)^{-1}||((1-\omega)I+\omega D^{-1}U)|\\
&=(1-\omega)^n<1
\end{align}$

$\begin{align}
B&=D^{-1}(L+U)=D^{-1}(D-A)\\
&=D^{-\frac{1}{2}}D^{-\frac{1}{2}}(D-A)D^{-\frac{1}{2}}D^{\frac{1}{2}}\\
&=D^{-\frac{1}{2}}(I-D^{-\frac{1}{2}}AD^{-\frac{1}{2}})D^{\frac{1}{2}}\text{（先合同，再相似）}
\end{align}$

$\begin{align}
\rho(B)<1&\Leftrightarrow\rho(I-D^{-\frac{1}{2}}AD^{-\frac{1}{2}})<1\\
&\Leftrightarrow0<\lambda(D^{-\frac{1}{2}}AD^{-\frac{1}{2}})<2\\
&\Leftrightarrow A\text{正定，}2D-A\text{正定}
\end{align}$

定理：A对称正定，则GS迭代收敛

证明：迭代矩阵$(D-L)^{-1}L^T$，设$\lambda$是其特征值，v是对应的特征向量，  
$(D-L)^{-1}L^Tv=\lambda v
\Rightarrow\lambda(D-L)v=L^Tv$  
左乘$v^H$,$\lambda v^HDv-\lambda v^HLv=v^HL^Tv$  
记为$\lambda(\delta-\alpha+i\beta)=\alpha-i\beta$
$\Rightarrow|\lambda|<1$  
$v^Hav>0\Rightarrow\delta>2\alpha$

作业：P177/16,17; P209/3,5

上机题：P179/3