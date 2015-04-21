'*** Mathe-Grumbel V 2.45 (Beta) ***
GOTO 10
grf = 0

'**** HIER die Funktion eingeben!!!! ****
5 y = x ^ 3
RETURN

6 y = x ^ 2
RETURN
10 SCREEN 12

StartBild:
LOCATE 5, 26: COLOR 14: PRINT "*** Mathe-Grumbel V2.45 (Beta) ***": COLOR 15
LOCATE 6, 33: COLOR 4: PRINT "(17.3.96-31.5.96)": COLOR 7
LOCATE 8, 9: PRINT "Dieses Programm wurde erdacht und programmiert von Ingo Ruhnke."
'LOCATE 9, 9: PRINT "Mit ihm l„st sich leider nur "; : COLOR 15: PRINT "ein"; : COLOR 7: PRINT " Funktionsgraph darstellen."
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
LOCATE 1, 5: PRINT "Tastatur-Belegung:": COLOR 7
LOCATE 3, 5: COLOR 4: PRINT "Curser-Tasten "; : COLOR 7: PRINT "zum Ausschnitt verschieben"
LOCATE 4, 5: COLOR 4: PRINT "F "; : COLOR 7: PRINT "zum„ndern der Farben"
LOCATE 5, 5: COLOR 4: PRINT "+/- "; : COLOR 7: PRINT "fr den Zoom"
LOCATE 6, 5: COLOR 4: PRINT "Return "; : COLOR 7: PRINT "fr eingabe des Zoom-Faktors"
LOCATE 7, 5: COLOR 4: PRINT "Space "; : COLOR 7: PRINT "fr Eingabe von Koordinaten"
LOCATE 8, 5: COLOR 4: PRINT "H "; : COLOR 7: PRINT "zum Aufrufen dieses Bildschirms"
LOCATE 9, 5: COLOR 4: PRINT "I "; : COLOR 7: PRINT "fr Informationen ber bekannte Bugs"
LOCATE 10, 5: COLOR 4: PRINT "A;S;W;Y "; : COLOR 7: PRINT "zum strecken und stauchen des Graphens (Graph wird ungenau)"
LOCATE 11, 5: COLOR 4: PRINT "Q "; : COLOR 7: PRINT "setzt die Streckfaktoren wieder auf Standard"
LOCATE 12, 5: COLOR 4: PRINT "E "; : COLOR 7: PRINT "eingeben der Streckwerte"
LOCATE 13, 5: COLOR 4: PRINT "Bild rauf "; : COLOR 7: PRINT "zum neu zeichnen des Graphen"
LOCATE 14, 5: COLOR 4: PRINT "G "; : COLOR 7: PRINT "zum ein-/ausblenden eines Gitters"
LOCATE 15, 5: COLOR 4: PRINT "Bild runter "; : COLOR 7: PRINT "Graph aus-/einschalten"
LOCATE 16, 5: COLOR 4: PRINT "POS 1 "; : COLOR 7: PRINT "Schrift ein-/ausblenden"
LOCATE 17, 5: COLOR 4: PRINT "Einfg "; : COLOR 7: PRINT "Genauigkeit eingeben"
LOCATE 19, 5: COLOR 4: PRINT "Shift-Q "; : COLOR 7: PRINT "zum beenden des Programmes"

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
12 b = 10: g = 2: fa = 7: faa = 15: stx = 1: sty = 1
genauigkeit = 1
15 CLS
IF b > 32768 THEN b = 32760
 PAINT (320, 240), faaa
20 a = b: d = 0: IF a <= 0 THEN a = .9
24 x = (-320 - e) / a * stx: xx = 0

28
IF grf > 0 THEN GOTO 30
IF a < 2 THEN GOTO KoLine
IF ge = 0 THEN GOTO Ko

Gitter:
FOR sx = 320 TO 635 - e STEP 1 * a
LINE (sx + e, 0)-(sx + e, 480), 8
NEXT sx
FOR sy = 240 TO 475 - f STEP 1 * a
LINE (0, sy + f)-(640, sy + f), 8
NEXT sy
FOR sx = -320 TO -4 + e STEP 1 * a
LINE (-sx + e, 0)-(-sx + e, 480), 8
NEXT sx
FOR sy = -240 TO -4 + f STEP 1 * a
LINE (0, -sy + f)-(640, -sy + f), 8
NEXT sy

Ko:
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
GOTO KoLine

KoLine:
LINE (1, 240 + f)-(640, 240 + f), fa
LINE (320 + e, 1)-(320 + e, 480), fa

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

