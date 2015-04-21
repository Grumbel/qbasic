DECLARE SUB negativ ()
DECLARE SUB smoothy (g AS INTEGER)
DECLARE SUB smooth2 ()
DECLARE SUB smooth2y (g AS INTEGER)
RANDOMIZE TIMER
SCREEN 13
x = 350
Datei$ = "c:\basic\dig2.bmp"
CLS

OPEN Datei$ FOR RANDOM AS #1 LEN = 1
FIELD #1, 1 AS a$

FOR a& = 65079 TO 128 STEP -1
'61377
   GET #1, a&
   x% = x% - 1
   IF x% < 1 THEN x% = 320: y% = y% + 1
   'Hexe$ = HEX$(ASC(a$))
   fa% = ASC(a$)
   fa% = fa% / 4
   IF fa% = 15 THEN fa% = 16
   IF fa% > 63 THEN fa% = 63
20 PSET (x% + d%, y%), fa%

NEXT a&
CLOSE

FOR fa% = 0 TO 63
   IF fa% = 15 THEN fa% = 16
   PALETTE fa%, fa%

NEXT fa%


FOR y% = 0 TO 200
   FOR x% = 0 TO 320
     
     
      IF POINT(x%, y%) = POINT(x% + 1, y%) THEN PSET (x%, y%), 0: k = k + 1

   NEXT x%
NEXT y%



FOR y% = 0 TO 200
   FOR x% = 0 TO 320
    
      IF POINT(x%, y%) = 0 THEN
         x1% = x%
         DO
            x1% = x1% + 1
         LOOP UNTIL POINT(x1%, y%) <> 0
            fa% = POINT(x1%, y%)
         DO
         
            PSET (x1%, y%), fa%
            x1% = x1% - 1
         LOOP UNTIL POINT(x1%, y%) <> 0

      END IF
   NEXT x%
NEXT y%
PRINT k
SLEEP

DO
negativ
LOOP UNTIL INKEY$ <> ""

DO
smooth2y (2)
LOOP

SUB negativ

FOR y% = 0 TO 200
   FOR x% = 0 TO 320
   
      fa% = 63 - POINT(x%, y%)
      PSET (x%, y%), fa%

   NEXT x%
NEXT y%

END SUB

SUB smooth

FOR y% = 0 TO 199
   FOR x% = 0 TO 319
      PSET (x%, y%), (POINT(x%, y%) + POINT(x% + 1, y%)) / 2
   NEXT x%
NEXT y%

FOR y% = 199 TO 0 STEP -1
   FOR x% = 0 TO 319
      PSET (x%, y%), (POINT(x%, y%) + POINT(x% - 1, y%)) / 2
   NEXT x%
NEXT y%

END SUB

SUB smooth2

a% = 15

FOR y% = 0 TO 199
   FOR x% = 0 TO 319
      fa! = 0
      FOR b% = 0 TO a%
         fa! = POINT(x% + b%, y%) + fa!
      NEXT b%
      PSET (x%, y%), fa! / (a% + 1)
      
   NEXT x%
NEXT y%

FOR y% = 199 TO 0 STEP -1
   FOR x% = 0 TO 319
      fa! = 0
      FOR b% = 0 TO a%
         fa! = POINT(x% + b%, y%) + fa!
      NEXT b%
      PSET (x%, y%), fa! / (a% + 1)
   NEXT x%
NEXT y%

END SUB

SUB smooth2y (g AS INTEGER)

'a% = 15

'      fa! = 0
'      fa! = POINT(x% + b%, y%) + fa!
'      NEXT b%
'      PSET (x%, y%), fa! / (a% + 1)
' 

FOR x% = 0 TO 319
   FOR y% = 0 TO 199
     
      fa! = 0
      FOR b% = -g TO g
         FOR a% = -g TO g
            fa! = POINT(x% + a%, y% + b%) + fa!
         NEXT a%
      NEXT b%
      PSET (x%, y%), fa! / (((2 * g) + 1) ^ 2)
   NEXT y%
NEXT x%


END SUB

SUB smoothy (g AS INTEGER)

FOR za! = 1 TO 34000
      x% = 320 * RND
      y% = 200 * RND
      fa! = 0
      FOR b% = -g TO g
         FOR a% = -g TO g
            fa! = POINT(x% + a%, y% + b%) + fa!
         NEXT a%
      NEXT b%
      LINE (x% - g, y% - g)-STEP(g * 2, g * 2), fa! / (((2 * g) + 1) ^ 2), BF
  
NEXT za!

END SUB

