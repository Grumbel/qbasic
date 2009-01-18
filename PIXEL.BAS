10 SCREEN 12
15 RANDOMIZE TIMER
20 LINE (540 * RND + 50, 400 * RND + 40)-STEP(150, 150), 3, BF
30 LINE (540 * RND + 50, 400 * RND + 40)-STEP(150, 150), 4, BF
40 x = 620 * RND + 10: y = 460 * RND + 10
50 IF POINT(x, y) = 3 OR POINT(x, y) = 4 THEN GOTO 40
60 r = INT(4 * RND) + 1
70 IF r = 1 THEN xr = 1
80 IF r = 2 THEN xr = -1
90 IF r = 3 THEN yr = -1
100 IF r = 4 THEN yr = 1
110 PSET (x, y)
112 PSET (xx, yy), 0
115 xx = x: yy = y
120 x = x + xr: y = y + yr
130 IF x < 10 OR x > 630 THEN xr = xr * -1: yr = INT(3 * RND) - 1
140 IF y < 10 OR y > 470 THEN yr = yr * -1: xr = INT(3 * RND) - 1
IF INT(200 * RND) = 50 THEN GOTO 60
IF POINT(x, y) = 3 THEN SOUND 1000, .05: n = n + 1
IF POINT(x, y) = 4 THEN SOUND 750, 1: xr = xr * -1: yr = yr * -1
FOR za = 1 TO 75
NEXT za
LOCATE 1, 1: PRINT "Nahrung:"; n
IF n > 450 THEN b = 1
IF b = 1 THEN GOSUB 160
150 GOTO 110
160 ar = INT(4 * RND) + 1

