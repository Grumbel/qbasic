CLS
SCREEN 12
5 x = -500
10 x = x + 5
'x = x + 1
'IF x > 500 THEN END
20 FOR z = 1 TO 10
30 y = x ^ 3 - x - .5
40 yy = 3 * x ^ 2 - 1
50 n = x - (y / yy)
60 'PRINT n; x
70 x = n
80 NEXT z
IF Ergebnis <> n THEN LOCATE 1, 1: PRINT n
Ergebnis = n
PSET (xx, n * 10 + 240)
xx = xx + 1
'COLOR 15: PRINT n; : COLOR 7: PRINT zuf;
GOTO 10

