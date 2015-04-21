DECLARE SUB PutBar ()
DECLARE SUB DoEffekt ()
DECLARE SUB DoEvent ()
DECLARE FUNCTION KnopfOff! ()
DECLARE SUB InitJoystick ()
DECLARE SUB WaitForEvent ()
DECLARE SUB PutIcons ()
DECLARE SUB Verschieben ()
DECLARE SUB PutLeiste ()
DECLARE SUB ScreenWechsel ()
DECLARE SUB PutIcon (xPos AS INTEGER, yPos AS INTEGER, Farbe AS INTEGER, Farbe1 AS INTEGER)
DECLARE SUB ButtonNeg (xPos AS INTEGER, yPos AS INTEGER)
DECLARE SUB Button (xPos AS INTEGER, yPos AS INTEGER)
DECLARE SUB PutCursor (xPos AS INTEGER, yPos AS INTEGER, Farbe AS INTEGER)
DECLARE SUB Joystick ()
DECLARE SUB JoystickAbfrage ()
DECLARE FUNCTION ButtonReq! ()

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
COMMON SHARED TempX        AS INTEGER
COMMON SHARED TempY        AS INTEGER
COMMON SHARED Knopf1       AS INTEGER
COMMON SHARED TempKnopf1   AS INTEGER
COMMON SHARED scr1         AS INTEGER
COMMON SHARED scr2         AS INTEGER
COMMON SHARED PosX         AS INTEGER
COMMON SHARED PosY         AS INTEGER
COMMON SHARED Farbe        AS INTEGER
COMMON relX AS INTEGER
COMMON relY AS INTEGER
COMMON SHARED ButtonReqs
COMMON SHARED i AS INTEGER
COMMON SHARED MaxButtons  AS INTEGER

InitJoystick

MaxButtons = 4
PosX = 320 - 64
PosY = 100

DIM SHARED Colr(0 TO 250) AS INTEGER

Colr(0) = 4
Colr(1) = 1
Colr(2) = 2
Colr(3) = 9
Colr(4) = 2
Colr(5) = 9

scr1 = 1

SCREEN 9

DO
   ScreenWechsel
  
   WaitForEvent
 
   PutBar

   DoEvent
  
LOOP

SUB Button (xPos AS INTEGER, yPos AS INTEGER)

   LINE (xPos, yPos)-STEP(32, 20), 7, BF
   LINE (xPos, yPos)-STEP(32, 0), 15, BF
   LINE (xPos, yPos)-STEP(0, 20), 15, BF
   LINE (xPos + 32, yPos + 20)-STEP(-32, 0), 8, BF
   LINE (xPos + 32, yPos + 20)-STEP(0, -20), 8, BF

END SUB

SUB ButtonNeg (xPos AS INTEGER, yPos AS INTEGER)

   LINE (xPos, yPos)-STEP(32, 20), 7, BF
   LINE (xPos, yPos)-STEP(32, 0), 8, BF
   LINE (xPos, yPos)-STEP(0, 20), 8, BF
   LINE (xPos + 32, yPos + 20)-STEP(-32, 0), 15, BF
   LINE (xPos + 32, yPos + 20)-STEP(0, -20), 15, BF

END SUB

FUNCTION ButtonReq

   ButtonReq = -1
  
   IF x > PosX AND x < PosX + 32 * (MaxButtons + 1) AND y < PosY - 2 AND y > PosY - 10 THEN
      ButtonReq = 255
      EXIT FUNCTION
   END IF
  

   FOR i = 1 TO MaxButtons + 1
      IF x > PosX + 32 * (i - 1) AND x < PosX + 32 * i AND y > PosY AND y < PosY + 20 THEN
         ButtonReq = i - 1
         EXIT FOR
      END IF
   NEXT i
  
   'IF x > PosX AND x < PosX + 32 AND y > PosY AND y < PosY + 20 THEN
   '   ButtonReq = 0
   'ELSEIF x > PosX + 32 AND x < PosX + 64 AND y > PosY AND y < PosY + 20 THEN
   '   ButtonReq = 1
   'ELSEIF x > PosX + 64 AND x < PosX + 96 AND y > PosY AND y < PosY + 20 THEN
   '   ButtonReq = 2
   'ELSEIF x > PosX + 96 AND x < PosX + 128 AND y > PosY AND y < PosY + 20 THEN
   '   ButtonReq = 3
   'ELSE
   '   ButtonReq = -1
   'END IF

END FUNCTION

SUB DoEvent
  
   IF KnopfOff THEN
      LINE (0, 0)-(20, 10), ButtonReqs + 1, BF
   END IF

END SUB

SUB InitJoystick

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
'  Stick2Y = STICK(3)

  Knopf1 = STRIG(1)
