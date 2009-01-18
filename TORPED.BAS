10 SCREEN 12


fa = 8
11 x = INT(640 * RND)
y = INT(480 * RND)
PSET (x, y), fa
z = z + 1
IF z = 750 THEN fa = 7
IF z = 1500 THEN fa = 15
IF z = 2250 THEN 12
GOTO 11


12

FOR za = 1 TO 10000
NEXT za
20 y = 245' PSET (480, 245)
30 x = x + 1
FOR za = 1 TO 100
NEXT za
PSET (x, 245)
PSET (xx, 245), 0
xx = x
IF x > 480 THEN GOTO 50
GOTO 30
50 CIRCLE (480, 245), r, 4
CIRCLE (480, 245), r / 2, 14
r = r + 1
IF r > 100 THEN x = 0: r = 0: GOTO 60
GOTO 50
60 CIRCLE (480, 245), r, 0
r = r + .5
IF r > 100 THEN r = 0: GOTO 30
GOTO 60

