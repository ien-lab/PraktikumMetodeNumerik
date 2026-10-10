
clc;
clear;
format long g;

A = [ 5 -1 -1  0  0;
     -1  5 -1 -1  0;
     -1 -1  4 -1 -1;
      0  0  1  4 -2;
      0  1 -1  1  4];

b = [-1; 2; 6; 2; -1];

% Dekomposisi LU dan substitusi maju-mundur
tic;

[L, U, P] = lu(A);
y = L \ (P*b);
x = U \ y;

waktu_lu = toc;

disp('=== DEKOMPOSISI LU ===');
disp('Matriks L:');
disp(L);
disp('Matriks U:');
disp(U);
disp('Solusi [p; q; r; s; t]:');
disp(x);
fprintf('Running time: %.8f detik\n', waktu_lu);

