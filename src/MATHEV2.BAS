'*** Mathe-Grumbel V 2.2 ***

10 SCREEN 12

StartBild:
LOCATE 5, 26: COLOR 14: PRINT "*** Mathe-Grumbel V2.3 (Beta) ***": COLOR 15
LOCATE 6, 33: COLOR 4: PRINT "(17.3.96-31.5.96)": COLOR 7
LOCATE 8, 9: PRINT "Dieses Programm wurde erdacht und programmiert von Ingo Ruhnke."
LOCATE 9, 9: PRINT "Mit ihm lÑst sich leider nur "; : COLOR 15: PRINT "ein"; : COLOR 7: PRINT " Funktionsgraph darstellen."
LOCATE 10, 9: PRINT "Die Funktion kann jedoch nicht im Programm eingegeben werden,"
LOCATE 11, 9: PRINT "sondern mu· im Quellcode geÑndert werden. Die zu editierende"
LOCATE 12, 9: PRINT "Zeile ist Zeile 40. Als Beispiel steht hier die Funktion:"
LOCATE 13, 9: COLOR 15: PRINT "y = SIN(x) + SIN(x * 10) + SIN(x * 20) + SIN(x * 30)": COLOR 7
LOCATE 14, 9: PRINT "Hinter dem "; : COLOR 15: PRINT "y"; : COLOR 7: PRINT " mu· die Funktion eingegeben werden."
LOCATE 16, 19: PRINT "Viel Spa· beim arbeiten mit diesem Programm."

blinker:
LOCATE 28, 25: COLOR col: PRINT "Leerrtaste drÅcken oder [H] fÅr Hilfe": COLOR 15
FOR z = 1 TO 10000
z$ = INKEY$
IF z$ = " " THEN GOTO 12
IF z$ = "h" THEN GOTO Hilfe
NEXT z
IF col = 4 THEN col = 0: GOTO blinker
col = 4
GOTO blinker

Hilfe:
CLS
LOCATE 5, 5: PRINT "Tastatur-Belegung:"
LOCATE 7, 5: PRINT "Curser-Tasten zum Ausschnitt verschieben"
LOCATE 8, 5: PRINT "F zumÑndern der Farben"
LOCATE 9, 5: PRINT "+/- fÅr den Zoom"
LOCATE 10, 5: PRINT "Return fÅr eingabe des Zoom-Faktors"
LOCATE 11, 5: PRINT "Leertaste fÅr Eingabe von Koordinaten"

blinker2:
LOCATE 28, 25: COLOR col: PRINT "Leerrtaste drÅcken fÅr Programm start": COLOR 15
FOR z = 1 TO 10000
z$ = INKEY$
IF z$ = " " THEN GOTO 12
IF z$ = "h" THEN GOTO Hilfe
NEXT z
IF col = 4 THEN col = 0: GOTO blinker2
col = 4
GOTO blinker2


12 b = 10: g = 2: fa = 7: faa = 15
15 CLS
20 a = b: d = 0: IF a <= 0 THEN a = .9
24 x = (-320 - e) / a: xx = 0
25 LINE (1, 240 + f)-(640, 240 + f), fa
27 LINE (320 + e, 1)-(320 + e, 480), fa

28
IF a > 1 THEN g = 2
IF a <= 1 THEN g = 0
FOR sx = 320 TO 635 - e STEP 1 * a
LINE (sx + e, 240 + f - g)-(sx + e, 240 + f + g), fa
NEXT sx
FOR sy = 240 TO 475 - f STEP 1 * a
LINE (320 + e + g, sy + f)-(320 + e - g, sy + f), fa
NEXT sy
FOR sx = -320 TO -4 + e STEP 1 * a
LINE (-sx + e, 240 + f - g)-(-sx + e, 240 + f + g), fa
NEXT sx
FOR sy = -240 TO -4 + f STEP 1 * a
LINE (320 + e + g, -sy + f)-(320 + e - g, -sy + f), fa
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

30 x = x + 1 / a



'**** HIER die Funktion eingeben!!!! ****

40 y = SIN(x) + SIN(x * 10) + SIN(x * 20) + SIN(x * 30)



ax = (x + (319 + e) / a) * a
ay = ((240 + f) / a - y) * a
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
IF a$ = CHR$(0) + "M" THEN e = e - 10: GOTO 15
IF a$ = CHR$(0) + "K" THEN e = e + 10: GOTO 15
IF a$ = CHR$(0) + "P" THEN f = f - 10: GOTO 15
IF a$ = CHR$(0) + "H" THEN f = f + 10: GOTO 15
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
200 GOTO 15
210 LINE (0, 30)-(110, 300), 0, BF
LINE (0, 287)-(180, 305), 0, BF
LINE (0, 305)-(210, 320), 0, BF
PRINT "0 - Schwarz"
PRINT "1 - Blau"
PRINT "2 - GrÅn"
PRINT "3 - Cyanblau"
PRINT "4 - Rot"
PRINT "5 - Magenta"
PRINT "6 - Braun"
PRINT "7 - Hellgrau"
PRINT "8 - Grau"
PRINT "9 - Hellblau"
PRINT "10 - HellgrÅn"
PRINT "11 - Hellcyan"
PRINT "12 - Hellrot"
PRINT "13 - Pink"
PRINT "14 - Gelb"
PRINT "15 - Wei·"
220 INPUT "Farbe des Graphen:"; faa
230 INPUT "Farbe des KO-Systems:"; fa
IF faa > 15 THEN faa = 15
IF fa > 15 THEN fa = 15
240 GOTO 15

