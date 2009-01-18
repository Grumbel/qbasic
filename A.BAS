   CLS
10
RANDOMIZE TIMER
DIM a(18, 13)

FOR g = 1 TO 15
x = INT(18 * RND) + 1
y = INT(5 * RND) + 1
a(x, y) = 1
NEXT g
x = 2: y = 13
a(x, y) = 2



15
FOR fx = 1 TO 18
   FOR fy = 1 TO 13
      LOCATE fy, fx * 2
      IF a(fx, fy) = 1 THEN gegner = gegner + 1: COLOR 15 ELSE COLOR 7
      IF a(fx, fy) = 2 THEN COLOR 14
      PRINT a(fx, fy)
      NEXT fy
NEXT fx

IF gegner = 0 THEN CLS : PRINT "geschafft": END
LOCATE 1, 60: PRINT gegner
gegner = 0
20 a$ = INKEY$
IF a$ = CHR$(0) + "K" THEN m = -1: GOTO 30 'rechts
IF a$ = CHR$(0) + "M" THEN m = 1: GOTO 30'links
IF a$ = CHR$(0) + "H" THEN GOTO 40
GOTO 20

30 a(x, y) = 0
x = x + m
IF x > 18 THEN x = 18
IF x < 1 THEN x = 1
a(x, y) = 2
CLS
GOTO 15

40
xx = x: yy = y - 1
GOTO 46
45
a(xx, yy + 1) = 0
IF yy < 1 THEN GOTO 15
46 a(xx, yy) = 3

FOR fx = 1 TO 18
   FOR fy = 1 TO 13
      LOCATE fy, fx * 2
      IF a(fx, fy) = 1 THEN gegner = gegner + 1: COLOR 15 ELSE COLOR 7
      IF a(fx, fy) = 2 THEN COLOR 14
      IF a(fx, fy) = 3 THEN COLOR 4
      PRINT a(fx, fy)
      NEXT fy
NEXT fx

yy = yy - 1

IF a(xx, yy) = 1 THEN a(xx, yy + 1) = 0: a(xx, yy) = 0: SOUND 1000, .1: GOTO 15

GOTO 45



