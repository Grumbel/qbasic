10 SCREEN 9
x = 320: y = 120
20 PSET (x + 2, y + 2): PSET (x, y), 1
f = f + 1
LOCATE 1, 1: PRINT f
30 IF a$ = "links" THEN x = x - 1
IF a$ = "rechts" THEN x = x + 1
IF a$ = "unten" THEN y = y + 1
IF a$ = "oben" THEN y = y - 1
gf = gf + 1
PRINT a; b
IF gf = 5 THEN gf = 0
IF gf = 4 THEN a = STICK(0): b = STICK(1)
IF a < 7 AND a > 3 THEN a$ = "links"
IF a > 218 AND a < 222 THEN a$ = "rechts"
IF b = 4 THEN a$ = "oben"
IF b = 218 THEN a$ = "unten"
IF POINT(x, y) = 15 THEN PRINT "GAME OVER": END
40 GOTO 20

