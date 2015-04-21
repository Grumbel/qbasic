SCREEN 12: CLS : pi = 3.1415923#
WINDOW (-1.2, -.9)-(1.2, .9)
p = 5: DIM t(p)
a = .5

FOR m = 0 TO p
   FOR n = 0 TO 3 ^ m - 1
     
      n1 = n
     
      FOR l = 1 TO m
         t(l) = n1 MOD 3
         n1 = n1 / 3
      NEXT l
     
      x = 0: y = 0
     
      FOR k = 1 TO m
         f = (2 * t(k) * pi) / 3
         x = x + COS(f) * a ^ k
         y = y + SIN(f) * a ^ k
      NEXT k
     
      LINE (x, y)-(x + a ^ k, y)
      LINE (x, y)-(x - .5 * a ^ k, y + SQR(3) / 2 * a ^ k)
      LINE (x, y)-(x - .5 * a ^ k, y - SQR(3) / 2 * a ^ k)

   NEXT n
NEXT m
   a$ = inpt$(1)
END

