DECLARE SUB Joystick ()
'Formeln fÅr 3D-Objekte
DECLARE FUNCTION DX! (Abstnd!, aaaax!)
DECLARE FUNCTION DY! (Abstnnd!, aaaax!)

'3D Formel fÅr Rutine
DECLARE FUNCTION Zoom! (x!)

COMMON SHARED Abstnd!, aaax!, xPos%, yPos%, Richtung%, LZoom%
COMMON SHARED za%, da%, db%, LabyX%, LabyY%, aaaax!, grum, baaax!

'COMMON SHARED StickMitteX, StickMitteY, StickRight, StickForw
'COMMON SHARED StickBack, StickLeft, StickX, StickY
'COMMON SHARED Stick2Back, Stick2Forw, StickYY, StickMitteYY

'CALL Joystick
'PRINT "StickMitteX"; StickMitteX
'PRINT "StickMitteY"; StickMitteY
'PRINT "StickMitteYY"; StickMitteYY
'PRINT "StickLeft"; StickLeft
'PRINT "StickRight"; StickRight
'PRINT "StickForw"; StickForw
'PRINT "StickBack"; StickBack
'PRINT "Stick2Forw"; StickForw
'PRINT "Stick2Back"; StickBack

CONST StickMitteX = 108
CONST StickMitteY = 110
CONST StickMitteYY = 121
CONST StickLeft = 111
CONST StickRight = -102
CONST StickForw = -106
CONST StickBack = 103
CONST Stick2Forw = -106
CONST Stick2Back = 103

CONST XtoY! = .546875
CONST Ziro% = 5

da% = 1

y = -175
10
SCREEN 9, , da%, db%
CLS

StickAbfrage:
StickX = STICK(0)
StickY = STICK(1)
StickYY = STICK(3)
StickX = -StickMitteX + StickX
StickY = -StickMitteY + StickY
StickYY = StickMitteYY + StickYY

IF StickX < -Ziro% THEN a = StickX / StickLeft * 100
IF StickX > Ziro% THEN a = -StickX / StickRight * 100
IF StickX < Ziro% AND StickX > -Ziro% THEN a = 0

IF StickY < -Ziro% THEN b = -StickY / StickForw * 100
IF StickY > Ziro% THEN b = StickY / StickBack * 100
IF StickY < Ziro% AND StickY > -Ziro% THEN b = 0

IF StickYY < -Ziro% THEN d = StickYY / Stick2Back * 100 - 200
IF StickYY > Ziro% THEN d = -StickYY / Stick2Forw * 100 - 200
IF StickYY < Ziro% AND StickYY > -Ziro% THEN c = 0

x = x - a / 3
y = y + b / 3
z = z + d

LINE (DX!(320 + x, 740 + z), DY!(175 + y, 740 + z))-(DX!(220 + x, 740 + z), DY!(175 + y, 740 + z))
LINE (DX!(320 + x, 740 + z), DY!(100 + y, 740 + z))-(DX!(220 + x, 740 + z), DY!(175 + y, 740 + z))
LINE (DX!(320 + x, 740 + z), DY!(175 + y, 740 + z))-(DX!(320 + x, 740 + z), DY!(100 + y, 740 + z))
LINE (DX!(320 + x, 740 + z), DY!(175 + y, 740 + z))-(DX!(320 + x, 640 + z), DY!(175 + y, 640 + z))
LINE (DX!(320 + x, 640 + z), DY!(100 + y, 640 + z))-(DX!(220 + x, 640 + z), DY!(175 + y, 640 + z))
LINE (DX!(320 + x, 640 + z), DY!(100 + y, 640 + z))-(DX!(320 + x, 740 + z), DY!(100 + y, 740 + z))

LINE (DX!(270 + x, 50), DY!(137 + y, 50))-(DX!(320, 640), DY!(175, 640)), 4

IF da% = 1 THEN da% = 0: db% = 1: GOTO 10
IF db% = 1 THEN da% = 1: db% = 0

GOTO 10

FUNCTION DX! (Abstnd, aaaax!) STATIC

aaaax! = aaaax! / 640

xxxx = ((Abstnd - 320) / 175) * (Zoom!(aaaax!) * XtoY!) + 640 - Abstnd
DX! = xxxx

END FUNCTION

FUNCTION DY! (Abstnnd, aaaax!) STATIC

aaaax! = aaaax! / 640

Abstnnd = 350 - Abstnnd

yyyy = ((Abstnnd - 175) / 320) * (Zoom!(aaaax!)) + 350 - Abstnnd

DD! = yyyy
DY! = yyyy

END FUNCTION

SUB Joystick

'PRINT "Joystick in Mittelstellung"

StickSchleife1:
'   StickMitteX = STICK(0)
'   StickMitteY = STICK(1)
'   StickMitteYY = STICK(3)
   Knopf = STRIG(1)
   IF Knopf = -1 THEN CLS : GOTO Stick1
GOTO StickSchleife1

Stick1:
PRINT "Joystick oben/rechts und Knopf"
FOR za = 1 TO 10000
NEXT za

StickSchleife2:
'   StickRight = -StickMitteX + STICK(0)
'   StickForw = -StickMitteY + STICK(1)
'   Stick2Forw = -StickMitteYY + STICK(3)
   Knopf = STRIG(1)
   IF Knopf = -1 THEN CLS : GOTO Stick2
GOTO StickSchleife2

Stick2:

PRINT "Joystick unten/links und Knopf"
FOR za = 1 TO 10000
NEXT za

StickSchleife3:
'   StickLeft = -StickMitteX + STICK(0)
'   StickBack = -StickMitteY + STICK(1)
'   Stick2Back = -StickMitteYY + STICK(3)
   Knopf = STRIG(1)
   IF Knopf = -1 THEN CLS : GOTO EndSub
GOTO StickSchleife3

EndSub:

END SUB

FUNCTION Zoom! (x!)

IF x! <= 0 THEN x! = 1

y! = 320 - (640 / (x!))  '+ .546875

Zoom! = y!

END FUNCTION

