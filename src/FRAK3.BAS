SCREEN 12
WINDOW (-.3, -.4)-(1.3, .8)
DIM A(729), B(729)
A(0) = 0
A(1) = 1
B = .1

LINE (0, 0)-(1, 0)
LINE -(1, -B)
LINE -(0, -B)
LINE -(0, 0)

FOR P = 1 TO 6
  
   FOR I = 0 TO 2 ^ P - 1
      B(I) = A(I) / 3
      B(I + 2 ^ P) = 1 - (1 - A(I)) / 3
   NEXT I

   FOR J = 1 TO 2 ^ (P + 1) - 1
      A(J) = B(J)
   NEXT J

   FOR K = 0 TO 2 ^ (P + 1) - 1 STEP 2
      LINE (A(K), B * P)-(A(K + 1), B * P)
      LINE (A(K), B * P)-(A(K), B * P - B)
      LINE (A(K + 1), B * P)-(A(K + 1), B * P - B)
   NEXT K

NEXT P
A$ = INPUT$(1)
END

