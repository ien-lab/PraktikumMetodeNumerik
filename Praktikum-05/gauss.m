clc;
clear;

A = [2 1 -1;
     4 3 1;
    -2 1 2];

b = [3;
     9;
     4];

n = length(b);

Ab = [A b];

disp('MATRIKS AUGMENTED AWAL:');
disp(Ab);

for k = 1:n-1
    for i = k+1:n
        m = Ab(i,k) / Ab(k,k);
        Ab(i,:) = Ab(i,:) - m * Ab(k,:);
    end
end

disp('MATRIKS SEGITIGA ATAS:');
disp(Ab);

x = zeros(n,1);

for i = n:-1:1
    x(i) = (Ab(i,n+1) - Ab(i,i+1:n) * x(i+1:n)) / Ab(i,i);
end

disp('HASIL ELIMINASI GAUSS:');
fprintf('x1 = %.4f\n', x(1));
fprintf('x2 = %.4f\n', x(2));
fprintf('x3 = %.4f\n', x(3));
