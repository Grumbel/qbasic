'*** Mathe-Grumbel V 2.3 (Beta) ***

GOTO 10

'**** HIER die Funktion eingeben!!!! ****
5 'IF x < 0 THEN drawnot = 1: y = 0: GOTO 6
drawnot = 0
y = SIN(x) + .1 * x ^ 2
6
RETURN

10 SCREEN 12

StartBild:
LOCATE 5, 26: COLOR 14: PRINT "*** Mathe-Grumbel V2.3 (Beta) ***": COLOR 15
LOCATE 6, 33: COLOR 4: PRINT "(17.3.96-31.5.96)": COLOR 7
LOCATE 8, 9: PRINT "Dieses Programm wurde erdacht und programmiert von Ingo Ruhnke."
LOCATE 9, 9: PRINT "Mit ihm l„st sich leider nur "; : COLOR 15: PRINT "ein"; : COLOR 7: PRINT " Funktionsgraph darstellen."
LOCATE 10, 9: PRINT "Die Funktion kann jedoch nicht im Programm eingegeben werden,"
LOCATE 11, 9: PRINT "sondern muá im Quellcode ge„ndert werden. Die zu editierende"
LOCATE 12, 9: PRINT "Zeile ist Zeile 5. Als Beispiel steht hier die Funktion:"
LOCATE 13, 9: COLOR 15: PRINT "y = SIN(x) + .1 * x ^ 2": COLOR 7
LOCATE 14, 9: PRINT "Hinter dem "; : COLOR 15: PRINT "y"; : COLOR 7: PRINT " muá die Funktion eingegeben werden."
LOCATE 16, 19: PRINT "Viel Spaá beim arbeiten mit diesem Programm."

blinker:
LOCATE 28, 17: COLOR col: PRINT "Leerrtaste drcken zum starten oder [H] fr Hilfe": COLOR 15
FOR z = 1 TO 10000
z$ = INKEY$
IF z$ = " " OR z$ = CHR$(13) THEN GOTO 12
IF z$ = "h" THEN GOTO Hilfe
NEXT z
IF col = 4 THEN col = 0: GOTO blinker
col = 4
GOTO blinker

Hilfe:
CLS
LOCATE 5, 5: PRINT "Tastatur-Belegung:": COLOR 7
LOCATE 7, 5: COLOR 4: PRINT "Curser-Tasten "; : COLOR 7: PRINT "zum Ausschnitt verschieben"
LOCATE 9, 5: COLOR 4: PRINT "F "; : COLOR 7: PRINT "zum„ndern der Farben"
LOCATE 11, 5: COLOR 4: PRINT "+/- "; : COLOR 7: PRINT "fr den Zoom"
LOCATE 13, 5: COLOR 4: PRINT "Return "; : COLOR 7: PRINT "fr eingabe des Zoom-Faktors"
LOCATE 15, 5: COLOR 4: PRINT "Space "; : COLOR 7: PRINT "fr Eingabe von Koordinaten"
LOCATE 17, 5: COLOR 4: PRINT "H "; : COLOR 7: PRINT "zum Aufrufen dieses Bildschirms"
LOCATE 19, 5: COLOR 4: PRINT "I "; : COLOR 7: PRINT "fr Informationen ber bekannte Bugs"
LOCATE 21, 5: COLOR 4: PRINT "A;S;W;Y "; : COLOR 7: PRINT "zum strecken und stauchen des Graphens (Graph wird extrem ungenau)"
LOCATE 23, 5: COLOR 4: PRINT "Q "; : COLOR 7: PRINT "setzt die Streckfaktoren wieder auf Standard"
LOCATE 25, 5: COLOR 4: PRINT "Shift-Q "; : COLOR 7: PRINT "zum beenden des Programmes"

blinker2:
LOCATE 28, 25: COLOR col: PRINT "Leerrtaste drcken fr Programm start": COLOR 15
FOR z = 1 TO 5000
z$ = INKEY$
IF z$ = " " AND help = 0 THEN GOTO 12
IF z$ = " " AND help = 1 THEN GOTO 126
IF z$ = "h" THEN GOTO Hilfe
IF z$ = "i" THEN GOTO Bug
IF z$ = "Q" THEN END
NEXT z
IF col = 4 THEN col = 0: GOTO blinker2
col = 4
GOTO blinker2

