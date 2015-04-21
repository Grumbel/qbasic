DECLARE SUB SchrankBMP ()
DECLARE SUB Pflanze ()
DECLARE SUB BildMap ()
DECLARE SUB Kisteo ()
DECLARE SUB Kiste ()
DECLARE SUB Bild ()
DECLARE SUB Joystick ()
DECLARE SUB JoystickAbfrage ()
COMMON SHARED StickMitteX  AS INTEGER
COMMON SHARED StickMitteY  AS INTEGER
COMMON SHARED StickBack    AS INTEGER
COMMON SHARED StickForw    AS INTEGER
COMMON SHARED StickLeft    AS INTEGER
COMMON SHARED StickRight   AS INTEGER
COMMON SHARED Stick2MitteX AS INTEGER
COMMON SHARED Stick2MitteY AS INTEGER
COMMON SHARED Stick2Back   AS INTEGER
COMMON SHARED Stick2Forw   AS INTEGER
COMMON SHARED Stick2Left   AS INTEGER
COMMON SHARED Stick2Right  AS INTEGER
COMMON SHARED x            AS INTEGER
COMMON SHARED y            AS INTEGER
COMMON TempX               AS INTEGER
COMMON TempY               AS INTEGER
COMMON xPos                AS INTEGER
COMMON yPos                AS INTEGER
COMMON b                   AS INTEGER
COMMON Objekt              AS STRING
Joystick

SCREEN 13

LINE (0, 9)-(24, 9), 254
LINE (12, 0)-(12, 18), 254

DIM Box%(1 TO 1000)
DIM Kiste1%(1 TO 1000)
DIM Kiste1o%(1 TO 1000)
DIM Pflanze2%(1 TO 1000)
DIM Pflanze1%(1 TO 1000)
DIM Schrank1%(1 TO 2000)
DIM Schrank2%(1 TO 2000)

GET (0, 0)-(24, 18), Box%

DIM pal%(0 TO 255)

FOR f% = 1 TO 64
   k% = f%
   IF f% = 15 THEN k% = 16
   IF k% > 63 THEN k% = 63
   pal%(f%) = k%
NEXT f%

pal%(15) = 63

'LINE (0, 0)-(320, 200), 70, BF
FOR f% = 1 TO 64
   PALETTE f%, pal%(f%)
NEXT f%

'Kiste
CLS

SchrankBMP
GET (0, 0)-(48, 62), Schrank1%
Kisteo
GET (0, 0)-(32, 24), Kiste1o%
Pflanze
GET (0, 0)-(20, 29), Pflanze1%

'SLEEP
'SYSTEM
'BildMap
'DIM map1%(1 TO 32767)
'DIM map2%(1 TO 32767)
'GET (0, 0)-(159, 199), map1%
'GET (160, 0)-(319, 199), map2%

Bild

GET (86, 109)-STEP(32, 24), Kiste1%
GET (7, 106)-STEP(20, 29), Pflanze2%
GET (271, 36)-STEP(48, 62), Schrank2%

'SLEEP

'FOR za = 1 TO 1000
'PSET (320 * RND, 200 * RND), 14 * RND + 1
'NEXT za

x = 160
y = 100
PUT (TempX, TempY), Box%, XOR

DO

JoystickAbfrage

PUT (TempX, TempY), Box%, XOR
PUT (x, y), Box%, XOR

TempX = x
TempY = y


IF STRIG(1) = -1 THEN
   LOCATE 1, 1
   PRINT "X:"; x; " Y:"; y'; "F: "; POINT(x, y)
END IF

IF x >= 0 AND x <= 125 AND y >= 25 AND y <= 100 THEN
   Objekt = "   Exit   "
ELSEIF x >= 75 AND x <= 100 AND y >= 100 AND y <= 125 THEN
   Objekt = "  Kasten  "
ELSEIF x >= 0 AND x <= 15 AND y >= 100 AND y <= 125 THEN
   Objekt = " Pflanzen "
ELSEIF x >= 263 AND x <= 295 AND y >= 22 AND y <= 75 THEN
   Objekt = " Schr„nke "
ELSE
   Objekt = "          "
END IF

LOCATE 1, 16
PRINT Objekt

IF STRIG(3) = 0 THEN k% = 0

