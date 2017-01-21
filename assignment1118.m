% 2016.11.18 Third assignment
% 12307110079 Cheng Yu Ge
%
% P179/3 Relative error in linear equations (A + dA)(x + dx) = b

close;
clear;
clc;
A = [10 7 8 7; 7 5 6 5; 8 6 10 9; 7 5 9 10];
dA = [0 0 0.1 0.2; 0.08 0.04 0 0; 0 -0.02 -0.11 0; -0.01 0 0 -0.02];
b = [32 23 33 31]';
x = A\b;
dx = (A+dA)\b - x; % dx = -(eye(4) + A\dA) \ (A \ (dA * x)); % same

fprintf('A =\n'); disp(A);
fprintf('|A| =\n'); disp(det(A));
fprintf('Eigenvalues of A are:\n'); disp(eig(A)');
fprintf('cond(A) =\n'); disp(cond(A));
fprintf('A + dA =\n'); disp(A+dA);
fprintf('solve (A + dA)(x + dx) = b and get dx =\n'); disp(dx);
fprintf('||dx|| =\n'); disp(norm(dx));
fprintf('||dx|| / ||x|| =\n'); disp(norm(dx)/norm(x));
fprintf('||dA|| / ||A|| =\n'); disp(norm(dA)/norm(A));
fprintf('since ||A^-1|| * ||dA|| > 1\n'); disp(norm(inv(A))/norm(dA));
fprintf('||dx|| / ||x|| cannot be contained.\n');