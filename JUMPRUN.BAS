10 SCREEN 12
x = 320
15 v = 70
20 IF j = 1 THEN GOTO 25 ELSE GOTO 40
25 t = t + .005
30 y = v * t - 5 * t ^ 2
32 yy = v * (t - .005) - 5 * (t - .005) ^ 2
'35 PSET (x, 479 - yy), 0
40 PSET (x, 479 - y)
45 IF y < 0 THEN t = 0: j = 0
a$ = INKEY$
IF a$ = CHR$(0) + "M" THEN x = x + 5
IF a$ = CHR$(0) + "K" THEN x = x - 5
IF a$ = CHR$(0) + "H" THEN j = 1
150 GOTO 20


