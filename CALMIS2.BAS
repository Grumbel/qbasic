CLS
RANDOMIZE TIMER
SCREEN 9
b = 1: y = 175: yy = 175
10 a = a + .5
20 b = 1D+20
y = (a / b) * b - a
LINE (x, y * 1D+17 + 175)-(xx, yy)
xx = x: yy = y * 1D+17 + 175
x = x + .01
IF x > 640 THEN x = 0: xx = 0
IF y <> 0 THEN LOCATE 1, 1: PRINT a;
GOTO 10

