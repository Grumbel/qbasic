1 RANDOMIZE TIMER
3 CLS
PRINT "Ziel ist es die weissen Punkte zu zerstîren."
4 PRINT "Der untere Knopf des Joysticks ist Feuer und er obere ist Turbo."
5 PRINT "ACHTUNG! Nicht zu nah an den Rand!"
6 PRINT "DrÅcke Fire fÅr den Beginn."
7 h = STRIG(1)
8 IF h = -1 THEN GOTO 10
9 GOTO 7
10 CLS : SCREEN 9
21 xx = INT(500 * RND) + 70
22 yy = INT(250 * RND) + 50
x = xx: y = yy
23 LINE (xx, yy)-STEP(20, 15), , BF
LINE (xx + 5, yy + 4)-STEP(10, 7), 13, BF
30 LINE (40, 1)-(40, 30), 14
40 LINE (20, 15)-(60, 15), 14
41 gh = gh + 21
50 DIM a(1 TO 10000)
60 GET (1, 1)-(60, 30), a
140 d = STICK(0)
150 f = STICK(1)
160 h = STRIG(5)
170 g = STRIG(1)
ti = ti + .1
171 LOCATE 2, 1: PRINT "Zeit:"; ti
180 IF d < 115 THEN x = x - l
190 IF d > 135 THEN x = x + l
200 IF f < 89 THEN y = y - l
210 IF f > 110 THEN y = y + l
215 l = 2
217 IF h = -1 THEN l = 20
220 IF g = -1 THEN BEEP: GOTO 300
230 PUT (x, y), a
PUT (x + 1, y + 1), a
240 PUT (x, y), a, XOR
PUT (x + 1, y + 1), a, XOR
IF ti > 100 THEN CLS : PRINT "Zeit vorÅber!": GOTO 400
GOTO 250
241 CLS : RANDOMIZE TIMER
LOCATE 1, 1: PRINT "SchÅsse:"; gh
242 xx = INT(500 * RND) + 70
243 yy = INT(250 * RND) + 50
244 LINE (xx, yy)-STEP(19, 15), , BF
LINE (xx + 5, yy + 4)-STEP(10, 7), 13, BF
250 IF b = 400 THEN b = 0
260 IF c = 0 THEN GOTO 280
270 GOTO 140
280 LINE (1, 1)-(60, 30), 0, BF: c = c + 1
290 GOTO 140
300 PUT (x, y), a
PUT (x + 1, y + 1), a
PUT (x, y), a, XOR
PUT (x + 1, y + 1), a, XOR
gh = gh - 1: LOCATE 1, 1: PRINT "SchÅsse:"; gh
IF gh = 0 THEN GOTO 400
p = POINT(x + 39, y + 14)
LINE (1, 350)-(x + 39, y + 14), 14: LINE (50, 350)-(x + 39, y + 14), 14: LINE (640, 350)-(x + 39, y + 14), 14: LINE (590, 350)-(x + 39, y + 14), 14
LINE (1, 350)-(x + 39, y + 14), 0: LINE (50, 350)-(x + 39, y + 14), 0: LINE (640, 350)-(x + 39, y + 14), 0: LINE (590, 350)-(x + 39, y + 14), 0
310 IF p = 15 THEN tr = tr + 1: GOTO 330
IF p = 13 THEN tr = tr + 1: re = re + 1: GOTO 330
IF p = 0 OR 14 THEN SOUND 1000, 4: LINE (xx, yy)-STEP(20, 15), , BF: LINE (xx + 5, yy + 4)-STEP(10, 7), 13, BF: fe = fe + 1
320 GOTO 140
330 FOR r = 1 TO 10
340 CIRCLE (x + 39, y + 14), r, 14
SOUND 1000, .1
350 NEXT r
FOR r = 10 TO 20
CIRCLE (x + 39, y + 14), r, 4
NEXT r
390 GOTO 241
400 CLS : PRINT "FehlschÅsse:"; fe
410 PRINT "Treffer:"; tr
420 PRINT "Zeit:"; ti
lo = fe / 1.5
IF tr = 20 AND ti < 55 AND re = 20 THEN PRINT "Punkte: 150": GOTO 430
IF tr = 20 AND ti < 55 THEN PRINT "Punkte: 125": GOTO 430
IF fe > 18 THEN PRINT "Punkte: 0": GOTO 430
pu = 100 - ti / 2 + tr - fe * lo + re
IF pu < 0 THEN pu = 0
421 PRINT "Punkte:"; pu
430 PRINT "Noch mal (j/n)"
435 b$ = INKEY$
440 IF b$ = "j" THEN RUN
445 IF b$ = "n" THEN END
450 GOTO 435



                  



