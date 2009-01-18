10 SCREEN 9
15 x = -320: c = 160: y = 190: lx = -323: lc = 160: ly = 190
20 rx = (x + 320) * 45 + v
30 ry = 350 - y
40 y = (SIN(x)) * 50
50 y = y + 170
60 LINE (rx, ry)-(r, c), 10
r = rx
c = ry
x = x + .025
IF x > -290 THEN x = -320: y = 190: rx = 0: r = 0: c = 160
'l”schen
120 lrx = (lx + 320) * 45 + lv
130 lry = 350 - ly
140 ly = (SIN(lx)) * 50
150 ly = ly + 170
160 LINE (lrx, lry)-(lr, lc), 0
lr = lrx
lc = lry
lx = lx + .025
IF lx > -290 THEN lx = -320: ly = 190: lrx = 0: lr = 0: lc = 160

GOTO 20

