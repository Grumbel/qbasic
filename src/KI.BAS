RANDOMIZE TIMER
10 SCREEN 12

15 'Startwerte fr Gitter
20 x = 150: y = 100: g = 1

30 'Programm zur Gitter-Erstellung
40 x = x + g
50 IF x >= 490 THEN x = 150: y = y + g
60 IF y >= 320 THEN GOTO 110
70 a = INT(2 * RND)
80 IF a = 0 THEN fa = 8 ELSE fa = 0
90 PSET (x, y), fa
100 GOTO 40

110 'Startwerte fr KI
120 x = 150: y = 211

130 'Programmteil fr Knstliche Intelligenz
140 PSET (x, y)
150 aa = POINT(x + g, y - g)
160 ab = POINT(x + g, y)
170 ac = POINT(x + g, y + g)
175 IF x > 489 - g THEN x = 150: y = 211: GOTO 140
180 IF ab = 0 THEN x = x + g: GOTO 140
190 IF aa > fa AND ab > fa AND ac = 0 THEN y = y + g: x = x + g: GOTO 140
200 IF aa = 0 AND ab > fa AND ac > fa THEN y = y - g: x = x + g: GOTO 140
210 IF ab = 0 THEN x = x + g: GOTO 140
220 IF aa = 0 AND ab > fa AND ac = 0 THEN a = INT(2 * RND): b = 1
230 IF b = 1 AND a = 0 THEN y = y - g: x = x + g: GOTO 140
240 IF b = 1 AND a = 1 THEN y = y + g: x = x + g: GOTO 140
250 IF a = 0 THEN y = y + g ELSE y = y - g: x = x + g: GOTO 140
260 IF aa > fa AND ab > fa AND ac > fa THEN b = INT(2 * RND): c = 1
270 IF b = 1 THEN b = -1 ELSE b = 1
280 y = y + 2 * b * g: BEEP
GOTO 140











