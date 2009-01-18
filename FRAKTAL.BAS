SCREEN 12
xx = 1: yy = 1
x = -15360
10 y = SIN(x ^ 2)
x = x + .1
IF SGN(y) = -1 THEN col = 4
IF SGN(y) = 1 THEN col = 14
IF SGN(y) = 0 THEN col = 7
xx = xx + 1
IF xx > 639 THEN yy = yy + 1: xx = 0
'LOCATE 1, 1: PRINT x, SGN(y)
IF yy > 480 THEN END

PSET (xx, yy), col

GOTO 10

