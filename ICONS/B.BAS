SCREEN 12
b = 10: y = 1
CLS
10
OPEN "c:\dos\basic\icons\_Yoshi4.ico" FOR RANDOM AS #1 LEN = 1
FIELD #1, 1 AS a$

FOR a = 638 TO 127 STEP -1

   GET #1, a
  
   x = x + 1

   IF x > 16 THEN x = 1: y = y + 1

 IF y > 27 THEN CLOSE : END
  
   LOCATE y, x
  
   IF HEX$(ASC(a$)) = "99" THEN COLOR 0 ELSE COLOR 15
  
   PRINT HEX$(ASC(a$))

   
           
NEXT a

CLOSE
  
 

