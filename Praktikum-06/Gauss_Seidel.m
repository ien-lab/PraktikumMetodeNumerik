
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

% Algoritma Gauss-Seidel saja yang diukur
tic;

while iterasi < maks_iterasi && galat_iterasi >= toleransi
    x_lama = x;

    for i = 1:n
        jumlah_kiri = A(i,1:i-1)*x(1:i-1);
        jumlah_kanan = A(i,i+1:n)*x_lama(i+1:n);

        x(i) = (b(i) - jumlah_kiri ...
                - jumlah_kanan)/A(i,i);
    end

    galat_iterasi = max(abs(x - x_lama));
    iterasi = iterasi + 1;
end

waktu_gs = toc;

% Galat terhadap solusi acuan
galat_eksak = abs(x_eksak - x);

disp('=== METODE GAUSS-SEIDEL ===');
fprintf('Jumlah iterasi: %d\n', iterasi);
disp('Solusi hampiran [p; q; r; s; t]:');
disp(x);
fprintf('Selisih iterasi terakhir: %.8f\n', galat_iterasi);
disp('Galat absolut terhadap solusi eksak:');
disp(galat_eksak);
fprintf('Running time: %.8f detik\n', waktu_gs);

