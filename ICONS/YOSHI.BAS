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
   IF CHR$(t) = "C" THEN fa = 1: GOTO 20
   IF CHR$(t) = "2" THEN fa = 2: GOTO 20
   IF CHR$(t) = "6" THEN fa = 3: GOTO 20
   IF CHR$(t) = "1" THEN fa = 4: GOTO 20
   IF CHR$(t) = "D" THEN fa = 5: GOTO 20
   IF CHR$(t) = "3" THEN fa = 6: GOTO 20
   IF CHR$(t) = "7" THEN fa = 7: GOTO 20
   IF CHR$(t) = "8" THEN fa = 8: GOTO 20
   IF CHR$(t) = "4" THEN fa = 9: GOTO 20
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
Scann = Scann + 1

IF Scann = 2 THEN
   Datei$ = "c:\basic\icons\_Yoshi4.ico"
   DIM Yoshi1(1 TO 166)
      GET (132, 0)-(102, 31), Yoshi1
         
END IF

IF Scann = 3 THEN
   Datei$ = "c:\basic\icons\_Yoshi5.ico"
   DIM Yoshi2(1 TO 166)
      GET (132, 0)-(102, 31), Yoshi2
        
END IF

IF Scann = 4 THEN
   DIM Yoshi3(1 TO 166)
      GET (132, 0)-(102, 31), Yoshi3
       
   GOTO Ani
END IF

x = 134: y = 0
GOTO 10

Ani:
CLS


PAINT (320, 200), 9
LINE (0, 232)-(640, 480), 2, BF

CIRCLE (205, 105), 50, 7, , , .3
PAINT (205, 105), 7
CIRCLE (200, 100), 50, , , , .3
PAINT (200, 100)

CIRCLE (405, 135), 50, 7, , , .2
PAINT (405, 135), 7
CIRCLE (400, 130), 50, , , , .2
PAINT (400, 130)

CIRCLE (15, 75), 50, 7, , , .35
PAINT (15, 75), 7
CIRCLE (10, 70), 50, , , , .35
PAINT (10, 70)

CIRCLE (105, 145), 30, 7, , , .3
PAINT (105, 145), 7
CIRCLE (100, 140), 30, , , , .3
PAINT (100, 140)

CIRCLE (405, 65), 30, 7, , , .3
PAINT (405, 65), 7
CIRCLE (400, 60), 30, , , , .3
PAINT (400, 60)

CIRCLE (555, 145), 40, 7, , , .3
PAINT (555, 145), 7
CIRCLE (550, 140), 40, , , , .3
PAINT (550, 140)

CIRCLE (605, 65), 45, 7, , , .4
PAINT (605, 65), 7
CIRCLE (600, 60), 45, , , , .4
PAINT (600, 60)


x = 608
Start:
x = x - 1
PUT (x, 200), Yoshi1, PSET

FOR za = 1 TO 1500
NEXT za
x = x - 1
PUT (x, 200), Yoshi2, PSET

FOR za = 1 TO 1500
NEXT za
x = x - 1
PUT (x, 200), Yoshi3, PSET

FOR za = 1 TO 1500
NEXT za

IF x < 5 THEN END

GOTO Start


