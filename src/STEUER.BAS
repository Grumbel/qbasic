10 SCREEN 12
15 a = 5
20 a$ = INKEY$
30 IF a$ = CHR$(0) + "H" OR a$ = "8" THEN y = y - a'oben
40 IF a$ = CHR$(0) + "P" OR a$ = "2" THEN y = y + a'unten
50 IF a$ = CHR$(0) + "K" OR a$ = "4" THEN x = x - a'inks
60 IF a$ = CHR$(0) + "M" OR a$ = "6" THEN x = x + a'rechts
70 IF a$ = "7" THEN y = y - a: x = x - a'links-oben
80 IF a$ = "9" THEN y = y - a: x = x + a'rechts-oben
90 IF a$ = "1" THEN y = y + a: x = x - a'links-unten
100 IF a$ = "3" THEN y = y + a: x = x + a'rechts-unten
PSET (x + 50, y + 50)
GOTO 20

