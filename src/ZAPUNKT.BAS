5 fa = 15
10 SCREEN 9
20 CLS
25 RANDOMIZE TIMER
30 x = INT(RND * 640)
40 y = INT(RND * 360)
50 PSET (x, y), fa
55 za = za + 1: zahl = zahl + 1
56 IF zahl = 1000 THEN fa = INT(RND * 15) + 1: zahl = 0
57 IF za = 200000 THEN CLS : za = 0
60 LOCATE 1, 1: PRINT za
70 GOTO 30





