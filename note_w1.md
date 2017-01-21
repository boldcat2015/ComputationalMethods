计算方法 高卫国 五6-8 @HGX306

2016.09.09

**教材** ： 李庆阳 王能超 易大义 《数值分析》（第五版） 清华大学出版社

教到第8章，第9章不讲。

可能会有集体上机课。

上机：平时－期末＝30%－70%；不上机＝20%－80%

#### 第一章 引论
##### §1 科学研究手段

理论 － 数值模拟 — 数据 － 实验

##### §2 数值计算

图论算法／数值算法

数的表示（不要求）精确／不精确 浮点

(See D.Goldberg's [*What Every Computer Scientist Should Know About Floating-Point Arithmetic*](./goldberg.pdf))

$$1.2 - 1.0 - 0.2 \neq 0$$

##### §3 误差

1. 误差来源：测量误差，截断误差，舍入误差
2. 误差界
3. 误差分析 舍入误差  
   向前误差 $(x+y)(1+\delta)$  
   向后误差 Wilkinson
   $$
    \begin{aligned}
     &~ fl(x_1y_1+x_2y_2+x_3y_3) \\
     &= fl(fl(fl(x_1y_1) + fl(x_2y_2)) + fl(x_3y_3)) \\
     &= x_1y_1(1+\delta_1)(1+\delta_4)(1+\delta_5) + x_2y_2(1+\delta_2)(1+\delta_4)(1+\delta_5) + x_3y_3(1+\delta_3)(1+\delta_4)(1+\delta_5) \\
     &= \hat{x}_1\hat{y}_1 + \hat{x}_2\hat{y}_2 + \hat{x}_3\hat{y}_3
    \end{aligned}
   $$
   条件数

##### §4 算法

避免减法相消