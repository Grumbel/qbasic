5 SCREEN 9
10 x = 320: a = 320
20 x = x - 1: y = y + .8
30 LINE (x, (.003 * y ^ 2))-(320, 350)
40 a = a + 1: b = b + .8
50 LINE (a, (.003 * b ^ 2))-(320, 350)
z = z + 1
IF z = 50 THEN z = 0: CLS
r = r + 1
IF r = 550 THEN b = 0: y = 0: r = 0: GOTO 10
GOTO 20

