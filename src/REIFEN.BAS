10 SCREEN 12
x = 0: w = 180: b = 0
20 CIRCLE (x / 5, 230), 25, , w * (3.141593 / 180), w * (3.141593 / 180)
w = w - 1
REM FOR za = 1 TO 100
REM NEXT za
x = x + 2.2918
IF w <= 0 THEN w = 359
IF x > 640 * 5 THEN x = 0
GOTO 20

