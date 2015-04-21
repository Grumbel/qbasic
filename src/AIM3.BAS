10 SCREEN 12
 RANDOMIZE TIMER

CONST pi = 3.14159
 Speed = 1

 xcent = STICK(0)
 ycent = STICK(1)

15
'Ziel Finder
x = INT(640 * RND)
y = INT(480 * RND)

'Ziel
xx = INT(640 * RND)
yy = INT(480 * RND)

20
xstick = STICK(0)
ystick = STICK(1)
st = STRIG(0)
'LOCATE 1, 1: PRINT xstick; ystick
IF st = -1 THEN CLS
IF xstick > xcent AND (xstick - 10) < xcent THEN xstick = xcent
IF xstick < xcent AND (xstick + 10) > xcent THEN xstick = xcent
IF ystick > ycent AND (ystick - 10) < ycent THEN ystick = ycent
IF ystick < ycent AND (ystick + 10) > ycent THEN ystick = ycent



'LOCATE 2, 1: PRINT xstick; ystick, xcent; ycent
xx = xx + (xstick - xcent) / 50
yy = yy + (ystick - ycent) / 50


IF xx < 0 THEN xx = 0
IF xx > 639 THEN xx = 639
IF yy > 479 THEN yy = 479
IF yy < 0 THEN yy = 0

PSET (xx, yy), 14

'Dreiecks Seiten
a = xx - x
b = yy - y

IF b < 0 AND a < 0 THEN WinkelPlus = pi
IF b < 0 AND a > 0 THEN WinkelPlus = -pi

'Winkel  
IF b = 0 THEN b = .000001
winkel = ATN(a / b)
winkel = winkel + WinkelPlus
LOCATE 1, 1: PRINT winkel * 180 / pi
PSET (x, y)
PSET (xx, yy), 2

SpeedX = SIN(winkel) * Speed
SpeedY = COS(winkel) * Speed

30
x = x + SpeedX
y = y + SpeedY
fa = POINT(x, y)
'IF fa = 2 THEN CLS : WinkelPlus = 0: GOTO 15
'IF x > xx AND x - 5 < xx AND y > yy AND y - 5 < yy THEN GOTO 40

PSET (x, y), 4


WinkelPlus = 0

GOTO 20


