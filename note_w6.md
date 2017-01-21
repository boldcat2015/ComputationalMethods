2016.10.14

##### §6 最佳平方逼近（三角）和FFT

1. 三角多项式
    
    $x_j=2\pi j/(2m+1)$
    
    $\{1,\cos x,\cdots,\sin mx\}$
    
    2m+1矩阵
    
    DFT
    
    $\{1,e^{ix},\cdots,e^{ikx}\}$
    
    $F_N=(e^{2\pi i jk/N})_{N\times N},~j,k\in[0,N-1]$
    
    $F_N^HF_N=NI$
    
2. FFT
    以$N=2^2=4$为例：
    
    $F_4=\left(
\begin{matrix}
1 & 1 & 1 & 1\\
1 & i & -1 & -i\\
1 & -1 & 1 & -1\\
1 & -i & -1 & i\\
\end{matrix}\right), \Pi_4$交换2、3列

    $F_4\Pi_4=\left(
\begin{matrix}
F_2 & diag\{1,i\}F_2\\
F_2 & -diag\{1,i\}F_2\\
\end{matrix}\right)$

    $F_N\Pi_N=\left(
\begin{matrix}
F_{N/2} & \Omega_{N/2}F_{N/2}\\
F_{N/2} & -\Omega_{N/2}F_{N/2}\\
\end{matrix}\right),\Omega$是对角阵

    $f = F_N\cdot C = F_N\Pi_N\cdot C'$,用上式二分地拆分，总运算量$2N\log_2 N$
    
#### 第四章 数值积分与数值微分
##### §1 数值积分概论

##### §2 插值型求积公式（quadrature）

收敛性：$$\lim_{h\to 0}\sum_{k=0}^{n}A_kf(x_k)=\int_a^bf(x)\mathrm{d}x$$

稳定性：$$\forall\epsilon>0,\exists\delta,s.t.\left|f(x_k)-\hat{f}(x_k)\right|\leqslant\delta_k<\delta\Rightarrow\left|\sum_{k=0}^nA_kf(x_k)-\sum_{k=0}^nA_k\hat{f}(x_k)\right|<\epsilon.$$

定理：如果求积系数$A_k>0$，则求积公式稳定。（证明：取$\delta=\epsilon/(b-a)$）

##### §3 Newton-Cotes公式
$$\sum_{k=0}^nC_k^{(n)}=1$$

作业：P135/3,5