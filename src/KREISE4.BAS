1 CLS
5 farbe = 15: r = 30
10 SCREEN 9
20 RANDOMIZE TIMER
30 x = INT(RND * 640)
40 y = INT(RND * 350)
50 CIRCLE (x, y), r, farbe
51 z = z + 1
IF z = 75 THEN z = 0: GOTO 55
54 GOTO 51
55 CIRCLE (x, y), r, 0
60 r = r - 1
80 IF r = 1 THEN GOTO 5
90 GOTO 50

