DECLARE SUB Gitter2 (a!, e!, f!, stx!, sty!)
DECLARE SUB Info ()
DECLARE SUB Start ()
DECLARE SUB InfoBild ()
DECLARE FUNCTION Fklt (x!)
DECLARE SUB Details (Detail!)
DECLARE SUB Zoom (b!)
DECLARE SUB KoPfeile (e!, f!, fa!)
DECLARE SUB StartBild ()
DECLARE SUB Blinker (z$)
DECLARE SUB Hilfe ()
DECLARE SUB Gitter (a!, e!, f!, stx, sty)
DECLARE SUB Bug ()
DECLARE SUB Blinker2 (z$)
DECLARE SUB ENDE ()
DECLARE SUB KO (a!, e!, f!, g!, fa!, stx, sty)
DECLARE SUB Farben (fa!, faa!, faaa!)
DECLARE SUB Tastaturabfrage ()
SCREEN 0

'  *** Mathe-Grumbel V 2.65a (Beta) ***

GOSUB Konst
GOTO 10
'Festlegen der Konstanten
Konst:
b = 10: g = 2: fa = 7: faa = 15: stx = 2: sty = 2
Detail = 1: grfanz = 1: col = 1: col2 = 1: PolTol = 1000
CONST PI = 3.1415927#
RETURN

GOTO 10
grf = 0


'**** HIER die Funktion eingeben!!!! ****

5 y = 1 / x


RETURN

6 y = SIN(x) / x

RETURN

7 y = 1 / x

RETURN

10

CALL Start

'CALL InfoBild

Blinker:

LOCATE 23, 40

COLOR col, col2
  
   PRINT "Weiter mit beliebiger Taste"


FOR z = 1 TO 10000
  z$ = INKEY$
  IF z$ = "i" THEN SCREEN 12: help = 1: CALL Bug: GOSUB Blinker3: GOTO 15
  IF z$ = CHR$(0) + ";" THEN SCREEN 12: help = 1: CALL Hilfe: GOSUB Blinker3: GOTO 15
  IF z$ <> "" THEN SCREEN 12: GOTO 15
  
 
NEXT z

IF col = 1 THEN col = 15: col2 = 4: GOTO Blinker
col = 1
col2 = 1
GOTO Blinker

CALL Bug

'************************************************

Blinker3:

LOCATE 22, 26: COLOR col, 1: PRINT " Weiter mit beliebiger Taste ": COLOR 15
FOR z = 1 TO 5000

z$ = INKEY$
   IF z$ = CHR$(0) + ";" THEN SCREEN 12: CALL Hilfe: GOTO Blinker3
   IF z$ = "i" THEN SCREEN 12: CALL Bug: GOTO Blinker3
   IF z$ = "Q" THEN SCREEN 12: ENDE: GOTO 15
  
   IF z$ <> "" AND help = 0 THEN SCREEN 12: GOSUB Konst
   IF z$ <> "" AND help = 1 THEN SCREEN 12: RETURN
NEXT z

IF col = 15 THEN col = 1: GOTO Blinker3
col = 15

GOTO Blinker3

'************** Programm beginn *****************

15 CLS

IF b > 32768 THEN b = 32760
PAINT (320, 240), faaa
20 a = b: d = 0: IF a <= 0 THEN a = .9
24 x = (-320 - e) / a * stx / 2: xx = -1

28
IF grf > 0 THEN GOTO 30
IF a < 2 THEN GOTO KoLine
IF ge = 0 THEN
   CALL KO(a, e, f, g, fa, stx, sty)
  
   'CALL Gitter2(a, e, f, stx, sty) Aktiviert Gitter2 (Raster Punkte)
   GOTO KoLine
END IF

CALL Gitter(a, e, f, stx, sty)

CALL KO(a, e, f, g, fa, stx, sty)
GOTO KoLine

