COMMON x AS INTEGER
COMMON xx AS INTEGER
COMMON xxx AS INTEGER
COMMON xxxx AS INTEGER
COMMON a AS INTEGER
COMMON b1 AS INTEGER
COMMON b2 AS INTEGER
COMMON tempa AS INTEGER
COMMON d AS INTEGER
COMMON col AS INTEGER

SCREEN 9
CONST pi = 3.1415927#
b1 = 1
10 SCREEN 9, , b1, b2
SWAP b1, b2
CLS

tempa = a

IF a > 360 THEN a = 0
a = a + 4
'IF a < 180 THEN col = 7 ELSE col = 15

FOR d = 1 TO 180 STEP 10
   
   x = (SIN((a + d) * pi / 180)) * 50
   xx = (SIN((a + 180 + d) * pi / 180)) * 50
   xx = (SIN((a + 180 + d) * pi / 180)) * 50
   'xxx = (SIN((a + 90 + d) * pi / 180)) * 50
   'xxxx = (SIN((a + 270 + d) * pi / 180)) * 50
  
   'LINE (x + 320, 50 + d)-(xx + 320, 50 + d)
   CIRCLE (x + 320, 50 + d), 5
   CIRCLE (xx + 320, 50 + d), 5', col
   

   'CIRCLE (xxx + 320, 50 + d), 5
   'CIRCLE (xxxx + 320, 50 + d), 5
   'LINE (xxx + 320, 50 + d)-(xxxx + 320, 50 + d)

NEXT d

GOTO 10

