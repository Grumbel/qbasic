1 CLS
5 farbe = 15: r = 150
10 SCREEN 9
20 RANDOMIZE TIMER
30 x = INT(RND * 640)
40 y = INT(RND * 350)
50 CIRCLE (x, y), r, farbe
51 z = z + 1
IF z = 150 THEN z = 0: GOTO 55
54 GOTO 51
55 CIRCLE (x, y), r, 0
60 r = r - 1
80 IF r = 1 THEN r = 150: GOTO 100
90 GOTO 50
100 FOR ra = 1 TO 150
110 CIRCLE (x, y), ra, 4
CIRCLE (x, y), ra / 2, 14
120 NEXT
PSET (x, y), 0
FOR ra = 1 TO 150
CIRCLE (x, y), ra, 0
NEXT
130 GOTO 30

