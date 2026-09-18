%% =========================================================
% 12. GRAFIK GARIS 2D
% =========================================================

disp('=== GRAFIK GARIS 2D ===');

x = 1:25:100;
y = x.^3 + 2*x.^2 - 40*x;

x
y

figure;
plot(x,y);
grid on;
title('Grafik Garis 2D');


%% =========================================================
% 13. GRAFIK GARIS 2D DENGAN INTERVAL 1
% =========================================================

disp('=== GRAFIK GARIS 2D INTERVAL 1 ===');

x = 0:1:100;

y = x.^3 + 2*x.^2 - 40*x;

x
y

figure;
plot(x,y);
grid on;
title('Grafik Garis 2D');


%% =========================================================
% 14. GRAFIK 2D MENGGUNAKAN LINSPACE
% =========================================================

disp('=== GRAFIK 2D LINSPACE ===');

x = linspace(0,20);

y = exp(-x/4).*sin(x);

figure;
plot(x,y);
xlabel('Sumbu X');
ylabel('Sumbu Y');
title('Grafik persamaan f(x) = exp(-x/4) .* sin(x)');
grid on;


%% =========================================================
% 15. GRAFIK 2D DENGAN DUA FUNGSI
% =========================================================

disp('=== GRAFIK 2D DUA FUNGSI ===');

x = 0:0.01:2*pi;

y = -10*sin(2*x) - 8*cos(3*x);

z = 8*sin(6*x) - 6*cos(10*x);

figure;
plot(x,y,x,z);
grid on;
title('Grafik Dua Fungsi');
xlabel('Sumbu X');
ylabel('Sumbu Y');


%% =========================================================
% 16. GRAFIK GARIS 3D - LINE PLOT
% =========================================================

disp('=== GRAFIK GARIS 3D ===');

t = 0:0.1:6*pi;

x = sqrt(t).*sin(2*t);
y = sqrt(t).*cos(2*t);
z = 0.5*t;

figure;
plot3(x,y,z,'k','linewidth',1);
grid on;

xlabel('x');
ylabel('y');
zlabel('z');

title('Grafik Garis 3D');


%% =========================================================
% 17. GRAFIK 3D - MESH PLOT
% =========================================================

disp('=== GRAFIK MESH 3D ===');

x = -7.3:0.5:7.5;
y = x;

[X,Y] = meshgrid(x,y);

R = sqrt(X.^2 + Y.^2);

Z = sin(R)./R;

figure;
mesh(X,Y,Z);

xlabel('x');
ylabel('y');
zlabel('z');

title('Grafik Mesh 3D');


%% =========================================================
% 18. CONTOH MESHGRID
% =========================================================

disp('=== CONTOH MESHGRID ===');

x = [1, 2, 3];
y = [10, 20];

[X,Y] = meshgrid(x,y)

% Koordinat yang terbentuk:
% (1,10) (2,10) (3,10)
% (1,20) (2,20) (3,20)


%% =========================================================
% 19. CONTOUR PLOT 3D
% =========================================================

disp('=== CONTOUR PLOT 3D ===');

x = -3:0.25:3;
y = -3:0.25:3;

[X,Y] = meshgrid(x,y);

Z = 1.8.*(-1.5*sqrt(X.^2 + Y.^2)) ...
    .*cos(0.5*Y).*sin(X);

figure;
contour3(X,Y,Z,15);

xlabel('x');
ylabel('y');
zlabel('z');

title('Grafik Contour Plot 3D');
grid on;


disp(' ');
disp('======================================');
disp('SEMUA PRAKTIKUM SELESAI DIJALANKAN');
disp('======================================');


