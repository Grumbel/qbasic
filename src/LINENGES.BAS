10 SCREEN 9
20 CLS
30 a = a + 2
y = 40: yy = 80: yyy = 120: yb = 160: yyb = 200: yyyb = 240: f = 280: z = 320
50 r = INT(14 * RND)
60 c = INT(16 * RND)
70 PRESET (a, t), 15
PRESET (a * 2, y), 14
PRESET (a * 3, yy), 13
PRESET (a * 4, yyy), 12
PRESET (a * 5, yb), 11
PRESET (a * 6, yyb), 10
PRESET (a * 7, yyyb), 9
PRESET (a * 8, f), 8
PRESET (a * 9, z), 7
80 IF a = 640 THEN CLS : a = 0
90 GOTO 30






