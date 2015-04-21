10 SCREEN 12
fa = 8
20 x = INT(640 * RND)
y = INT(480 * RND)
PSET (x, y), fa
z = z + 1
IF z = 500 THEN fa = 7
IF z = 1000 THEN fa = 15
IF z = 1500 THEN GOTO 30
GOTO 20
30 x = 150
y = INT(20 * RND) + 245

a$ = INKEY$
IF STRIG(1) = -1 THEN GOTO 40
IF STRIG(3) = -1 THEN GOTO 50
GOTO 30
40 FOR z = 1 TO 50
LINE (x, y)-(480, 250), 4
LINE (x, y)-(480, 250), 14
LINE (x, y)-(480, 250), 4
NEXT z
LINE (x, y)-(480, 250), 0
GOTO 30
50 x = 480
55 x = x - .1
PSET (x, 250), 14
PSET (x, 251), 14
PSET (x + 1, 250), 0
PSET (x + 1, 251), 0
IF x < 150 THEN PSET (x, 250), 0: PSET (x, 251), 0: GOTO 30
GOTO 55