KoLine:
LINE (1, 240 + f)-(640, 240 + f), fa
LINE (320 + e, 1)-(320 + e, 480), fa

CALL KoPfeile(e, f, fa)

30 IF Text = 0 THEN LINE (0, 0)-(10, 10), 4, BF
35 'IF grf = 0 THEN Text = 1
IF drawnot = 1 THEN ax = 645: GOTO 40

x = x + (Detail / a) * stx


40 IF grf = 0 THEN GOSUB 5
IF grf = 1 THEN GOSUB 6
IF grf = 2 THEN GOSUB 7


ax = ((x / stx * 2) + (319 + e) / a) * a
ay = ((240 + f) / a - (y / sty * 2)) * a

IF d = 0 THEN
   Tempay = ay
   TempX = x
   x = x - (Detail / a) * stx

   IF grf = 0 THEN GOSUB 5
   IF grf = 1 THEN GOSUB 6
   IF grf = 2 THEN GOSUB 7
  
   ay = ((240 + f) / a - (y / sty * 2)) * a
   yy = ay
   ay = Tempay
   x = TempX
   d = 1
END IF

IF drawnot = 1 THEN ax = 645: GOTO 60

'*** Zeichnet den Graph ***

50

IF ay > 5000 THEN ay = 5000
IF yy > 5000 THEN yy = 5000    'verhindert љberlauf
IF ay < -1000 THEN ay = -1000
IF yy < -1000 THEN yy = -1000

'LOCATE 10, 10: PRINT ax; ay; xx; yy
'FOR za = 1 TO 100
'NEXT za


IF ABS(yy - ay) > PolTol THEN yy = ay: 'verbessert Sprungstellen



LINE (ax, ay)-(xx, yy), faa


'LOCATE 10, 10: PRINT ax; xx

'FOR za = 1 TO 1000: NEXT za

60 xx = ax: yy = ay

'LOCATE 11, 10: PRINT ax; ay; xx; yy
'FOR za = 1 TO 100
'NEXT za


IF ax > 640 AND Text = 0 AND grf = grfanz - 1 THEN
   LINE (0, 0)-(200, 60), , BF
   LINE (0, 0)-(195, 55), 0, BF
   LOCATE 1, 1: PRINT "Zoomfaktor:"; CINT(a)
   PRINT "Koordinaten:"; -e; f
END IF

90

IF ax > 640 THEN
   IF grf = grfanz - 1 THEN
      IF Text = 0 THEN
         PRINT "Stauchfaktor:"; FIX(stx * 100) / 200; FIX(sty * 100) / 200
      END IF
     
      LOCATE (240 + f) / 480 * 30 + 2, ((320 + e) / 640 * 80) + 2
      PRINT "0"

   FOR sx = 320 + a / stx * 2 TO 635 - e STEP 1 * a / stx * 2
      
      IF ((sx + e) / 640 * 80) + 2 > 75 THEN GOTO 100
      LOCATE ((240 + f) / 480 * 30) + 2, ((sx + e) / 640 * 80) + 1
      
      PRINT "1"
     
100 NEXT sx
     
      grf = 0
      GOTO Inkey
      END IF
   IF grf < grfanz THEN grf = grf + 1: GOTO 20
END IF

GOTO 35

