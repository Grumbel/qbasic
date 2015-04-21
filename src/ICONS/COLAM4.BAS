SCREEN 12
x = 640:  DetailX% = 1: DetailY% = 1
CLS
5
StepX% = 0
StepY% = 0

Datei$ = "c:\basic\icons\c.bmp"
10
OPEN Datei$ FOR RANDOM AS #1 LEN = 1
FIELD #1, 1 AS a$

FOR a = 153718 TO 119 STEP -1 * DetailX%

   GET #1, a
   x% = x% - 2 * DetailX%
   IF x% < 1 THEN x% = 639: y% = y% + 1 * DetailY%: a = a - (320 * (DetailY% - 1))
 
   LOCATE 28, 78: PRINT "   "
   LOCATE 28, 78: PRINT HEX$(ASC(a$))
  
FOR d% = 0 TO 1 STEP 1 * DetailX%
   T% = SCREEN(28, 78 + d%)
  
   IF T = 32 THEN fa% = 0: e% = 0: GOTO 19
   IF CHR$(T%) = "0" THEN fa% = 0: GOTO 20
   IF CHR$(T%) = "4" THEN fa% = 1: GOTO 20
   IF CHR$(T%) = "2" THEN fa% = 2: GOTO 20
   IF CHR$(T%) = "6" THEN fa% = 3: GOTO 20
   IF CHR$(T%) = "1" THEN fa% = 4: GOTO 20
   IF CHR$(T%) = "D" THEN fa% = 5: GOTO 20
   IF CHR$(T%) = "3" THEN fa% = 6: GOTO 20
   IF CHR$(T%) = "7" THEN fa% = 7: GOTO 20
   IF CHR$(T%) = "8" THEN fa% = 8: GOTO 20
   IF CHR$(T%) = "C" THEN fa% = 9: GOTO 20
   IF CHR$(T%) = "A" THEN fa% = 10: GOTO 20
   IF CHR$(T%) = "E" THEN fa% = 11: GOTO 20
   IF CHR$(T%) = "9" THEN fa% = 12: GOTO 20
   IF CHR$(T%) = "5" THEN fa% = 13: GOTO 20
   IF CHR$(T%) = "B" THEN fa% = 14: GOTO 20
   IF CHR$(T%) = "F" THEN fa% = 15: GOTO 20
                                  
19
   LINE (x% + d%, y%)-STEP(StepX%, StepY%), tempfa%, BF
   GOTO 21

20
   tempfa% = fa%
   e% = d%


   LINE (x% + d%, y%)-STEP(StepX%, StepY%), tempfa%, BF
21 NEXT d%
   
NEXT a

CLOSE
x% = 640: y% = 0
DetailX% = DetailX% - 3
DetailY% = DetailY% - 3
GOTO 5

