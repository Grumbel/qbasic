1 RANDOMIZE TIMER
CLS
yy = 1
FOR z = 1 TO 1840
PRINT CHR$(9);
NEXT z
10 x = INT(80 * RND) + 1
y = INT(23 * RND) + 1
LOCATE y, x: PRINT CHR$(11)
Schleife:
a$ = INKEY$
IF a$ = " " THEN GOTO 20
GOTO Schleife


20 xx = xx + 1
IF xx = 81 THEN xx = 1: yy = yy + 1
IF yy = 24 THEN PRINT a: END
f = SCREEN(yy, xx)
LOCATE yy, xx: COLOR 15: PRINT CHR$(9)
IF f = 11 THEN GOTO 30
GOTO 20
30 LOCATE yy, xx: COLOR 14: PRINT CHR$(11): COLOR 7
FOR z = 1 TO 10000
NEXT z

LOCATE yy, xx: PRINT CHR$(11)
FOR z = 1 TO 10000
NEXT z

a$ = INKEY$
IF a$ = " " THEN xx = 0: yy = 0: GOTO 1


GOTO 30

