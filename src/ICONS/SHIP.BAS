SCREEN 12


Datei$ = "c:\basic\icons\links.ico"

10
x = 34: Scann = 1: y = 0
CLS
OPEN Datei$ FOR RANDOM AS #1 LEN = 1
FIELD #1, 1 AS a$

FOR a = 638 TO 127 STEP -1

   GET #1, a
   x = x - 2
   IF x < 1 THEN x = 32: y = y + 1

   LOCATE 20, 20: PRINT "   "
   LOCATE 20, 20: PRINT HEX$(ASC(a$))

FOR d = 0 TO 1
   t = SCREEN(20, 20 + d)

   IF t = 32 THEN fa = 0: e = 0: GOTO 19
   IF CHR$(t) = "0" THEN fa = 0: GOTO 20
   IF CHR$(t) = "4" THEN fa = 1: GOTO 20
   IF CHR$(t) = "2" THEN fa = 2: GOTO 20
   IF CHR$(t) = "6" THEN fa = 3: GOTO 20
   IF CHR$(t) = "1" THEN fa = 4: GOTO 20
   IF CHR$(t) = "D" THEN fa = 5: GOTO 20
   IF CHR$(t) = "3" THEN fa = 6: GOTO 20
   IF CHR$(t) = "7" THEN fa = 7: GOTO 20
   IF CHR$(t) = "8" THEN fa = 8: GOTO 20
   IF CHR$(t) = "C" THEN fa = 9: GOTO 20
   IF CHR$(t) = "A" THEN fa = 10: GOTO 20
   IF CHR$(t) = "E" THEN fa = 11: GOTO 20
   IF CHR$(t) = "9" THEN fa = 12: GOTO 20
   IF CHR$(t) = "5" THEN fa = 13: GOTO 20
   IF CHR$(t) = "B" THEN fa = 14: GOTO 20
   IF CHR$(t) = "F" THEN fa = 15: GOTO 20
                                
19 PSET (x + d, y), tempfa
GOTO 21

20 tempfa = fa
e = d

21 PSET (x + e, y), fa
NEXT d
 
NEXT a

IF Sprite = 0 THEN
   DIM links(1 TO 167)
   GET (0, 0)-(32, 32), links
   Sprite = 1
   Datei$ = "c:\basic\icons\rechts.ico"
   CLOSE
   GOTO 10
END IF

IF Sprite = 1 THEN
   DIM rechts(1 TO 167)
   GET (0, 0)-(32, 32), rechts
   Sprite = 2
   Datei$ = "c:\basic\icons\Oben.ico"
   CLOSE
   GOTO 10
END IF

IF Sprite = 2 THEN
   DIM oben(1 TO 167)
   GET (0, 0)-(32, 32), oben
   Sprite = 3
   Datei$ = "c:\basic\icons\Unten.ico"
   CLOSE
   GOTO 10
END IF

IF Sprite = 3 THEN
   DIM unten(1 TO 167)
   GET (0, 0)-(32, 32), unten
   CLOSE
   GOTO Start
END IF

CLOSE

Start:
x = 0: y = 0
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

x = x + StickX / 10
y = y + StickY / 10

IF ABS(StickX) > 0 AND ABS(StickX) < 10 THEN StickX = 0
IF ABS(StickY) > 0 AND ABS(StickY) < 10 THEN StickY = 0


IF x < 0 THEN x = 0
IF x > 606 THEN x = 606

IF y < 0 THEN y = 0
IF y > 446 THEN y = 446


IF StickX < 0 THEN
   PUT (x, y), links, XOR
   GOTO 49
END IF

IF StickX > 0 THEN
   PUT (x, y), rechts, XOR
   GOTO 49
END IF

IF StickY < 0 THEN
   PUT (x, y), oben, XOR
   GOTO 49
END IF

IF StickY > 0 THEN
   PUT (x, y), unten, XOR
   GOTO 49
END IF

49 IF Durchgang = 0 THEN Durchgang = 1: GOTO 50

IF StickX < 0 THEN
   PUT (xx, yy), links, XOR
GOTO 50
END IF

IF StickX > 0 THEN
   PUT (xx, yy), rechts, XOR
   GOTO 50
END IF

IF StickY < 0 THEN
   PUT (xx, yy), oben, XOR
   GOTO 50
END IF

IF StickY > 0 THEN
   PUT (xx, yy), unten, XOR
END IF


50 xx = x: yy = y

IF STRIG(1) = -1 THEN BEEP: BEEP

GOTO StickAbfrage




