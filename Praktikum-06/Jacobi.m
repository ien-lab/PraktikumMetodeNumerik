
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
maks_iterasi = 20;
toleransi = 0.001;

% Solusi acuan untuk perhitungan galat
x_eksak = A \ b;

% Nilai awal
x = zeros(n,1);
galat_iterasi = Inf;
iterasi = 0;

D = diag(diag(A));
R = A - D;

% Algoritma Jacobi saja yang diukur
tic;

while iterasi < maks_iterasi && galat_iterasi >= toleransi
    x_baru = D \ (b - R*x);

    galat_iterasi = max(abs(x_baru - x));
    x = x_baru;
    iterasi = iterasi + 1;
end

waktu_jacobi = toc;

% Galat terhadap solusi acuan
galat_eksak = abs(x_eksak - x);

disp('=== METODE JACOBI ===');
fprintf('Jumlah iterasi: %d\n', iterasi);
disp('Solusi hampiran [p; q; r; s; t]:');
disp(x);
fprintf('Selisih iterasi terakhir: %.8f\n', galat_iterasi);
disp('Galat absolut terhadap solusi eksak:');
disp(galat_eksak);
fprintf('Running time: %.8f detik\n', waktu_jacobi);

