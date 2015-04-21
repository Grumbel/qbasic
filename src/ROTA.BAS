DECLARE FUNCTION RotX! (x!, y!, cx!, cy!, ang!)
COMMON SHARED RotY

CONST pi = 3.1415927#
SCREEN 9
WINDOW SCREEN (1, 480)-(640, 1)
angl = 0

10

LINE -(RotX!(100, 100, 300, 200, angl), RotY), INT(14 * RND + 1)

angl = angl + 1

GOTO 10

FUNCTION RotX (x, y, cx, cy, ang)

b = cx - x
a = cy - y
c = SQR(a ^ 2 + b ^ 2)

winkl! = ATN(a / b)

nw = winkl! + (ang * pi / 180)

cb = SIN(270 * pi / 180 - nw) * c
ca = SIN(nw) * c

RotY = cy - ca

RotX = cx + cb

END FUNCTION

