clc;
clear;

fprintf('====================================================\n');
fprintf(' SOAL 2 - PERHITUNGAN 1/1 + 1/2 + ... + 1/20\n');
fprintf('====================================================\n\n');


%% ====================================================
% A. PERHITUNGAN SECARA EKSAK
% =====================================================

jumlah_eksak = 0;

for i = 1:20
    jumlah_eksak = jumlah_eksak + 1/i;
end

fprintf('A. PERHITUNGAN SECARA EKSAK\n');
fprintf('Hasil = %.15f\n\n', jumlah_eksak);


%% ====================================================
% B. SETIAP PEMBAGIAN DIBULATKAN
% ====================================================

% Pembulatan menggunakan 6 angka di belakang koma
jumlah_bulat = 0;

fprintf('B. SETIAP PEMBAGIAN DIBULATKAN\n');
fprintf('----------------------------------------------------\n');

for i = 1:20

    % Nilai pembagian
    nilai = 1/i;

    % Pembulatan menjadi 6 angka desimal
    nilai_bulat = round(nilai * 10^6) / 10^6;

    % Menjumlahkan hasil pembulatan
    jumlah_bulat = jumlah_bulat + nilai_bulat;

    fprintf('1/%2d = %.6f\n', i, nilai_bulat);

end

fprintf('----------------------------------------------------\n');
fprintf('Hasil pembulatan = %.15f\n', jumlah_bulat);


% Galat metode pembulatan
galat_bulat = abs(jumlah_eksak - jumlah_bulat);

galat_relatif_bulat = ...
    galat_bulat / abs(jumlah_eksak);

galat_persen_bulat = ...
    galat_relatif_bulat * 100;

fprintf('Galat absolut    = %.15f\n', galat_bulat);
fprintf('Galat relatif    = %.15f\n', galat_relatif_bulat);
fprintf('Galat relatif (%%)= %.10f%%\n\n', galat_persen_bulat);


%% ====================================================
% C. TANPA LOOPING MENGGUNAKAN SUM
% ====================================================

data = 1 ./ (1:20);

jumlah_sum = sum(data);

% Galat terhadap nilai eksak
galat_sum = abs(jumlah_eksak - jumlah_sum);

galat_relatif_sum = ...
    galat_sum / abs(jumlah_eksak);

galat_persen_sum = ...
    galat_relatif_sum * 100;

fprintf('C. TANPA LOOPING MENGGUNAKAN SUM\n');
fprintf('Hasil sum        = %.15f\n', jumlah_sum);
fprintf('Galat absolut    = %.15f\n', galat_sum);
fprintf('Galat relatif    = %.15f\n', galat_relatif_sum);
fprintf('Galat relatif (%%)= %.10f%%\n', galat_persen_sum);


fprintf('\n====================================================\n');
fprintf('Program selesai.\n');
fprintf('====================================================\n');
