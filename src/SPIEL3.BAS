10 SCREEN 9
xa = 2: g = 500
RANDOMIZE TIMER
LINE (1, 1)-(639, 349), , B
x = INT(600 * RND) + 20
y = 50
15 n = 1: m = 1
CIRCLE (x, y), 7
LOCATE 23, xa: PRINT CHR$(219); CHR$(219); CHR$(219); CHR$(219); CHR$(219); CHR$(219); CHR$(219); CHR$(219)
FOR za = 1 TO 80000
NEXT za
IF g <= 25 THEN GOTO 500
g = g - .1
IF x = 628 THEN SOUND 1750, .1: n = -1
IF x = 12 THEN SOUND 1750, .1: n = 1
IF y = 337 THEN SOUND 1750, .1: m = -1
IF y = 12 THEN SOUND 1750, .1: m = 1
IF fa = 15 THEN m = m * (-1): SOUND 1750, .1
a$ = INKEY$
IF a$ = "6" AND xa >= 71 THEN xa = 69
IF a$ = "4" AND xa <= 3 THEN xa = 5
IF a$ = "6" THEN xa = xa + 3: LOCATE 23, xa - 3: PRINT "       "
IF a$ = "4" THEN xa = xa - 3: LOCATE 23, xa + 3: PRINT "        "
LOCATE 23, xa: PRINT CHR$(219); CHR$(219); CHR$(219); CHR$(219); CHR$(219); CHR$(219); CHR$(219); CHR$(219)
GOTO 20
500 FOR r = 1 TO 75
sou = INT(300 * RND) + 400
SOUND sou, .1
CIRCLE (x, y), r, 4
CIRCLE (x, y), r / 2, 14
NEXT r
FOR r = -75 TO 0
CIRCLE (x, y), -r, 0
NEXT r
FOR za = 1 TO 25000
NEXT za
CLS

600 fa = INT(14 * RND) + 1
FOR za = 1 TO 3000
NEXT za
IF fa = 7 OR fa = 8 THEN fa = 14
LOCATE 8, 29: COLOR fa: PRINT "Herzlichen Glckwunsch!"
LOCATE 11, 14: COLOR 15: PRINT "Du hast es geschaft. Du hast das Spiel durch gespielt."
IF INKEY$ = " " THEN CLS : GOTO 700
GOTO 600
700 LOCATE 8, 22.5: COLOR 7: PRINT "Dieses Spiel wurde programmiert von"
LOCATE 12, 34.5: COLOR 14: PRINT "INGO RUHNKE": COLOR 7
IF INKEY$ = " " THEN CLS : GOTO 800
GOTO 700
800 LOCATE 8, 35: PRINT "Grafik von"
LOCATE 12, 34: COLOR 2: PRINT "INGO RUHNKE": COLOR 7
IF INKEY$ = " " THEN CLS : GOTO 900
GOTO 800
900 LOCATE 8, 35: PRINT "Sound von"
LOCATE 12, 33.5: COLOR 15: PRINT "INGO RUHNKE": COLOR 7
IF INKEY$ = " " THEN CLS : GOTO 1000
GOTO 900
1000 LOCATE 8, 22.5: PRINT "Die Idee zu diesem Spiel stammt von"
LOCATE 12, 32: COLOR 5: PRINT "Stefan Ruhnke": COLOR 7
IF INKEY$ = " " THEN CLS : fa = 0: GOTO 1100
GOTO 1000
1100 LOCATE 8, 29: COLOR 14: PRINT "Thank you for playing!"
LOCATE 10, 23: COLOR 2: PRINT "presented by": COLOR 7
LOCATE 15, 31: COLOR fa: PRINT "GG - Grumbel Games": COLOR 7
IF INKEY$ = " " THEN CLS : GOTO 1200
IF fa = 0 THEN fa = 15: GOTO 1150
IF fa = 15 THEN fa = 0
1150 FOR za = 1 TO 15000
NEXT za
GOTO 1100
1200











