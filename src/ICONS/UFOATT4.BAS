DECLARE SUB Joystick (StickMitteX!, StickMitteY!, StickRight!, StickForw!, StickLeft!, StickBack!)
DECLARE SUB Sprite (Scann%)
SCREEN 12
RANDOMIZE TIMER
CONST AnimSpeed = .1
InstPath$ = "C:\Basic\Icons\"
uy = 7
DIM Visier(1 TO 166)
DIM Ufo1(1 TO 166)
DIM Ufo2(1 TO 166)
DIM Ufo3(1 TO 166)


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

CALL Joystick(StickMitteX, StickMitteY, StickRight, StickForw, StickLeft, StickBack)

x = 320: y = 240
xx = 320: yy = 320
uy = 200

40
LOCATE 1, 1: PRINT "AbschÅsse: "; UfoAbschuesse
'Setzt neu Ufo Position
UfoStart = TIMER
ux = ux + CINT(20 * RND) + 10
uy = uy + INT(9 * RND) - 4'INT(13 * RND) + 1

'Auftauch Effekt fÅr Ufo
'FOR r = 1 TO 16 STEP .4
'   CIRCLE (ux + 16, uy + 16), r, 3, , , .4
'NEXT r



IF Anim% = 0 THEN PUT (ux, uy), Ufo1, PSET
IF Anim% = 1 THEN PUT (ux, uy), Ufo2, PSET
IF Anim% = 2 THEN PUT (ux, uy), Ufo3, PSET

50

StickAbfrage:
   'Joystick Abfrage (-100 bis 100)

   StickX = STICK(0)
   StickY = STICK(1)
   'StickYY = STICK(3)
   Knopf1 = STRIG(1)
   Knopf2 = STRIG(3)
   StickX = -StickMitteX + StickX
   StickY = -StickMitteY + StickY
   IF UfoStart + .5 < TIMER THEN GOTO UfoPos2
   IF StickX < 0 THEN StickA = -StickX / StickLeft * 100
   IF StickX > 0 THEN StickA = StickX / StickRight * 100
   IF StickY < 0 THEN StickB = -StickY / StickForw * 100
   IF StickY > 0 THEN StickB = StickY / StickBack * 100
   'StickD = StickYY / (Stick2Back + Stick2Forw) * 100
   IF StickD <= 0 THEN StickD = .1

   'Grî·e des NullFeldes
   IF ABS(StickA) < 7 THEN StickA = 0
   IF ABS(StickB) < 7 THEN StickB = 0
   
  
   IF Knopf2 = -1 THEN END
  
   IF Knopf1 = -1 THEN

      SOUND 1000, .1

      LINE (0, 480)-(x + 2, y), 14
      LINE (640, 480)-(x + 2, y), 14
     
      'Kollisions Abfrage
      
      IF ux < x AND ux + 32 > x AND uy < y AND uy + 32 > y THEN
         SOUND 500, .1
         dd = 0
         UfoAbschuesse = UfoAbschuesse + 1
         GOTO Explosion
      END IF

      FOR za = 1 TO 1000
      NEXT za
  
      LINE (0, 480)-(x + 2, y), 0
      LINE (640, 480)-(x + 2, y), 0
  
      dd = 0

      'Ufo Animation
      IF Anim >= 0 AND Anim < 1 THEN PUT (ux, uy), Ufo1, PSET
      IF Anim >= 1 AND Anim < 2 THEN PUT (ux, uy), Ufo2, PSET
      IF Anim >= 2 AND Anim < 3 THEN PUT (ux, uy), Ufo3, PSET
      Anim = Anim + AnimSpeed * 4
      IF Anim > 3 THEN Anim = 0
      GOTO StickAbfrage

   END IF

   
'60
   x = x + StickA / 10
   y = y + StickB / 10
   
   IF x < 20 THEN x = 20
   IF x > 600 THEN x = 600

   IF y < 20 THEN y = 20
   IF y > 440 THEN y = 440

   'Beseitigt Grafikfehler bei erstem Durchgang
   IF dd = 0 THEN dd = 1: GOTO 80

 
   PUT (xx - 16, yy - 16), Visier, XOR
