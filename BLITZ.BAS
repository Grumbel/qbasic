1 SCREEN 9
2 RANDOMIZE TIMER
3 x = INT(RND * 640)
5 aa = RND * 4 - 2
6 ba = RND * 2
7 ca = RND * 4 - 2
8 da = RND * 2
xx = x: yy = y
10 LINE (x, y)-(xx, yy)
xx = x: yy = y
IF g = 0 THEN x = x + aa
20 IF h = 0 THEN y = y + da
30 IF g = 1 THEN x = x - ca
40 IF h = 1 THEN y = y - ba
50 za = za + 1: zr = zr + 1
60 IF zr = 350 THEN GOSUB 110: y = 0: zr = 0: x = INT(RND * 640): CLS
70 IF za = 10 THEN g = 1: GOTO 5
80 IF za = 20 THEN g = 0: za = 0: GOTO 5
90
100 GOTO 10
110 r = r + 1
120 CIRCLE (x, 350), r, 14: CIRCLE (x, 350), r, 14: CIRCLE (x, 350), r, 14: CIRCLE (x, 350), r, 14: CIRCLE (x, 350), r, 14
130 IF r = 50 THEN GOTO 150
140 GOTO 110
150 r = r + 1
160 CIRCLE (x, 350), r, 4
170 IF r = 100 THEN r = 0: RETURN
180 GOTO 150

