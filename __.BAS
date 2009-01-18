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

CONST g = 50
CONST maxX = 639 - g
CONST maxY = 479 - g
CONST minX = 0 + g
CONST minY = 16 + g
CONST Farbe1 = 4
CONST Farbe2 = 1

CONST Startx = 300
CONST Starty = 240
CONST Startx1 = 340
CONST Starty1 = 240

SCREEN 12
SetScr

x = Startx
y = Starty
x1 = Startx1
y1 = Starty1

n = -1
n1 = 1

Pause

DO UNTIL a$ = "q"

a$ = INKEY$

LOCATE 1, 1: PRINT "P1:"; p1; " P2:"; p

IF POINT(x, y) = Farbe2 OR POINT(x, y) = Farbe1 THEN
   p = p + 1
   CALL Explo(x, y, 1)
   x = 300
   y = 240
   x1 = 340
   y1 = 240
   m = 0
   n = 1
   m1 = 0
   n1 = -1
   Pause
   CLS
   SetScr
END IF

IF POINT(x1, y1) = Farbe2 OR POINT(x1, y1) = Farbe1 THEN
   p1 = p1 + 1
   CALL Explo(x1, y1, 2)
   Pause
   SetScr
x = Startx
y = Starty
x1 = Startx1
y1 = Starty1
   m = 0
   n = -1
   m1 = 0
   n1 = 1
END IF

PSET (x, y), Farbe1
PSET (x1, y1), Farbe2

x = x + m
y = y + n
x1 = x1 + m1
y1 = y1 + n1

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

'Player 2
CASE ("8") 'oben
   IF n1 <> 1 THEN n1 = -1: m1 = 0
CASE ("5") 'unten    
   IF n1 <> -1 THEN n1 = 1: m1 = 0
CASE ("6") 'rechts
   IF m1 <> -1 THEN n1 = 0: m1 = 1
CASE ("4")'links
   IF m1 <> 1 THEN n1 = 0: m1 = -1
CASE ("c")
   p = 0: p1 = 0:
   Pause
  
   SetScr
   x = 300
   y = 240
   x1 = 340
   y1 = 240
   m = 0
   n = -1
   m1 = 0
   n1 = -1
END SELECT

LOOP

SUB Explo (ex AS INTEGER, ey AS INTEGER, Player AS INTEGER)

SELECT CASE Player
CASE 1
FOR r = 1 TO 40 STEP 1
   CIRCLE (ex, ey), r, 4
   CIRCLE (ex, ey), r / 2, 14
NEXT r

FOR r = 0 TO 40 STEP 1
   CIRCLE (ex, ey), r, 0
NEXT r

CASE 2
FOR r = 1 TO 40 STEP 1
   CIRCLE (ex, ey), r, 1
   CIRCLE (ex, ey), r / 2, 9
NEXT r

FOR r = 0 TO 40 STEP 1
   CIRCLE (ex, ey), r, 0
NEXT r
END SELECT



END SUB

SUB Pause

DO UNTIL (a$ = CHR$(13) OR a$ = "q" OR a$ = " ")
a$ = INKEY$
LOOP

END SUB

SUB SetScr

CLS

LINE (minX, minY)-(maxX, minY), 4
LINE (maxX, minY)-(maxX, maxY), 4
LINE (minX, minY)-(minX, maxY), 4
LINE (minX, maxY)-(maxX, maxY), 4

END SUB

