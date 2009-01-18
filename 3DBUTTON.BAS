DECLARE SUB Button (x!, y!, a!, b!)
SCREEN 12

CALL Button(320, 200, 150, 100)
CALL Button(120, 100, 50, 30)



SUB Button (x, y, a, b)
LINE (x - a / 2, y - b / 2)-STEP(a, b), 7, BF
LINE (x - a / 2, y - b / 2)-STEP(a, 0)
LINE (x - a / 2, y - b / 2)-STEP(0, b)
LINE (x + a / 2, y + b / 2)-STEP(-a, 0), 8
LINE (x + a / 2, y + b / 2)-STEP(0, -b), 8

END SUB

