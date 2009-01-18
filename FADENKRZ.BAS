10 SCREEN 12

'Der folgende Abschnitt ist unwichtig, k”nnte allerdings noch gebrauchsfertig
'gemacht werden.

'20 PRINT "oben/links"
'30 IF STRIG(1) = -1 THEN minx = STICK(0): miny = STICK(1): GOTO 50
'40 GOTO 30
'50 PRINT "unten/rechts"
'FOR za = 1 TO 10000
'NEXT za
'60 IF STRIG(1) = -1 THEN maxx = STICK(0): maxy = STICK(1): GOTO 80
'70 GOTO 60

80 PRINT "Mittelstellung"
FOR za = 1 TO 10000
NEXT za
90 IF STRIG(1) = -1 THEN centx = STICK(0): centy = STICK(1): GOTO 110
100 GOTO 90
110 PRINT "links:"; minx; "rechts:"; maxx
120 PRINT "oben:"; miny; "unten:"; maxy
130 PRINT "Zentrum X:"; centx; "Zentrum Y:"; centy
140 rx = maxx - centx
150 lx = minx - centx
160 oy = miny - centy
170 uy = maxy - centy
180 PRINT lx; rx; oy; uy
190 x = 320: y = 230: xx = 320: yy = 230
195 CLS
200 IF STRIG(5) = -1 THEN xx = x: yy = y
'LINE (x, y)-(xx, yy), fa

LINE (x, 0)-(x, 480), fa
LINE (0, y)-(640, y), fa

LINE (xx, 0)-(xx, 480), 0
LINE (0, yy)-(640, yy), 0

IF STRIG(1) = -1 THEN fa = f ELSE fa = 0
IF STRIG(3) = -1 THEN f = f + 1: GOSUB 450
IF STRIG(7) = -1 THEN f = f - 1: GOSUB 450
a$ = INKEY$
IF a$ = "c" THEN CLS
IF f < 0 THEN f = 0
IF f > 15 THEN f = 15
LOCATE 1, 1: PRINT f; fa; INT(x); INT(y)
201 xx = x: yy = y
205 IF STICK(0) > centx - 10 AND STICK(0) < centx + 10 THEN GOTO 220
210 x = x + (STICK(0) - centx) / 10
220 IF STICK(1) > centy - 10 AND STICK(1) < centy + 10 THEN GOTO 300
225 y = y + (STICK(1) - centy) / 10
300 GOTO 200
450 FOR za = 1 TO 4500
NEXT za
RETURN

