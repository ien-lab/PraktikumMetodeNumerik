% GRAFIK_TUNGGAL.M
% Metode grafik tunggal: plot f(x) = 0, titik yang memotong sumbu x = akar.
% Persamaan pada tugas dipindah ruas agar bentuknya f(x) = 0:
%   1) y = 3x^3 - 5x^2 + 4x - 7, y = 1  ->  f(x) = 3x^3 - 5x^2 + 4x - 8
%   2) y = e^x - x^2,            y = 0  ->  f(x) = e^x - x^2
%   3) y = log(x+2) + 2x - 3,    y = 0  ->  f(x) = log(x+2) + 2x - 3
%      (log di MATLAB/Octave = logaritma natural / ln)

clear; clc; close all;

% fungsi f(x) = 0 untuk masing-masing persamaan
f = {@(x) 3*x.^3 - 5*x.^2 + 4*x - 7 - 1, ...
     @(x) exp(x) - x.^2, ...
     @(x) log(x+2) + 2*x - 3};

judul = {'y = 3x^3 - 5x^2 + 4x - 7, dengan y = 1', ...
         'y = e^x - x^2, dengan y = 0', ...
         'y = log(x+2) + 2x - 3, dengan y = 0'};

label = {'f(x) = 3x^3 - 5x^2 + 4x - 8', ...
         'f(x) = e^x - x^2', ...
         'f(x) = log(x+2) + 2x - 3'};

% rentang plot (persamaan 3 hanya terdefinisi untuk x > -2)
rentang = {[0 3], [-2 2], [-1.9 3]};

% selang kecil yang mengapit akar, hanya dipakai untuk menandai titik akar
tebakan = {[1 2], [-1 0], [0 2]};

for k = 1:3
  figure(k);
  x = linspace(rentang{k}(1), rentang{k}(2), 500);
  y = f{k}(x);

  plot(x, y, 'b', 'LineWidth', 1.5); hold on;

  % menggambar sumbu x dan y
  xl = xlim; yl = ylim;
  plot(xl, [0 0], 'k');   % sumbu X
  plot([0 0], yl, 'k');   % sumbu Y

  % menandai titik potong dengan sumbu x (akar)
  akar = fzero(f{k}, tebakan{k});
  plot(akar, 0, 'ro', 'MarkerFaceColor', 'r');
  text(akar, 0, sprintf('  Akar \\approx %.4f', akar), ...
       'VerticalAlignment', 'bottom');

  grid on;
  xlabel('x'); ylabel('y');
  title(['Grafik Tunggal: ' judul{k}]);
  legend(label{k}, 'Location', 'best');
  hold off;
end

