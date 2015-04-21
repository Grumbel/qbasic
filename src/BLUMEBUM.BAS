COMMON t AS INTEGER
COMMON x AS SINGLE
COMMON d AS SINGLE
COMMON b1 AS INTEGER
COMMON b2 AS INTEGER
COMMON a AS SINGLE
COMMON c AS SINGLE
COMMON e AS SINGLE


SCREEN 9
CLS

t = 1
b1 = 1
pi = 3.1415927#

10

SCREEN 9, , b1, b2
CLS
SWAP b1, b2
WINDOW (-90 / t, -90 / t)-(90 / t, 90 / t)
a = .51
b = -.49
c = .9996
x = 4
y = 1
d = a * x
FOR i = 0 TO 100
PSET (y, x)
e = x
x = c * y + d
IF x > 0 THEN d = a * x ELSE d = b * x
y = d - e
NEXT i
t = t + 1
IF t > 45 THEN t = 1
GOTO 10
END

