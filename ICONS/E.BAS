SCREEN 12
b = 10: x = 34
CLS
10
OPEN "c:\dos\basic\icons\_Yoshi4.ico" FOR RANDOM AS #1 LEN = 1
FIELD #1, 1 AS a$

GET #1, 534
                                   
   PRINT HEX$(ASC(a$))
   t = SCREEN(1, 1)
   u = SCREEN(2, 1)
   IF t = 70 THEN b$ = "F"
   IF u = 50 THEN c$ = "2"
   PRINT b$; t
   PRINT c$; u
CLOSE
  
 

