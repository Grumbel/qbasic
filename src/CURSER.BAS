2 CLS
3 x = 10: y = 10: b = 176: a = 219
10 LOCATE y, x: COLOR 15: PRINT CHR$(b)
15 IF a$ = "4" THEN x = x - 1
20 IF a$ = "6" THEN x = x + 1
30 IF a$ = "8" THEN y = y - 1
40 IF a$ = "2" THEN y = y + 1
50 IF a$ = "7" THEN x = x - 1: y = y - 1
60 IF a$ = "9" THEN x = x + 1: y = y - 1
70 IF a$ = "1" THEN x = x - 1: y = y + 1
80 IF a$ = "3" THEN x = x + 1: y = y + 1
90 IF a$ = "5" AND a = 219 THEN a = 178: b = 177: GOTO 110
100 IF a$ = "5" AND a = 178 THEN a = 219: b = 176
IF a$ = CHR$(0) + "K" THEN x = x - 1 'links
IF a$ = CHR$(0) + "P" THEN y = y + 1 'unten
IF a$ = CHR$(0) + "H" THEN y = y - 1 'rechts
IF a$ = CHR$(0) + "M" THEN x = x + 1 'oben
110 LOCATE 2, 1: PRINT a; b
IF x = 4 THEN x = 5
IF x = 76 THEN x = 75
IF y = 24 THEN y = 23
IF y = 2 THEN y = 3
LOCATE 1, 1: PRINT x, y
LOCATE y, x: COLOR 14: PRINT CHR$(a)
a$ = INKEY$
GOTO 10

