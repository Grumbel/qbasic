10 SCREEN 9
11 x = x + 1
12 IF x = 5000 THEN x = 0: GOTO 15
13 GOTO 11
15 fa = 14
20 CLS
30 a = a + .01
35 b = b + a ^ 2
40 PSET (b, y), 15
50 IF b > 640 THEN b = 0: y = y + 1
60 IF y = 360 THEN GOTO 100
90 GOTO 30
100 x = x + 4
110 CIRCLE (320, 160), x, 4
115 SOUND 1000, .05
116 CIRCLE (320, 160), x / 2, 14
117 IF x > 850 THEN CLS : END
120 GOTO 100






