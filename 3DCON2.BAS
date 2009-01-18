10 SCREEN 12
15 oz = 1
20 ox = INT(100 * RND) - 50
oy = INT(100 * RND) - 50
80 oz = oz + 1
100 x = (ox * (oz / 10) + 320): y = (-oy * (oz / 10) + 240)

110  CIRCLE (xx, yy), oz - 1, 0
120 CIRCLE (x, y), oz
FOR za = 1 TO 100
NEXT za
xx = x
yy = y

REM IF x > 570 THEN CIRCLE (xx, yy), oz, 0: x = 0: y = 0: oz = 0: GOTO 20
REM IF y > 400 THEN CIRCLE (xx, yy), oz, 0: x = 0: y = 0: oz = 0: GOTO 20
REM IF x < 70 THEN CIRCLE (xx, yy), oz, 0: x = 0: y = 0: oz = 0: GOTO 20
REM IF y < 80 THEN CIRCLE (xx, yy), oz, 0: x = 0: y = 0: oz = 0: GOTO 20

IF oz > 75 THEN CIRCLE (xx, yy), oz, 0: x = 0: y = 0: oz = 0:  GOTO 20
150 GOTO 80