Bug:
CLS
LOCATE 5, 5: COLOR 15: PRINT "bekannte Fehler des Programmes:"
LOCATE 7, 5: COLOR 7: PRINT "-die Koordinaten entsprechen nicht den KO-Koordinaten"
LOCATE 9, 5: PRINT "-die Funktion kann nur im Quellcode eingegeben werden"
LOCATE 11, 5: PRINT "-der Graph l„st sich nicht ausdrucken (oder nur ber Screen-Shots)"
LOCATE 13, 5: PRINT "-kleinere Fehler an den KO-Pfeilen"
LOCATE 15, 5: PRINT "-bei Zoom keine entsprechende KO verschiebung"
LOCATE 17, 5: PRINT "-Division durch 0 ergibt Fehler-Meldung"
LOCATE 19, 5: PRINT "-nicht definierte Rechnungen fhren zum Programm abbruch"
LOCATE 21, 5: PRINT "-Probleme mit Sprungstellen"
'LOCATE 23, 5: PRINT "Die Fehler betreffen jedoch nur den Komfort, nicht aber"
'LOCATE 24, 5: PRINT "die Genauigkeit. (Entweder funktioniert der Graph richtig"
'LOCATE 25, 5: PRINT "oder garnicht)"
blinker3:
LOCATE 28, 25: COLOR col: PRINT "Leerrtaste drcken fr Programm start": COLOR 15
FOR z = 1 TO 5000
z$ = INKEY$
IF z$ = " " AND help = 0 THEN GOTO 12
IF z$ = " " AND help = 1 THEN GOTO 126
IF z$ = "h" THEN GOTO Hilfe
IF z$ = "i" THEN GOTO Bug
IF z$ = "Q" THEN END
NEXT z
IF col = 4 THEN col = 0: GOTO blinker3
col = 4
GOTO blinker3

'Festlegen der Konstanten
12 b = 10: g = 2: fa = 7: faa = 15: stx = 2: sty = 2
15 CLS
20 a = b: d = 0: IF a <= 0 THEN a = .9
24 x = (-320 - e) / a: xx = 0
25 PAINT (1, 1), faaa
LINE (1, 240 + f)-(640, 240 + f), fa
27 LINE (320 + e, 1)-(320 + e, 480), fa

28
IF a > 2 THEN g = 2
IF a <= 2 THEN g = 0

KO:
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

KoPfeile:
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

40 GOSUB 5

ax = (x + (319 + e) / a) * a
ay = ((240 + f) / a - y) * a
IF d = 0 THEN yy = ay: d = 1

IF ay > 480 THEN ay = 480: yy = 480
IF ay < 0 THEN ay = -1

'Zeichnet den Graph
50 IF drawnot = 1 THEN GOTO 60
LINE (ax / stx * 2, ay / sty * 2)-(xx / stx * 2, yy / sty * 2), faa

60 xx = ax: yy = ay
70 IF ax > 640 THEN LOCATE 1, 1: PRINT "Zoomfaktor:"; CINT(a)
80 IF ax > 640 THEN PRINT "Koordinaten:"; -e; f: GOTO 110
100 GOTO 30

'Tastaturabfrage
110 a$ = INKEY$
120 IF a$ = "+" THEN b = b ^ 1.1: GOTO 15
126 IF a$ = CHR$(13) THEN GOTO 150
IF a$ = "h" THEN GOTO Hilfe
IF a$ = "i" THEN GOTO Bug
IF a$ = "Q" THEN END
IF a$ = CHR$(0) + "M" THEN e = e - 10: GOTO 15
IF a$ = CHR$(0) + "K" THEN e = e + 10: GOTO 15
IF a$ = CHR$(0) + "P" THEN f = f - 10: GOTO 15
IF a$ = CHR$(0) + "H" THEN f = f + 10: GOTO 15
IF a$ = "y" THEN sty = sty ^ (1 / 2): GOTO 15
IF a$ = "w" THEN sty = sty ^ 2: GOTO 15
IF a$ = "a" THEN stx = stx ^ (1 / 2): GOTO 15
IF a$ = "s" THEN stx = stx ^ 2: GOTO 15
IF a$ = "q" THEN stx = 2: sty = 2: GOTO 15
IF a$ = " " THEN GOTO 180
IF a$ = "f" THEN GOTO 210
'125 IF b < 5 THEN GOTO 140
130 IF a$ = "-" THEN b = b ^ (1 / 1.1): GOTO 15
140 GOTO 110
145 LOCATE 1, 1
150 tempb = b
INPUT "Zoomfaktor:"; b
IF b = 0 THEN b = tempb
170 GOTO 15
180 INPUT "X-Koordinate:"; e: e = -e
190 INPUT "Y-Koordinate:"; f
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
INPUT "Farbe des Hintergrundes:"; faaa
IF faaa > 15 THEN faaa = 0
IF faa > 15 THEN faa = 15
IF fa > 15 THEN fa = 15
240 GOTO 15

