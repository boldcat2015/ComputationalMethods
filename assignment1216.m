% 2016.12.16 Fifth Assignment
% P240/2
%
% 12307110079 Cheng Yu Ge

close;
clear;
clc;

%% (1) generate coefficients a_0, a_1,..., a_9
syms x;
p = 1;
for i = 1 : 10
    p = p * (x - i);
end
% disp(p);
p = simplifyFraction(p, 'Expand', true);
% disp(p);

%% (2) solve p(x) + epsilon * x^9 = 0
epsilon = 10.^(-4:-1:-12);
error = zeros(size(epsilon));
for i = 1 : numel(epsilon);
    fprintf('\nepsilon = %.1e\n', epsilon(i));
    a = sym2poly(p + epsilon(i) * x^9); % a_i = a(11-i)
    % disp(a);
    r = roots(a);
    disp(r);
    error(i) = max(abs(r-(10:-1:1)'));
    fprintf('\terror = %e\n', error(i));
end

loglog(epsilon, error, '-+');
title('error - \epsilon');
% from result we can conclude error ~ epsilon * 10^4
