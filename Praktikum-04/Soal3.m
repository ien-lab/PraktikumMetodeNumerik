clc;
clear;

fprintf('===============================================\n');
fprintf(' SOAL 3 - DERET TAYLOR sin(x)\n');
fprintf('===============================================\n\n');

% Nilai x
x = 1;

% Nilai eksak
nilai_eksak = sin(x);

fprintf('Nilai x = %.0f radian\n', x);
fprintf('Nilai eksak sin(1) = %.15f\n\n', nilai_eksak);

fprintf(' N       Nilai Hampiran       Galat Absolut       Galat Relatif (%%)\n');
fprintf('---------------------------------------------------------------------\n');

% Perhitungan untuk N = 1 sampai 5
for N = 1:5

    % Inisialisasi nilai hampiran
    nilai_hampiran = 0;

    % Deret Taylor sin(x)
    for n = 0:N

        suku = ((-1)^n * x^(2*n + 1)) ...
            / factorial(2*n + 1);

        nilai_hampiran = nilai_hampiran + suku;

    end

    % Galat absolut
    galat_absolut = ...
        abs(nilai_eksak - nilai_hampiran);

    % Galat relatif
    galat_relatif = ...
        galat_absolut / abs(nilai_eksak);

    % Galat dalam persen
    galat_persen = galat_relatif * 100;

    fprintf('%2d    %.15f    %.15f    %.10f%%\n', ...
        N, nilai_hampiran, galat_absolut, galat_persen);

end

fprintf('\n===============================================\n');
fprintf('Program selesai.\n');
fprintf('===============================================\n');
