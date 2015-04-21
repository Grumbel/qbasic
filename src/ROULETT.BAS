10 CLS
SCREEN 12
20 RANDOMIZE TIMER
25 g = 32768: e = 1
30 n = INT(37 * RND)
40 IF n <= 18 AND n > 0 THEN fa = 1
50 IF n > 18 THEN fa = 0
60 IF n = 0 THEN fa = 2
x = v / 25
y = 300 - g / 500
70 IF fa = 0 OR fa = 2 THEN g = g - e: e = e * 2: ve = ve - e: f = f + 1
80 IF fa = 1 THEN g = g + e: ge = ge + e: e = 1: ff = ff + 1


LINE (v / 25, 300 - (g / 500))-(x, y)
IF e > g THEN BEEP

'90 LOCATE 1, 1: PRINT "Guthaben:"; g
'100 LOCATE 2, 1: PRINT "Einsatz:"; e
110 v = v + 1
120 LOCATE 1, 1: PRINT "Versuche:"; v': PRINT "Gewinn:"; ge: PRINT "Verlust:"; ve
130 GOTO 30

