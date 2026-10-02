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

for k = 1:n
    Ab(k,:) = Ab(k,:) / Ab(k,k);

    for i = 1:n
        if i ~= k
            m = Ab(i,k);
            Ab(i,:) = Ab(i,:) - m * Ab(k,:);
        end
    end
end

disp('MATRIKS HASIL GAUSS-JORDAN:');
disp(Ab);

x = Ab(:,n+1);

disp('HASIL GAUSS-JORDAN:');
fprintf('x1 = %.4f\n', x(1));
fprintf('x2 = %.4f\n', x(2));
fprintf('x3 = %.4f\n', x(3));
