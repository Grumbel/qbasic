10 SCREEN 9
f = 1
15 r = 4
20 xx = x: kk = k
FOR za = 0 TO 15
xx = xx + kk
NEXT za
25 r = r ^ 1.1
x = x + k
y = y + yk
30 CIRCLE (320 - xx + x, 170), r
IF r > 157 THEN r = 4: x = 0: y = 0: GOTO 50
40 GOTO 25
50 r = 4
60 r = r ^ 1.1
x = x + k
y = y + yf
70 CIRCLE (320 - xx + x, 170), r, 0
IF r > 157 THEN r = 4: x = 0: k = k + f: GOTO 20
IF 320 - xx + x < 0 THEN f = -1
IF 320 - xx + x > 640 THEN f = 1
GOTO 60

