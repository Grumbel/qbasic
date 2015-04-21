5 INPUT b
10 SCREEN 9
20 CLS
30 x = x + b
40 PSET (x, y), 15
50 IF x > 640 THEN y = y + b: x = 0
60 IF y > 360 THEN y = 0: a = a + 1: CLS
65 IF a = 150 THEN a = 0: GOTO 5
70 GOTO 30

