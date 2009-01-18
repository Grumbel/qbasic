SCREEN 12
10 INPUT x
INPUT y

'640,480
'80,28

LOCATE y / 480 * 30, x / 640 * 80
PRINT "-"
LINE (x - 50, y - 50)-(x + 50, y + 50)
LINE (x + 50, y - 50)-(x - 50, y + 50)
LOCATE 1, 1
GOTO 10


