10 SCREEN 9
20 RANDOMIZE TIMER
30 x = INT(640 * RND)
40 y = INT(340 * RND)
50 FOR a = -1000 TO -440 STEP 15
60 SOUND -a, -a / 1000
70 NEXT
80 FOR r = 1 TO 75
90 CIRCLE (x, y), r, 4
100 f = INT(1500 * RND) + 50
110 SOUND f, .08
120 CIRCLE (x, y), r / 2, 14
130 NEXT
140 FOR r = -75 TO 0
150 CIRCLE (x, y), -r, 0
160 NEXT
170 GOTO 30

