SCREEN 12
x = 1: y = 1
b = 10
CLS
10
OPEN "c:\dos\basic\icons\_Yoshi4.ico" FOR RANDOM AS #1 LEN = 1
FIELD #1, 1 AS a$

FOR a = 638 TO 127 STEP -1

GET #1, a
  
  
'   IF HEX$(ASC(a$)) = "0" THEN fa = 0
'   IF HEX$(ASC(a$)) = "C" THEN fa = 1
'   IF HEX$(ASC(a$)) = "2" THEN fa = 2
'   IF HEX$(ASC(a$)) = THEN fa = 3
'   IF HEX$(ASC(a$)) = THEN fa = 4
'   IF HEX$(ASC(a$)) = THEN fa = 5
'   IF HEX$(ASC(a$)) = THEN fa = 6
'   IF HEX$(ASC(a$)) = THEN fa = 7
'   IF HEX$(ASC(a$)) = THEN fa = 8
'   IF HEX$(ASC(a$)) = THEN fa = 9
'   IF HEX$(ASC(a$)) = THEN fa = 10
'   IF HEX$(ASC(a$)) = THEN fa = 11
'   IF HEX$(ASC(a$)) = THEN fa = 12
'   IF HEX$(ASC(a$)) = THEN fa = 13
'   IF HEX$(ASC(a$)) = THEN fa = 14
'   IF HEX$(ASC(a$)) = THEN fa = 15
IF ASC(a$) = 0 THEN fa = 15 ELSE fa = 0
PSET (x, y), fa
x = x + 1
IF x > 15 THEN x = 0: y = y + 1
  
NEXT a

CLOSE

