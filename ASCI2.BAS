RANDOMIZE TIMER
CLS
yy = 1
FOR z = 1 TO 1840
PRINT CHR$(9);
NEXT z
10 x = INT(80 * RND) + 1
y = INT(23 * RND) + 1
LOCATE y, x: PRINT CHR$(10)
xx = xx + 1
IF xx = 80 THEN xx = 1: yy = yy + 1
IF yy = 24 THEN PRINT a: END
f = SCREEN(yy, xx)
LOCATE yy, xx: COLOR 15: PRINT CHR$(9)
IF f = 10 THEN SOUND 1000, .1: a = a + 1
FOR za = 1 TO 100: NEXT za
GOTO 10

