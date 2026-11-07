1;
% Soal: dy/dx = (4x^3 - 2x + 1) / (2 + y),  y(0) = 1,  cari y(2) = ...?
% Bentuk dy/dx = f(x,y):
%     f(x,y) = (4x^3 - 2x + 1) / (2 + y)
%
% Solusi eksak (pemisahan variabel):
%     y(x) = -2 + sqrt(2x^4 - 2x^2 + 2x + 9)
%     y(2) = -2 + sqrt(37)

function r = f(x, y)
  r = (4*x^3 - 2*x + 1) / (2 + y);
end

function r = solusi_eksak(x)
  r = -2 + sqrt(2*x^4 - 2*x^2 + 2*x + 9);
end

function [tabel, y] = metode_heun(f, x_awal, y_awal, x_target, N)
  h = (x_target - x_awal) / N;
  x = x_awal; y = y_awal;
  tabel = zeros(N, 7);

  for i = 0:N-1
    k1 = f(x, y);
    y_pred = y + h * k1;                % prediktor (Euler)
    k2 = f(x + h, y_pred);
    y_next = y + (h / 2) * (k1 + k2);   % korektor
    tabel(i+1, :) = [i, x, y, k1, y_pred, k2, y_next];
    x = x + h;
    y = y_next;
  end
  % y terakhir = hasil pendekatan y(x_target)
end

function cetak_tabel(tabel)
  printf('%-3s%-9s%-10s%-9s%-10s%-9s%-10s\n', 'i', 'xi', 'yi', 'k1', 'y_pred', 'k2', 'yi+1');
  printf('%s\n', repmat('.', 1, 60));
  for r = 1:rows(tabel)
    printf('%-3d%-9.4f%-10.4f%-9.4f%-10.4f%-9.4f%-10.4f\n', tabel(r, 1), tabel(r, 2), ...
           tabel(r, 3), tabel(r, 4), tabel(r, 5), tabel(r, 6), tabel(r, 7));
  end
end

% ---------------------------------------------------------------- Program utama
x_awal = 0.0; y_awal = 1.0;
x_target = 2.0;
N = 15;

[tabel, y_heun] = metode_heun(@f, x_awal, y_awal, x_target, N);

printf('     Tabel Iterasi Metode Heun  \n\n');
cetak_tabel(tabel);

y_eksak = solusi_eksak(x_target);
galat_absolut = abs(y_eksak - y_heun);
galat_relatif = galat_absolut / abs(y_eksak) * 100;

printf('\n       Perbandingan Solusi Eksak\n');
printf('Solusi eksak y%.0f = -2 + sqrt(37) = %.4f\n', x_target, y_eksak);
printf('Metode Heun  y%.0f            = %.4f\n', x_target, y_heun);
printf('Galat absolut                      = %.4f\n', galat_absolut);
printf('Galat relatif                      = %.4f%%\n', galat_relatif);
