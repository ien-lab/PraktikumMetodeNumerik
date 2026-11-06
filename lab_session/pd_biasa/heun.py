import math

# Soal 1: dy/dx = x * sqrt(y)
# Perkiraan nilai awaal:
# x0 = 0 dan y0 = 1. Step size h = 0.1, target x = 1.2.

def f(x, y):
    return x * math.sqrt(y)

def metode_heun(x0, y0, x_target, h):
    x, y = x0, y0
    tabel = []
    i = 0

    while x < x_target - 1e-12:
        k1 = f(x, y)
        k2 = f(x + h, y + h * k1)
        y_baru = y + (h / 2) * (k1 + k2)

        tabel.append((i, x, y, k1, k2, y_baru))
        x = round(x + h, 10)
        y = y_baru
        i += 1

    return tabel, y

def solusi_eksak(x):
    # Dari dy/dx = x*sqrt(y), dengan y(0)=1:
    # y(x) = (1 + x^2/4)^2
    return (1 + x**2 / 4)**2

if __name__ == "__main__":
    x0, y0 = 0.0, 1.0
    x_target, h = 1.2, 0.1

    tabel, hasil = metode_heun(x0, y0, x_target, h)

    print("METODE RUNGE-KUTTA ORDE 2 (HEUN)")
    print(f"{'i':<3}{'xi':>8}{'yi':>13}{'k1':>13}{'k2':>13}{'yi+1':>13}")
    print("-" * 63)
    for i, x, y, k1, k2, yn in tabel:
        print(f"{i:<3}{x:>8.4f}{y:>13.8f}{k1:>13.8f}{k2:>13.8f}{yn:>13.8f}")

    eksak = solusi_eksak(x_target)
    galat = abs(eksak - hasil)
    print("\nHasil y(1.2) metode Heun =", f"{hasil:.10f}")
    print("Solusi eksak              =", f"{eksak:.10f}")
    print("Galat absolut             =", f"{galat:.10f}")
