DECLARE SUB Kollision ()
DECLARE SUB JoystickAbfrage ()
DECLARE SUB Windows (X1!, Y1!, x2!, Y2!)
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
COMMON SHARED X1           AS SINGLE
COMMON SHARED Y1           AS SINGLE
COMMON SHARED x2           AS SINGLE
COMMON SHARED Y2           AS SINGLE
COMMON SHARED TempX1       AS SINGLE
COMMON SHARED TempY1       AS SINGLE
COMMON SHARED TempX2       AS SINGLE
COMMON SHARED TempY2       AS SINGLE
COMMON SHARED wMove        AS INTEGER
COMMON SHARED b1           AS INTEGER
COMMON SHARED b2           AS INTEGER
COMMON SHARED kol          AS INTEGER
COMMON SHARED fa           AS INTEGER
COMMON SHARED Bewegen      AS INTEGER
COMMON SHARED fest         AS INTEGER
COMMON SHARED LaengeX1     AS INTEGER
COMMON SHARED LaengeX2     AS INTEGER
COMMON SHARED LaengeY1     AS INTEGER
COMMON SHARED LaengeY2     AS INTEGER

CONST MinLenghtX = 60
CONST MinLenghtY = 40

SCREEN 9
'WINDOW SCREEN (1, 1)-(640, 480)
CALL Joystick
X1 = 200: Y1 = 100
x2 = 400: Y2 = 300
b1 = 1
fa = 15

Start:
CALL JoystickAbfrage
xPos = xPos + StickX / 10
yPos = yPos + StickY / 10

IF xPos > 640 THEN xPos = 640
IF xPos < 1 THEN xPos = 1
IF yPos > 350 THEN yPos = 350
IF yPos < 0 THEN yPos = 0

kol = 0
fa = 15
CALL Kollision
IF Bewegen = 1 THEN GOTO Bewegen

CLS

CALL Windows(X1, Y1, x2, Y2)

'Curser-Pfeil
LINE (xPos, yPos)-STEP(8, 3), fa
LINE (xPos, yPos)-STEP(3, 8), fa
LINE (xPos + 8, yPos + 3)-(xPos + 3, yPos + 8), fa

'LOCATE 1, 1
'PRINT "Knopf1:"; Knopf1; fest

SCREEN 9, , b1, b2
SWAP b1, b2
GOTO Start

Bewegen:

CALL JoystickAbfrage
IF Knopf1 = 0 THEN kol = 0: Bewegen = 0: GOTO Start
xPos = xPos + StickX / 5
yPos = yPos + StickY / 5

'Randbegrenzung
IF xPos > 640 THEN xPos = 640
IF xPos < 1 THEN xPos = 1
IF yPos > 350 THEN yPos = 350
IF yPos < 0 THEN yPos = 0

'Titelleiste
IF kol = 10 THEN
   X1 = xPos - LaengeX1
   x2 = xPos + LaengeX2
   Y1 = yPos - LaengeY1
   Y2 = yPos + LaengeY2
END IF
 
'Kasten unten/rechts
IF kol = 1 THEN
   x2 = xPos
   Y2 = yPos
END IF

'Kasten oben/rechts
IF kol = 2 THEN
   x2 = xPos
   Y1 = yPos
END IF

'Kasten oben/links
IF kol = 3 THEN
   X1 = xPos
   Y1 = yPos
END IF

'Kasten unten/links
IF kol = 4 THEN
   X1 = xPos
   Y2 = yPos
END IF


CLS
CALL Windows(X1, Y1, x2, Y2)
'LOCATE 1, 1: PRINT "XXXXXXXXXXX"; fest
SCREEN 9, , b1, b2
SWAP b1, b2

GOTO Bewegen

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

SUB Kollision
'Kasten unten/rechts
IF Y2 > yPos AND Y2 - 15 < yPos AND x2 > xPos AND x2 - 15 < xPos THEN
   kol = 1
   fa = 4
IF Knopf1 = -1 AND fest = 0 THEN Bewegen = 1: EXIT SUB
END IF

'Kasten oben / rechts
IF Y1 < yPos AND Y1 + 15 > yPos AND x2 > xPos AND x2 - 15 < xPos THEN
   kol = 2
   fa = 4
IF Knopf1 = -1 AND fest = 0 THEN Bewegen = 1: EXIT SUB
END IF

'Kasten oben / links
IF Y1 < yPos AND Y1 + 15 > yPos AND X1 < xPos AND X1 + 15 > xPos THEN
   kol = 3
   fa = 4
IF Knopf1 = -1 AND fest = 0 THEN Bewegen = 1: EXIT SUB
END IF

'Kasten unten / links
IF Y2 > yPos AND Y2 - 15 < yPos AND X1 < xPos AND X1 + 15 > xPos THEN
   kol = 4
   fa = 4
IF Knopf1 = -1 AND fest = 0 THEN Bewegen = 1: EXIT SUB

END IF

