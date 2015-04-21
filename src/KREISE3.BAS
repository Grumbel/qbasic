10 SCREEN 9
11 fa = 15
12 ra = 15
15 RANDOMIZE TIMER
20 CLS
30 x = INT(640 * RND)
40 y = INT(350 * RND)
50 CIRCLE (x, y), 15
51 a = a + 1: IF a = 500 THEN a = 0: GOTO 60
55 GOTO 51
60 LINE (1, 350)-(x, y), 14: LINE (640, 350)-(x, y), 14
76 b = b + 1: IF b > 100 THEN b = 0: GOTO 78
77 GOTO 76
78 CIRCLE (x, y), ra
SOUND 1000 - so, .1
so = so + 50
79 ra = ra - 1
IF ra = -1 THEN ra = 16: so = 0: GOTO 80
CIRCLE (x, y), ra + 1, 0
GOTO 78
80 LINE (1, 350)-(x, y), 0: LINE (640, 350)-(x, y), 0
90 c = INT(40 + e * RND) + x - (40 + e / 2)
100 d = INT(30 + f * RND) + y - (30 + f / 2)
110 LINE (c, d)-(c, d), fa
120 ca = INT(40 + e * RND) + x - (40 + e / 2)
130 da = INT(30 + f * RND) + y - (30 + f / 2)
140 LINE (ca, da)-(ca, da), fa
150 cb = INT(40 + e * RND) + x - (40 + e / 2)
160 db = INT(30 + f * RND) + y - (30 + f / 2)
170 LINE (cb, db)-(cb, db), fa
180 cc = INT(40 + e * RND) + x - (40 + e / 2)
190 dc = INT(30 + f * RND) + y - (30 + f / 2)
200 LINE (cc, dc)-(cc, dc), fa
210 cd = INT(40 + e * RND) + x - (40 + e / 2)
230 dd = INT(30 + f * RND) + y - (30 + f / 2)
240 LINE (cd, dd)-(cd, dd), fa
250 ce = INT(40 + e * RND) + x - (40 + e / 2)
260 de = INT(30 + f * RND) + y - (30 + f / 2)
270 LINE (ce, de)-(ce, de), fa
280 cf = INT(40 + e * RND) + x - (40 + e / 2)
290 df = INT(30 + f * RND) + y - (30 + f / 2)
300 LINE (cf, df)-(cf, df), fa
310 cg = INT(40 + e * RND) + x - (40 + e / 2)
320 dg = INT(30 + f * RND) + y - (30 + f / 2)
330 LINE (cg, dg)-(cg, dg), fa
340 ch = INT(40 + e * RND) + x - (40 + e / 2)
350 dh = INT(30 + f * RND) + y - (30 + f / 2)
360 LINE (ch, dh)-(ch, dh), fa
370 IF e = 200 THEN e = 0: f = 0: fa = 15: GOTO 20
380 IF e = 100 THEN fa = 14
LINE (c, d)-(c, d), 0
LINE (ca, da)-(ca, da), 0
LINE (cb, db)-(cb, db), 0
LINE (cc, dc)-(cc, dc), 0
LINE (cd, dd)-(cd, dd), 0
su = INT(1000 * RND) + 200
SOUND su, .4
430 e = e + 10: f = f + 7
440 GOTO 90