Inkey:
a$ = INKEY$

   IF a$ = "" THEN GOTO Inkey

   IF a$ = CHR$(13) THEN CALL Zoom(b): GOTO 15                     'Enter
   IF a$ = "w" THEN sty = sty ^ 1.1:   GOTO StCheck
   IF a$ = "y" THEN sty = sty ^ (1 / 1.1): GOTO StCheck
   IF a$ = "a" THEN stx = stx ^ 1.1: GOTO StCheck
   IF a$ = "s" THEN stx = stx ^ (1 / 1.1): GOTO StCheck
   IF a$ = " " THEN GOTO 180
   IF a$ = "f" THEN GOTO 210
   IF a$ = "e" THEN GOTO 144

   IF a$ = "+" THEN b = b ^ 1.1: GOTO 15

   IF a$ = CHR$(0) + ";" THEN CALL Hilfe: help = 1: GOSUB Blinker3: GOTO 15
   IF a$ = "i" THEN CALL Info: help = 1: GOSUB Blinker3: GOTO 15
   IF a$ = "Q" THEN ENDE
  
   IF a$ = CHR$(0) + "M" THEN e = e - 10: GOTO 15
   IF a$ = CHR$(0) + "K" THEN e = e + 10: GOTO 15
   IF a$ = CHR$(0) + "P" THEN f = f - 10: GOTO 15
   IF a$ = CHR$(0) + "H" THEN f = f + 10: GOTO 15
  
   IF a$ = "p" THEN
      LOCATE 5, 1
         INPUT "Polstellen Sprung Tolleranz"; PolTol
         GOTO 15
   END IF
  
   IF a$ = "G" AND Ge2 = 0 THEN Ge2 = 1
   IF a$ = "G" AND Ge2 = 1 THEN Ge2 = 0

   IF a$ = "q" THEN stx = 2: sty = 2: GOTO 15
   IF a$ = "g" AND ge = 1 THEN g = 2: ge = 0: GOTO 15
   IF a$ = "g" THEN g = 2: ge = 1: GOTO 15
   IF a$ = CHR$(0) + "G" AND Text = 1 THEN Text = 0: GOTO 15       'POS 1
   IF a$ = CHR$(0) + "G" AND Text = 0 THEN Text = 1: GOTO 15       'POS 1
   IF a$ = CHR$(0) + "R" THEN CALL Details(Detail): GOTO 15        'EINFG
  
   IF a$ = CHR$(0) + "S" AND lowDetail = 0 THEN                    'Entf
      lowDetail = 1
      Detail = 10
      GOTO 15
   END IF
  
   IF a$ = CHR$(0) + "S" AND lowDetail = 1 THEN                    'Entf
      lowDetail = 0
      Detail = 1
      GOTO 15
   END IF

   IF a$ = CHR$(9) THEN : GOTO 15                                  'Tabulator
   IF a$ = CHR$(0) + "Q" AND drawnot = 0 THEN drawnot = 1: GOTO 15 'Bild down
   IF a$ = CHR$(0) + "Q" AND drawnot = 1 THEN drawnot = 0: GOTO 15 'Bild down
   IF a$ = "-" THEN b = b ^ (1 / 1.1): GOTO 15
  
   IF a$ = CHR$(0) + "O" THEN                                      'Ende
      LOCATE 5, 1
      INPUT "Anzahl der Graphen:"; grfanz
         IF grfanz = 0 THEN grfanz = 1
      GOTO 15
   END IF
  
   IF a$ = "-" THEN b = b ^ (1 / 1.1): GOTO 15

GOTO Inkey


141
IF stx <= 0 THEN stx = .5
IF sty <= 0 THEN sty = .5
GOTO 15

144
tempstx = stx
tempsty = sty

LOCATE 5, 1
  
   INPUT "Stachfaktor X-Achse:"; stx
   INPUT "Stauchfaktor Y-Achse"; sty
     
      stx = stx * 2
      sty = sty * 2

IF stx <= 0 THEN stx = tempstx
IF sty <= 0 THEN sty = tempsty

GOTO 15

180

LOCATE 5, 1
   INPUT "X-Koordinate:"; e: e = -e
   INPUT "Y-Koordinate:"; f
GOTO 15

210 CALL Farben(fa, faa, faaa)
240 GOTO 15


StCheck:
   IF stx < 0 THEN stx = .1
   IF sty < 0 THEN sty = .1
GOTO 15

