
clc;
clear;
format long g;

A = [ 5 -1 -1  0  0;
     -1  5 -1 -1  0;
     -1 -1  4 -1 -1;
      0  0  1  4 -2;
      0  1 -1  1  4];

b = [-1; 2; 6; 2; -1];
n = length(b);

% Algoritma Gauss-Jordan
tic;

M = [A b];

for k = 1:n
    [~, idx] = max(abs(M(k:n,k)));
    idx = idx + k - 1;
    M([k idx],:) = M([idx k],:);

    M(k,:) = M(k,:)/M(k,k);

    for i = 1:n
        if i ~= k
            faktor = M(i,k);
            M(i,:) = M(i,:) - faktor*M(k,:);
        end
    end
end

x = M(:,n+1);

waktu_gj = toc;

disp('=== METODE GAUSS-JORDAN ===');
disp('Solusi [p; q; r; s; t]:');
disp(x);
fprintf('Running time: %.8f detik\n', waktu_gj);

