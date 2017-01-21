% 2016.09.30 First assignment
% 12307110079 Cheng Yu Ge
%
% Draw: Ronge's phenomenon on P40,
%       cubic spline interpolation on P45,
%   and Chebyshev interpolation node on P65.

close;
clear;
clc;
%% Runge @P40 & Chebyshev @P65
R = @(x) 1./(1+x.^2);
n = 10; % degree of interpolation polynomial

xx = -5:0.01:5; % for ploting
yy = R(xx); % exact value

x_u = -5:10/n:5; % uniform interpolation
pc_u = polyfit(x_u,R(x_u),n); % same as Lagrange
pv_u = polyval(pc_u,xx);

x_c = -5*cos((1:2:2*n+1)*pi/(2*n+2)); % chebyshev interpolation
pc_c = polyfit(x_c,R(x_c),n);
pv_c = polyval(pc_c,xx);

plot(xx,yy,'k-',xx,pv_u,'r--', xx,pv_c,'b--');
axis([-5 5 -1/3 2]);
legend('exact','uniform','chebshev','location','north');
title(sprintf('n=%d',n));

%% 3-spline @P45
x = [27.7 28 29 30];
fx = [4.1 4.3 4.1 3.0];

s = [[13.07278 -14.84322 0.22 14.31353]; ...
     [0.066 4.234 0.13833 3.96167]; ...
     [0.13833 3.96167 -1.51917 4.51917]];
S = @(x) (s(1,1)*(x-28).^3+s(1,2)*(x-28)+s(1,3)*(x-27.7).^3 ...
          +s(1,4)*(x-27.7)).*(x<28) ...
        +(s(2,1)*(29-x).^3+s(2,2)*(29-x)+s(2,3)*(x-28).^3 ...
          +s(2,4)*(x-28)).*(x>=28 & x<29) ...
        +(s(3,1)*(30-x).^3+s(3,2)*(30-x)+s(3,3)*(x-29).^3 ...
          +s(3,4)*(x-29)).*(x>=29);
xxx = 27.7:0.01:30;
Sxx = S(xxx);

xx1 = 27.7:0.01:28;
f1x = 3 * (xx1 - 27.7) + 4.1;
xx2 = 29.7:0.01:30;
f2x = -4 * (xx2 - 30) + 3;

plot(xx1,f1x,'k',xx2,f2x,'k','linewidth',1);hold on;
plot(x,fx,'rx',xxx,Sxx,'k-','linewidth',2);
axis([27.7 30 2.9 4.5]);
legend('sample points','3-spline','location','south');
title(sprintf('3-spline'));
    