DECLARE SUB ZustandTest ()
DECLARE SUB SetScreen ()
DECLARE SUB SetFire ()
DECLARE SUB Explosion (xExp%, yExp%)
DECLARE SUB DefAstro ()
DECLARE SUB SetAstro ()
DECLARE SUB SetShip ()
DECLARE SUB Joystick ()
DECLARE SUB JoystickAbfrage ()
DECLARE SUB SetSterne ()
DECLARE SUB DefSterne ()
DECLARE SUB Pause (PauseLenght!)

COMMON SHARED StickMitteX   AS INTEGER
COMMON SHARED StickMitteY   AS INTEGER
COMMON SHARED StickBack     AS INTEGER
COMMON SHARED StickForw     AS INTEGER
COMMON SHARED StickLeft     AS INTEGER
COMMON SHARED StickRight    AS INTEGER
COMMON SHARED Stick2MitteX  AS INTEGER
COMMON SHARED Stick2MitteY  AS INTEGER
COMMON SHARED Stick2Back    AS INTEGER
COMMON SHARED Stick2Forw    AS INTEGER
COMMON SHARED Stick2Left    AS INTEGER
COMMON SHARED Stick2Right   AS INTEGER
COMMON SHARED x             AS INTEGER
COMMON SHARED y             AS INTEGER
COMMON SHARED d             AS INTEGER
COMMON SHARED e             AS INTEGER
COMMON SHARED PauseLenght   AS INTEGER
COMMON SHARED xPos          AS INTEGER
COMMON SHARED yPos          AS INTEGER
COMMON SHARED TempxPos      AS INTEGER
COMMON SHARED TempyPos      AS INTEGER
COMMON SHARED xFire         AS INTEGER
COMMON SHARED yFire         AS INTEGER
COMMON SHARED Fire          AS INTEGER
COMMON SHARED Energie       AS INTEGER
COMMON SHARED ScrEnergie    AS INTEGER
COMMON SHARED Ende          AS INTEGER
COMMON SHARED MaxSpeed      AS INTEGER
COMMON SHARED MaxSterne     AS INTEGER
COMMON SHARED Score         AS LONG
COMMON SHARED AstroNum      AS INTEGER
COMMON SHARED TempAstroNum  AS INTEGER
COMMON SHARED MaxAstroSpeed AS INTEGER
COMMON SHARED Level         AS INTEGER
'COMMON SHARED MaxSchuss    AS INTEGER

SCREEN 9

CONST MaxEnergie = 20
CONST MaxAstro = 100
MaxSterne = 50
DIM SHARED Sterne%(MaxSterne + 1, 3)
DIM SHARED Astro%(MaxAstro + 1, 3)
DIM Schuesse%(MaxSchuss + 1, 3)

LOCATE 8, 29
PRINT "    Willkommen zu    "
LOCATE 9, 29
PRINT "StarShip vs. Astroids"
LOCATE 10, 29
PRINT "        V 0.7�       "
LOCATE 12, 29
PRINT "                     "
LOCATE 15, 29
PRINT "   Knopf f�r Start   "
DO UNTIL STRIG(1) = -1: LOOP

SOUND 1000, 5

Neubeginn:
CLS
RANDOMIZE TIMER

Ende = 0
'MaxSchuss = 5

MaxSpeed = 10
MaxSterne = 50
CONST SternNum% = 50
Level = 1

MaxAstroSpeed = 10
TempAstroNum = 5
AstroNum = TempAstroNum

xPos = 320
yPos = 200
Energie = MaxEnergie

CALL Joystick
CALL DefSterne
CALL DefAstro

StartPrgSchleife:
  
   CALL JoystickAbfrage
   CALL SetScreen
   CALL ZustandTest
   
   Score = Score - 1

   IF Ende = 1 THEN
      LOCATE 10, 35
      PRINT "Game Over"
      LOCATE 12, 34
      PRINT "nochmal j/n"
    
SelectSchleife:
      SELECT CASE INKEY$
         CASE "j"
         GOTO Neubeginn

         CASE "n"
         END
         
         CASE ELSE
         GOTO SelectSchleife
      END SELECT

   END IF

   GOTO StartPrgSchleife

Abspann:

CLS

'Routine zum Erzeugen von Scroll Effekten noch nicht integriert

StartScroll:
FOR z = 1 TO 17

DATA " "
DATA " "
DATA "Dies ist ein Programm zum erzeugen von Scroll-Effekten."
DATA " "
DATA "Es m�ssen dazu nur die entsprechenden DATA - Zeilen ge�ndert werden."
DATA "Zeile 10 mu� entsprechend ge�ndert werden (Nummer �ndern)"
DATA " "
DATA "Dies ist ein Test -------- tseT nie tsi seiD"
DATA " "
DATA "Die Nummern hinter den Zeilen geben die Anzahl der Buchstaben an,"
DATA "dies ist wichtig damit der Text in der Mitte plaziert werden kann."
DATA " "
DATA " "
DATA " "
DATA " "
DATA " "
DATA " "

Pause (10000)

