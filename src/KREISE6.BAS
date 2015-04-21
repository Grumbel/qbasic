5 RANDOMIZE TIMER
10 SCREEN 9
20 CLS
30 LINE (275, 130)-(345, 190), 15, BF
40 x = INT(640 * RND): y = INT(350 * RND)
45 g = g + 1
IF g = 2500 THEN g = 0: GOTO 50
GOTO 45
50 LINE (0, 350)-(x, y), 14: LINE (640, 350)-(x, y), 14
60 FOR r = 1 TO 50
70 CIRCLE (x, y), r, 4
75 g = g + 1
IF g = 100 THEN g = 0: GOTO 80
GOTO 75
80 CIRCLE (x, y), r / 2, 14
90 NEXT
100 FOR r = 1 TO 50
110 CIRCLE (x, y), r, 0
120 NEXT
130 PSET (x, y), 0: LINE (0, 350)-(x, y), 0: LINE (640, 350)-(x, y), 0
LINE (275, 130)-(345, 190), 15, BF
FOR sou = -5000 TO -1000 STEP 100
SOUND -sou, .1
NEXT
140 IF x > 250 AND x < 365 AND y < 210 AND y > 110 THEN GOTO 160
LINE (275, 130)-(345, 190), 15, BF
150 GOTO 40
160 x = INT(70 * RND) + 275: y = INT(60 * RND) + 130
170 GOTO 200
200 FOR r = 1 TO 25
210 CIRCLE (x, y), r, 4
211 g = g + 1
IF g = 100 THEN g = 0: GOTO 220
GOTO 211
220 CIRCLE (x, y), r / 2, 14
sou = INT(3000 * RND) + 1000
SOUND sou, .1
230 NEXT
z = z + 1
IF z = 15 THEN END
FOR r = 1 TO 50
CIRCLE (x, y), r, 0
NEXT
PSET (x, y), 0
240 GOTO 160



