5 CONST pi = 3.141592654#
10 SCREEN 12
15 RANDOMIZE TIMER
20 x = INT(640 * RND)
30 y = INT(480 * RND)
40 xx = INT(640 * RND)
45 yy = INT(480 * RND)
50 PSET (xx, yy), 14
55 alfa = ATN((yy - y) / (xx + .00001 - x))
56 e = TAN(alfa): IF e < 0 THEN e = -e
60 LOCATE 1, 1: PRINT "Objekt Koordinaten:"; x; y
70 PRINT "Ziel-Koordinaen:"; xx; yy
PRINT "Winkel"; alfa * (180 / pi)
80 IF x > xx THEN m = -1
90 IF x < xx THEN m = 1
100 IF x = xx THEN m = 0
110 IF y > yy THEN n = -e
120 IF y < yy THEN n = e
130 IF y = yy THEN n = 0
140 x = x + m: y = y + n
150 PSET (x, y)
160 IF y + .5 >= yy AND y - .5 <= yy AND x = xx THEN PRINT "Zielerreicht": CLS : GOTO 20
170 GOTO 60


