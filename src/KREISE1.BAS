5 CLS
10 SCREEN 9
15 INPUT "Maximaler Radius:", mr
17 CLS
20 x = INT(640 * RND) + 1
30 y = INT(350 * RND) + 1
40 r = INT(mr * RND) + 1
50 c = INT(15 * RND) + 1
60 CIRCLE (x, y), r, c
70 Z = Z + 1
80 IF Z = 200 THEN CLS : Z = 0
90 GOTO 20

