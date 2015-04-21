10 SCREEN 9
15 RANDOMIZE TIMER
20 a = INT(4 * RND)
30 IF a = 0 THEN b$ = "r"
40 IF a = 1 THEN b$ = "l"
50 IF a = 2 THEN b$ = "u"
60 IF a = 3 THEN b$ = "d"
70 DRAW b$
80 GOTO 20

