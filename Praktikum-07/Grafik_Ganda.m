% GRAFIK_GANDA.M
% Metode grafik ganda: persamaan dipecah menjadi y1(x) dan y2(x),
% titik perpotongan antara y1 dan y2 = akar.
%   1) 3x^3 - 5x^2 + 4x - 7 = 1   ->  y1 = 3x^3 - 5x^2 + 4x - 7 , y2 = 1
%   2) e^x - x^2 = 0              ->  y1 = e^x                  , y2 = x^2
%   3) log(x+2) + 2x - 3 = 0      ->  y1 = log(x+2)             , y2 = -2x + 3
%      (log di MATLAB/Octave = logaritma natural / ln)

clear; clc; close all;

y1 = {@(x) 3*x.^3 - 5*x.^2 + 4*x - 7, ...
      @(x) exp(x), ...
      @(x) log(x+2)};

y2 = {@(x) ones(size(x)), ...
      @(x) x.^2, ...
      @(x) -2*x + 3};

judul = {'3x^3 - 5x^2 + 4x - 7 = 1', ...
         'e^x - x^2 = 0', ...
         'log(x+2) + 2x - 3 = 0'};

label1 = {'y_1 = 3x^3 - 5x^2 + 4x - 7', 'y_1 = e^x', 'y_1 = log(x+2)'};
label2 = {'y_2 = 1', 'y_2 = x^2', 'y_2 = -2x + 3'};

rentang = {[0 3], [-2 2], [-1.9 3]};

tebakan = {[1 2], [-1 0], [0 2]};

for k = 1:3
  figure(k);
  x = linspace(rentang{k}(1), rentang{k}(2), 500);

  plot(x, y1{k}(x), 'b', x, y2{k}(x), 'r', 'LineWidth', 1.5); hold on;

  xl = xlim; yl = ylim;
  plot(xl, [0 0], 'k');
  plot([0 0], yl, 'k');

  g = @(x) y1{k}(x) - y2{k}(x);
  akar = fzero(g, tebakan{k});
  plot(akar, y1{k}(akar), 'ko', 'MarkerFaceColor', 'g', 'MarkerSize', 8);
  text(akar, y1{k}(akar), sprintf('  Akar \\approx %.4f', akar), ...
       'VerticalAlignment', 'bottom');

  grid on;
  xlabel('x'); ylabel('y');
  title(['Grafik Ganda: ' judul{k}]);
  legend(label1{k}, label2{k}, 'Akar', 'Location', 'best');
  hold off;
end

