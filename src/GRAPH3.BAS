10 SCREEN 9
20 RANDOMIZE TIMER
30 e = 4 * RND + 1
40 x = x + 1
50 PRINT e:  y = x ^ e
60 LINE (320 + 5 * x, 340 - y)-(320 + 5 * a, 340 - b)
70 a = x: b = y
IF 320 + 5 * x >= 640 THEN x = -4: y = 0: a = 0: b = 0: CLS : GOTO 30
IF 320 + 5 * x <= 0 THEN x = -4: y = 0: a = 0: b = 0: CLS : GOTO 30
IF 340 - y <= 0 THEN x = -4: y = 0: a = 0: b = 0: CLS : GOTO 30
IF 340 - y >= 350 THEN x = -4: y = 0: a = 0: b = 0: CLS : GOTO 30
80 GOTO 40



