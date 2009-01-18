10 SCREEN 9
LINE (1, 170)-(640, 170), 8
LINE (320, 0)-(320, 360), 8
x = -500
sy = 170
sx = -1
ssx = sx: ssy = sy
20
sx = (x * 5) + 320
ssx = sx: ssy = sy
30 sy = 170 - (y / 999)
IF sy > 360 THEN sy = 360: ssy = 360
IF sy < 0 THEN sy = -1: ssy = -1
IF sx > 640 THEN sx = 640
IF sx < 0 THEN sx = 0
40 LINE (sx, sy)-(ssx, ssy)
45
50 x = x + 1
60 y = (x - 20) * (x - 10) * (x + 50) * (x - 25) * (x - 13) * (x + 16) * (x + 23) * (x + 8) * (x - 45)
65 IF sx > 639 THEN END
LOCATE 1, 1: PRINT x; y; sx; sy
ssx = sx: ssy = sy
70 GOTO 20