SUB Bug
SCREEN 0
CLS
LOCATE 3, 5: COLOR 15: PRINT "bekannte Fehler des Programmes:"
LOCATE 5, 5: COLOR 7: PRINT "-die Koordinaten entsprechen nicht den KO-Koordinaten"
LOCATE 7, 5: PRINT "-die Funktion kann nur im Quellcode eingegeben werden ?#!?..."
LOCATE 9, 5: PRINT "-der Graph l„st sich nicht ausdrucken (oder nur Ѓber Screen-Shots)"
LOCATE 11, 5: PRINT "-kleinere Fehler an den KO-Pfeilen"
LOCATE 13, 5: PRINT "-bei Zoom keine entsprechende KO verschiebung"
LOCATE 17, 5: PRINT "-nicht definierte Rechnungen fЃhren zum Programm abbruch"
LOCATE 19, 5: PRINT "-Probleme mit Sprungstellen"

END SUB

SUB Details (Detail)

tempDetail = Detail
LOCATE 5, 1
INPUT "Genauigkeit"; Detail
IF Detail <= 0 THEN Detail = tempDetail
END SUB

SUB ENDE

LOCATE 10, 22
   PRINT "ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ"
LOCATE 11, 22
   PRINT "Ы                                   Ы±"
LOCATE 12, 22
   PRINT "Ы   Wollen sie wirklich aufh”ren?   Ы±"
LOCATE 13, 22
   PRINT "Ы                                   Ы±"
LOCATE 14, 22
   PRINT "Ы               [J/N]               Ы±"
LOCATE 15, 22
   PRINT "Ы                                   Ы±"
LOCATE 16, 22
   PRINT "ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ±"
LOCATE 17, 22
   PRINT " ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±"

Abfrage:
a$ = INKEY$
IF a$ = "j" THEN GOTO Wiedersehen
IF a$ = "n" THEN EXIT SUB
GOTO Abfrage


Wiedersehen:
   COLOR 14
LOCATE 10, 22
   PRINT "ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ"
LOCATE 11, 22
   PRINT "Ы                                   Ы±"
LOCATE 12, 22
   PRINT "Ы              TschЃб!              Ы±"
LOCATE 13, 22
   PRINT "Ы                                   Ы±"
LOCATE 14, 22
   PRINT "Ы           Und bis bald.           Ы±"
LOCATE 15, 22
   PRINT "Ы                                   Ы±"
LOCATE 16, 22
   PRINT "ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ±"
LOCATE 17, 22
   PRINT " ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±"



CIRCLE (560, 380), 75, 14
PAINT (560, 380), 14
CIRCLE (535, 360), 7, 0
CIRCLE (585, 360), 7, 0
PAINT (535, 360), 0
PAINT (585, 360), 0
CIRCLE (560, 380), 45, 0, 200 * (PI / 180), 340 * (PI / 180)


COLOR 14
LOCATE 20, 3: PRINT "    ЬЬЬЬЬЬЬЬЬЬ"
LOCATE 21, 3: PRINT "   ЫЫЫЫЫЫЫЫЫЫЫЫ"
LOCATE 22, 3: PRINT "  ЫЫЫЫ ЫЫЫЫ ЫЫЫЫ"
LOCATE 23, 3: PRINT " ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ"
LOCATE 24, 3: PRINT " ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ"
LOCATE 25, 3: PRINT " ЫЫЫЬЯЯЯЯЯЯЯЯЬЫЫЫ"
LOCATE 26, 3: PRINT "  ЫЫЫЫЫЫЫЫЫЫЫЫЫЫ"
LOCATE 27, 3: PRINT "   ЫЫЫЫЫЫЫЫЫЫЫЫ"
LOCATE 28, 3: PRINT "    ЯЯЯЯЯЯЯЯЯЯ"

COLOR 7
END
END SUB

