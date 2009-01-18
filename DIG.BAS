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
   fa% = 25 - ASC(a$)

20 PSET (x% + d%, y%), fa%

NEXT a&
CLOSE

10

'FOR fa2% = 1 TO 63 STEP 1
'   FOR fa1% = 0 TO 256 STEP 10
'      PALETTE fa1%, fa2%
'      'SOUND 1000, .01
'   NEXT fa1%
'NEXT fa2%

'PALETTE 150 * RND + 1, INT(63 * RND) + 1

'PRINT POINT(160, 100)
'fa1% = INT(63 * RND) + 1

'SOUND 1000, .1
FOR fa% = 19 TO 256
   PALETTE fa%, INT(63 * RND) + 1
SLEEP
'PRINT fa%
'LOCATE 1, 1
NEXT fa%

GOTO 10

