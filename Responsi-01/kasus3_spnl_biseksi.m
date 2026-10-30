% KASUS 3 - PERSAMAAN NONLINEAR
% Mencari jari-jari bola dari volume bola 300 cm^3 dengan metode biseksi.
% Mengikuti relasi pada soal: tinggi tabung = 2r dan jari-jari tabung = r.
% Volume bagian tabung di luar bola = (2/3)*pi*r^3.

clear; clc; close all;

V_bola = 300;          % cm^3
tol = 1e-8;             % toleransi panjang interval
max_iter = 200;

% Persamaan nonlinear: (4/3)*pi*r^3 - V_bola = 0
f = @(r) (4/3) .* pi .* r.^3 - V_bola;

% Grafik untuk membantu memilih interval awal
r_plot = linspace(0, 6, 500);
figure;
plot(r_plot, f(r_plot), 'b-', 'LineWidth', 1.5); hold on;
plot(r_plot, zeros(size(r_plot)), 'k--');
grid on;
xlabel('Jari-jari r (cm)');
ylabel('f(r)');
title('Grafik Persamaan Nonlinear untuk Menentukan Interval Biseksi');
hold off;

% Interval awal dipilih karena f(4) < 0 dan f(5) > 0
a = 4;
b = 5;

if f(a) * f(b) >= 0
    error('Interval awal harus memenuhi f(a)*f(b) < 0.');
end

fprintf('KASUS 3: METODE BISEKSI\n');
fprintf('%4s %14s %14s %14s %14s %14s\n', ...
    'Iterasi', 'a', 'b', 'c', 'f(c)', 'Panjang interval');

for iter = 1:max_iter
    c = (a + b) / 2;
    fc = f(c);
    interval_length = b - a;

    fprintf('%4d %14.8f %14.8f %14.8f %14.6e %14.6e\n', ...
        iter, a, b, c, fc, interval_length);

    if abs(fc) < tol || interval_length/2 < tol
        break;
    end

    if f(a) * fc < 0
        b = c;
    else
        a = c;
    end
end

r = c;
V_tabung = pi * r^2 * (2*r);
V_luar = V_tabung - V_bola;

fprintf('\nHASIL AKHIR\n');
fprintf('Jari-jari bola dan tabung : %.10f cm\n', r);
fprintf('Volume bola               : %.10f cm^3\n', (4/3)*pi*r^3);
fprintf('Volume tabung              : %.10f cm^3\n', V_tabung);
fprintf('Volume tabung di luar bola : %.10f cm^3\n', V_luar);
fprintf('Jumlah iterasi             : %d\n', iter);
fprintf('Nilai f(r)                 : %.12e\n', f(r));

