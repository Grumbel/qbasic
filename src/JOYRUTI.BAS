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
   IF Knopf = -1 THEN CLS : GOTO StickAbfrage
GOTO StickSchleife3


StickAbfrage:
StickX = STICK(0)
StickY = STICK(1)
StickX = -StickMitteX + StickX
StickY = -StickMitteY + StickY
IF StickX < 0 THEN a = StickX / StickLeft * 100
IF StickX > 0 THEN a = -StickX / StickRight * 100
IF StickY < 0 THEN b = -StickY / StickForw * 100
IF StickY > 0 THEN b = StickY / StickBack * 100
PRINT CINT(a); CINT(b)
GOTO StickAbfrage