SUB Farben (fa, faa, faaa)
LOCATE 5, 1
'LINE (0, 45)-(110, 300), 0, BF
'LINE (0, 287)-(180, 305), 0, BF
'LINE (0, 305)-(210, 320), 0, BF
PRINT "0 - Schwarz"
PRINT "1 - Blau"
PRINT "2 - GrЃn"
PRINT "3 - Cyanblau"
PRINT "4 - Rot"
PRINT "5 - Magenta"
PRINT "6 - Braun"
PRINT "7 - Hellgrau"
PRINT "8 - Grau"
PRINT "9 - Hellblau"
PRINT "10 - HellgrЃn"
PRINT "11 - Hellcyan"
PRINT "12 - Hellrot"
PRINT "13 - Pink"
PRINT "14 - Gelb"
PRINT "15 - Weiб"
220 tempfaa = faa
INPUT "Farbe des Graphen:"; faa
230 INPUT "Farbe des KO-Systems:"; fa
INPUT "Farbe des Hintergrundes:"; faaa
IF faa = 0 THEN faa = tempfaa
IF faaa > 15 THEN faaa = 0
IF faa > 15 THEN faa = 15
IF fa > 15 THEN fa = 15

END SUB

FUNCTION Fklt (x)

fkln = 1

FOR fklm = 1 TO x
  
   fkln = fkln * fklm

NEXT fklm
Fklt = fkln

END FUNCTION

SUB Gitter (a, e, f, stx, sty)


FOR sx = 320 TO 635 - e STEP 1 * a / stx * 2
   LINE ((sx + e), 0)-((sx + e), 480), 8
NEXT sx

FOR sy = 240 TO 475 - f STEP 1 * a / sty * 2
   LINE (0, sy + f)-(640, sy + f), 8
NEXT sy

FOR sx = -320 TO -4 + e STEP 1 * a / stx * 2
   LINE (-sx + e, 0)-(-sx + e, 480), 8
NEXT sx

FOR sy = -240 TO -4 + f STEP 1 * a / sty * 2
   LINE (0, -sy + f)-(640, -sy + f), 8
NEXT sy

END SUB

SUB Gitter2 (a, e, f, stx, sty)

'Das Gitter muб noch angepasst werden (For Schleifen in andere For Schleife
'einbinden!!)

FOR sx = 320 TO 635 - e STEP 1 * a / stx * 2
   'PSET ((sx + e), 0), 8
   FOR sy = 240 TO 475 - f STEP 1 * a / sty * 2
      PSET (sx + e, sy + f), 8
   NEXT sy
NEXT sx


FOR sy = 240 TO 475 - f STEP 1 * a / sty * 2
   'PSET (0, sy + f), 8

FOR sx = 320 TO 635 - e STEP 1 * a / stx * 2
   PSET ((sx + e), sy + f), 8
NEXT sx






NEXT sy





FOR sx = -320 TO -4 + e STEP 1 * a / stx * 2
   'PSET (-sx + e, 0), 8
     FOR sy = -240 TO -4 + f STEP 1 * a / sty * 2
         PSET (-sx + e, -sy + f), 8
      NEXT sy
NEXT sx


'FOR sy = -240 TO -4 + f STEP 1 * a / sty * 2
   PSET (0, -sy + f), 8
'NEXT sy


END SUB

SUB Hilfe
SCREEN 0
COLOR 0, 3
CLS
COLOR 15, 1
LOCATE 2, 6
   PRINT "ЪДДДДДДДДДДДДДДДДДДДДДДДДДTastatur-BelegungДДДДДДДДДДДДДДДДДДДДДДДДДї": COLOR 7

'Rand
COLOR 15, 1
FOR x = 6 TO 75 STEP 68
   FOR y = 3 TO 21
      LOCATE y, x
      PRINT "і"
   NEXT y
NEXT x

'FЃllung
COLOR 7
FOR y = 3 TO 21
   FOR x = 7 TO 73
      LOCATE y, x
      PRINT "Ы"
   NEXT x
NEXT y
COLOR 15, 1

LOCATE 22, 6
   PRINT "АДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДДЩ"

