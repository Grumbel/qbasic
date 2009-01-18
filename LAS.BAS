COMMON x AS INTEGER
COMMON xx AS INTEGER
COMMON y AS INTEGER
COMMON yy AS INTEGER
COMMON b AS INTEGER
COMMON bb AS INTEGER
COMMON a AS INTEGER
COMMON aa AS INTEGER
COMMON g AS INTEGER
COMMON xxa AS INTEGER
COMMON yya AS INTEGER
COMMON xxb AS INTEGER
COMMON yyb AS INTEGER

10 SCREEN 12
15 x = 300: y = 240: xx = 340: yy = 240: b = -1: bb = -1: a = 0: aa = 0: g = 1: gg = 1: xxa = 300: xxb = 340: yya = 240: yyb = 240
LINE (0, 0)-(639, 479), , B
LINE (1, 1)-(638, 478), , B
LINE (0, 0)-(96, 16), , B
LINE (1, 1)-(97, 17), , B
LINE (640, 16)-(535, 0), , B
LINE (639, 17)-(536, 1), , B
LOCATE 1, 1: PRINT "Player 1:"; l
LOCATE 1, 68: COLOR 4: PRINT "Player 2:"; ll: COLOR 15
20 stg$ = INKEY$
21 IF g = 2 THEN fb = POINT(x, y)
IF fb = 15 OR fb = 4 THEN GOTO 22
IF g = 2 THEN fb = POINT(x + (a / 2), y + (b / 2))
22 IF g = 1 THEN fb = POINT(x, y)

IF gg = 2 THEN fa = POINT(xx, yy)
IF fa = 15 OR fa = 4 THEN GOTO 25
IF gg = 2 THEN fa = POINT(xx + (a / 2), yy + (b / 2))
25 IF gg = 1 THEN fa = POINT(xx, yy)

30 LINE (x, y)-(xxa, yya)
LINE (xx, yy)-(xxb, yyb), 4
xxa = x: yya = y: xxb = xx: yyb = yy
40 x = x + a: xx = xx + aa
44 y = y + b: yy = yy + bb
45 FOR za = 1 TO 200
50 NEXT za
kn = STRIG(1)
km = STRIG(5)

IF g = 2 THEN GOTO 51
IF stg$ = "s" THEN g = 2: GOTO 59
51 IF gg = 2 THEN GOTO 53
52 IF stg$ = "5" THEN gg = 2: GOTO 59

53 IF stg$ = "s" THEN g = 1
54 IF stg$ = "5" THEN gg = 1

59 LOCATE 1, 10: PRINT ll
LOCATE 1, 78: PRINT l

IF g = 1 AND a = -2 THEN a = -1
IF g = 2 AND a = 1 THEN a = 2
IF g = 1 AND a = 2 THEN a = 1
IF g = 2 AND a = -1 THEN a = -2
IF g = 2 AND b = -1 THEN b = -2
IF g = 1 AND b = -2 THEN b = -1
IF g = 2 AND b = 1 THEN b = 2
IF g = 1 AND b = 2 THEN b = 1

IF gg = 1 AND aa = -2 THEN aa = -1
IF gg = 2 AND aa = 1 THEN aa = 2
IF gg = 1 AND aa = 2 THEN aa = 1
IF gg = 2 AND aa = -1 THEN aa = -2
IF gg = 2 AND bb = -1 THEN bb = -2
IF gg = 1 AND bb = -2 THEN bb = -1
IF gg = 2 AND bb = 1 THEN bb = 2
IF gg = 1 AND bb = 2 THEN bb = 1

IF a = -1 OR a = -2 THEN GOTO 80
60 IF stg$ = CHR$(0) + "M" THEN a = g: b = 0 'rechts
IF a = 1 OR a = 2 THEN GOTO 80
70 IF stg$ = CHR$(0) + "K" THEN a = -g: b = 0 'links
IF b = 1 OR b = 2 THEN GOTO 90
80 IF stg$ = CHR$(0) + "H" THEN b = -g: a = 0 'oben
IF b = -1 OR b = -2 THEN GOTO 100
90 IF stg$ = CHR$(0) + "P" THEN b = g: a = 0 'unten
100 IF aa = -gg THEN GOTO 130
110 IF stg$ = "6" THEN aa = gg: bb = 0  'rechts
120 IF aa = gg THEN GOTO 140
130 IF stg$ = "4" THEN aa = -gg: bb = 0  'links
140 IF bb = gg THEN GOTO 160
150 IF stg$ = "8" THEN bb = -gg: aa = 0  'oben
160 IF bb = -gg THEN GOTO 180
170 IF stg$ = "2" THEN bb = gg: aa = 0 'unten
180 IF fa = 4 OR fa = 15 THEN LOCATE 1, 1: COLOR 4: PRINT "Player 2: GAME OVER": COLOR 15: ll = ll + 1: GOTO 200
IF fb = 4 OR fb = 15 THEN LOCATE 1, 1: COLOR 15: PRINT "Player 1: GAME OVER": COLOR 15: l = l + 1: GOTO 200
GOTO 20
200 DO UNTIL gd$ = " "
gd$ = INKEY$
LOOP
CLS
gd$ = "k"
GOTO 15

