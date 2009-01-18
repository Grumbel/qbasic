10 SCREEN 9
15 x = 330: y = 150: xx = 320: yy = 100: a = .1: b = .1
20 LINE (270, 150)-(370, 150)
30 LINE (320, 100)-(320, 200)
40 PSET (x, y), 4
50 PSET (xx, yy), 4
PSET (x, yy), 14
IF yy >= 200 THEN CLS
60 x = x + a
yy = yy + b
a = a + 1 / a
IF x >= 370 THEN a = -1: x = x - 1
IF x <= 270 THEN a = 1
IF yy <= 100 THEN b = 1
IF yy >= 200 THEN b = -1
GOTO 20


