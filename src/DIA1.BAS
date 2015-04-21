10 SCREEN 9: CLS
11 DRAW "c0m1,175"
15 RANDOMIZE TIMER
20 a = INT(4 * RND)
21 c$ = "r"
22 d = d + 1
23 IF d = 1250 THEN d = 0: GOTO 10
30 IF a = 0 THEN b$ = "l"
40 IF a = 1 THEN b$ = "l"
50 IF a = 2 THEN b$ = "uu"
60 IF a = 3 THEN b$ = "dd"
70 DRAW "c15" + b$ + c$
71 g = g + 1: IF g = 50 THEN d = 1
75 IF d = 1249 THEN GOTO 90
80 GOTO 20
90 ab = ab + 1
100 IF ab = 1000 THEN ab = 0: GOTO 20
110 GOTO 90

