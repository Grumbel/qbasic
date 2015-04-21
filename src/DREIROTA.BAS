DECLARE FUNCTION RotX! (x, y, cx, cy, ang)

COMMON SHARED RotY  AS INTEGER
COMMON SHARED B1    AS INTEGER
COMMON SHARED B2    AS INTEGER
COMMON SHARED a     AS INTEGER
COMMON SHARED b     AS INTEGER
COMMON SHARED c     AS INTEGER
COMMON SHARED Winkl AS SINGLE
COMMON SHARED x     AS INTEGER
COMMON SHARED y     AS INTEGER
COMMON SHARED cx    AS INTEGER
COMMON SHARED cy    AS INTEGER
COMMON SHARED ang   AS INTEGER
COMMON SHARED ca    AS INTEGER
COMMON SHARED cb    AS INTEGER
COMMON SHARED nw    AS SINGLE
COMMON SHARED Angl  AS SINGLE
CONST pi! = 3.1415927#

B1 = 1
B2 = 0

SCREEN 9, , B1, B2
WINDOW SCREEN (1, 480)-(640, 1)
Angl = 0

10
SWAP B1, B2
SCREEN 9, , B1, B2
CLS

LINE (RotX!(200, 250, 300, 200, Angl), RotY)-(RotX!(100, 150, 300, 200, Angl), RotY)
LINE -(RotX!(350, 320, 300, 200, Angl), RotY)
LINE -(RotX!(200, 250, 300, 200, Angl), RotY)

Angl = Angl + 5

GOTO 10

FUNCTION RotX! (x, y, cx, cy, ang)

b = cx - x
a = cy - y
c = SQR(a ^ 2 + b ^ 2)

Winkl = ATN(a / b)

nw = Winkl + (ang * pi! / 180)

cb = SIN(270 * pi! / 180 - nw) * c
ca = SIN(nw) * c

RotY = cy - ca

RotX! = cx + cb

END FUNCTION

