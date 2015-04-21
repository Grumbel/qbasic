'*** Mathe-Grumbel V 2.3 Alfa V 1 ***

10 SCREEN 12
12 b = 10: g = 2: fa = 7: faa = 15
15 CLS
20 a = b: d = 0: IF a <= 0 THEN a = .9
24 x = (-320 - e) / a: xx = 0
25 LINE (1, 240 + f + cy)-(640, 240 + f + cy), fa
27 LINE (320 + e + cx, 1)-(320 + e + cx, 480), fa

28
IF a > 1 THEN g = 2
IF a <= 1 THEN g = 0
FOR sx = 320 TO 635 - e STEP 1 * a
LINE (sx + e, 240 + f - g + cy)-(sx + e, 240 + f + g + cy), fa
NEXT sx
FOR sy = 240 TO 475 - f STEP 1 * a
LINE (320 + e + g + cx, sy + f)-(320 + e - g + cx, sy + f), fa
NEXT sy
FOR sx = -320 TO -4 + e STEP 1 * a
LINE (-sx + e, 240 + f - g + cy)-(-sx + e, 240 + f + g + cy), fa
NEXT sx
FOR sy = -240 TO -4 + f STEP 1 * a
LINE (320 + e + g + cx, -sy + f)-(320 + e - g + cx, -sy + f), fa
NEXT sy

LINE (0, 240 + f)-(4, 240 + f - 4), fa
LINE (0, 240 + f)-(4, 240 + f + 4), fa
LINE (4, 240 + f - 4)-(4, 240 + f + 4), fa
PAINT (3, 241 + f), fa: PAINT (3, 239 + f), fa

LINE (635, 240 + f - 4)-(639, 240 + f), fa
LINE (635, 240 + f + 4)-(639, 240 + f), fa
LINE (635, 240 + f - 4)-(635, 240 + f + 4), fa
PAINT (636, 241 + f), fa: PAINT (636, 239 + f), fa

LINE (320 + e, 0)-(320 + e + 4, 4), fa
LINE (320 + e, 0)-(320 + e - 4, 4), fa
LINE (320 + e - 4, 4)-(320 + e + 4, 4), fa
PAINT (321 + e, 2), fa: PAINT (319 + e, 2), fa

LINE (320 + e, 479)-(320 + e + 4, 475), fa
LINE (320 + e, 479)-(320 + e - 4, 475), fa
LINE (320 + e - 4, 475)-(320 + e + 4, 475), fa
PAINT (321 + e, 476), fa: PAINT (319 + e, 476), fa

LOCATE 4, 1: PRINT cx; cy

30 x = x + 1 / a

'**** HIER die Funktion eingeben!!!! ****
40 y = SIN(x) + SIN(x * 10) + SIN(x * 20) + SIN(x * 30)

ax = (x + (319 + e) / a) * a + cx
ay = ((240 + f) / a - y) * a + cy
IF d = 0 THEN yy = ay: d = 1

IF ay > 480 THEN ay = 480: yy = 480
IF ay < 0 THEN ay = -1
50 LINE (ax, ay)-(xx, yy), faa
60 xx = ax: yy = ay
70 IF ax > 640 THEN LOCATE 1, 1: PRINT "Zoomfaktor:"; a
80 IF ax > 640 THEN PRINT "Koordinaten:"; -e; f: GOTO 110
100 GOTO 30
110 a$ = INKEY$
120 IF a$ = "+" THEN b = b + 5: GOTO 15
126 IF a$ = CHR$(13) THEN GOTO 150
IF a$ = CHR$(0) + "M" THEN e = e - 10: GOTO 127
IF a$ = CHR$(0) + "K" THEN e = e + 10: GOTO 127
IF a$ = CHR$(0) + "P" THEN f = f - 10: GOTO 127
IF a$ = CHR$(0) + "H" THEN f = f + 10: GOTO 127

GOTO 128
127
IF e = 0 THEN cx = 0
IF e < 0 THEN cx = -1 * a ^ 2
IF e > 0 THEN cx = 1 * a ^ 2
IF f = 0 THEN cy = 0
IF f > 0 THEN cy = 1 * a ^ 2
IF f < 0 THEN cy = -1 * a ^ 2
GOTO 15

128
IF a$ = " " THEN GOTO 180
IF a$ = "f" THEN GOTO 210
125 IF b < 5 THEN GOTO 140
130 IF a$ = "-" THEN b = b - 5: GOTO 15
140 GOTO 110
145 LOCATE 1, 1
150 INPUT "Zoomfaktor:"; b
170 GOTO 15
180 INPUT "X-Koordinate:"; e: e = -e
190 INPUT "Y-Koordinate:"; f

IF e = 0 THEN cx = 0
IF e < 0 THEN cx = -1 * a
IF e > 0 THEN cx = 1 * a
IF f = 0 THEN cy = 0
IF f > 0 THEN cy = 1 * a
IF f < 0 THEN cy = -1 * a

200 GOTO 15
210 LINE (0, 30)-(110, 300), 0, BF
LINE (0, 287)-(180, 305), 0, BF
LINE (0, 305)-(210, 320), 0, BF
PRINT "0 - Schwarz"
PRINT "1 - Blau"
PRINT "2 - Grn"
PRINT "3 - Cyanblau"
PRINT "4 - Rot"
PRINT "5 - Magenta"
PRINT "6 - Braun"
PRINT "7 - Hellgrau"
PRINT "8 - Grau"
PRINT "9 - Hellblau"
PRINT "10 - Hellgrn"
PRINT "11 - Hellcyan"
PRINT "12 - Hellrot"
PRINT "13 - Pink"
PRINT "14 - Gelb"
PRINT "15 - Weiá"
220 INPUT "Farbe des Graphen:"; faa
230 INPUT "Farbe des KO-Systems:"; fa
IF faa > 15 THEN faa = 15
IF fa > 15 THEN fa = 15
240 GOTO 15

