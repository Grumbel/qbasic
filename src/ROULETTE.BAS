5 RANDOMIZE TIMER
CLS
INPUT "Versuche ?", g
10 a = INT(37 * RND)
PRINT a;
IF a < 19 AND a > 0 THEN r = r + 1
IF a > 18 THEN b = b + 1
IF a = 0 THEN o = o + 1
z = z + 1
IF z = g THEN z = 0: GOTO 100
GOTO 10
100 CLS
COLOR 4: PRINT "Rot:"; r
COLOR 1: PRINT "Blau:"; b
COLOR 7: PRINT "Null:"; o
INPUT "Nochmal [j/n] ?", h$
IF h$ = "j" THEN GOTO 5 ELSE END




