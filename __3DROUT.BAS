DECLARE SUB Joystick ()
'Formeln fÅr 3D-Objekte
DECLARE FUNCTION DX! (Abstnd!, aaaax!)
DECLARE FUNCTION DY! (Abstnnd!, aaaax!)

'3D Formel fÅr Rutine
DECLARE FUNCTION Zoom! (x!)

COMMON SHARED Abstnd!, aaax!, xPos%, yPos%, Richtung%, LZoom%
COMMON SHARED za%, da%, db%, LabyX%, LabyY%, aaaax!, grum, baaax!

COMMON SHARED StickMitteX, StickMitteY, StickRight, StickForw
COMMON SHARED StickBack, StickLeft, StickX, StickY
COMMON SHARED Stick2Back, Stick2Left, Stick2Forw, Stick2Right
COMMON SHARED Stick2MitteY, Stick2MitteX

DECLARE FUNCTION RotX! (x!, y!, cx!, cy!, ang!)
COMMON SHARED RotY

CALL Joystick

CONST pi = 3.1415927#
angl = 0

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
Stick2Y = STICK(3)
StickX = -StickMitteX + StickX
StickY = -StickMitteY + StickY
Stick2Y = StickMitteYY + Stick2Y

IF StickX < -Ziro% THEN a = StickX / StickLeft * 100
IF StickX > Ziro% THEN a = -StickX / StickRight * 100
IF StickX < Ziro% AND StickX > -Ziro% THEN a = 0

IF StickY < -Ziro% THEN b = -StickY / StickForw * 100
IF StickY > Ziro% THEN b = StickY / StickBack * 100
IF StickY < Ziro% AND StickY > -Ziro% THEN b = 0

IF Stick2Y < -Ziro% THEN d = Stick2Y / Stick2Back * 100 - 100
IF Stick2Y > Ziro% THEN d = -Stick2Y / Stick2Forw * 100 - 100
IF Stick2Y < Ziro% AND Stick2Y > -Ziro% THEN c = 0

x = x + a / 3
y = y + b / 3
z = z + d
PRINT d; Stick2Y; STICK(3)
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

FUNCTION RotX (x, y, cx, cy, ang)

b = cx - x
a = cy - y
c = SQR(a ^ 2 + b ^ 2)

winkl! = ATN(a / b)

nw = winkl! + (ang * pi / 180)

cb = SIN(270 * pi / 180 - nw) * c
ca = SIN(nw) * c

RotY = cy - ca

RotX = cx + cb

END FUNCTION

FUNCTION Zoom! (x!)

IF x! <= 0 THEN x! = 1

y! = 320 - (640 / (x!))  '+ .546875

Zoom! = y!

END FUNCTION