IF STRIG(3) = -1 THEN
   IF x >= 0 AND Objekt = "   Exit   " AND Ausgang% = 0 THEN
      Ausgang% = 1
      FOR f% = 1 TO 64
         PALETTE f%, 0
      NEXT f%
     
   ELSEIF Ausgang% = 1 THEN
      Ausgang% = 0
      FOR f% = 1 TO 64
         PALETTE f%, pal%(f%)
      NEXT f%
   END IF

   IF Objekt = "  Kasten  " AND Kasten% = 0 AND k% = 0 THEN
      PUT (TempX, TempY), Box%, XOR
      PUT (86, 109), Kiste1o%, PSET
      PUT (x, y), Box%, XOR
      k% = 1
      Kasten% = 1
   ELSEIF Objekt = "  Kasten  " AND Kasten% = 1 AND k% = 0 THEN
      PUT (TempX, TempY), Box%, XOR
      PUT (86, 109), Kiste1%, PSET
      PUT (x, y), Box%, XOR
      Kasten% = 0
      k% = 1
   END IF
  
   IF Objekt = " Pflanzen " AND Pflanz% = 0 AND k% = 0 THEN
      PUT (TempX, TempY), Box%, XOR
      PUT (6, 106), Pflanze1%, PSET
      PUT (x, y), Box%, XOR
      Pflanz% = 1
      k% = 1
   ELSEIF Objekt = " Pflanzen " AND Pflanz% = 1 AND k% = 0 THEN
      PUT (TempX, TempY), Box%, XOR
      PUT (7, 106), Pflanze2%, PSET
      PUT (x, y), Box%, XOR
      Pflanz% = 0
      k% = 1
   END IF
  
   IF Objekt = " Schr„nke " AND SchrankOffen% = 0 AND k% = 0 THEN
      PUT (TempX, TempY), Box%, XOR
      PUT (271, 36), Schrank1%, PSET
      PUT (x, y), Box%, XOR
      SchrankOffen% = 1
      k% = 1
   ELSEIF Objekt = " Schr„nke " AND SchrankOffen% = 1 AND k% = 0 THEN
      PUT (TempX, TempY), Box%, XOR
      PUT (271, 36), Schrank2%, PSET
      PUT (x, y), Box%, XOR
      SchrankOffen% = 0
      k% = 1
   END IF
      
END IF



IF STRIG(7) = -1 AND Objekt = "   Exit   " AND Ausgang% = 0 THEN
  
   FOR b = 0 TO 101
     
      FOR xPos = -2 + b TO 319 - b
         PSET (xPos, yPos), 0
      NEXT xPos

      FOR yPos = -2 + b TO 199 - b
         PSET (xPos, yPos), 0
      NEXT yPos

      FOR xPos = 320 - b TO 0 + b STEP -1
         PSET (xPos, yPos), 0
      NEXT xPos

      FOR yPos = 200 - b TO 0 + b STEP -1
         PSET (xPos, yPos), 0
      NEXT yPos

   NEXT b
   SYSTEM
END IF

IF STRIG(5) = -1 AND Objekt = "   Exit   " AND Ausgang% = 0 AND Negativ% = 0 AND k% = 0 THEN
'   FOR a% = 1 TO 64 STEP 4
'      FOR fa% = 1 TO 64
'         f% = fa% - a%
'         IF f% < 0 THEN f% = 0
'         PALETTE fa%, f%
'      NEXT fa%
'   NEXT a%

FOR f% = 1 TO 64
   PALETTE f%, 63 - pal%(f%)
NEXT f%
Negativ% = 1
k% = 1

ELSEIF STRIG(5) = -1 AND Objekt = "   Exit   " AND Ausgang% = 0 AND Negativ% = 1 AND k% = 0 THEN
FOR f% = 1 TO 64
   PALETTE f%, pal%(f%)
NEXT f%
Negativ% = 0
k% = 1

'ELSEIF STRIG(5) = -1 THEN
'   LINE (50, 120)-(270, 180), , BF
'   PUT (0, 0), map1%, PSET
'   PUT (160, 0), map2%, PSET

END IF
LOOP

SUB Bild
y% = 0
x% = 320
Datei$ = "c:\basic\dig2.bmp"
OPEN Datei$ FOR RANDOM AS #1 LEN = 1
FIELD #1, 1 AS a$

FOR a& = 65078 TO 1079 STEP -1

   GET #1, a&
   x% = x% - 1
   IF x% < 0 THEN x% = 319: y% = y% + 1
   fa% = ASC(a$)
   
   'IF fa% = 36 THEN fa% = 0
   fa% = fa% / 4
   IF fa% = 15 THEN fa% = 16
   PSET (x%, y%), fa%

NEXT a&
CLOSE


END SUB

SUB BildMap

y% = 0
x% = 320
Datei$ = "c:\basic\dig2map1.bmp"
OPEN Datei$ FOR RANDOM AS #1 LEN = 1
FIELD #1, 1 AS a$

