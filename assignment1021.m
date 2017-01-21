% 2016.10.21 Second assignment
% 12307110079 Cheng Yu Ge
%
% Compute $\int_{-1}^1e^{-x^2}\mathrm{d}x$ in four different formula,
% with error below $10^{-8}$ for at least one method.
%
% 1. 6-order Newton-Cotes formula
% 2. Simpson Quadrature Formulas of 40 Equal (required accuracy)
% 3. 5 Times Richardson extrapolates accelerated Romberg formula (required accuracy)
% 4. 4-order Gauss-Legendre Quadrature Formula

close;
clear;
clc;
f = @(x) exp(-x.^2);
I = sqrt(pi)*erf(1); % exact integral value

%% 1. Newton-Cotes, n=6
x1 = linspace(-1,1,7); % nodes
y1 = f(x1);
NC = [41/840, 9/35, 9/280, 34/105, 9/280, 9/35, 41/840]; % Newton-Cotes
I1 = 2 * y1 * NC';
e1 = abs(I1-I)/I; % error

%% 2. Composite Simpson's Rule, n=40
n = 40; 
x2 = linspace(-1,1,2*n+1); % nodes (with all half interval points)
y2 = f(x2);
I2 = (y2(1)+4*sum(y2(2:2:2*n))+2*sum(y2(3:2:2*n))+y2(2*n+1))/(3*n);
e2 = abs(I2-I)/I; % error

%% 3. Romberg's method with Richardson extrapolation, m=5
m = 5;
T = zeros(m+1);
T(1,1) = f(-1) + f(1);
for k = 2:m+1 % T(k,1) is composite trapezoidal rule with k-1 times bisec
    h = 2^(-k+2);
    T(k,1) = T(k-1,1)/2 + h*sum(f(-1+h:2*h:1));
    for l = 2:k % T(k,l) is T(k,1) accelerated l-1 times
        T(k,l) = 4^(l-1)/(4^(l-1)-1)*T(k,l-1)-1/(4^(l-1)-1)*T(k-1,l-1);
    end
end % This table will be exactly the same as table 4-4 on page 112
I3 = diag(T);
e3 = abs(I3(2:m+1)-I)./I; % error

%% 4. Gauss-Legendre, n=4
x41 = sqrt(245-14*sqrt(70))/21;
x42 = sqrt(245+14*sqrt(70))/21;
x4 = [-x42 -x41 0 x41 x42]; % nodes
y4 = f(x4);
gl1 = (322+13*sqrt(70))/900;
gl2 = (322-13*sqrt(70))/900;
GL = [gl2 gl1 128/225 gl1 gl2]; % Gauss-Legendre
I4 = y4 * GL';
e4 = abs(I4-I)/I; % error

%% show error
rombergs = cell(1,m);
for i=1:m   
    rombergs{i}=char(['Romberg-',num2str(i)]);      
end
semilogy(1,e1,'>','linewidth', 9); hold on;
semilogy(2,e2,'^','linewidth', 9);
semilogy(3,e3,'o','linewidth', 9);
semilogy(4,e4,'v','linewidth', 9);
title('error of 4 methods');
legend(['Cotes-6','Simpson-40',rombergs,'Gauss-4'],'fontsize', 14);
semilogy([1:0.05:4],1e-8,'k.'); hold off;
