DECLARE SUB ShowScore (p1 AS INTEGER, p2 AS INTEGER)
DECLARE SUB Explo (ex AS INTEGER, ey AS INTEGER, Player AS INTEGER)
DECLARE SUB SetScr ()
DECLARE SUB Pause ()

COMMON x  AS INTEGER
COMMON y  AS INTEGER
COMMON x1 AS INTEGER
COMMON y1 AS INTEGER
COMMON m  AS INTEGER
COMMON n  AS INTEGER
COMMON m1 AS INTEGER
COMMON n1 AS INTEGER
COMMON SHARED a AS STRING
COMMON r AS INTEGER
COMMON p AS INTEGER
COMMON p1 AS INTEGER
COMMON Time AS SINGLE

CONST g = 20
CONST maxX = 639 - g
CONST maxY = 479 - g
CONST minX = 0 + g
CONST minY = 16 + g
CONST Farbe1 = 2
CONST Farbe2 = 1

CONST StartX = 300
CONST StartY = 240
CONST StartX1 = 340
CONST StartY1 = 240
CONST StartM = 0
CONST StartM1 = 0
CONST StartN = 1
CONST StartN1 = -1
CONST StartTime = 300

SCREEN 12
SetScr
CALL ShowScore(p, p1)
Time = StartTime
x = StartX
y = StartY
x1 = StartX1
y1 = StartY1

n = StartN
n1 = StartN1

Pause

DO UNTIL a$ = "q"

a$ = INKEY$
FOR za = 1 TO Time: NEXT za
Time = Time - .01

x = x + m
y = y + n
x1 = x1 + m1
y1 = y1 + n1

IF POINT(x, y) = Farbe2 OR POINT(x, y) = Farbe1 THEN
   p = p + 1
   CALL Explo(x, y, 1)
   x = StartX
   y = StartY
   x1 = StartX1
   y1 = StartY1
   m = StartM
   n = StartN
   m1 = StartM1
   n1 = StartN1
   Time = StartTime
   Pause
   CLS
   SetScr
   CALL ShowScore(p, p1)
END IF


IF POINT(x1, y1) = Farbe2 OR POINT(x1, y1) = Farbe1 THEN
   p1 = p1 + 1
   CALL Explo(x1, y1, 2)
   Pause
   SetScr
   CALL ShowScore(p, p1)
   x = StartX
   y = StartY
   x1 = StartX1
   y1 = StartY1
   m = StartM
   n = StartN
   m1 = StartM1
   n1 = StartN1
   Time = StartTime
END IF

PSET (x, y), Farbe1
PSET (x1, y1), Farbe2

SELECT CASE a$

   'Player 1
   CASE "w"'(CHR$(0) + "H")' oben
      IF n <> 1 THEN n = -1: m = 0
   CASE "s"'(CHR$(0) + "P")  'unten
      IF n <> -1 THEN n = 1: m = 0
   CASE "d"'(CHR$(0) + "M")  'rechts
      IF m <> -1 THEN n = 0: m = 1
   CASE "a"'(CHR$(0) + "K") 'links
      IF m <> 1 THEN n = 0: m = -1

   CASE ("y")
      SELECT CASE m
         CASE 1 'rechts
            m = 0
            n = -1

         CASE -1 'links
            m = 0
            n = 1

         CASE 0
            SELECT CASE n 'oben
               CASE -1
                  m = -1
                  n = 0
               CASE 1 'unten
                  m = 1
                  n = 0
            END SELECT
      END SELECT

   CASE ("x")
      SELECT CASE m
         CASE 1 'rechts
            m = 0
            n = 1
            
         CASE -1 'links
            m = 0
            n = -1

         CASE 0
            SELECT CASE n 'oben
               CASE -1
                  m = 1
                  n = 0
               CASE 1 'unten
                  m = -1
                  n = 0
            END SELECT
      END SELECT


   'Player 2
   CASE ("8") 'oben
      IF n1 <> 1 THEN n1 = -1: m1 = 0
   CASE ("5") 'unten
      IF n1 <> -1 THEN n1 = 1: m1 = 0
   CASE ("6") 'rechts
      IF m1 <> -1 THEN n1 = 0: m1 = 1
   CASE ("4")'links
      IF m1 <> 1 THEN n1 = 0: m1 = -1

   CASE ("1")
      SELECT CASE m1
         CASE 1 'rechts
            m1 = 0
            n1 = -1

         CASE -1 'links
            m1 = 0
            n1 = 1

         CASE 0
            SELECT CASE n1 'oben
               CASE -1
                  m1 = -1
                  n1 = 0
               CASE 1 'unten
                  m1 = 1
                  n1 = 0
            END SELECT
      END SELECT

   CASE ("2")
      SELECT CASE m1
         CASE 1 'rechts
            m1 = 0
            n1 = 1

         CASE -1 'links
            m1 = 0
            n1 = -1

         CASE 0
            SELECT CASE n1 'oben
               CASE -1
                  m1 = 1
                  n1 = 0
               CASE 1 'unten
                  m1 = -1
                  n1 = 0
            END SELECT
      END SELECT
  
   CASE ("c")
      p = 0: p1 = 0:
      Pause
      SetScr
      CALL ShowScore(p, p1)
      x = StartX
      y = StartY
      x1 = StartX1
      y1 = StartY1
      m = StartM
      n = StartN
      m1 = StartM1
      n1 = StartN1
      Time = StartTime

END SELECT

LOOP

SUB Explo (ex AS INTEGER, ey AS INTEGER, Player AS INTEGER)

SELECT CASE Player
CASE 1
FOR r = 1 TO 40 STEP 1
   CIRCLE (ex, ey), r, 2
   CIRCLE (ex, ey), r / 2, 10
   FOR za = 1 TO 10: NEXT za
NEXT r

CASE 2
FOR r = 1 TO 40 STEP 1
   CIRCLE (ex, ey), r, 1
   CIRCLE (ex, ey), r / 2, 9
   FOR za = 1 TO 10: NEXT za
NEXT r

END SELECT

FOR r = 0 TO 40 STEP 1
   CIRCLE (ex, ey), r, 0
   FOR za = 1 TO 100: NEXT za
NEXT r


END SUB

SUB Pause

DO UNTIL (a$ = CHR$(13) OR a$ = "q" OR a$ = " ")
a$ = INKEY$
LOOP

END SUB

SUB SetScr

CLS

LINE (minX, minY)-(maxX, minY), 2
LINE (maxX, minY)-(maxX, maxY), 2
LINE (minX, minY)-(minX, maxY), 1
LINE (minX, maxY)-(maxX, maxY), 1



END SUB

SUB ShowScore (p1 AS INTEGER, p2 AS INTEGER)

COLOR 7: LOCATE 1, 1: PRINT "Punkte ->",
COLOR Farbe1: PRINT "Player 1:"; p2,
COLOR Farbe2: PRINT " Player 2:"; p1

END SUB

