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
COMMON SHARED X            AS INTEGER
COMMON SHARED y            AS INTEGER

CALL Joystick

SCREEN 12

CONST pi = 3.1415927#

Start:

'X = CINT(640 * RND)
'Y = CINT(480 * RND)

fx = 320 'CINT(640 * RND)
fy = 220 'CINT(640 * RND)

CALL JoystickAbfrage

LINE -(X, y)
PSET (fx, fy), 14

IF fy = y THEN fy = y + .1

LOCATE 1, 1
PRINT X; y; (TAN((fx - X) / (fy - y)) / pi * 180)

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
  
   IF StickX < 0 THEN StickA = -StickX / StickLeft * 100
   IF StickX > 0 THEN StickA = StickX / StickRight * 100
   IF StickY < 0 THEN StickB = -StickY / StickForw * 100
   IF StickY > 0 THEN StickB = StickY / StickBack * 100
  
   'StickD = StickYY / (Stick2Back + Stick2Forw) * 100
  
   IF StickD <= 0 THEN StickD = .1

   'Gr”áe des NullFeldes
   IF ABS(StickA) < 7 THEN StickA = 0
   IF ABS(StickB) < 7 THEN StickB = 0

   X = X + StickA / 10
   y = y + StickB / 10
  
END SUB

