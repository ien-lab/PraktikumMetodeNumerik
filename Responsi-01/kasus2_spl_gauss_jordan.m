% KASUS 2 - SISTEM PERSAMAAN LINEAR

clear; clc;

% Kolom variabel: [beras, telur, tepung, ayam]
% Semua kuantitas sudah dikonversi ke kilogram.
A = [2.5, 1.5, 5.0, 0.5;
     4.0, 0.75, 1.0, 2.0;
     2.0, 1.5, 0.5, 6.0;
     1.0, 4.25, 2.0, 0.9];

b = [161000; 149000; 251500; 173000];

% Matriks augmented [A | b]
M = [A, b];
n = size(A, 1);

fprintf('KASUS 2: SPL DENGAN ELIMINASI GAUSS-JORDAN\n');
fprintf('Matriks augmented awal [A | b]:\n');
disp(M);

% Eliminasi Gauss-Jordan dengan partial pivoting
for k = 1:n

    [~, idx_rel] = max(abs(M(k:n, k)));
    idx = idx_rel + k - 1;

    if abs(M(idx, k)) < 1e-12
        error('Matriks singular atau tidak memiliki pivot yang memadai.');
    end

    % Tukar baris bila diperlukan
    if idx ~= k
        temp = M(k, :);
        M(k, :) = M(idx, :);
        M(idx, :) = temp;
    end

    % Normalisasi baris pivot agar elemen pivot menjadi 1
    M(k, :) = M(k, :) / M(k, k);

    % Nolkan elemen lain pada kolom pivot
    for i = 1:n
        if i ~= k
            factor = M(i, k);
            M(i, :) = M(i, :) - factor .* M(k, :);
        end
    end

    fprintf('Matriks setelah langkah pivot ke-%d:\n', k);
    disp(M);
end

harga = M(:, end);

fprintf('\nHASIL HARGA BAHAN PER KILOGRAM\n');
fprintf('Beras  : Rp %.2f per kg\n', harga(1));
fprintf('Telur  : Rp %.2f per kg\n', harga(2));
fprintf('Tepung : Rp %.2f per kg\n', harga(3));
fprintf('Ayam   : Rp %.2f per kg\n', harga(4));

% Verifikasi: substitusikan hasil ke sistem awal
b_hitung = A * harga;
residual = b_hitung - b;

fprintf('\nVerifikasi A*x dibandingkan dengan b:\n');
disp([b, b_hitung, residual]);
fprintf('Norma residual maksimum: %.12g\n', max(abs(residual)));

% Catatan analisis:
% Matriks tidak memenuhi dominasi diagonal secara langsung pada susunan
% baris/kolom soal, sehingga Gauss-Seidel tidak dijamin konvergen dari
% kriteria dominasi diagonal. Karena itu program menggunakan metode
% langsung Gauss-Jordan.

