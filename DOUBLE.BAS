SCREEN 12
pi = 3.141593 / 180: b = 90: fa = 15
10 CIRCLE (120, 150), r, fa, a * pi, b * pi
'IF fa = 15 THEN fa = 4: GOTO 20
'IF fa = 4 THEN fa = 15
fa = fa + 1
IF fa >= 15 THEN fa = 1
20 r = r + 3
a = a + 5: b = b + 5
IF r >= 175 THEN r = 0: GOTO 30
IF b >= 360 THEN b = 0
IF a >= 360 THEN a = 0
GOTO 10
30 x = 0: y = 75
40 x = x + 1: s = s + .05
a = POINT(x, y)
IF a = 0 THEN GOTO 35
PSET (x + 300 + s / 50, y / 1.5), a
35 IF x > 320 THEN y = y + 1: x = 0
IF y > 350 THEN END
GOTO 40

