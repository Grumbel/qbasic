DECLARE SUB Joystick (StickMitteX!, StickMitteY!, StickRight!, StickForw!, StickLeft!, StickBack!, Stick2Back, Stick2Forw)
DECLARE SUB Sprite (Scann%)
SCREEN 12
RANDOMIZE TIMER
CONST AnimSpeed = .1
DIM Visier(1 TO 166)
DIM Ufo1(1 TO 166)
DIM Ufo2(1 TO 166)
DIM Ufo3(1 TO 166)
DIM Feld(20, 15)

SpriteScann:
   Scann% = Scann% + 1
   IF Scann% = 5 THEN GOTO ProgrammStart
   CALL Sprite(Scann%)
   IF Scann% = 1 THEN GET (100, 0)-(132, 32), Visier
   IF Scann% = 2 THEN GET (100, 0)-(132, 32), Ufo1
   IF Scann% = 3 THEN GET (100, 0)-(132, 32), Ufo2
   IF Scann% = 4 THEN GET (100, 0)-(132, 32), Ufo3
GOTO SpriteScann

ProgrammStart:

CALL Joystick(StickMitteX, StickMitteY, StickRight, StickForw, StickLeft, StickBack, Stick2Forw, Stick2Back)

x = 320: y = 240
xx = 320: yy = 320


40
LOCATE 1, 1: PRINT "AbschÅsse: "; UfoAbschuesse
'Setzt neu Ufo Position
UfoStart = TIMER
ux = INT(18 * RND) + 1
uy = INT(13 * RND) + 1
Feld(ux, uy) = 1

'Auftauch Effekt fÅr Ufo
FOR r = 1 TO 16 STEP .4
   CIRCLE (ux * 32 + 16, uy * 32 + 16), r, 3, , , .4
   SOUND r * 100, .1
NEXT r

SOUND 1000, .6

IF Anim% = 0 THEN PUT (ux * 32, uy * 32), Ufo1, PSET
IF Anim% = 1 THEN PUT (ux * 32, uy * 32), Ufo2, PSET
IF Anim% = 2 THEN PUT (ux * 32, uy * 32), Ufo3, PSET

50

StickAbfrage:
   'Joystick Abfrage (-100 bis 100)

   StickX = STICK(0)
   StickY = STICK(1)
   StickYY = STICK(3)
   Knopf1 = STRIG(1)
   Knopf2 = STRIG(3)
   StickX = -StickMitteX + StickX
   StickY = -StickMitteY + StickY
   IF UfoStart + 60 < TIMER THEN GOTO UfoPos2
   IF StickX < 0 THEN StickA = StickX / StickLeft * 100
   IF StickX > 0 THEN StickA = -StickX / StickRight * 100
   IF StickY < 0 THEN StickB = -StickY / StickForw * 100
   IF StickY > 0 THEN StickB = StickY / StickBack * 100
   StickD = StickYY / (Stick2Back + Stick2Forw) * 100
   IF StickD <= 0 THEN StickD = .1
   'Grî·e des NullFeldes
   IF ABS(StickA) < 5 THEN StickA = 0
   IF ABS(StickB) < 5 THEN StickB = 0
   
   IF Knopf2 = -1 THEN END
  
   IF Knopf1 = -1 THEN

      SOUND 1000, .1
      dx = INT((x + 16) / 32)
      dy = INT((y + 16) / 32)
      LINE (0, 480)-(x + 18, y + 16), 14
      LINE (640, 480)-(x + 18, y + 16), 14
     
      'Kollisions Abfrage
      IF Feld(dx, dy) = 1 THEN
         SOUND 500, .1
         dd = 0
         Feld(dx, dy) = 0
         UfoAbschuesse = UfoAbschuesse + 1
         GOTO Explosion
      END IF

      FOR za = 1 TO 1000
      NEXT za
  
      LINE (0, 480)-(x + 18, y + 16), 0
      LINE (640, 480)-(x + 18, y + 16), 0
  
      LINE (x, y)-STEP(32, 32), 0, BF
  
      dd = 0

      'Ufo Animation
      IF Anim >= 0 AND Anim < 1 THEN PUT (ux * 32, uy * 32), Ufo1, PSET
      IF Anim >= 1 AND Anim < 2 THEN PUT (ux * 32, uy * 32), Ufo2, PSET
      IF Anim >= 2 AND Anim < 3 THEN PUT (ux * 32, uy * 32), Ufo3, PSET
      Anim = Anim + AnimSpeed * 4
      IF Anim > 3 THEN Anim = 0
      GOTO StickAbfrage

   END IF
   
'60
   x = x + StickA / SQR(StickD)
   y = y + StickB / SQR(StickD)
 
   'Randbegrenzung
   IF x < 0 THEN x = 0
   IF x > 607 THEN x = 607
   IF y < 0 THEN y = 0
   IF y > 447 THEN y = 447
  
   'Beseitigt Grafikfehler bei erstem Durchgang
   IF dd = 0 THEN dd = 1: GOTO 80

 
   PUT (xx, yy), Visier, XOR
80
      IF Anim >= 0 AND Anim < 1 THEN PUT (ux * 32, uy * 32), Ufo1, PSET
      IF Anim >= 1 AND Anim < 2 THEN PUT (ux * 32, uy * 32), Ufo2, PSET
      IF Anim >= 2 AND Anim < 3 THEN PUT (ux * 32, uy * 32), Ufo3, PSET
      Anim = Anim + AnimSpeed
      IF Anim > 3 THEN Anim = 0


