2016.12.09

共轭梯度法

#### 收敛速率

定理：$A$对称正定，SD，$\kappa$是$A$的条件数，$$||x_k-x_*||_A\leqslant\left(\frac{\kappa-1}{\kappa+1}\right)^k||x_0-x_*||_A$$

定理：$A$对称正定，CG，$\kappa$是$A$的条件数，$$||x_k-x_*||_A\leqslant2\left(\frac{\sqrt\kappa-1}{\sqrt\kappa+1}\right)^k||x_0-x_*||_A$$

小技巧：P/185

$||x_k-x_*||\leqslant q^k||x_0-x_*||$

$\begin{align}
||x_1-x_0||&\geqslant||x_0-x_*||-||x_1-x_*||\\
&\geqslant||x_0-x_*||-q||x_0-x_*||\\
&\geqslant(1-q)||x_0-x_*||\\
\end{align}$

$||x_k-x_*||\leqslant\frac{q^k}{1-q}||x_1-x_0||$

$$x_*-x=A^{-1}r$$

$$||x-x_*||=||A^{-1}||\cdot||r||$$

$$b=Ax_*\Rightarrow||b||\leqslant||A||\cdot||x_*||$$

$$\frac{||x-x_*||}{||x||}\leqslant||A||\cdot||A^{-1}||\frac{||r||}{||b||}$$

## 第七章 非线性方程与方程组的数值解法

作业：P238/10,12,15

上机作业：P211/2

