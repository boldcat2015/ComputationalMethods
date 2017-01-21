2016.09.30

##### §5 三次样条插值

定理5（P46）

证明：$\eta(x)=f(x)-S(x)\in C^2[a,b]\Rightarrow \eta(x_i)=0, \eta'(x_1)=\eta'(x_n)=0$

$$
\begin{align}
&~\int_a^b[f''(x)]^2\mathrm{d}x \\
&=\int_a^b[S''(x)+\eta''(x)]^2\mathrm{d}x \\
&=\int_a^b[S''(x)]^2\mathrm{d}x+\int_a^b[\eta''(x)]^2\mathrm{d}x+2\int_a^bS''(x)\eta''(x)\mathrm{d}x
\end{align}$$
因此
$$\int_a^b[f''(x)]^2\mathrm{d}x\geqslant\int_a^b[S''(x)]^2\mathrm{d}x$$
等号成立当且仅当
$$\int_a^b[\eta''(x)]^2\mathrm{d}x=0\Rightarrow\eta(x)\equiv 0$$
对自然样条、周期样条也成立


#### 第三章 函数逼近与FFT
##### §1 逼近问题
$L_2$范数,$L_\infty$范数

##### §2 正交多项式

作业：P94/6,12

上机作业：P40/荣格现象,P45/三次样条插值,P65/切比雪夫插值节点，三个图画出来

上机作业交至： zlzl-196@163.com

上机作业时间为两周