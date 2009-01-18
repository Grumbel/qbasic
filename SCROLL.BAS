10 CLS
15 a$ = "hallo"
20 LOCATE 24, 36: PRINT a$
30 FOR z = 1 TO 7
40 PRINT " "
50 FOR za = 1 TO 7500
60 NEXT za
70 NEXT z
75 d = d + 1
80 IF d = 1 THEN a$ = "Ingo"
90 IF d = 2 THEN a$ = "Stefan"
100 IF d = 3 THEN a$ = "Joystick"
110 IF d = 4 THEN a$ = "PC": d = 0
120 GOTO 20









