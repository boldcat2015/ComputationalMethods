2016.11.11

相容范数：  
$||AB||\leqslant||A||\cdot||B||$

**谱半径**$$\rho(A)\leqslant||A||$$

证明：$|\lambda|\cdot||xy^T||=||A(xy^T)||\leqslant||A||\cdot||xy^T||,~||xy^T||\ne0~\square$

$$\forall\epsilon>0,\exists||\cdot||_\epsilon s.t. ||A||\leqslant\rho(A)+\epsilon$$

证明：$P^{-1}AP=diag(\lambda_1\cdots\lambda_n,0)+diag(\delta_1\cdots\delta_{n-1},1),$

令$D_\epsilon=diag(1\cdots\epsilon^{n-1}),D^{-1}_\epsilon=diag(1\cdots1/\epsilon^{n-1}),$

令$||A||_\epsilon=||D^{-1}_\epsilon P^{-1}APD_\epsilon||_\infty\Rightarrow||A||_\epsilon\leqslant\rho(A)+\epsilon~\square$

$$||I||=1,||B||<1\Rightarrow I\pm B, ||(I\pm B)^{-1}||\leqslant\frac{1}{1-||B||}$$

证明：$|\lambda|\leqslant||B||<1\Rightarrow|1\pm\lambda|\geqslant1-|\lambda|>0~\square$

**条件数**$cond(A)=||A||\cdot||A^{-1}||$

若$||\cdot||$为2-范数，即$||A||_2=\sqrt{\lambda_{max}(A^{T}A)}$，

则$cond(A)=\frac{\sigma_1(A)}{\sigma_n(A)},~\sigma_1\geqslant\cdots\geqslant\sigma_n,~\sigma_i=\sqrt{\lambda_i(A^{T}A)}$

定理：设A非奇异，则$\min\left\{\frac{||\delta A||_2}{||A||_2}\right\}$($A+\delta A$非奇异)$=\frac{1}{||A||_2||A^{-1}||_2}$

证明：只需证$\min\left\{||\delta A||_2\right\}$($A+\delta A$非奇异)$=\frac{1}{||A^{-1}||_2}$

1. 若$||A^{-1}\delta A||_2\leqslant||A^{-1}||_2||\delta A||_2<1,~A+\delta A=A(I+A^{-1}\delta A)$非奇异

高斯消去，定义增长因子$$p=\max_{i,j,k}|a^{(k)}_{ij}|\big/||A||_\infty$$

作业：P177/13,15,20