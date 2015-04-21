DECLARE FUNCTION b! (a%)
10 CLS
DIM a%(2, 2)
a%(2, 2) = 2

c = b(a%)

FUNCTION b (a%) STATIC

FOR x = 1 TO 2
   FOR y = 1 TO 2
      LOCATE y * 2, x * 2: PRINT a%(x, y)
   NEXT y
NEXT x

END FUNCTION

