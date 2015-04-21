DECLARE SUB Sprite (Yoshi!, d)
SCREEN 12
RANDOMIZE TIMER
CALL Sprite(Yoshi!, d)
DIM Yoshi(1 TO 168)
GET (100, 0)-(132, 32), Yoshi
d = 1
CALL Sprite(Yoshi, d)
DIM Ufo(1 TO 166)
GET (100, 0)-(132, 32), Ufo

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
   Knopf = STRIG(1)
   IF Knopf = -1 THEN CLS : GOTO 40
GOTO StickSchleife3

x = 320: y = 240
xx = 320: yy = 320


40
DIM Feld(20, 15)
ux = INT(18 * RND) + 1
uy = INT(13 * RND) + 1
Feld(ux, uy) = 1


FOR r = 1 TO 16 STEP .4
   CIRCLE (ux * 32 + 16, uy * 32 + 16), r, 3, , , .4
   SOUND r * 100, .1
NEXT r

SOUND 1000, .6
PUT (ux * 32, uy * 32), Ufo, PSET

50
StickAbfrage:
   StickX = STICK(0)
   StickY = STICK(1)
   Knopf = STRIG(1)
   StickX = -StickMitteX + StickX
   StickY = -StickMitteY + StickY
   IF StickX < 0 THEN StickA = StickX / StickLeft * 100
   IF StickX > 0 THEN StickA = -StickX / StickRight * 100
   IF StickY < 0 THEN StickB = -StickY / StickForw * 100
   IF StickY > 0 THEN StickB = StickY / StickBack * 100

'NullFeld
IF ABS(StickA) < 5 THEN StickA = 0
IF ABS(StickB) < 5 THEN StickB = 0

IF Knopf = -1 THEN
  
   SOUND 1000, .1
   dx = INT((x + 16) / 32)
   dy = INT((y + 16) / 32)
   LINE (0, 480)-(x + 18, y + 16), 14
   LINE (640, 480)-(x + 18, y + 16), 14
   IF Feld(dx, dy) = 1 THEN SOUND 500, .1: dd = 0: Feld(dx, dy) = 0: GOTO 100

   FOR za = 1 TO 1000
   NEXT za
  
   LINE (0, 480)-(x + 18, y + 16), 0
   LINE (640, 480)-(x + 18, y + 16), 0
  
   LINE (x, y)-STEP(32, 32), 0, BF
  
   dd = 0
   PUT (ux * 32, uy * 32), Ufo, PSET
   GOTO 50

END IF

60
x = x + StickA / 20
y = y + StickB / 20

65
'Randbegrenzung
IF x < 0 THEN x = 0
IF x > 607 THEN x = 607
IF y < 0 THEN y = 0
IF y > 447 THEN y = 447
 
70
'Beseitigt Grafikfehler bei erstem Durchgang
IF dd = 0 THEN dd = 1: GOTO 80

PUT (xx, yy), Yoshi, XOR

80 PUT (x, y), Yoshi, XOR
xx = x: yy = y

GOTO 50

100
FOR r = 1 TO 50
   CIRCLE (ux * 32 + 18, uy * 32 + 16), r, 4
   CIRCLE (ux * 32 + 18, uy * 32 + 16), r / 2, 14
   SOUND INT(2500 * RND) + 700, .1
NEXT r
   LINE (0, 480)-(x + 18, y + 16), 0
   LINE (640, 480)-(x + 18, y + 16), 0


FOR r = 1 TO 50
   CIRCLE (ux * 32 + 18, uy * 32 + 16), r, 0
   CIRCLE (ux * 32 + 18, uy * 32 + 16), r, 0
   CIRCLE (ux * 32 + 18, uy * 32 + 16), r, 0
  
NEXT r
CLS
GOTO 40

SUB Sprite (Yoshi, d)
 x = 134: Scann = 1
Datei$ = "c:\dos\basic\icons\Kreuz.ico"
IF d = 1 THEN Datei$ = "C:\Dos\Basic\Icons\Ufo.ico"
CLS
10
OPEN Datei$ FOR RANDOM AS #1 LEN = 1
FIELD #1, 1 AS a$

FOR a = 638 TO 127 STEP -1

   GET #1, a
   x = x - 2
   IF x < 101 THEN x = 132: y = y + 1

   LOCATE 20, 20: PRINT "   "
   LOCATE 20, 20: PRINT HEX$(ASC(a$))
 
FOR d = 0 TO 1
   T = SCREEN(20, 20 + d)
 
   IF T = 32 THEN fa = 0: e = 0: GOTO 19
   IF CHR$(T) = "0" THEN fa = 0: GOTO 20
   IF CHR$(T) = "C" THEN fa = 1: GOTO 20
   IF CHR$(T) = "2" THEN fa = 2: GOTO 20
   IF CHR$(T) = "6" THEN fa = 3: GOTO 20
   IF CHR$(T) = "1" THEN fa = 4: GOTO 20
   IF CHR$(T) = "D" THEN fa = 5: GOTO 20
   IF CHR$(T) = "3" THEN fa = 6: GOTO 20
   IF CHR$(T) = "7" THEN fa = 7: GOTO 20
   IF CHR$(T) = "8" THEN fa = 8: GOTO 20
   IF CHR$(T) = "4" THEN fa = 9: GOTO 20
   IF CHR$(T) = "A" THEN fa = 10: GOTO 20
   IF CHR$(T) = "E" THEN fa = 11: GOTO 20
   IF CHR$(T) = "9" THEN fa = 12: GOTO 20
   IF CHR$(T) = "5" THEN fa = 13: GOTO 20
   IF CHR$(T) = "B" THEN fa = 14: GOTO 20
   IF CHR$(T) = "F" THEN fa = 15: GOTO 20
                                 
19 PSET (x + d, y), tempfa
GOTO 21

20 tempfa = fa
e = d

21 PSET (x + e, y), fa
NEXT d
  
NEXT a

CLOSE

END SUB

