SCREEN 9
x = 350
Datei$ = "c:\ingo.bmp"
CLS
OPEN Datei$ FOR RANDOM AS #1 LEN = 1
FIELD #1, 1 AS a$

FOR a& = 61377 TO 127 STEP -1

   GET #1, a&
   x% = x% - 2
   IF x% < 1 THEN x% = 352: y% = y% + 1
   Hexe$ = HEX$(ASC(a$))
      
FOR d% = 0 TO 1
  
   
   T$ = MID$(Hexe$, d% + 1, 1)
   IF LEN(Hexe$) = 1 THEN fa% = 0: GOTO 20
   IF T$ = "4" THEN fa% = 1: GOTO 20  'blau
   IF T$ = "6" THEN fa% = 3: GOTO 20  'cyanblau
   IF T$ = "7" THEN fa% = 7: GOTO 20  'hellgrau
   IF T$ = "E" THEN fa% = 11: GOTO 20 'hellcyan
   IF T$ = "8" THEN fa% = 8: GOTO 20  'grau
   IF T$ = "C" THEN fa% = 9: GOTO 20  'hellblau
   IF T$ = "A" THEN fa% = 10: GOTO 20 'hellgrn
   IF T$ = "9" THEN fa% = 12: GOTO 20 'hellrot
   IF T$ = "5" THEN fa% = 13: GOTO 20 'pink
   IF T$ = "B" THEN fa% = 14: GOTO 20 'gelb
   IF T$ = "F" THEN fa% = 15: GOTO 20 'weiá
   IF T$ = "0" THEN fa% = 0: GOTO 20  'schwarz                             
   IF T$ = "2" THEN fa% = 2: GOTO 20  'grn   
   IF T$ = "1" THEN fa% = 4: GOTO 20  'rot
   IF T$ = "D" THEN fa% = 5: GOTO 20  'magenta
   IF T$ = "3" THEN fa% = 6: GOTO 20  'braun

20 PSET (x% + d%, y%), fa%
NEXT d%
NEXT a&
BEEP
CLOSE


x! = 0: y! = 0
CONST z% = 350 / 200
LINE (350, 0)-(450, 100), , BF

10

x! = x! + 1 * z%

fa% = POINT(x!, y!)

IF x! > 350 THEN x! = 0: y! = y! + 1 * z%

PSET ((x! / z%) + 350, (y! / z%)), fa%
'LOCATE 1, 1: PRINT x!; y!; fa%
GOTO 10
     

