10 SCREEN 12
x = 320: xx = 320
LINE (320, 480)-(640, 400), 7, BF
LINE (0, 479)-(640, 479), 7
15 v = 70
20 IF j = 1 THEN GOTO 25 ELSE GOTO 35
25 t = t + .005
30 y = v * t - 5 * t ^ 2

35  col = POINT(x, 479 - y): LOCATE 2, 2: PRINT col

PSET (xx, 479 - yy), 0

40 PSET (x, 479 - y)
xx = x: yy = y
       
45 'col = POINT(x, 479 - y): LOCATE 2, 2: PRINT col
IF col = 7 OR y < 0 THEN t = 0: j = 0: BEEP
a$ = INKEY$
IF a$ = CHR$(0) + "M" THEN x = x + 5

IF a$ = CHR$(0) + "K" THEN x = x - 5
IF a$ = CHR$(0) + "H" THEN j = 1
150 GOTO 20

