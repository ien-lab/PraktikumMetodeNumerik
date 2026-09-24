clc;
clear;

fprintf('===============================================\n');
fprintf(' SOAL 1 - DERET TAYLOR e^0.3\n');
fprintf('===============================================\n\n');

% Nilai x
x = 0.3;

% Nilai eksak
nilai_eksak = exp(x);

fprintf('Nilai eksak e^0.3 = %.15f\n\n', nilai_eksak);

fprintf(' n       Nilai Hampiran       Galat Absolut       Galat Relatif (%%)\n');
fprintf('---------------------------------------------------------------------\n');

% Perhitungan untuk n = 0 sampai 4
for n = 0:4

    % Inisialisasi nilai hampiran
    nilai_hampiran = 0;

    % Deret Taylor
    for i = 0:n
        nilai_hampiran = nilai_hampiran + ...
            (x^i / factorial(i));
    end

    % Galat absolut
    galat_absolut = abs(nilai_eksak - nilai_hampiran);

    % Galat relatif
    galat_relatif = galat_absolut / abs(nilai_eksak);

    % Galat relatif dalam persen
    galat_persen = galat_relatif * 100;

    fprintf('%2d    %.15f    %.15f    %.10f%%\n', ...
        n, nilai_hampiran, galat_absolut, galat_persen);

end

fprintf('\n===============================================\n');
fprintf('Program selesai.\n');
fprintf('===============================================\n');