'Schatten
   COLOR 8
   FOR y = 3 TO 22
      LOCATE y, 75
      PRINT "Ы"
   NEXT y

LOCATE 23, 7
   PRINT "ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ"

a = 4
b = 5
f = 0

COLOR 0, 7
LOCATE a, 7 + b: COLOR 4
   PRINT "Curser-Tasten "; : COLOR f: PRINT "--------------> zum Ausschnitt verschieben"
LOCATE a + 1, 7 + b: COLOR 4
   PRINT "F "; : COLOR f: PRINT "--------------------------------> zum„ndern der Farben"
LOCATE a + 2, 7 + b: COLOR 4
   PRINT "+/- "; : COLOR f: PRINT "--------------------------------------> fЃr den Zoom"
LOCATE a + 3, 7 + b: COLOR 4
   PRINT "Return "; : COLOR f: PRINT "---------------------fЃr eingabe des Zoom-Faktors"
LOCATE a + 4, 7 + b: COLOR 4
   PRINT "Space "; : COLOR f: PRINT "---------------------> fЃr Eingabe von Koordinaten"
LOCATE a + 5, 7 + b: COLOR 4
   PRINT "F1 "; : COLOR f: PRINT "--------------------> zum Aufrufen dieses Bildschirms"
LOCATE a + 6, 7 + b: COLOR 4
   PRINT "I "; : COLOR f: PRINT "----------------> fЃr Informationen Ѓber bekannte Bugs"
LOCATE a + 7, 7 + b: COLOR 4
   PRINT "A;S;W;Y "; : COLOR f: PRINT "--------> zum strecken und stauchen des Graphens"
LOCATE a + 8, 7 + b: COLOR 4
   PRINT "Q "; : COLOR f: PRINT "--------> setzt die Streckfaktoren wieder auf Standard"
LOCATE a + 9, 7 + b: COLOR 4
   PRINT "E "; : COLOR f: PRINT "----------------------------> eingeben der Streckwerte"
LOCATE a + 10, 7 + b: COLOR 4
   PRINT "Ende "; : COLOR f: PRINT "-> Anzahl der Graphen eingeben (under construction)"
LOCATE a + 11, 7 + b: COLOR 4
   PRINT "G "; : COLOR f: PRINT "-------------------> zum ein-/ausblenden eines Gitters"
LOCATE a + 12, 7 + b: COLOR 4
   PRINT "Bild runter "; : COLOR f: PRINT "--------------------> Graph aus-/einschalten"
LOCATE a + 13, 7 + b: COLOR 4
   PRINT "POS 1 "; : COLOR f: PRINT "----------------------------> Text ein-/ausblenden"
LOCATE a + 14, 7 + b: COLOR 4
   PRINT "Einfg "; : COLOR f: PRINT "----------------------------> Genauigkeit eingeben"
LOCATE a + 15, 7 + b: COLOR 4
   PRINT "Shift-Q "; : COLOR f: PRINT "--------------------> zum beenden des Programmes"
LOCATE a + 16, 7 + b: COLOR 4
   PRINT "Tab "; : COLOR f: PRINT "---------------------------------> Bild neu aufbauen"
END SUB

SUB Info
SCREEN 0
CLS
PRINT "Info"

END SUB

SUB InfoBild

