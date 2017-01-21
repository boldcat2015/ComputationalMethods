2016.10.21

##### §3 Newton-Cotes公式

$$\begin{align}
\int_a^bf(x)\mathrm{d}x&\approx\frac{b-a}{2}\left(f(a)+f(b)\right)\\
&\approx\frac{b-a}{6}\left(f(a)+4f(\frac{a+b}{2})+f(b)\right)\\
&\approx\frac{b-a}{90}\left(7f(a)+32f(\frac{3a+b}{4})+12f(\frac{a+b}{2})+32f(\frac{a+3b}{4})+7f(b)\right)
\end{align}$$
n=1:梯形公式  
n=2:Simpson公式  
n=4:Cotes公式  

定理：偶数n的Newton-Cotes公式具有n+1阶代数精度

P101/余项公式$$R=\int_a^b\frac{f^{(n+1)}(\xi)}{(n+1)!}\omega_{n+1}(x)\mathrm{d}x,~\omega_{n+1}(x)=\prod_{i=0}^n(x-x_i)$$
n为偶数时，$$\int_a^b\omega_{n+1}(x)\mathrm{d}x=0$$

##### §4 提高精度方法

上机题：$$\int_{-1}^1e^{-x^2}\mathrm{d}x$$四种以上公式，其中至少一种达到$10^{-8}$以上精度。

1. 复合求积公式
2. Richardson外插技巧和Romberg公式
3. Gauss求积公式（正系数，2n+1精度）

作业：P136/6,7,10,13
