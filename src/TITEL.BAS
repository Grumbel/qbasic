DECLARE SUB bild ()
SCREEN 13
DIM pal%(0 TO 69)
DIM pal1%(0 TO 65)
bild
'LINE (0, 0)-(320, 200), 20, BF

FOR f% = 1 TO 64
   k% = f%
   IF f% = 15 THEN k% = 16
   IF k% > 63 THEN k% = 63
   pal%(f%) = k%
NEXT f%

FOR f% = 1 TO 64
   pal1%(f%) = 1
NEXT f%

10

'FOR f% = 0 TO 63
'   PALETTE f%, pal%(f%)
'NEXT f%


FOR i% = 0 TO 63
   PALETTE i%, pal%(i%)
   pal%(i%) = pal%(i%) + pal1%(i%)
  
   IF pal%(i%) > 58 THEN pal1%(i%) = -5: pal%(i%) = 63
   IF pal%(i%) < 5 THEN pal1%(i%) = 5: pal%(i%) = 0
NEXT i%

GOTO 10

SUB bild

y% = 0
x% = 320
Datei$ = "c:\basic\1.bmp"
OPEN Datei$ FOR RANDOM AS #1 LEN = 1
FIELD #1, 1 AS a$

FOR a& = 65078 TO 1079 STEP -1

   GET #1, a&
   x% = x% - 1
   IF x% < 0 THEN x% = 319: y% = y% + 1
   fa% = ASC(a$)
  
   'IF fa% = 36 THEN fa% = 0
   fa% = fa% / 4
   IF fa% = 15 THEN fa% = 16
   PSET (x%, y%), fa%

NEXT a&
CLOSE

END SUB

