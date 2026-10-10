
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

% Algoritma Gauss: eliminasi maju dan substitusi mundur
tic;

M = [A b];

for k = 1:n-1
    [~, idx] = max(abs(M(k:n,k)));
    idx = idx + k - 1;
    M([k idx],:) = M([idx k],:);

    for i = k+1:n
        faktor = M(i,k)/M(k,k);
        M(i,k:n+1) = M(i,k:n+1) ...
                     - faktor*M(k,k:n+1);
    end
end

x = zeros(n,1);

for i = n:-1:1
    x(i) = (M(i,n+1) ...
           - M(i,i+1:n)*x(i+1:n))/M(i,i);
end

waktu_gauss = toc;

disp('=== METODE GAUSS ===');
disp('Solusi [p; q; r; s; t]:');
disp(x);
fprintf('Running time: %.8f detik\n', waktu_gauss);

