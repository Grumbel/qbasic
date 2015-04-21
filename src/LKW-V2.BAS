1 CLS
2 PRINT "Der untere Knopf des Joysticks ist fire und er obere ist turbo."
3 PRINT "DrÅcke Space fÅr den Beginn."
4 a$ = INKEY$
5 IF a$ = " " THEN GOTO 10
6 GOTO 4
10 CLS
20 SCREEN 9
30 x = 320: y = 175
40 LINE (40, 130)-(180, 260), 1, BF: LINE (40, 130)-(110, 180), , BF: REM FÅhrerhaus
50 LINE (180, 100)-(570, 240), 9, BF: REM Plane
60 LINE (180, 260)-(570, 240), 7, BF: REM AnhÑnger
70 CIRCLE (100, 250), 40, 8: PAINT (100, 251), 8: PAINT (100, 260), 8: CIRCLE (100, 250), 20, 7: PAINT (100, 250), 7: REM Reifen links"
80 CIRCLE (460, 250), 40, 8: PAINT (460, 250), 8: PAINT (460, 240), 8: PAINT (460, 260), 8: CIRCLE (460, 250), 20, 7: PAINT (460, 250), 7
90 LINE (40, 1)-(40, 30), 13
100 LINE (20, 15)-(60, 15), 13
110 DIM a(1 TO 10000)
120 GET (1, 1)-(60, 30), a
130 e = STICK(0)
140 d = STICK(0)
150 f = STICK(1)
160 h = STRIG(1)
170 g = STRIG(5)
180 IF d < 10 THEN x = x - l
190 IF d > 100 THEN x = x + l
200 IF f < 10 THEN y = y - l
210 IF f > 100 THEN y = y + l
205 l = 1
220 IF g = -1 THEN GOTO 300
225 IF h = -1 THEN l = 10
230 PUT (x, y), a
240 PUT (x, y), a, XOR
250 IF b = 400 THEN b = 0
260 IF c = 0 THEN GOTO 280
270 GOTO 130
280 LINE (1, 1)-(60, 30), 0, BF: c = c + 1
290 GOTO 130
300 FOR w = 1 TO 3
310 CIRCLE (x + 39, y + 14), w, 4
320 NEXT w
330 w = w - 1
340 CIRCLE (x + 39, y + 14), w, 0
350 IF w = 0 THEN BEEP: GOTO 130
360 GOTO 330



