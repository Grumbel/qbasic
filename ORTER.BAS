10 SCREEN 12
15 RANDOMIZE TIMER
20 x = INT(640 * RND)
30 y = INT(480 * RND)
35 LINE (0, yy - 2)-(640, yy - 2), 0
d = d + 1
IF d = 50 THEN SOUND 1000, 2: d = 0
FOR za = 1 TO 1000
NEXT za

40 LINE (0, yy)-(640, yy)
50 yy = yy + 1
60 IF yy = y THEN GOTO 80
70 GOTO 35
75 LINE (xx - 2, 0)-(xx - 2, 640), 0
d = d + 1
IF d = 50 THEN SOUND 1000, 2: d = 0

FOR za = 1 TO 1000
NEXT za

80 LINE (xx, 0)-(xx, 640)
90 xx = xx + 1
100 IF xx = x THEN xx = 0: yy = 0: CLS : SOUND 2000, 5: GOTO 15
110 GOTO 75

