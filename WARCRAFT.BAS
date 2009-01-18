RANDOMIZE TIMER
5 CLS
10 LOCATE 1, 1: COLOR 15, 0: PRINT "Orcs:"; : COLOR 7, 0: PRINT orcs
20 COLOR 15, 0: PRINT "Menschen:"; : COLOR 7, 0: PRINT hum
25 IF orcs - hum > 0 THEN PRINT "Orcs       "
27 IF orcs - hum < 0 THEN PRINT "Menschen   "
28 IF orcs - hum = 0 THEN PRINT "Gleichstand"
30 t = t + 1
40 orcs = orcs + INT(3 * RND)
50 hum = hum + INT(3 * RND)
60 IF t = INT(80 * RND) + 20 THEN orcs = orcs - INT(hum * RND) + 20: hum = hum - INT(orcs * RND) + 20
GOTO 10
FOR za = 1 TO 1000
NEXT za
70 GOTO 10

