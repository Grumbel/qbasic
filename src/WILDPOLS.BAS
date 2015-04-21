5 a = 1: b = 1: aa = 1: bb = 1: aaa = 1: bbb = 1
10 SCREEN 12
20 CLS
30 x = INT(RND * 640)
40 y = INT(RND * 480)
50 xx = INT(RND * 640)
60 yy = INT(RND * 480)
70 xxx = INT(RND * 640)
80 yyy = INT(RND * 480)
90 LINE (x, y)-(xx, yy), 1
100 LINE (xx, yy)-(xxx, yyy), 4
110 LINE (xxx, yyy)-(x, y), 10
120 x = x + a: y = y + b
130 xx = xx + aa: yy = yy + bb
140 xxx = xxx + aaa: yyy = yyy + bbb
150 IF x >= 640 THEN a = INT(RND * 5) - 5
160 IF y >= 480 THEN b = INT(RND * 5) - 5
170 IF xx >= 640 THEN aa = INT(RND * 5) - 5
180 IF yy >= 480 THEN bb = INT(RND * 5) - 5
190 IF xxx >= 480 THEN aaa = INT(RND * 5) - 5
200 IF yyy >= 480 THEN bbb = INT(RND * 5) - 5
210 IF x <= 0 THEN a = INT(RND * 5)
220 IF y <= 0 THEN b = INT(RND * 5)
230 IF xx <= 0 THEN aa = INT(RND * 5)
240 IF yy <= 0 THEN bb = INT(RND * 5)
250 IF xxx <= 0 THEN aaa = INT(RND * 5)
260 IF yyy <= 0 THEN bbb = INT(RND * 5)
270 z = z + 1: IF z = 15 THEN CLS : z = 0: REM (z ist der "Verwisch Effekt")
280 GOTO 90

