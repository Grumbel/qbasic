COMMON a AS SINGLE
COMMON y AS SINGLE
COMMON kx AS INTEGER
COMMON ky AS INTEGER
COMMON za AS INTEGER
COMMON dg AS INTEGER

SCREEN 9
WINDOW SCREEN (0, 0)-(320, 200)
RANDOMIZE TIMER
y = 100
a = -1
b1 = 1
CONST ScanDetail = .1'2 / 320

DIM XY%(10, 3)
DIM High%(1 TO 350)

FOR za = 1 TO 10
   kx = CINT(320 * RND)
   ky = CINT(200 * RND)
   kr = 20 * RND + 2
   
   XY%(za, 1) = kx
   XY%(za, 2) = ky
   XY%(za, 3) = kr
NEXT za


Start:

SCREEN 9, , 0, 0
CLS
FOR dg = 1 TO 320
   hg = High%(dg)
   LINE (dg, 100 - hg)-(dg, 100), 14
   LINE (dg, 100 + hg)-(dg, 100), 14
NEXT dg

'SWAP b1, b2

SCREEN 9, , 1, 0


FOR za = 1 TO 10
   kx = XY%(za, 1)
   ky = XY%(za, 2)
   kr = XY%(za, 3)
   CIRCLE (kx, ky), kr, 8
   PAINT (kx, ky), 8
NEXT za

PSET (PosX, 100), 15

10
x = x + 1
y = y + a

IF x > 320 OR y < 0 OR y > 200 THEN
   a = a + ScanDetail
   x = PosX
   y = 100
   IF a > 1 THEN a = -1: y = 100:   PosX = PosX + 10: x = PosX: GOTO Start
END IF

IF POINT(x, y) = 8 OR POINT(x, y - 1) = 15 OR POINT(x, y + 1) = 15 THEN
   'LINE ((1 + a) * 160, 100 - (3200 / x))-((1 + (a)) * 160, 100), 14
   'LINE ((1 + a) * 160, 100 + (3200 / x))-((1 + (a)) * 160, 100), 14
   High%((1 + a) * 160 + 1) = (3200 / x)
   a = a + ScanDetail
   x = PosX
   y = 100

   IF a > 1 THEN a = -1: y = 100: PosX = PosX + 10: x = PosX: GOTO Start

END IF

'PSET (x, y), 4

GOTO 10

