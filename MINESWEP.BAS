COMMON PosX  AS INTEGER
COMMON PosY  AS INTEGER

CLS
DIM Feld(22, 22)

PosX = 10
PosY = 10

Minen = 100

FOR MineNum = 1 TO Minen
   x = CINT(22 * RND)
   y = CINT(22 * RND)
   Feld(x, y) = 1
NEXT MineNum

'FOR x = 1 TO 20
'   FOR y = 1 TO 20
'      LOCATE y, x * 2
'      PRINT Feld(x, y)
'   NEXT y
'NEXT x

FOR x = 1 TO 20
   FOR y = 1 TO 20
      LOCATE y, x * 2
      PRINT "²"   'Feld(x, y)
   NEXT y
NEXT x


10
a$ = INKEY$
IF a$ = CHR$(0) + "K" THEN PosX = PosX - 1 'links
IF a$ = CHR$(0) + "P" THEN PosY = PosY + 1 'unten
IF a$ = CHR$(0) + "H" THEN PosY = PosY - 1 'rechts
IF a$ = CHR$(0) + "M" THEN PosX = PosX + 1 'oben
IF a$ = CHR$(13) THEN
  
   SELECT CASE Feld(PosX, PosY)
      CASE 0
      LOCATE PosY, PosX * 2
      PRINT "T"
              
      CASE 1
      LOCATE PosY, PosX * 2
      PRINT "O"

   END SELECT
END IF

LOCATE PosY, PosX * 2 - 1: PRINT "X"

IF PosX < 2 THEN PosX = 2
IF PosX > 21 THEN PosX = 21
IF PosY < 2 THEN PosX = 2
IF PosY > 21 THEN PosX = 21
GOTO 10

