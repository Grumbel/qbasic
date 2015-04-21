'*** Mathe ***

10 SCREEN 12
12 b = 10
15 CLS
20 a = b: IF a <= 0 THEN a = 1
24 x = -320 / a: xx = -320
25 LINE (1, 240)-(640, 240), 8
27 LINE (320, 1)-(320, 480), 8
28 FOR sx = 320 TO 640 STEP 1 * a
PSET (sx, 240), 7
NEXT sx
FOR sy = 240 TO 480 STEP 1 * a
PSET (320, sy), 7
NEXT sy
FOR sx = -320 TO 0 STEP 1 * a
PSET (-sx, 240), 7
NEXT sx
FOR sy = -240 TO 0 STEP 1 * a
PSET (320, -sy), 7
NEXT sy
30 x = x + 1 / a

'**** HIER die Funktion eingeben!!!! ****
40 y = (SIN(x * 5) ^ 3 * x ^ 2) / 50

IF d = 0 THEN yy = y: d = 1
ax = (x + 319 / a) * a
ay = (240 / a - y) * a
IF ay > 480 THEN ay = 480: yy = 480
IF ay < 0 THEN ay = -1
50 LINE (ax, ay)-(xx, yy)
60 xx = ax: yy = ay
70 IF ax > 640 THEN LOCATE 1, 1: PRINT "Zoomfaktor:"; a: GOTO 110
100 GOTO 30
110 a$ = INKEY$
120 IF a$ = "+" THEN b = b + 5: GOTO 15
126 IF a$ = " " THEN GOTO 150
125 IF b < 5 THEN GOTO 140
130 IF a$ = "-" THEN b = b - 5: GOTO 15
140 GOTO 110
145 LOCATE 1, 1
150 INPUT "Zoomfaktor:"; b
170 GOTO 15