30 IF schrift = 0 THEN LINE (0, 0)-(10, 10), 4, BF
35 'IF grf = 0 THEN schrift = 1
IF drawnot = 1 THEN ax = 645: GOTO 60
x = x + (genauigkeit / a) * stx

'LOCATE 27, 1: PRINT "                 "
'PRINT "                 "
'LOCATE 27, 1: PRINT "X:"; x
'PRINT "Y:"; y

40 IF grf = 0 THEN GOSUB 5
IF grf = 1 THEN GOSUB 6

ax = ((x / stx) + (319 + e) / a) * a
ay = ((240 + f) / a - (y / sty)) * a
IF d = 0 THEN yy = ay: d = 1

IF ay > 500 OR yy > 500 THEN ay = 500: yy = 500'verhindert šberlauf
IF ay < 0 THEN ay = -1

'Zeichnet den Graph
50 LINE (ax, ay)-(xx, yy), faa

60 xx = ax: yy = ay
IF ax > 640 AND schrift = 0 AND grf = 1 THEN
LINE (0, 0)-(200, 60), , BF
LINE (0, 0)-(195, 55), 0, BF
LOCATE 1, 1: PRINT "Zoomfaktor:"; CINT(a)
PRINT "Koordinaten:"; -e; f
END IF
90 IF ax > 640 THEN
IF schrift = 0 AND grf = 1 THEN PRINT "Stauchfaktor:"; stx; sty

IF grf = 0 THEN grf = grf + 1: GOTO 20
grf = 0
GOTO 110
END IF
GOTO 35

100 GOTO 35

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
IF a$ = "w" THEN sty = sty + .5: GOTO 141
IF a$ = "y" THEN sty = sty - .5: GOTO 141
IF a$ = "a" THEN stx = stx + .5: GOTO 141
IF a$ = "s" THEN stx = stx - .5: GOTO 141
IF a$ = "q" THEN stx = 1: sty = 1: GOTO 15
IF a$ = " " THEN GOTO 180
IF a$ = "f" THEN GOTO 210
IF a$ = "e" THEN GOTO 144
IF a$ = "g" AND ge = 1 THEN g = 2: ge = 0:  GOTO 15
IF a$ = "g" THEN g = 2: ge = 1: GOTO 15
IF a$ = CHR$(0) + "G" AND schrift = 1 THEN schrift = 0: GOTO 15
IF a$ = CHR$(0) + "G" AND schrift = 0 THEN schrift = 1: GOTO 15
IF a$ = CHR$(0) + "R" THEN
LOCATE 5, 1
INPUT "Genauigkeit"; genauigkeit
GOTO 15
END IF
IF a$ = CHR$(0) + "I" THEN GOTO 15
IF a$ = CHR$(0) + "Q" AND drawnot = 0 THEN drawnot = 1: GOTO 15
IF a$ = CHR$(0) + "Q" AND drawnot = 1 THEN drawnot = 0: GOTO 15

'125 IF b < 5 THEN GOTO 140
130 IF a$ = "-" THEN b = b ^ (1 / 1.1): GOTO 15
140 GOTO 110

141
IF stx <= 0 THEN stx = .5
IF sty <= 0 THEN sty = .5
GOTO 15

144
tempstx = stx
tempsty = sty
INPUT "Stachfaktor X-Achse:"; stx
INPUT "Stauchfaktor Y-Achse"; sty
IF stx = 0 THEN stx = tempstx
IF sty = 0 THEN sty = tempsty
GOTO 15

145 LOCATE 1, 1
150 tempb = b
LOCATE 5, 1
INPUT "Zoomfaktor:"; b
IF b = 0 THEN b = tempb
170 GOTO 15
180 LOCATE 5, 1
INPUT "X-Koordinate:"; e: e = -e
190 INPUT "Y-Koordinate:"; f
200 GOTO 15
210 LOCATE 5, 1
'LINE (0, 45)-(110, 300), 0, BF
'LINE (0, 287)-(180, 305), 0, BF
'LINE (0, 305)-(210, 320), 0, BF
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
220 tempfaa = faa
INPUT "Farbe des Graphen:"; faa
230 INPUT "Farbe des KO-Systems:"; fa
INPUT "Farbe des Hintergrundes:"; faaa
IF faa = 0 THEN faa = tempfaa
IF faaa > 15 THEN faaa = 0
IF faa > 15 THEN faa = 15
IF fa > 15 THEN fa = 15
240 GOTO 15

