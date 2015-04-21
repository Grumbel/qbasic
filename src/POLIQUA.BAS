1 RANDOMIZE TIMER
gh = -1: g = 1
5 a = 1: b = 1: aa = 1: bb = 1: aaa = 1: bbb = 1: aaaa = 1: bbbb = 1
10 SCREEN 9
20 CLS
30 x = 400: z = INT(RND * 640)
40 y = 100: z = INT(RND * 350)
50 xx = 300: z = INT(RND * 640)
60 yy = 100: z = INT(RND * 350)
70 xxx = 300: z = INT(RND * 640)
80 yyy = 175: z = INT(RND * 350)
81 ax = 400: z = INT(RND * 640)
82 ay = 175: z = INT(RND * 350)
90 LINE (x, y)-(xx, yy), 1
100 LINE (xx, yy)-(xxx, yyy), 4
110 LINE (xxx, yyy)-(ax, ay), 10
111 LINE (ax, ay)-(x, y), 3
112 d = d + 1
IF d = 50 THEN d = 0: GOTO 113
GOTO 112
113 LINE (x, y)-(xx, yy), 0
114 LINE (xx, yy)-(xxx, yyy), 0
115 LINE (xxx, yyy)-(ax, ay), 0
116 LINE (ax, ay)-(x, y), 0
120 x = x + a: y = y + b
130 xx = xx + aa: yy = yy + bb
140 xxx = xxx + aaa: yyy = yyy + bbb
145 ax = ax + aaaa: ay = ay + bbbb
150 IF x = 640 THEN a = gh
160 IF y = 350 THEN b = gh
170 IF xx = 640 THEN aa = gh
180 IF yy = 350 THEN bb = gh
190 IF xxx = 640 THEN aaa = gh
200 IF yyy = 350 THEN bbb = gh
201 IF ax = 640 THEN aaaa = gh
202 IF ay = 350 THEN bbbb = gh
210 IF x = 0 THEN a = g
220 IF y = 0 THEN b = g
230 IF xx = 0 THEN aa = g
240 IF yy = 0 THEN bb = g
250 IF xxx = 0 THEN aaa = g
260 IF yyy = 0 THEN bbb = g
261 IF ax = 0 THEN aaaa = g
262 IF ay = 0 THEN bbbb = g
280 GOTO 90

