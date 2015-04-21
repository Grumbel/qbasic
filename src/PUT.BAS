10 SCREEN 12
RANDOMIZE TIMER
LINE (100, 10)-(100, 90)
LINE (60, 50)-(140, 50)
DIM a(1 TO 2000)
GET (60, 20)-(140, 90), a
LINE (60, 20)-(140, 90), bf
100 PSET (x, y), 4
PUT (xx, yy), a, XOR
x = INT(100 * RND) + 220
y = INT(100 * RND) + 220

PUT (x, y), a, XOR
PSET (x, y), 14
xx = x: yy = y

GOTO 100

fa = 8: a = 750
20 x = INT(640 * RND)
y = INT(230 * RND)
PSET (x, y), fa
z = z + 1
IF z = a THEN fa = 7
IF z = 2 * a THEN fa = 15
IF z = 3 * a THEN GOTO 30
GOTO 20
30 LINE (0, 230)-(640, 480), 7, BF
40 LINE (10, 240)-(630, 470), 0, BF
GOTO 40

