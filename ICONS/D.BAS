
b = 10: y = 1
CLS
10
OPEN "c:\dos\basic\icons\_Yoshi4.ico" FOR RANDOM AS #1 LEN = 1
FIELD #1, 1 AS a$

FOR a = 638 TO 127 STEP -1

   GET #1, a
  
   x = x + 3

   IF x > 48 THEN x = 3: y = y + 1

 IF y > 20 THEN CLOSE : GOTO 15
  
   LOCATE y, x
  
   PRINT HEX$(ASC(a$))

   
           
NEXT a

CLOSE
15
SLEEP
COLOR 15
x = 1
y = 1

20 x = x + 1
IF x > 48 THEN x = 1: y = y + 1
IF y > 20 THEN : END

d = SCREEN(x, y)

LOCATE 21, 50: PRINT d

GOTO 20

