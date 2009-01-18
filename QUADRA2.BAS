5 SCREEN 9
10 r = 2
20 x = INT(640 * RND)
30 y = INT(340 * RND)
35 z = z + 1: r = r * 1.1 ^ z
36 IF r <= 0 THEN CLS : z = 0: GOTO 5

40 FOR za = 1 TO z
50 LOCATE 1, 1: PRINT r
CIRCLE (x, y), r
60 x = INT(640 * RND)
70 y = INT(340 * RND)
80 NEXT

90 IF INKEY$ = " " THEN GOTO 110
GOTO 90
110
GOTO 20

