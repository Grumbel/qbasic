10 SCREEN 12
15 oz = 1
20 a$ = INKEY$
30 IF a$ = CHR$(0) + "M" THEN ox = ox + 1
40 IF a$ = CHR$(0) + "K" THEN ox = ox - 1
50 IF a$ = CHR$(0) + "H" THEN oy = oy + 1
60 IF a$ = CHR$(0) + "P" THEN oy = oy - 1
70 IF a$ = "„" THEN oz = oz + 1
80 IF a$ = "#" THEN oz = oz - 1
85 IF oz = -1 THEN oz = 0
90 LOCATE 1, 1: PRINT ox; oy; oz; x; y; xx; yy
100 x = (ox * (oz / 10) + 320): y = (-oy * (oz / 10) + 240)
110 CIRCLE (xx, yy), oz, 0
120 CIRCLE (x, y), oz
130 xx = x
140 yy = y
150 GOTO 20

