SCREEN 12
r = 1
x = -r
10
r = r + .005
PSET (x + 320, SQR(r ^ 2 - x ^ 2) + 200)
PSET (x + 320, -SQR(r ^ 2 - x ^ 2) + 200)
x = x + 20
IF x >= r THEN x = -r
GOTO 10