READ a$
a = LEN(a$)
LOCATE 24, 40 - a / 2
fa = INT(15 * RND) + 1
COLOR fa: PRINT a$
NEXT z



'erzeugt Endlosschleife
RESTORE
GOTO StartScroll

SUB DefAstro

FOR za = 1 TO AstroNum
   Astro%(za, 1) = CINT(640 * RND)
   Astro%(za, 2) = CINT(313 * RND) + 37
   Astro%(za, 3) = CINT(MaxSpeed * RND) + 3
NEXT za

END SUB

SUB DefSterne

FOR za = 1 TO SternNum%
   Sterne%(za, 1) = CINT(640 * RND)
   Sterne%(za, 2) = CINT(320 * RND) + 20
   Sterne%(za, 3) = CINT(MaxSpeed * RND) + 1
NEXT za

END SUB

SUB Explosion (xExp%, yExp%)

FOR r = 1 TO 35
   CIRCLE (xExp% - 10, yExp%), r, 4
   CIRCLE (xExp% - 10, yExp%), r / 2, 14
NEXT r


FOR r = 35 TO 1 STEP -1
   CIRCLE (xExp% - 10, yExp%), r, 0
   CIRCLE (xExp% - 10, yExp%), r / 2, 0
NEXT r

ScrEnergie = 0

LINE (0, 15)-(640, 15)

END SUB

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

   'Gr��e des NullFeldes
   IF ABS(StickA) < 7 THEN StickA = 0
   IF ABS(StickB) < 7 THEN StickB = 0

   xPos = xPos + StickA / 25
   yPos = yPos + StickB / 25

   IF Knopf1 = -1 AND Fire = 0 THEN xFire = xPos: yFire = yPos: Fire = 1
   IF Knopf2 = -1 THEN CLS

END SUB

SUB Pause (PauseLenght)

FOR za = 1 TO PauseLenght
NEXT za

END SUB

SUB SetAstro



FOR d = 1 TO AstroNum

   x = Astro%(d, 1)
   x = x - Astro%(d, 3)
   Astro%(d, 1) = x

   IF x < -22 - MaxAstroSpeed THEN
      Astro%(d, 1) = 640
      Astro%(d, 2) = CINT(313 * RND) + 37
   END IF

   x = Astro%(d, 1)
   y = Astro%(d, 2)

   'Kollison Ship/Astro
   IF (xPos + 15 > x - 11 AND xPos + 15 < x + 11) OR (xPos - 25 > x - 11 AND (xPos - 25 < x + 11)) THEN
    IF (yPos - 5 < y AND yPos - 5 > y - 17) OR (yPos + 5 > y - 17 AND yPos + 5 < y) THEN
      CALL Explosion(xPos, yPos)
      Energie = Energie - 1
     
      LINE (xFire, yFire)-STEP(3, 2), 0, BF
    
      LINE (x + Astro%(d, 3), y)-STEP(10, -0), 0
      LINE -STEP(1, -10), 0
      LINE -STEP(-7, -5), 0
      LINE -STEP(-10, -2), 0
      LINE -STEP(-5, 10), 0
      LINE -(x + Astro%(d, 3), y), 0

      Astro%(d, 1) = 640
    
      Astro%(d, 2) = CINT(320 * RND) + 30
    
      x = Astro%(d, 1)
      y = Astro%(d, 2)
    END IF
   END IF
  
   'Kollision Astro/Schu�
  
   IF Fire = 1 AND xFire > x - 11 AND xFire < x + 11 AND yFire < y AND yFire > y - 17 THEN
     
      CALL Explosion(xFire, yFire)
      Fire = 0
         
      Score = Score + 200

      LINE (xFire, yFire)-STEP(3, 2), 0, BF
     
      LINE (x + Astro%(d, 3), y)-STEP(10, -0), 0
      LINE -STEP(1, -10), 0
      LINE -STEP(-7, -5), 0
      LINE -STEP(-10, -2), 0
      LINE -STEP(-5, 10), 0
      LINE -(x + Astro%(d, 3), y), 0

      'Astro%(AstroNum, 1) = Astro%(d, 1)
      'Astro%(AstroNum, 2) = Astro%(d, 2)
      'Astro%(AstroNum, 3) = Astro%(d, 3)
          
      Astro%(d, 1) = Astro%(AstroNum, 1)
      Astro%(d, 2) = Astro%(AstroNum, 2)
      Astro%(d, 3) = Astro%(AstroNum, 3)

      AstroNum = AstroNum - 1

      'Astro%(d, 1) = 640
      'Astro%(d, 2) = CINT(320 * RND) + 30
      GOTO 20

      'x = Astro%(d, 1)
      'y = Astro%(d, 2)

   END IF
  
   'LINE (x - 11, y)-(x + 11, y - 22), , BF
  
   SELECT CASE Astro%(d, 3)

      CASE 0 TO 10
      LINE (x + Astro%(d, 3), y)-STEP(10, -0), 0
      LINE -STEP(1, -10), 0
      LINE -STEP(-7, -5), 0
      LINE -STEP(-10, -2), 0
      LINE -STEP(-5, 10), 0
      LINE -(x + Astro%(d, 3), y), 0

      LINE (x, y)-STEP(10, -0), 7
      LINE -STEP(1, -10), 7
      LINE -STEP(-7, -5), 7
      LINE -STEP(-10, -2), 7
      LINE -STEP(-5, 10), 7
      LINE -(x, y), 7
  
      CASE 10 TO 20
      LINE (x + Astro%(d, 3), y)-STEP(10, -0), 0
      LINE -STEP(1, -10), 0
      LINE -STEP(-7, -5), 0
      LINE -STEP(-10, -2), 0
      LINE -STEP(-5, 10), 0
      LINE -(x + Astro%(d, 3), y), 0

      LINE (x, y)-STEP(10, 0), 2
      LINE -STEP(1, -10), 2
      LINE -STEP(-7, -5), 2
      LINE -STEP(-10, -2), 2
      LINE -STEP(-5, 10), 2
      LINE -(x, y), 2
 

      CASE 15 TO 50
      LINE (x + Astro%(d, 3), y)-STEP(10, -0), 0
      LINE -STEP(1, -10), 0
      LINE -STEP(-7, -5), 0
      LINE -STEP(-10, -2), 0
      LINE -STEP(-5, 10), 0
      LINE -(x + Astro%(d, 3), y), 0

      LINE (x, y)-STEP(10, -0), 7
      LINE -STEP(1, -10), 7
      LINE -STEP(-7, -5), 7
      LINE -STEP(-10, -2), 7
      LINE -STEP(-5, 10), 7
      LINE -(x, y), 14
 

   END SELECT

