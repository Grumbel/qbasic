5 z = 1: w = 1: c = -1: d = d - 1
10 SCREEN 9
20 RANDOMIZE TIMER
30 x = INT(640 * RND) + 1
40 y = INT(350 * RND) + 1
50 a = INT(640 * RND) + 1
60 b = INT(350 * RND) + 1
70 x = x + z: y = y + w
80 a = a + c: b = b + d
90 IF a > 639 THEN c = -.9
100 IF a < 1 THEN c = .9
110 IF x > 639 THEN z = -.9
120 IF x < 1 THEN z = .9
130 IF y < 1 THEN w = 1
140 IF y > 349 THEN w = -1
150 IF b > 349 THEN d = -1
160 IF b < 1 THEN d = 1
170 LINE (x, y)-(a, b)
REM FOR e = 1 TO 25
REM NEXT
180 LINE (x, y)-(a, b), 0
PSET (x, y): PSET (a, b)
190 GOTO 70

