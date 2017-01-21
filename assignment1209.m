% 2016.12.09 Fourth Assignment
% P211/2 Au = b
%
% 12307110079 Cheng Yu Ge

close;
clear;
clc;

%% (1) Discretize the domain with grid N=10
N = 10;
h = 1 / (N + 1);
x = (1 : N) ./ (N + 1);
y = (1 : N) ./ (N + 1);

% b = h^2 * f + r
b = zeros(N * N, 1);
for j = 1 : N
    for i = 1 : N
        b((j-1) * N + i) = (x(i)^2 + y(j)^2) * exp(x(i)*y(j));
    end
end
b = -h^2 * b;
for j = 1 : N % add boundary conditions r
    for i = 1 : N
        if i == 1 % lack West point
           b((j-1) * N + i) = b((j-1) * N + i) + 1;
        end
        if i == N % lack East point
           b((j-1) * N + i) = b((j-1) * N + i) + exp(y(j));
        end
        if j == 1 % lack South point
           b((j-1) * N + i) = b((j-1) * N + i) + 1;
        end
        if j == N % lack NOrth point
           b((j-1) * N + i) = b((j-1) * N + i) + exp(x(i));
        end
    end
end

% A
Ai = cell(N,1);
for i = 1 : N
    Ai{i} = 4*eye(N) + diag(-ones(N-1,1), 1) + diag(-ones(N-1,1), -1);
end
A = blkdiag(Ai{:});
A = A + diag(-ones(N*N-N,1), N);
A = A + diag(-ones(N*N-N,1), -N);
A = sparse(A); % to save space

%% (2) Solve the linear equations

% u*
u_star = zeros(N * N, 1);
for j = 1 : N
    for i = 1 : N
        u_star((j-1) * N + i) = exp(x(i) * y(j));
    end
end

% A = D - U - L
D = diag(diag(A));
U = -triu(A,1);
L = -tril(A,-1);
fprintf('\nUntil norm(u(k) - u(k-1), Inf) < 1e-5,\n');

%% with Jacobi iterative method
J = D\(L+U);
f_J = D\b;
u_J = ones(N * N, 1);
u_J_prev = zeros(N * N, 1);
k_J = 0;

while norm(u_J - u_J_prev, Inf) >= 1e-5
    u_J_prev = u_J;
    u_J = J * u_J + f_J;
    k_J = k_J + 1;
    % disp(k_J);
    % disp(norm(u_J - u_star, Inf));
    % pause();
end
fprintf('\nJacobi iterative method:\n');
fprintf('\tk = %d,\n\t||u(%d) - u*|| = %.3e\n', ...
    k_J, k_J, norm(u_J - u_star, Inf));

%% with successive over relaxation method (SOR),
w_opt = 2 / (1 + sqrt(1 - vrho(J)^2));
omega = [1, 1.25, 1.5, 1.75, w_opt];
k_S = zeros(1,5);
for w = 1 : 5
    SOR = (D - omega(w)*L) \ ((1-omega(w))*D + omega(w)*U);
    f_S = omega(w) * ((D - omega(w)*L) \ b);
    u_S = ones(N * N, 1);
    u_S_prev = zeros(N * N, 1);

    while norm(u_S - u_S_prev, Inf) >= 1e-5
        u_S_prev = u_S;
        u_S = SOR * u_S + f_S;
        k_S(w) = k_S(w) + 1;
        % disp(k_S(w));
        % disp(norm(u_S - u_star, Inf));
        % pause();
    end
    fprintf('\nSOR method (omega = %f):\n', omega(w));
    fprintf('\tk = %d,\n\t||u(%d) - u*|| = %.3e\n', ...
        k_S(w), k_S(w), norm(u_S - u_star, Inf));
end

%% and with conjugate gradient (CG)
u_C = ones(N * N, 1);
u_C_prev = zeros(N * N, 1);
r = b - A*u_C;
p = r;
for k_C = 1 : N * N
    if norm(u_C - u_C_prev, Inf) < 1e-5
        break
    end
    u_C_prev = u_C;
    r_prev = r;
    p_prev = p;
    alpha = (r'*r) / (p'*A*p);
    u_C = u_C_prev + alpha * p_prev;
    r = r_prev - alpha * A * p_prev;
    beta = (r'*r) / (r_prev'*r_prev);
    p = r + beta * p_prev;
end
fprintf('\nCG method:\n');
fprintf('\tk = %d,\n\t||u(%d) - u*|| = %.3e\n', ...
    k_C, k_C, norm(u_C - u_star, Inf));