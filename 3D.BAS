COMMON sx AS INTEGER
COMMON sy AS SINGLE
COMMON a  AS SINGLE
COMMON x AS INTEGER
COMMON y AS INTEGER

RANDOMIZE TIMER

SCREEN 13
x = 1
y = 100
CIRCLE (250, 100), 25
LINE (150 * RND + 100, 200 * RND)-STEP(100 * RND - 50, 50 * RND - 25)
LINE (150 * RND + 100, 200 * RND)-STEP(100 * RND - 50, 50 * RND - 25)
LINE (150 * RND + 100, 200 * RND)-STEP(100 * RND - 50, 50 * RND - 25)
'PSET (100, 200)
sx = x
sy = y
a = -1
10
sy = sy + a
sx = sx + 1

IF POINT(sx, sy) > 4 THEN
 
   LINE (160 + a * 160, 100)-STEP(0, -8000 / (sx)), 4

   LINE (160 + a * 160, 100)-STEP(0, 8000 / (sx)), 4
  
   'PRINT sx - 101
   sx = x
   sy = y
   a = a + .03
END IF

'OR POINT(sx, sy - 1) <> 0 OR POINT(sx, sy + 1) <> 0

'PSET (sx, sy), 4


IF sy > 480 OR sy < 0 OR sx > 640 THEN
   sx = x
   sy = y
   a = a + .03
   'LINE (320 + a * 500, 101 - sx)-(320 + a * 1000, 101 + sx), 14
END IF

IF a > 1 THEN SOUND 1000, .1: SLEEP: END

GOTO 10

