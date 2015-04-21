SCREEN 12
RANDOMIZE TIMER
21
z = 50
zz = 200
f = 8

25
FOR za = 1 TO zz
  x = INT(640 * RND)
  y = INT(480 * RND)
  PSET (x, y), f
NEXT za

d = d + 1
IF d = 1 THEN f = 7: GOTO 25
IF d = 2 THEN f = 15: GOTO 25

30

FOR za = 1 TO z
  x = INT(640 * RND)
  y = INT(480 * RND)
  a = INT(9 * RND) + 1
  LINE (x - a, y)-(x + a, y), 8
  LINE (x - a / 2, y)-(x + a / 2, y), 7
  LINE (x - a / 5, y)-(x + a / 5, y), 15
  LINE (x, y - a)-(x, y + a), 8
  LINE (x, y - a / 2)-(x, y + a / 2), 7
  LINE (x, y - a / 5)-(x, y + a / 5), 15
NEXT za

100 a$ = INKEY$
IF a$ = " " THEN CLS : d = 0: GOTO 21
GOTO 100

