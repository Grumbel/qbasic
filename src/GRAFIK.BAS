RANDOMIZE TIMER
bb = 1: aa = 2
10 SCREEN 9
20 a = a + 1
30 IF a = 45000 THEN a = aa: b = bb: GOTO 50
40 GOTO 20
50 x = INT(640 * RND)
60 y = INT(350 * RND)
70 x = x + a
80 y = y + b
90 IF y >= 349 THEN b = -bb
100 IF x >= 640 THEN a = -aa
110 IF y <= 0 THEN b = bb
120 IF x <= 0 THEN a = aa
130 CIRCLE (x, y), 10
140 PAINT (x, y), 15
150 z = z + 1
160 IF z = 100 THEN z = 0: GOTO 180
170 GOTO 150
180 PAINT (x, y), 0
210 IF c = 0 THEN GOTO 220
220 d = d + 1
230 xx = INT(640 * RND)
235 yy = INT(350 * RND)
240 GOTO 50