IF STRIG(3) = -1 THEN x = PosX: y = PosY
 
   StickX = -StickMitteX + StickX
   StickY = -StickMitteY + StickY
 
   IF StickX < 0 THEN StickA = -StickX / StickLeft * 100
   IF StickX > 0 THEN StickA = StickX / StickRight * 100
   IF StickY < 0 THEN StickB = -StickY / StickForw * 100
   IF StickY > 0 THEN StickB = StickY / StickBack * 100
 
   'StickD = StickYY / (Stick2Back + Stick2Forw) * 100
  
  ' IF StickD <= 0 THEN StickD = .1

   'Gr”áe des NullFeldes
   IF ABS(StickA) < 7 THEN StickA = 0
   IF ABS(StickB) < 7 THEN StickB = 0

   x = x + StickA / 10
   y = y + StickB / 8

   IF x > 639 THEN x = 639
   IF x < 0 THEN x = 0
   IF y > 349 THEN y = 349
   IF y < 0 THEN y = 0

END SUB

FUNCTION KnopfOff

   IF Knopf1 = 0 AND TempKnopf1 = -1 THEN
      KnopfOff = 1
   ELSE
      KnopfOff = 0
   END IF

END FUNCTION

SUB PutBar
  
   PutLeiste
   PutIcons
  
   SELECT CASE ButtonReqs + 1
      CASE 1 TO MaxButtons + 2
         IF Knopf1 = -1 THEN
            Farbe = Colr(ButtonReqs)
            CALL ButtonNeg(PosX + 32 * ButtonReqs, PosY)
            CALL PutIcon(PosX + 32 * ButtonReqs, PosY + 10, Farbe, 0)
         ELSE
            CALL Button(PosX + 32 * ButtonReqs, PosY)
            Farbe = Colr(ButtonReqs)
            CALL PutIcon(PosX + 32 * ButtonReqs - 1, PosY + 10 - 1, Farbe, 0)
         END IF
      CASE 256
         IF Knopf1 = -1 AND Knopf1 <> TempKnopf1 THEN
            CALL Verschieben
         END IF
   END SELECT

   CALL PutCursor(x, y, 5)

END SUB

SUB PutCursor (xPos AS INTEGER, yPos AS INTEGER, Farbe AS INTEGER)

   LINE (xPos, yPos)-STEP(5, 2), Farbe
   LINE (xPos, yPos)-STEP(2, 5), Farbe
   
END SUB

SUB PutIcon (xPos AS INTEGER, yPos AS INTEGER, Farbe AS INTEGER, Farbe1 AS INTEGER)
   CIRCLE (xPos + 16, yPos), 5, Farbe
   PAINT (xPos + 16, yPos), Farbe
   CIRCLE (xPos + 16, yPos), 5, Farbe1
END SUB

SUB PutIcons
  
   FOR i = 0 TO MaxButtons
      Farbe = Colr(i)
      CALL PutIcon(PosX + 32 * i, PosY + 10, Farbe, 0)
   NEXT i

END SUB

SUB PutLeiste
  
   LINE (PosX - 2, PosY - 2)-(PosX + 32 * (MaxButtons + 1) + 2, PosY + 2 + 20), 8, BF
   LINE (PosX - 1, PosY - 1)-(PosX + 32 * (MaxButtons + 1) + 1, PosY + 20 + 1), 7, BF
   LINE (PosX - 2, PosY - 2)-(PosX + 32 * (MaxButtons + 1) + 1, PosY - 2), 15
   LINE (PosX - 2, PosY - 2)-(PosX - 2, PosY + 20 + 1), 15
  
   'Setzt Trenn-Striche
   'LINE (PosX + 32, PosY + 2)-(PosX + 32, PosY + 18), 8
   'LINE (PosX + 64, PosY + 2)-(PosX + 64, PosY + 18), 8
   'LINE (PosX + 96, PosY + 2)-(PosX + 96, PosY + 18), 8
 
   LINE (PosX - 2, PosY - 3)-(PosX + 32 * (MaxButtons + 1) + 2, PosY - 10), 1, BF

END SUB

SUB ScreenWechsel

   SWAP scr1, scr2
   SCREEN 9, , scr1, scr2
   FOR za = 1 TO 200
   NEXT za
   CLS

END SUB

SUB Verschieben
DO
relX = x
relY = y
        
 ScreenWechsel
          
  CALL PutLeiste
  CALL PutIcons
 CALL PutCursor(x, y, 15)
          
            JoystickAbfrage

            PosX = PosX + x - relX
            PosY = PosY + y - relY
         LOOP UNTIL Knopf1 = 0

END SUB

SUB WaitForEvent
  
   TempKnopf1 = Knopf1
   TempX = x
   TempY = y
  
   DO
      JoystickAbfrage
   
   LOOP WHILE x = TempX AND y = TempY AND Knopf1 = TempKnopf1
 
   ButtonReqs = ButtonReq

'   IF TempKnopf1 = -1 AND Knopf1 = 0 THEN BEEP
END SUB

