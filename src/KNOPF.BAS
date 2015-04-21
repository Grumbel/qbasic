10 SCREEN 9
PRINT "Knopfdrcken zum starten"
12
IF STRIG(1) = -1 THEN GOTO 15 ELSE GOTO 12
15 t = TIMER
20 b = STRIG(1)
25 IF d = -1 THEN GOTO 45
30 IF b = -1 THEN a = a + 1: d = -1
45 b = STRIG(1)
IF b = 0 THEN d = 0
50 LOCATE 1, 1: PRINT a; TIMER
IF TIMER - t > 3 THEN PRINT a * 20: a = 0: GOTO 12
GOTO 20

