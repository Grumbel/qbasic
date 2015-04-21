10 SCREEN 12: a = 100
20  vy = 85: yy = 480
30 ry = 480 - y
40 x = x + 1
y = vy * t - .5 * 10 * t ^ 2
t = t + .1
LINE (x, ry)-(xx, yy)
xx = x: yy = ry
REM SOUND ry * 10, .1
FOR za = 1 TO a
NEXT za
IF ry > 480 THEN vy = vy - 5: t = 0: SOUND 1000, .2
IF x > 640 THEN t = 0: x = 0: y = 0: xx = 0: CLS : a = a / 2: GOTO 20
LOCATE 1, 1: PRINT a
GOTO 30

