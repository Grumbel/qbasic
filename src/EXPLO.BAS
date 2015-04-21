farben = 14
1 CLS
2 INPUT "Geschwindigkeit:", b
5 a = 1: farbe = 4: r = 1
10 SCREEN 9
20 RANDOMIZE TIMER
30 x = INT(RND * 640)
40 y = INT(RND * 350)
50 CIRCLE (x, y), r, farbe
CIRCLE (x, y), r / 2, farben
51 z = z + 1
52 IF z = b THEN z = 0: GOTO 60
53 GOTO 51
60 r = r + a
70 IF r = 50 THEN a = -1: farbe = 0: farben = 4
80 IF r = 0 THEN a = 1: PSET (x, y), 0: farbe = 4: farben = 14: GOTO 30
90 GOTO 50

