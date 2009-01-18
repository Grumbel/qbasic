SCREEN 9
CLS
10
PRINT "Joystick in Mittelstellung"

StickSchleife1:
   StickMitteX = STICK(0)
   StickMitteY = STICK(0)
   Knopf = STRIG(1)
   IF Knopf = -1 THEN CLS : GOTO Stick1
GOTO StickSchleife1

Stick1:
PRINT "Joystick oben/links und Knopf"
FOR za = 1 TO 10000
NEXT za

StickSchleife2:
   StickLeft = -StickMitteX + STICK(0)
   StickForw = -StickMitteY + STICK(1)
   Knopf = STRIG(1)
   IF Knopf = -1 THEN CLS : GOTO Stick2
GOTO StickSchleife2

Stick2:

PRINT "Joystick unten/rechts und Knopf"
FOR za = 1 TO 10000
NEXT za

StickSchleife3:
   StickRight = -StickMitteX + STICK(0)
   StickBack = -StickMitteY + STICK(1)
   Knopf = STRIG(1)
   IF Knopf = -1 THEN CLS : GOTO Stick3
GOTO StickSchleife3

Stick3:

PRINT "Joystick 2 zentrieren"
FOR za = 1 TO 10000
NEXT za

StickSchleife4:
   Stick2MitteX = STICK(2)
   Stick2MitteY = STICK(3)
   Knopf = STRIG(1)
   IF Knopf = -1 THEN CLS : GOTO Stick4
GOTO StickSchleife4


Stick4:
PRINT "Joystick 2 oben/links und Knopf"
FOR za = 1 TO 10000
NEXT za

StickSchleife5:
   Stick2Left = -Stick2MitteX + STICK(2)
   Stick2Forw = -Stick2MitteY + STICK(2)
   Knopf = STRIG(1)
   IF Knopf = -1 THEN CLS : GOTO Stick5
GOTO StickSchleife5

Stick5:

PRINT "Joystick 2 unten/rechts und Knopf"
FOR za = 1 TO 10000
NEXT za

StickSchleife6:
   Stick2Right = -Stick2MitteX + STICK(3)
   Stick2Back = -Stick2MitteY + STICK(3)
   Knopf = STRIG(1)
   IF Knopf = -1 THEN CLS : GOTO Werte
GOTO StickSchleife6


Werte:
PRINT "Werte:"
PRINT "Joystick 1:"
PRINT "StickMitteX:"; StickMitteX
PRINT "StickMitteY:"; StickMitteY
PRINT "StickBack:"; StickBack
PRINT "StickForw:"; StickForw
PRINT "StickLeft:"; StickLeft
PRINT "StickRight:"; StickRight
PRINT ""
PRINT "Joystick 2:"
PRINT "Stick2MitteX:"; Stick2MitteX
PRINT "Stick2MitteY:"; Stick2MitteY
PRINT "Stick2Back:"; Stick2Back
PRINT "Stick2Forw:"; Stick2Forw
PRINT "Stick2Left:"; Stick2Left
PRINT "Stick2Right:"; Stick2Right

PRINT ""
PRINT "Werte speichern? [j/n]"

InkeySchleife:
b$ = INKEY$
IF b$ = "j" THEN GOTO Speichern
IF b$ = "n" THEN CLS : GOTO StickAbfrage
GOTO InkeySchleife

Speichern:

OPEN "C:\Basic\JoyStick.ini" FOR OUTPUT AS #1
  
   PRINT #1, StickMitteX
   PRINT #1, StickMitteY
   PRINT #1, StickBack
   PRINT #1, StickForw
   PRINT #1, StickLeft
   PRINT #1, StickRight
  
   PRINT #1, Stick2MitteX
   PRINT #1, Stick2MitteY
   PRINT #1, Stick2Back
   PRINT #1, Stick2Forw
   PRINT #1, Stick2Left
   PRINT #1, Stick2Right


CLOSE

CLS

StickAbfrage:
StickX = STICK(0)
StickY = STICK(1)
Stick2X = STICK(2)
Stick2Y = STICK(3)

StickX = StickX - StickMitteX
StickY = StickY - StickMitteY
Stick2X = Stick2X - Stick2MitteX
Stick2Y = Stick2Y - Stick2MitteY

IF StickX < 0 THEN a = -StickX / StickLeft * 100
IF StickX > 0 THEN a = StickX / StickRight * 100
IF StickY < 0 THEN b = -StickY / StickForw * 100
IF StickY > 0 THEN b = StickY / StickBack * 100

IF Stick2X < 0 THEN c = Stick2X / Stick2Left * 100
IF Stick2X > 0 THEN c = -Stick2X / Stick2Right * 100
IF Stick2Y < 0 THEN d = -Stick2Y / Stick2Forw * 100
IF Stick2Y > 0 THEN d = Stick2Y / Stick2Back * 100

LOCATE 1, 1:
PRINT "Joystick 1:"
PRINT "X-Achse:"; CINT(a)
PRINT "Y-Achse:"; CINT(b)
PRINT "Joystick 2:"
PRINT "X-Achse:"; CINT(c)
PRINT "Y-Achse:"; CINT(d)

LINE (200, 190)-(440, 205), 0, BF
LINE (320, 190)-STEP(a, 10), 4, BF

LINE (310, 90)-(330, 310), 0, BF
LINE (310, 200)-STEP(20, b), 1, BF

PSET (320 + a, 200 + b)

IF INKEY$ = "r" THEN GOTO 10
GOTO StickAbfrage

