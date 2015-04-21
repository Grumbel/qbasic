SCREEN 12
z = 20
xx = 1: yy = 1
x = -15360 / z
10 y = SIN(x ^ 2)
x = x + .2 / z
IF SGN(y) = -1 THEN col = 4
IF SGN(y) = 1 THEN col = 14
IF SGN(y) = 0 THEN col = 7
xx = xx + 1
'LOCATE 20, 50: PRINT x
IF xx > 538 THEN GOTO 20

'LOCATE 1, 1: PRINT x, SGN(y)
15
IF yy > 480 THEN z = z + 5

PSET (xx, yy), col

GOTO 10

20


IF xx > 538 * (z / 10) THEN yy = yy + 1: xx = 0: GOTO 15
x = x + .2 / z
xx = xx + 1

GOTO 20

