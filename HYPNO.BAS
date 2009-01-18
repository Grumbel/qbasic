SCREEN 9
pi = 3.141593 / 180: b = 90: fa = 15
10 CIRCLE (320, 150), r, fa, a * pi, b * pi
REM IF fa = 15 THEN fa = 4: GOTO 20
REM IF fa = 4 THEN fa = 15
fa = fa + 1
IF fa >= 15 THEN fa = 1
20 r = r + 3
a = a + 5: b = b + 5
IF r >= 175 THEN r = 0
IF b >= 360 THEN b = 0
IF a >= 360 THEN a = 0
GOTO 10


