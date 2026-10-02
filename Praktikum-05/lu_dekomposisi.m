clc;
clear;

A = [2 1 -1;
     4 3 1;
    -2 1 2];

b = [3;
     9;
     4];

n = length(A);

L = eye(n);
U = A;

for k = 1:n-1
    for i = k+1:n
        m = U(i,k) / U(k,k);
        L(i,k) = m;
        U(i,:) = U(i,:) - m * U(k,:);
    end
end

disp('MATRIKS L:');
disp(L);

disp('MATRIKS U:');
disp(U);

disp('HASIL L * U:');
disp(L * U);

y = zeros(n,1);

for i = 1:n
    y(i) = (b(i) - L(i,1:i-1) * y(1:i-1)) / L(i,i);
end

disp('HASIL Ly = b:');
disp(y);

x = zeros(n,1);

for i = n:-1:1
    x(i) = (y(i) - U(i,i+1:n) * x(i+1:n)) / U(i,i);
end

disp('HASIL Ux = y:');
fprintf('x1 = %.4f\n', x(1));
fprintf('x2 = %.4f\n', x(2));
fprintf('x3 = %.4f\n', x(3));