80
      IF Anim >= 0 AND Anim < 1 THEN PUT (ux, uy), Ufo1, PSET
      IF Anim >= 1 AND Anim < 2 THEN PUT (ux, uy), Ufo2, PSET
      IF Anim >= 2 AND Anim < 3 THEN PUT (ux, uy), Ufo3, PSET
      Anim = Anim + AnimSpeed
      IF Anim > 3 THEN Anim = 0


PUT (x - 16, y - 16), Visier, XOR

90 xx = x: yy = y
   
GOTO StickAbfrage

UfoPos2:
  ' FOR r = 32 TO 1 STEP -1
  '    CIRCLE (ux + 16, uy + 16), r, 0, , , .4
  '    SOUND r * 100, .1
  ' NEXT r
   IF ux = 600 THEN ux = 0: uy = 0
   CLS
dd = 0
GOTO 40

Explosion:

'Zeichnet Explosion
FOR r = 1 TO 50
   CIRCLE (ux + 18, uy + 16), r, 4
   CIRCLE (ux + 18, uy + 16), r / 2, 14
   SOUND INT(RND * 1000) + 500, .1
NEXT r
    
   'Lîscht Laser
   LINE (0, 480)-(x + 18, y + 16), 0
   LINE (640, 480)-(x + 18, y + 16), 0

'Lîscht Explosion
FOR r = 1 TO 50
   CIRCLE (ux + 18, uy + 16), r, 0
   CIRCLE (ux + 18, uy + 16), r, 0
   CIRCLE (ux + 18, uy + 16), r, 0
NEXT r

LINE (ux - 32, uy - 32)-STEP(96, 96), 0, BF
ux = 0: uy = CINT(400 * RND) + 30
CLS
GOTO 40

SUB Joystick (StickMitteX, StickMitteY, StickRight, StickForw, StickLeft, StickBack)

OPEN "C:\Basic\JoyStick.ini" FOR INPUT AS #1
   INPUT #1, StickMitteX
   INPUT #1, StickMitteY
   INPUT #1, StickBack
   INPUT #1, StickForw
   INPUT #1, StickLeft
   INPUT #1, StickRight
CLOSE


END SUB

SUB Sprite (Scann%)
x% = 134
CLS

IF Scann% = 1 THEN Datei$ = "c:\basic\icons\Kreuz.ico"
IF Scann% = 2 THEN Datei$ = "C:\Basic\Icons\Ufo1.ico"
IF Scann% = 3 THEN Datei$ = "C:\Basic\Icons\Ufo2.ico"
IF Scann% = 4 THEN Datei$ = "C:\Basic\Icons\Ufo3.ico"

OPEN Datei$ FOR RANDOM AS #1 LEN = 1

FIELD #1, 1 AS a$

FOR a% = 638 TO 127 STEP -1

   GET #1, a%
   x% = x% - 2
   IF x% < 101 THEN x% = 132: y% = y% + 1

FOR d% = 0 TO 1
   
   t$ = MID$(HEX$(ASC(a$)), 2 - d%, 1)
  
   IF t$ = "0" THEN fa% = 0: GOTO 20
   IF t$ = "C" THEN fa% = 1: GOTO 20
   IF t$ = "2" THEN fa% = 2: GOTO 20
   IF t$ = "6" THEN fa% = 3: GOTO 20
   IF t$ = "1" THEN fa% = 4: GOTO 20
   IF t$ = "D" THEN fa% = 5: GOTO 20
   IF t$ = "3" THEN fa% = 6: GOTO 20
   IF t$ = "7" THEN fa% = 7: GOTO 20
   IF t$ = "8" THEN fa% = 8: GOTO 20
   IF t$ = "4" THEN fa% = 9: GOTO 20
   IF t$ = "A" THEN fa% = 10: GOTO 20
   IF t$ = "E" THEN fa% = 11: GOTO 20
   IF t$ = "9" THEN fa% = 12: GOTO 20
   IF t$ = "5" THEN fa% = 13: GOTO 20
   IF t$ = "B" THEN fa% = 14: GOTO 20
   IF t$ = "F" THEN fa% = 15: GOTO 20
20                                
   PSET (x% + d%, y%), fa%
   
NEXT d%
  
NEXT a%

CLOSE

END SUB

