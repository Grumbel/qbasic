RANDOMIZE TIMER
SCREEN 9
y = 130: yy = 130
CLS
20 FOR za = 1 TO 10
NEXT za
LINE (x, y)-(xx, yy), fa
xx = x: yy = y
x = x + 2
y = y + 1 * (INT(RND * 3 - 1))
IF x > 640 THEN x = 0: xx = 0: y = 130: yy = 130: GOTO 30
GOTO 20
30 f = INT(5 * RND) + 1
IF f = 1 THEN fa = 1
IF f = 2 THEN fa = 15
IF f = 3 OR f = 4 OR f = 5 THEN fa = 9
GOTO 20

