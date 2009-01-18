10 SCREEN 9
xx = 130: yy = 88: fa = 15
20 x = STICK(0)
30 y = STICK(1)
LINE (x + 190, y + 80)-(xx + 190, yy + 80), fa
IF STRIG(1) = -1 THEN fa = 4
IF STRIG(5) = -1 THEN fa = 0
IF STRIG(1) = 0 AND STRIG(5) = 0 THEN fa = 15
xx = x: yy = y
a$ = INKEY$
IF a$ = "c" THEN CLS : SOUND 1000, 1: xx = 130: yy = 88
GOTO 20

