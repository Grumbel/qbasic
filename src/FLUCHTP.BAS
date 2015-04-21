5 z = 2: v = 2: b1 = 1: b2 = 0
10 RANDOMIZE TIMER
20 SCREEN 9, , b1, b2
40 x = INT(640 * RND)
50 y = INT(350 * RND)
60 x = x + z
70 y = y + v
80 IF x > 640 THEN z = -1
90 IF y > 350 THEN v = -1
100 IF x < 1 THEN z = 1
110 IF y < 1 THEN v = 1
120
LINE (x, y)-(0, 0)
LINE (x, y)-(640, 0)
LINE (x, y)-(0, 350)
LINE (x, y)-(640, 350)
LINE (x, y)-(320, 0)
LINE (x, y)-(320, 350)
LINE (x, y)-(0, 175)
LINE (x, y)-(640, 175)
121 d = d + 1
IF d = 100 THEN d = 0: GOTO 125
GOTO 121
125

SWAP b1, b2
SCREEN 9, , b1, b2
CLS

130 GOTO 60

