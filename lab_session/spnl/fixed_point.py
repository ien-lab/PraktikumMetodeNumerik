import math

# Soal 2: f(x) = cos(x) - x = 0
# Bentuk iterasi: x_(n+1) = g(x_n) = cos(x_n)
# Tebakan awal dipilih x0 = 0.5 (memenuhi 0 < x0 < 1.4).

def g(x):
    return math.cos(x)

def turunan_g(x):
    return -math.sin(x)

def f(x):
    return math.cos(x) - x

if __name__ == "__main__":
    x = 0.5
    toleransi = 0.0001

    nilai_turunan = abs(turunan_g(x))
    print("METODE FIXED-POINT ITERATION")
    print(f"x0 = {x:.6f}")
    print(f"|g'(x0)| = {nilai_turunan:.8f}")

    if nilai_turunan >= 1:
        print("Syarat konvergensi tidak terpenuhi. Iterasi dihentikan.")
    else:
        print("Syarat konvergensi terpenuhi.")
        print(f"{'Iterasi':<9}{'x lama':>14}{'x baru':>14}{'Error':>14}")
        print("-" * 51)

        iterasi = 0
        while True:
            x_baru = g(x)
            error = abs(x_baru - x)
            iterasi += 1
            print(f"{iterasi:<9}{x:>14.8f}{x_baru:>14.8f}{error:>14.8f}")
            x = x_baru
            if error < toleransi:
                break

        print("\nHampiran akar =", f"{x:.10f}")
        print("f(x)          =", f"{f(x):.10f}")
        print("Jumlah iterasi =", iterasi)
