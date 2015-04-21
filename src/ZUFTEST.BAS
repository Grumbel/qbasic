10m = 0: n = 160: f = 15: l = 1
20 CLS
30 SCREEN 9
40 RANDOMIZE TIMER
50 a = INT(5 * RND) + 1
60 b = INT(5 * RND) + 1
70 c = c + a
80 d = d + b
90 e = c / d
100 FOR gh = 1 TO 50: NEXT
110IF l = 1 THEN l = 0: n = e * 1000 - 840
120LINE (x, e * 1000 - 840)-(m, n), f
130 m = x: n = e * 1000 - 840
140 x = x + 1
150 IF x > 640 THEN f = f - 1: x = 0: m = 0: n = 160: l = 1: CLS
160 IF f = 0 THEN f = 15: c = 0: d = 0: CLS
170 GOTO 40


