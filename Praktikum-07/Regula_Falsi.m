% REGULA_FALSI.M
%
%   1) y = 3x^3 - 5x^2 + 4x - 7, y = 1  ->  f(x) = 3x^3 - 5x^2 + 4x - 8
%   2) y = e^x - x^2,            y = 0  ->  f(x) = e^x - x^2
%   3) y = log(x+2) + 2x - 3,    y = 0  ->  f(x) = log(x+2) + 2x - 3
%      (log di MATLAB/Octave = logaritma natural / ln)

clear; clc;

f = {@(x) 3*x.^3 - 5*x.^2 + 4*x - 7 - 1, ...
     @(x) exp(x) - x.^2, ...
     @(x) log(x+2) + 2*x - 3};

nama = {'3x^3 - 5x^2 + 4x - 7 = 1', ...
        'e^x - x^2 = 0', ...
        'log(x+2) + 2x - 3 = 0'};

batas = [1  2;
        -1  0;
         0  2];

n   = 20;
tol = 1e-4;

for k = 1:3
  fk = f{k};
  a  = batas(k,1);
  b  = batas(k,2);
  fa = fk(a);
  fb = fk(b);

  fprintf('\n========================================================\n');
  fprintf('REGULA-FALSI - Persamaan %d: %s\n', k, nama{k});
  fprintf('Selang awal [%g, %g], n = %d, tol = %g\n', a, b, n, tol);
  fprintf('========================================================\n');

  if fa*fb > 0
    fprintf('Warning: sama tanda.\n');
    continue;
  end

  fprintf('Iter\ta\t\tb\t\tfa\t\tfb\t\tc\t\tfc\t\terror\n');

  c_lama = Inf;
  err = Inf;
  fc = 0;
  iter = 0;

  for i = 1:n

    c = (a*fb - b*fa)/(fb - fa);
    fc = fk(c);
    err = abs(c - c_lama);
    c_lama = c;
    iter = i;

    fprintf('%d\t%f\t%f\t%f\t%f\t%f\t%f\t%f\n', i, a, b, fa, fb, c, fc, err);

    if err <= tol || fc == 0
      break;
    end

    if fa*fc < 0
      b = c;  fb = fc;
    else
      a = c;  fa = fc;
    end
  end

  if err > tol && fc ~= 0
    fprintf('\nPeringatan: toleransi belum tercapai setelah %d iterasi.\n', n);
  end
  fprintf('\nAkar hampiran: c = %.6f  (f(c) = %.6f, iterasi = %d)\n', c, fc, iter);
end

