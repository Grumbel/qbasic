SCREEN 9
j = 140
k = 88
x = 1
CLS
10 xx = x
kk = k
jj = j
x = x + 1
j = STICK(0)
k = STICK(1)
LINE (x, j + 60)-(xx, jj + 60), 4
LINE (x, k + 30)-(xx, kk + 30), 5
IF x = 640 THEN CLS : x = 0
GOTO 10

