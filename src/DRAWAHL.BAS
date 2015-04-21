1 SCREEN 9
INPUT "Geben sie die l„nge der Farben an: ", la
CLS
RANDOMIZE TIMER
20 a = INT(4 * RND)
30 IF a = 0 THEN b$ = "r"
40 IF a = 1 THEN b$ = "l"
50 IF a = 2 THEN b$ = "u"
60 IF a = 3 THEN b$ = "d"
x = x + 1
IF x = la THEN x = 0: GOTO 100
DRAW "c14" + b$
GOTO 20
100 RANDOMIZE TIMER
a = INT(4 * RND)
IF a = 0 THEN b$ = "r"
IF a = 1 THEN b$ = "l"
IF a = 2 THEN b$ = "u"
IF a = 3 THEN b$ = "d"
DRAW "c2" + b$
x = x + 1
IF x = la THEN x = 0: GOTO 200
GOTO 100
200 a = INT(4 * RND)
IF a = 0 THEN b$ = "r"
IF a = 1 THEN b$ = "l"
IF a = 2 THEN b$ = "u"
IF a = 3 THEN b$ = "d"
DRAW "c4" + b$
x = x + 1
IF x = la THEN x = 0: GOTO 300
GOTO 200
300 a = INT(4 * RND)
IF a = 0 THEN b$ = "r"
IF a = 1 THEN b$ = "l"
IF a = 2 THEN b$ = "u"
IF a = 3 THEN b$ = "d"
DRAW "c3" + b$
x = x + 1
IF x = la THEN x = 0: GOTO 500
GOTO 300
500 a = INT(4 * RND)
IF a = 0 THEN b$ = "r"
IF a = 1 THEN b$ = "l"
IF a = 2 THEN b$ = "u"
IF a = 3 THEN b$ = "d"
DRAW "c1" + b$
x = x + 1
IF x = la THEN x = 0: GOTO 20
GOTO 500

