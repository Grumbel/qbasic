'Definitionen
5 RANDOMIZE TIMER
7 x = 10: xx = 10: bxx = 320: byy = 230: first = 1
8 y = 205: yy = 205: k = 1: ax = 614: axx = 614: ay = 230: ayy = 230: b = 1
r = INT(4 * RND)
IF r = 0 THEN n = 1: m = 1
IF r = 1 THEN n = 1: m = -1
IF r = 2 THEN n = -1: m = 1
IF r = 3 THEN n = -1: m = -1
bx = INT(200 * RND) + 220
by = INT(150 * RND) + 160
10 SCREEN 12
20 LINE (100, 100)-STEP(15, 75), , BF
21 LINE (100, 100)-(115, 100), 7
22 LINE (100, 175)-(115, 175), 7
25 CIRCLE (200, 100), 10: PAINT (200, 100)
30 DIM a(1 TO 153)
35 DIM b(154 TO 217)
40 GET (100, 100)-STEP(15, 75), a
41 GET (190, 90)-(210, 110), b
45 CLS

'Playfield
LINE (1, 475)-(640, 475), 7
LINE (1, 16)-(640, 16), 7
LINE (0, 16)-(0, 474), 4
LINE (639, 16)-(639, 474), 4
LINE (320, 16)-(320, 474), 2

'  *** Spiel ***
'-Steuerung und Balken
50 a$ = INKEY$
IF a$ = "y" THEN y = y + 45: k = 1' unten
IF a$ = "a" THEN y = y - 45: k = 1' oben
IF y < 17 THEN y = 17
IF y > 399 THEN y = 399
IF k = 1 THEN PUT (xx, yy), a, XOR
70 IF k = 1 THEN PUT (x, y), a, OR: k = 0
80 xx = x: yy = y

IF a$ = CHR$(0) + "H" THEN ay = ay - 45: b = 1'oben
IF a$ = CHR$(0) + "P" THEN ay = ay + 45: b = 1'unten
IF ay < 17 THEN ay = 17
IF ay > 399 THEN ay = 399
IF b = 1 THEN PUT (axx, ayy), a, XOR
IF b = 1 THEN PUT (ax, ay), a, OR: b = 0
axx = ax: ayy = ay
LOCATE 1, 20: PRINT c$
LOCATE 1, 1: PRINT "Spieler 1:"; playerii: LOCATE 1, 67: PRINT "Spieler 2:"; playeri

'-Ball
90 bx = bx + n
100 by = by + m

'PSET (bx, by)
'PSET (bx + 20, by)
'PSET (bx, by + 20)
'PSET (bx + 20, by + 20)

'Y-Achsen
110 IF POINT(bx, by) = 15 THEN n = -n: SOUND 1000, .5: GOTO 190
120 IF POINT(bx + 20, by) = 15 THEN n = -n: SOUND 1000, .5: GOTO 190
130 IF POINT(bx, by + 20) = 15 THEN n = -n: SOUND 1000, .5: GOTO 190
140 IF POINT(bx + 20, by + 20) = 15 THEN n = -n: SOUND 1000, .5: GOTO 190

'Bumper
150 IF POINT(bx, by) = 7 THEN m = -m: SOUND 1000, .5: GOTO 190
160 IF POINT(bx + 20, by) = 7 THEN m = -m: SOUND 1000, .5: GOTO 190
170 IF POINT(bx, by + 20) = 7 THEN m = -m: SOUND 1000, .5: GOTO 190
180 IF POINT(bx + 20, by + 20) = 7 THEN m = -m: SOUND 1000, .5: GOTO 190

'Aus
181 IF POINT(bx, by) = 4 THEN GOTO 230
182 IF POINT(bx + 20, by) = 4 THEN GOTO 230
183 IF POINT(bx, by + 20) = 4 THEN GOTO 230
184 IF POINT(bx + 20, by + 20) = 4 THEN GOTO 230

IF d = 0 THEN d = 1: GOTO 200
190 PUT (bxx, byy), b, XOR
200 PUT (bx, by), b, XOR
IF first = 1 THEN GOTO 201
GOTO 210
201 SOUND 450, 2
FOR za = 1 TO 10000
NEXT za
SOUND 450, 2
FOR za = 1 TO 10000
NEXT za
SOUND 1000, 3
first = 0
210 bxx = bx: byy = by
220 GOTO 50
230 IF n < 0 THEN playeri = playeri + 1
240 IF n > 0 THEN playerii = playerii + 1
250 FOR s = -1500 TO -450 STEP 10
260 SOUND -s, .1
270 NEXT s
FOR za = 1 TO 100
SOUND 1000 * RND + 300, .2
NEXT za
FOR za = 1 TO 25000
NEXT za
275 x = 10: xx = 10: bx = 320: by = 230: bxx = 320: byy = 230: m = 1: n = 1: b = 1: first = 0
278 y = 205: yy = 205: k = 1: d = 0: first = 1
279 a$ = ""
r = INT(4 * RND)
IF r = 0 THEN n = 1: m = 1
IF r = 1 THEN n = 1: m = -1
IF r = 2 THEN n = -1: m = 1
IF r = 3 THEN n = -1: m = -1
280 GOTO 45






