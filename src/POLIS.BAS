5 a = 1: b = 1: aa = 1: bb = 1: aaa = 1: bbb = 1
10 SCREEN 9
20 CLS
30 x = INT(RND * 640)
40 y = INT(RND * 350)
50 xx = INT(RND * 640)
60 yy = INT(RND * 350)
70 xxx = INT(RND * 640)
80 yyy = INT(RND * 350)
90 LINE (x, y)-(xx, yy), 1
100 LINE (xx, yy)-(xxx, yyy), 4
110 LINE (xxx, yyy)-(x, y), 10
120 x = x + a: y = y + b
130 xx = xx + aa: yy = yy + bb
140 xxx = xxx + aaa: yyy = yyy + bbb
150 IF x = 640 THEN a = -1
160 IF y = 350 THEN b = -1
170 IF xx = 640 THEN aa = -1
180 IF yy = 350 THEN bb = -1
190 IF xxx = 640 THEN aaa = -1
200 IF yyy = 350 THEN bbb = -1
210 IF x = 0 THEN a = 1
220 IF y = 0 THEN b = 1
230 IF xx = 0 THEN aa = 1
240 IF yy = 0 THEN bb = 1
250 IF xxx = 0 THEN aaa = 1
260 IF yyy = 0 THEN bbb = 1
270 z = z + 1: IF z = 10 THEN CLS : z = 0: REM (z ist der "Verwisch Effekt")
280 GOTO 90

