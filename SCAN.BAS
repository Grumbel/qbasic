10 SCREEN 12
15 fa = 1: a = 1: b = -1: c = -1: d = 1: xx = 639: yy = 479
20 IF fa = 14 THEN fa = 1
LINE (x, y)-(xx, yy), fa
x = x + a: xx = xx + c
IF x = 639 OR x = 0 THEN b = -b: d = -d: GOTO 30
GOTO 20
30  LINE (x, y)-(xx, yy), fa
y = y + b
yy = yy + d
IF y = 479 OR y <= 0 THEN a = -a: c = -c: fa = fa + 1: GOTO 20
GOTO 30

