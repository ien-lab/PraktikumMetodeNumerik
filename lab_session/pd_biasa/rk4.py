import math

# Soal 1: dy/dx = x * sqrt(y)
# Asumsi nilai awal karena PDF tidak mencantumkannya:
# x0 = 0 dan y0 = 1. Step size h = 0.1, target x = 1.2.

def f(x, y):
    return x * math.sqrt(y)

def metode_rk4(x0, y0, x_target, h):
    x, y = x0, y0
    tabel = []
    i = 0

    while x < x_target - 1e-12:
        k1 = f(x, y)
        k2 = f(x + h/2, y + h*k1/2)
        k3 = f(x + h/2, y + h*k2/2)
        k4 = f(x + h, y + h*k3)
        y_baru = y + (h/6) * (k1 + 2*k2 + 2*k3 + k4)

        tabel.append((i, x, y, k1, k2, k3, k4, y_baru))
        x = round(x + h, 10)
        y = y_baru
        i += 1

    return tabel, y

def solusi_eksak(x):
    return (1 + x**2 / 4)**2

if __name__ == "__main__":
    x0, y0 = 0.0, 1.0
    x_target, h = 1.2, 0.1

    tabel, hasil = metode_rk4(x0, y0, x_target, h)

    print("METODE RUNGE-KUTTA ORDE 4")
    print(f"{'i':<3}{'xi':>7}{'yi':>12}{'k1':>11}{'k2':>11}{'k3':>11}{'k4':>11}{'yi+1':>13}")
    print("-" * 89)
    for i, x, y, k1, k2, k3, k4, yn in tabel:
        print(f"{i:<3}{x:>7.3f}{y:>12.7f}{k1:>11.7f}{k2:>11.7f}{k3:>11.7f}{k4:>11.7f}{yn:>13.9f}")

    eksak = solusi_eksak(x_target)
    galat = abs(eksak - hasil)
    print("\nHasil y(1.2) metode RK4 =", f"{hasil:.10f}")
    print("Solusi eksak             =", f"{eksak:.10f}")
    print("Galat absolut            =", f"{galat:.10f}")