FOR a& = 65078 TO 1079 STEP -1

   GET #1, a&
   x% = x% - 1
   IF x% < 0 THEN x% = 319: y% = y% + 1
   fa% = ASC(a$)
   IF fa% = 15 THEN fa% = 16
   IF fa% = 36 THEN fa% = 0
   fa% = fa% / 4
   PSET (x%, y%), fa%

NEXT a&
CLOSE

END SUB

SUB Joystick   '(StickMitteX, StickMitteY, StickRight, StickForw, StickLeft, StickBack)

OPEN "C:\Basic\JoyStick.ini" FOR INPUT AS #1
   INPUT #1, StickMitteX
   INPUT #1, StickMitteY
   INPUT #1, StickBack
   INPUT #1, StickForw
   INPUT #1, StickLeft
   INPUT #1, StickRight

   INPUT #1, Stick2MitteX
   INPUT #1, Stick2MitteY
   INPUT #1, Stick2Back
   INPUT #1, Stick2Forw
   INPUT #1, Stick2Left
   INPUT #1, Stick2Right

CLOSE

END SUB

SUB JoystickAbfrage

   StickX = STICK(0)
   StickY = STICK(1)
   
   StickX = -StickMitteX + StickX
   StickY = -StickMitteY + StickY
 
   IF StickX < 0 THEN StickA = -StickX / StickLeft * 100
   IF StickX > 0 THEN StickA = StickX / StickRight * 100
   IF StickY < 0 THEN StickB = -StickY / StickForw * 100
   IF StickY > 0 THEN StickB = StickY / StickBack * 100
 
   'IF StickD <= 0 THEN StickD = .1

   'Gr”áe des NullFeldes
   'IF ABS(StickA) < 10 THEN StickA = 0
   'IF ABS(StickB) < 10 THEN StickB = 0

   x = x + StickA / 25
   y = y + StickB / 25

   IF x < 0 THEN x = 0
   IF x > 319 - 24 THEN x = 319 - 24

   IF y < 0 THEN y = 0
   IF y > 199 - 18 THEN y = 199 - 18

END SUB

SUB Kiste

   y% = 0
   x% = 36
   Datei$ = "c:\basic\kiste.bmp"
   OPEN Datei$ FOR RANDOM AS #1 LEN = 1
   FIELD #1, 1 AS a$

   FOR a& = 1978 TO 1079 STEP -1

      GET #1, a&
      x% = x% - 1
      IF x% < 0 THEN x% = 35: y% = y% + 1
      fa% = ASC(a$)
      IF fa% = 15 THEN fa% = 16
      fa% = fa% / 4
      PSET (x%, y%), fa%

   NEXT a&
   CLOSE

END SUB

SUB Kisteo

y% = 0
x% = 36
Datei$ = "c:\basic\kisteo.bmp"
OPEN Datei$ FOR RANDOM AS #1 LEN = 1
FIELD #1, 1 AS a$

FOR a& = 1978 TO 1079 STEP -1

   GET #1, a&
   x% = x% - 1
   IF x% < 0 THEN x% = 35: y% = y% + 1
   fa% = ASC(a$)
   fa% = fa% / 4
   IF fa% = 15 THEN fa% = 16
   PSET (x%, y%), fa%

NEXT a&
CLOSE

END SUB

SUB Pflanze
  
   y% = 0
   x% = 24
   Datei$ = "c:\basic\pflanzek.bmp"
   OPEN Datei$ FOR RANDOM AS #1 LEN = 1
   FIELD #1, 1 AS a$

   FOR a& = 1798 TO 1079 STEP -1

      GET #1, a&
      x% = x% - 1
      IF x% < 0 THEN x% = 23: y% = y% + 1
      fa% = ASC(a$)
      fa% = fa% / 4
      IF fa% = 15 THEN fa% = 16
      PSET (x%, y%), fa%

   NEXT a&
   CLOSE


END SUB

SUB SchrankBMP

y% = 0
x% = 52
Datei$ = "c:\basic\schranko.bmp"
OPEN Datei$ FOR RANDOM AS #1 LEN = 1
FIELD #1, 1 AS a$

FOR a& = 4354 TO 1079 STEP -1

   GET #1, a&
   x% = x% - 1
   IF x% < 0 THEN x% = 51: y% = y% + 1
   fa% = ASC(a$)
   fa% = fa% / 4
   IF fa% = 15 THEN fa% = 16
   PSET (x%, y%), fa%

NEXT a&
CLOSE

END SUB