20
NEXT d

END SUB

SUB SetFire

TempxFire = xFire
TempYFire = yFire
xFire = xFire + 10

IF xFire > 650 THEN Fire = 0

LINE (xFire, yFire)-STEP(10, 1), 14, BF

LINE (TempxFire, TempYFire)-STEP(10, 1), 0, BF

END SUB

SUB SetScreen

CALL SetSterne
CALL SetShip
CALL SetAstro
'IF Bonus = 1 THEN CALL SetBonus

IF Level <> ScrLevel THEN
   LOCATE 1, 70
   PRINT "Level:"; Level
   ScrLevel = Level
END IF

IF Energie <> ScrEnergie AND Energie >= 0 OR Energie = 0 THEN
   LOCATE 1, 1
   PRINT STRING$(MaxEnergie, "�")

   LOCATE 1, 1
   PRINT STRING$(Energie, "�")
   ScrEnergie = Energie
   LINE (0, 15)-(640, 15)
END IF

LOCATE 1, 25
PRINT "Punkte:"; Score

LOCATE 1, 45
PRINT AstroNum; " Asteroiden    "

END SUB

SUB SetShip

LINE (TempxPos, TempyPos)-STEP(-20, 5), 0
LINE -STEP(-5, -10), 0
LINE -(TempxPos, TempyPos), 0
LINE -STEP(5, 0), 0
LINE -STEP(5, 2), 0
LINE -STEP(5, 3), 0
LINE -(TempxPos - 20, TempyPos + 5), 0


LINE (xPos, yPos)-STEP(-20, 5)
LINE -STEP(-5, -10)
LINE -(xPos, yPos)
LINE -STEP(5, 0)
LINE -STEP(5, 2)
LINE -STEP(5, 3)
LINE -(xPos - 20, yPos + 5)

'pSET (xPos, yPos), 4

TempxPos = xPos
TempyPos = yPos

END SUB

SUB SetSterne

FOR d = 1 TO SternNum%
 
   x = Sterne%(d, 1)
   x = x - Sterne%(d, 3)
   Sterne%(d, 1) = x

   IF x < -20 + MaxSpeed THEN Sterne%(d, 1) = 640: Sterne%(d, 2) = CINT(320 * RND) + 20

   x = Sterne%(d, 1)
   y = Sterne%(d, 2)

   SELECT CASE Sterne%(d, 3)
  
      CASE 0 TO 3
      PSET (x + Sterne%(d, 3), y), 0
      PSET (x, y), 1

      CASE 4 TO 7
      PSET (x + Sterne%(d, 3), y), 0
      PSET (x, y), 9

      CASE 8 TO 10
      PSET (x + Sterne%(d, 3), y), 0
      PSET (x, y), 15

   END SELECT

NEXT d

END SUB

SUB ZustandTest

IF Energie < 0 THEN
   Ende = 1
   EXIT SUB
END IF

IF Fire = 1 THEN CALL SetFire

'Screen Begrenzung
IF xPos < 35 THEN xPos = 35
IF xPos > 620 THEN xPos = 620

IF yPos < 30 THEN yPos = 30
IF yPos > 330 THEN yPos = 330

IF AstroNum = 0 THEN
   LOCATE 12, 23
   PRINT "vorbereiten f�r den n�chsten Level"
   Pause (35000)
   LOCATE 12, 23
   PRINT "                                  "
   AstroNum = TempAstroNum + 5
   TempAstroNum = AstroNum
   MaxAstroSpeed = MaxAstroSpeed + 5
   Level = Level + 1
   CALL DefAstro
END IF

END SUB

