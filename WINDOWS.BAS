DECLARE SUB JoystickAbfrage ()
DECLARE SUB Windows (x1!, y1!, x2!, y2!)
DECLARE SUB Joystick ()
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
COMMON SHARED Knopf1       AS INTEGER
COMMON SHARED Knopf2       AS INTEGER
COMMON SHARED StickX       AS INTEGER
COMMON SHARED StickY       AS INTEGER
COMMON SHARED xPos         AS SINGLE
COMMON SHARED yPos         AS SINGLE
COMMON SHARED x1           AS SINGLE
COMMON SHARED y1           AS SINGLE
COMMON SHARED x2           AS SINGLE
COMMON SHARED y2           AS SINGLE
COMMON SHARED wMove        AS INTEGER
COMMON SHARED b1           AS INTEGER
COMMON SHARED b2           AS INTEGER
COMMON SHARED kol          AS INTEGER
COMMON SHARED fa           AS INTEGER

SCREEN 9
WINDOW SCREEN (1, 1)-(640, 480)
CALL Joystick
x1 = 200: y1 = 100
x2 = 400: y2 = 300
b1 = 1
Start:
CALL JoystickAbfrage
LOCATE 1, 1
PRINT "Knopf1:"; Knopf1
xPos = xPos + StickX / 10
yPos = yPos + StickY / 10

'Kasten unten/rechts
IF y2 > yPos AND y2 - 15 < yPos AND x2 > xPos AND x2 - 15 < xPos AND wMove = 0 THEN
   kol = 1
   fa = 4
ELSEIF wMove = 0 THEN
   kol = 0
   fa = 15
END IF

'Titelleiste
IF y1 < yPos AND y1 + 15 > yPos AND x1 + 15 < xPos AND x2 - 15 > xPos AND wMove = 0 THEN
   kol = 2
   fa = 14
ELSEIF wMove = 0 AND kol = 0 THEN
   kol = 0
   fa = 15
END IF

IF Knopf1 = 0 THEN wMove = 0

'Titelleiste
IF Knopf1 = -1 AND kol = 2 AND wMove = 0 THEN
   LaengeX1 = xPos - x1
   LaengeX2 = x2 - xPos
   LaengeY1 = yPos - y1
   LaengeY2 = y2 - yPos
   wMove = 2
END IF

IF wMove = 2 THEN
   x1 = xPos - LaengeX1
   x2 = xPos + LaengeX2
   y1 = yPos - LaengeY1
   y2 = yPos + LaengeY2
END IF
         

'Kasten unten/rechts
IF Knopf1 = -1 AND kol = 1 THEN
   x2 = xPos
   y2 = yPos
   wMove = 1
END IF
CLS

CALL Windows(x1, y1, x2, y2)

'Curser-Pfeil
LINE (xPos, yPos)-STEP(8, 3), fa
LINE (xPos, yPos)-STEP(3, 8), fa
LINE (xPos + 8, yPos + 3)-(xPos + 3, yPos + 8), fa


SCREEN 9, , b1, b2
SWAP b1, b2
GOTO Start

SUB Joystick

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
   Stick2Y = STICK(3)

   Knopf1 = STRIG(1)
   Knopf2 = STRIG(3)
 
   StickX = -StickMitteX + StickX
   StickY = -StickMitteY + StickY
 
   IF StickX < 0 THEN StickX = -StickX / StickLeft * 100
   IF StickX > 0 THEN StickX = StickX / StickRight * 100
   IF StickY < 0 THEN StickY = -StickY / StickForw * 100
   IF StickY > 0 THEN StickY = StickY / StickBack * 100
 
  
   'Gr”áe des NullFeldes
   IF ABS(StickA) < 7 THEN StickA = 0
   IF ABS(StickB) < 7 THEN StickB = 0


END SUB

SUB Windows (x1, y1, x2, y2)

IF x1 > x2 - 40 AND wMove < 2 THEN x2 = x1 + 40: xPos = x2
IF y1 > y2 - 40 AND wMove < 2 THEN y2 = y1 + 40: yPos = y2

   'Kasten untenrechts
   LINE (x2 - 15, y2 - 15)-(x2, y2), 8, BF
   LINE (x2 - 15, y2 - 15)-(x2, y2 - 15)
   LINE (x2 - 15, y2 - 15)-(x2 - 15, y2)

   'TitelLeiste
   LINE (x1 + 15, y1)-(x2 - 15, y1 + 15), 1, BF

   'Fenster Rand
   LINE (x1, y1)-(x2, y1)
   LINE -(x2, y2)
   LINE -(x1, y2)
   LINE -(x1, y1)

END SUB

