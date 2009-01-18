SCREEN 9
10 x = x + .02
20  xx = x: yy = y
y = SIN(x) * 50
REM 30 LOCATE y, x / 10: PRINT "Hallo"
IF x > 12.8 THEN x = 0: CLS : xx = 0
ly = CLNG((y + 150) / 19): lx = CLNG((x * 50) / 8)
LOCATE ly + 2, lx + 2: PRINT "H"
IF x > 12 THEN x = 0: CLS
GOTO 10