'groá
IF Y1 < yPos AND Y1 + 15 > yPos AND x2 - 16 > xPos AND x2 - 31 < xPos THEN
   fa = 2
   kol = 5
   IF Knopf1 = -1 AND fest = 0 THEN
   TempX1 = X1
   TempY1 = Y1
   TempX2 = x2
   TempY2 = Y2
   X1 = 1: Y1 = 1
   x2 = 638: Y2 = 348
   fest = 1
   ELSEIF fest = 1 AND Knopf1 = -1 THEN
      fest = 0
      X1 = TempX1
      x2 = TempX2
      Y2 = TempY2
      Y1 = TempY1
   END IF
END IF

'Titelleiste
IF Y1 < yPos AND Y1 + 15 > yPos AND X1 + 15 < xPos AND x2 - 32 > xPos THEN
   kol = 10
   fa = 14
   IF Knopf1 = -1 AND fest = 0 THEN
      LaengeX1 = xPos - X1
      LaengeX2 = x2 - xPos
      LaengeY1 = yPos - Y1
      LaengeY2 = Y2 - yPos
      Bewegen = 1
      EXIT SUB
   END IF
END IF

END SUB

SUB Windows (X1, Y1, x2, Y2)

SELECT CASE kol
  
   CASE 1
   IF Y2 < Y1 + MinLenghtY THEN Y2 = Y1 + MinLenghtY: yPos = Y2
   IF x2 < X1 + MinLenghtX THEN x2 = X1 + MinLenghtX: xPos = x2

   CASE 2
   IF Y1 > Y2 - MinLenghtY THEN Y1 = Y2 - MinLenghtY: yPos = Y1
   IF x2 < X1 + MinLenghtX THEN x2 = X1 + MinLenghtX: xPos = x2

   CASE 3
   IF Y1 > Y2 - MinLenghtY THEN Y1 = Y2 - MinLenghtY: yPos = Y1
   IF x2 < X1 + MinLenghtX THEN X1 = x2 - MinLenghtX: xPos = X1

   CASE 4
   IF Y2 < Y1 + MinLenghtY THEN Y2 = Y1 + MinLenghtY: yPos = Y2
   IF x2 < X1 + MinLenghtX THEN X1 = x2 - MinLenghtX: xPos = X1

END SELECT


   'TitelLeiste
   LINE (X1 + 15, Y1)-(x2 - 30, Y1 + 15), 1, BF
   LINE (X1 + 15, Y1 + 15)-(x2 - 30, Y1 + 15)

   'Kasten unten/rechts
   LINE (x2 - 15, Y2 - 15)-(x2, Y2), 8, BF
   LINE (x2 - 15, Y2 - 15)-(x2, Y2 - 15)
   LINE (x2 - 15, Y2 - 15)-(x2 - 15, Y2)

   'Kasten oben/rechts
   LINE (x2 - 15, Y1 + 15)-(x2, Y1), 8, BF
   LINE (x2 - 15, Y1 + 15)-(x2, Y1 + 15)
   LINE (x2 - 15, Y1 + 15)-(x2 - 15, Y1)

   '2. Kasten oben/rechts
   LINE (x2 - 31, Y1 + 15)-(x2 - 16, Y1), 8, BF
   LINE (x2 - 31, Y1 + 15)-(x2 - 16, Y1 + 15)
   LINE (x2 - 31, Y1 + 15)-(x2 - 31, Y1)
  
   IF fest = 0 THEN
      LINE (x2 - 28, Y1 + 9)-(x2 - 23, Y1 + 4)
      LINE -(x2 - 18, Y1 + 9)
      LINE -(x2 - 28, Y1 + 9)
   END IF
  
   IF fest = 1 THEN
      LINE (x2 - 28, Y1 + 4)-(x2 - 23, Y1 + 9)
      LINE -(x2 - 18, Y1 + 4)
      LINE -(x2 - 28, Y1 + 4)
   END IF


   'Kasten unten/links
   LINE (X1 + 15, Y2 - 15)-(X1, Y2), 8, BF
   LINE (X1 + 15, Y2 - 15)-(X1, Y2 - 15)
   LINE (X1 + 15, Y2 - 15)-(X1 + 15, Y2)

   'Kasten oben/links
   LINE (X1 + 15, Y1 + 15)-(X1, Y1), 8, BF
   LINE (X1 + 15, Y1 + 15)-(X1, Y1 + 15)
   LINE (X1 + 15, Y1 + 15)-(X1 + 15, Y1)
     
   'Fenster Rand
   LINE (X1 - 1, Y1 - 1)-(x2 + 1, Y1 - 1)
   LINE (X1, Y1)-(x2, Y1), 3
  
   LINE (x2, Y1)-(x2, Y2)
   LINE (x2 + 1, Y1 - 1)-(x2 + 1, Y2 + 1), 3
  
   LINE (x2 + 1, Y2 + 1)-(X1 - 1, Y2 + 1), 3
   LINE (x2, Y2)-(X1, Y2)

   LINE (X1, Y2)-(X1, Y1), 3
   LINE (X1 - 1, Y2 + 1)-(X1 - 1, Y1 - 1)

END SUB

