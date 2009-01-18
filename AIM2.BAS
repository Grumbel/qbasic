10 SCREEN 12
 RANDOMIZE TIMER

CONST Pi = 3.14159
 Speed = .1
15
'Ziel Finder
x = INT(640 * RND)
y = INT(480 * RND)

20
'Ziel
xx = INT(640 * RND)
yy = INT(480 * RND)
CIRCLE (xx, yy), 10

FOR d = 1 TO 175
'Dreiecks Seiten
a = xx - x
b = yy - y

IF b < 0 AND a < 0 THEN WinkelPlus = Pi
IF b < 0 AND a > 0 THEN WinkelPlus = -Pi

'Winkel    
IF b = 0 THEN b = .000001
Winkel = ATN(a / b)
Winkel = Winkel + WinkelPlus

PSET (x, y)
PSET (xx, yy), 2

SpeedX = SIN(Winkel) * Speed
SpeedY = COS(Winkel) * Speed

30
x = x + SpeedX
y = y + SpeedY
fa = POINT(x, y)
IF fa = 2 THEN CLS : WinkelPlus = 0: GOTO 15
'IF x > xx AND x - 5 < xx AND y > yy AND y - 5 < yy THEN GOTO 40

PSET (x, y), 4

NEXT d
WinkelPlus = 0
PSET (xx, yy), 0
CIRCLE (xx, yy), 10, 0
Speed = Speed + .001
GOTO 20


