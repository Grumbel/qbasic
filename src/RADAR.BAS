10 SCREEN 12
12 RANDOMIZE TIMER
15 xx = 350: yy = 200
20 FOR y = -10 TO 480 STEP 41
30 LINE (1, y)-(640, y), 7
40 NEXT y
50 FOR x = -10 TO 640 STEP 41
60 LINE (x, 1)-(x, 480), 7
70 NEXT x
80 FOR r = 5 TO 310 STEP 50
90 CIRCLE (320, 235), r: IF r > 50 THEN CIRCLE (320, 235), r - 50, 0
IF r > 100 AND r < 150 THEN CIRCLE (xx, yy), 5, 4: PAINT (xx, yy), 4: SOUND 500, .5
100 FOR za = 1 TO 100
110 NEXT za
120 NEXT r
125 mx = INT(21 * RND) - 11
126 my = INT(21 * RND) - 10
xx = xx + mx
yy = yy + my
130 CLS
140 GOTO 20

