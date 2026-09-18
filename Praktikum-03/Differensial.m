%% =========================================================
% 6. DIFFERENSIAL
% =========================================================

disp('=== DIFFERENSIAL ===');

% Membutuhkan Symbolic Package
% Jika belum aktif, jalankan:
% pkg load symbolic

syms x

f = input('Masukkan bentuk persamaan f(x) = ');

f_asli = sym(f)

f_turunan = diff(f_asli, 'x')
