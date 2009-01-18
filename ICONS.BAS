SCREEN 12
 x = 134: Scann = 1
Datei$ = "c:\basic\icons\_Yoshi3.ico"
CLS
10
OPEN Datei$ FOR RANDOM AS #1 LEN = 1
FIELD #1, 1 AS a$

FOR a = 638 TO 127 STEP -1

   GET #1, a
   x = x - 2
   IF x < 101 THEN x = 132: y = y + 1
 
   LOCATE 20, 20: PRINT "   "
   LOCATE 20, 20: PRINT HEX$(ASC(a$))
  
FOR d = 0 TO 1
   t = SCREEN(20, 20 + d)
  
   IF t = 32 THEN fa = 0: e = 0: GOTO 19
   IF CHR$(t) = "0" THEN fa = 0: GOTO 20
   IF CHR$(t) = "4" THEN fa = 1: GOTO 20
   IF CHR$(t) = "2" THEN fa = 2: GOTO 20
   IF CHR$(t) = "6" THEN fa = 3: GOTO 20
   IF CHR$(t) = "1" THEN fa = 4: GOTO 20
   IF CHR$(t) = "D" THEN fa = 5: GOTO 20
   IF CHR$(t) = "3" THEN fa = 6: GOTO 20
   IF CHR$(t) = "7" THEN fa = 7: GOTO 20
   IF CHR$(t) = "8" THEN fa = 8: GOTO 20
   IF CHR$(t) = "C" THEN fa = 9: GOTO 20
   IF CHR$(t) = "A" THEN fa = 10: GOTO 20
   IF CHR$(t) = "E" THEN fa = 11: GOTO 20
   IF CHR$(t) = "9" THEN fa = 12: GOTO 20
   IF CHR$(t) = "5" THEN fa = 13: GOTO 20
   IF CHR$(t) = "B" THEN fa = 14: GOTO 20
   IF CHR$(t) = "F" THEN fa = 15: GOTO 20
                                  
19 PSET (x + d, y), tempfa
GOTO 21

20 tempfa = fa
e = d

21 PSET (x + e, y), fa
NEXT d
   
NEXT a

CLOSE