PUT (x, y), Visier, XOR

90 xx = x: yy = y
   
GOTO StickAbfrage

UfoPos2:
   FOR r = 32 TO 1 STEP -1
      CIRCLE (ux * 32 + 16, uy * 32 + 16), r, 0, , , .4
      SOUND r * 100, .1
   NEXT r
   CLS
dd = 0
GOTO 40

Explosion:

'Zeichnet Explosion
FOR r = 1 TO 50
   CIRCLE (ux * 32 + 18, uy * 32 + 16), r, 4
   CIRCLE (ux * 32 + 18, uy * 32 + 16), r / 2, 14
   SOUND INT(2500 * RND) + 700, .1
NEXT r
    
   'Lîscht Laser
   LINE (0, 480)-(x + 18, y + 16), 0
   LINE (640, 480)-(x + 18, y + 16), 0

'Lîscht Explosion
FOR r = 1 TO 50
   CIRCLE (ux * 32 + 18, uy * 32 + 16), r, 0
   CIRCLE (ux * 32 + 18, uy * 32 + 16), r, 0
   CIRCLE (ux * 32 + 18, uy * 32 + 16), r, 0
NEXT r

LINE (ux * 32 - 32, uy * 32 - 32)-STEP(96, 96), 0, BF

GOTO 40

SUB Joystick (StickMitteX, StickMitteY, StickRight, StickForw, StickLeft, StickBack, Stick2Back, Stick2Forw)

KalibrierungsRutine:
   CLS
   PRINT "Joystick in Mittelstellung"

StickSchleife1:

   StickMitteX = STICK(0)
   StickMitteY = STICK(0)
   Knopf = STRIG(1)
   IF Knopf = -1 THEN CLS : GOTO Stick1
 
   GOTO StickSchleife1

Stick1:
      PRINT "Joystick oben/rechts und Knopf"
 
   FOR za = 1 TO 10000
   NEXT za

StickSchleife2:
   StickRight = -StickMitteX + STICK(0)
   StickForw = -StickMitteY + STICK(1)
   Stick2Forw = STICK(3)
   Knopf = STRIG(1)
   IF Knopf = -1 THEN CLS : GOTO Stick2
   GOTO StickSchleife2

Stick2:

   PRINT "Joystick unten/links und Knopf"
   FOR za = 1 TO 10000
   NEXT za

StickSchleife3:
   StickLeft = -StickMitteX + STICK(0)
   StickBack = -StickMitteY + STICK(1)
   Stick2Back = STICK(3)
   Knopf = STRIG(1)
   IF Knopf = -1 THEN CLS : GOTO SubEnde1
GOTO StickSchleife3

SubEnde1:

END SUB

SUB Sprite (Scann%)
x% = 134
CLS

IF Scann% = 1 THEN Datei$ = "c:\dos\basic\icons\Kreuz.ico"
IF Scann% = 2 THEN Datei$ = "C:\Dos\Basic\Icons\Ufo1.ico"
IF Scann% = 3 THEN Datei$ = "C:\Dos\Basic\Icons\Ufo2.ico"
IF Scann% = 4 THEN Datei$ = "C:\Dos\Basic\Icons\Ufo3.ico"

OPEN Datei$ FOR RANDOM AS #1 LEN = 1

FIELD #1, 1 AS a$

FOR a% = 638 TO 127 STEP -1

   GET #1, a%
   x% = x% - 2
   IF x% < 101 THEN x% = 132: y% = y% + 1

   LOCATE 20, 20: PRINT "   "
   LOCATE 20, 20: PRINT HEX$(ASC(a$))
 
FOR d% = 0 TO 1
   T% = SCREEN(20, 20 + d%)
 
   IF T% = 32 THEN fa% = 0: e% = 0: GOTO 19
   IF CHR$(T%) = "0" THEN fa% = 0: GOTO 20
   IF CHR$(T%) = "C" THEN fa% = 1: GOTO 20
   IF CHR$(T%) = "2" THEN fa% = 2: GOTO 20
   IF CHR$(T%) = "6" THEN fa% = 3: GOTO 20
   IF CHR$(T%) = "1" THEN fa% = 4: GOTO 20
   IF CHR$(T%) = "D" THEN fa% = 5: GOTO 20
   IF CHR$(T%) = "3" THEN fa% = 6: GOTO 20
   IF CHR$(T%) = "7" THEN fa% = 7: GOTO 20
   IF CHR$(T%) = "8" THEN fa% = 8: GOTO 20
   IF CHR$(T%) = "4" THEN fa% = 9: GOTO 20
   IF CHR$(T%) = "A" THEN fa% = 10: GOTO 20
   IF CHR$(T%) = "E" THEN fa% = 11: GOTO 20
   IF CHR$(T%) = "9" THEN fa% = 12: GOTO 20
   IF CHR$(T%) = "5" THEN fa% = 13: GOTO 20
   IF CHR$(T%) = "B" THEN fa% = 14: GOTO 20
   IF CHR$(T%) = "F" THEN fa% = 15: GOTO 20
                                 
19 PSET (x% + d%, y%), tempfa%
GOTO 21

20
tempfa% = fa%
e% = d%

21 PSET (x% + e%, y%), fa%
NEXT d%
  
NEXT a%

CLOSE

END SUB

