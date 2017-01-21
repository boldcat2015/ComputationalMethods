2016.12.02

#### 基本迭代法的收敛性分析

定义：$$R_k(B)=\frac{-\ln||B^k||}{k}$$为k次迭代的平均收敛速度（依赖于范数），其极限$$\lim_{k\to\infty}R_k(B)=-\ln\rho(B)$$（不依赖范数）

1⃣️若$\mu\ne0$是$B^J$的一个特征值，则由$(\lambda+\omega-1)^2=\omega^2\mu^2\lambda$所确定的$\lambda$是$B^{SOR(\lambda)}$的特征值，反之亦然。

2⃣️$\rho(B^{GS})=\rho(B^J)^2$

如果1⃣️成立，取$\omega=1,~\lambda^2=\mu^2\lambda\Rightarrow\lambda=\mu^2$

作业：P209/9,11