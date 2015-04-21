10 SCREEN 9
RANDOMIZE TIMER
20 a = INT(4 * RND)
30 IF a = 0 THEN b$ = "rrr"
40 IF a = 1 THEN b$ = "lll"
50 IF a = 2 THEN b$ = "uuu"
60 IF a = 3 THEN b$ = "ddd"
x = x + 1
IF x = 100 THEN x = 0: GOTO 100
DRAW "c14" + b$
GOTO 20
100 RANDOMIZE TIMER
a = INT(4 * RND)
IF a = 0 THEN b$ = "rrr"
IF a = 1 THEN b$ = "lll"
IF a = 2 THEN b$ = "uuu"
IF a = 3 THEN b$ = "ddd"
DRAW "c2" + b$
x = x + 1
IF x = 100 THEN x = 0: GOTO 200
GOTO 100
200 a = INT(4 * RND)
IF a = 0 THEN b$ = "rrr"
IF a = 1 THEN b$ = "lll"
IF a = 2 THEN b$ = "uuu"
IF a = 3 THEN b$ = "ddd"
DRAW "c4" + b$
x = x + 1
IF x = 100 THEN x = 0: GOTO 300
GOTO 200
300 a = INT(4 * RND)
IF a = 0 THEN b$ = "rrr"
IF a = 1 THEN b$ = "lll"
IF a = 2 THEN b$ = "uuu"
IF a = 3 THEN b$ = "ddd"
DRAW "c3" + b$
x = x + 1
IF x = 100 THEN x = 0: GOTO 500
GOTO 300
500 a = INT(4 * RND)
IF a = 0 THEN b$ = "rrr"
IF a = 1 THEN b$ = "lll"
IF a = 2 THEN b$ = "uuu"
IF a = 3 THEN b$ = "ddd"
DRAW "c1" + b$
x = x + 1
IF x = 100 THEN x = 0: GOTO 20
GOTO 500

