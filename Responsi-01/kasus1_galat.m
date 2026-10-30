% KASUS 1 - GALAT DAN ERROR PEMOTONGAN


clear; clc; close all;

lambda = 12;
v = 36;
x = 10;
h0 = 5;
n_list = [23, 24, 25];

% Rentang t: 0 sampai 5! = 120
t = linspace(0, factorial(5), 1000);
z = t .* v ./ lambda;

% Fungsi eksak
h_exact = h0 .* (cos(z) + exp(x));

h_approx = zeros(length(n_list), length(t));
mean_abs_error = zeros(size(n_list));
mean_relative_error_percent = zeros(size(n_list));

for j = 1:length(n_list)
    n = n_list(j);

    % Pendekatan cos(z) dengan n suku:
    % cos(z) = sum dari k=0 sampai n-1: (-1)^k z^(2k)/(2k)!
    cos_approx = zeros(size(z));
    for k = 0:(n-1)
        cos_approx = cos_approx + ((-1)^k .* z.^(2*k)) ./ factorial(2*k);
    end

    % Pendekatan exp(x) dengan n suku:
    % exp(x) = sum dari k=0 sampai n-1: x^k/k!
    exp_approx = 0;
    for k = 0:(n-1)
        exp_approx = exp_approx + (x^k) / factorial(k);
    end

    h_approx(j, :) = h0 .* (cos_approx + exp_approx);

    % Galat mutlak dan reratanya
    abs_error = abs(h_exact - h_approx(j, :));
    mean_abs_error(j) = mean(abs_error);

    % Galat relatif dalam persen; nilai eksak tidak nol untuk parameter soal
    relative_error_percent = abs_error ./ abs(h_exact) .* 100;
    mean_relative_error_percent(j) = mean(relative_error_percent);
end

% tabel ringkasan galat
fprintf('KASUS 1: GALAT DAN ERROR PEMOTONGAN\n');
fprintf('Rentang t: 0 sampai %g (5!)\n\n', factorial(5));
fprintf('%8s %22s %28s\n', 'Jumlah suku', 'Rerata galat mutlak', 'Rerata galat relatif (%)');
for j = 1:length(n_list)
    fprintf('%8d %22.10g %28.10g\n', n_list(j), ...
        mean_abs_error(j), mean_relative_error_percent(j));
end

fprintf('\nEvaluasi toleransi 1%% berdasarkan rerata galat relatif:\n');
for j = 1:length(n_list)
    if mean_relative_error_percent(j) <= 1
        status = 'MEMENUHI toleransi 1%';
    else
        status = 'TIDAK memenuhi toleransi 1%';
    end
    fprintf('n = %d: %s\n', n_list(j), status);
end


% Grafik perbandingan fungsi eksak dan tiga pendekatan

% Menggunakan renderer gnuplot jika tersedia
graphics_toolkit('gnuplot');

figure;
plot(t, h_exact, 'k-', 'LineWidth', 2);
hold on;

plot(t, h_approx(1,:), 'r--', 'LineWidth', 1.2);
plot(t, h_approx(2,:), 'b-.', 'LineWidth', 1.2);
plot(t, h_approx(3,:), 'g:', 'LineWidth', 1.5);

grid on;
xlabel('t');
ylabel('h(t)');
title('Perbandingan Fungsi Eksak dan Pendekatan Deret Taylor');

legend('Eksak', 'n = 23', 'n = 24', 'n = 25', ...
       'Location', 'northeast');

hold off;
', 'n = 23', 'n = 24', 'n = 25', 'Location', 'best');
hold off;

