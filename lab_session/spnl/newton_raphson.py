import math

# Soal 2: f(x) = cos(x) - x = 0
# f'(x) = -sin(x) - 1
# Tebakan awal dipilih x0 = 0.5 (memenuhi 0 < x0 < 1.4).

def f(x):
    return math.cos(x) - x

def turunan_f(x):
    return -math.sin(x) - 1

if __name__ == "__main__":
    x = 0.5
    toleransi = 0.0001

    print("METODE NEWTON-RAPHSON")
    print(f"{'Iterasi':<9}{'x lama':>14}{'f(x)':>14}{"f'(x)":>14}{'x baru':>14}{'Error':>14}")
    print("-" * 79)

    iterasi = 0
    while True:
        fx = f(x)
        dfx = turunan_f(x)

        if abs(dfx) < 1e-14:
            raise ZeroDivisionError("Turunan mendekati nol; iterasi tidak dapat dilanjutkan.")

        x_baru = x - fx / dfx
        error = abs(x_baru - x)
        iterasi += 1

        print(f"{iterasi:<9}{x:>14.8f}{fx:>14.8f}{dfx:>14.8f}{x_baru:>14.8f}{error:>14.8f}")
        x = x_baru

        if error < toleransi:
            break

    print("\nHampiran akar =", f"{x:.10f}")
    print("f(x)          =", f"{f(x):.10f}")
    print("Jumlah iterasi =", iterasi)