LOCATE 5, 26: COLOR 14: PRINT "*** Mathe-Grumbel V2.45 (Beta) ***": COLOR 15
LOCATE 6, 33: COLOR 4: PRINT "(17.3.96-31.5.96)": COLOR 7
LOCATE 8, 9: PRINT "Dieses Programm wurde erdacht und programmiert von Ingo Ruhnke."
'LOCATE 9, 9: PRINT "Mit ihm l„st sich leider nur "; : COLOR 15: PRINT "ein"; : COLOR 7: PRINT " Funktionsgraph darstellen."
LOCATE 10, 9: PRINT "Die Funktion kann jedoch nicht im Programm eingegeben werden,"
LOCATE 11, 9: PRINT "sondern muб im Quellcode ge„ndert werden. Die zu editierende"
LOCATE 12, 9: PRINT "Zeile ist Zeile 5. Als Beispiel steht hier die Funktion:"
LOCATE 13, 9: COLOR 15: PRINT "y = SIN(x) + .1 * x ^ 2": COLOR 7
LOCATE 14, 9: PRINT "Hinter dem "; : COLOR 15: PRINT "y"; : COLOR 7: PRINT " muб die Funktion eingegeben werden."
LOCATE 16, 19: PRINT "Viel Spaб beim arbeiten mit diesem Programm."

END SUB

SUB KO (a, e, f, g, fa, stx, sty)

FOR sx = 320 TO 635 - e STEP 1 * a / stx * 2
   LINE (sx + e, 240 + f - g)-(sx + e, 240 + f + g), fa
NEXT sx

FOR sy = 240 TO 475 - f STEP 1 * a / sty * 2
   LINE (320 + e + g, sy + f)-(320 + e - g, sy + f), fa
NEXT sy

FOR sx = -320 TO -4 + e STEP 1 * a / stx * 2
   LINE (-sx + e, 240 + f - g)-(-sx + e, 240 + f + g), fa
NEXT sx

FOR sy = -240 TO -4 + f STEP 1 * a / sty * 2
   LINE (320 + e + g, -sy + f)-(320 + e - g, -sy + f), fa
NEXT sy


END SUB

SUB KoPfeile (e, f, fa)

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

END SUB

SUB Start
an:

COLOR 15, 9
CLS
PRINT ""
PRINT " ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ"
PRINT " Ы                                                                           Ы"; : COLOR 9: PRINT "Ы": COLOR 15
PRINT " Ы                       Mathe-Grumbel V.2.???                               Ы"; : COLOR 9: PRINT "Ы": COLOR 15
PRINT " Ы                                                                           Ы"; : COLOR 9: PRINT "Ы": COLOR 15
PRINT " ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ"; : COLOR 9: PRINT "Ы": COLOR 15

COLOR 9

PRINT "  ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ"
PRINT ""
COLOR 15
PRINT "        ЙННННННННННННН»"
PRINT "        є kurz Hilfe: є "; : COLOR 7: PRINT "Ь": COLOR 15
PRINT "  ЙНННННКНННННННННННННОНННННН»"
PRINT "  єFunktion:          єTaste:є "; : COLOR 7: PRINT "Ь": COLOR 15
PRINT "  МНННННННННННННННННННОНННННН№ "; : COLOR 7: PRINT "Ы": COLOR 15
PRINT "  є Zoom              є +/-  є "; : COLOR 7: PRINT "Ы": COLOR 15
PRINT "  єДДДДДДДДДДДДДДДДДДДєДДДДДДє "; : COLOR 7: PRINT "Ы": COLOR 15
PRINT "  є KO verschieben    є Curs є "; : COLOR 7: PRINT "Ы": COLOR 15
PRINT "  єДДДДДДДДДДДДДДДДДДДєДДДДДДє "; : COLOR 7: PRINT "Ы": COLOR 15
PRINT "  є weitere Hilfe     є  F1  є "; : COLOR 7: PRINT "Ы": COLOR 15
PRINT "  єДДДДДДДДДДДДДДДДДДДєДДДДДДє "; : COLOR 7: PRINT "Ы": COLOR 15
PRINT "  є Infos             є  I   є "; : COLOR 7: PRINT "Ы": COLOR 15
PRINT "  ИНННННННННННННННННННКННННННј "; : COLOR 7: PRINT "Ы"':color 15
PRINT "   ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯ"

END SUB

SUB Zoom (b)

tempb = b
LOCATE 5, 1
INPUT "Zoomfaktor:"; b
IF b = 0 THEN b = tempb

END SUB

