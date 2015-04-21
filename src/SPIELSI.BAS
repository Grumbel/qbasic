level = 1
10 SCREEN 9
11 CLS : xa = 5: be = 3: g = 500: fa = 0: COLOR 15: f = 15
IF level = 2 THEN LINE (265, 40)-(360, 100), , B: LINE (265, 40)-(265, 100), 5: LINE (360, 40)-(360, 100), 5
RANDOMIZE TIMER
LINE (1, 1)-(639, 1)
LINE (1, 349)-(1, 1), 5: LINE (639, 349)-(639, 1), 5
x = INT(600 * RND) + 20
IF level = 2 THEN x = x / 2.5
y = 50
15 n = 1: m = 1
CIRCLE (x, y), 7
LOCATE 23, xa: COLOR 5: PRINT CHR$(219); : COLOR 15: PRINT CHR$(219); CHR$(219); CHR$(219); CHR$(219); CHR$(219); CHR$(219); CHR$(219); : COLOR 5: PRINT CHR$(219): COLOR 15
LOCATE 10, 37: PRINT "Level"; level
LOCATE 12, 38: PRINT "Ready"
FOR za = 1 TO 100000
NEXT za
LOCATE 12, 38: PRINT " Set "
FOR za = 1 TO 75000
NEXT za
LOCATE 12, 38: PRINT " Go! "
FOR za = 1 TO 75000
NEXT za
LOCATE 10, 37: PRINT "       "
LOCATE 12, 38: PRINT "      "
IF level = 2 THEN LINE (265, 40)-(360, 100), , B: LINE (265, 40)-(265, 100), 5: LINE (360, 40)-(360, 100), 5
CIRCLE (x, y), 7, 0
20 x = x + n: y = y + m
30 fb = POINT(x + 8, y + 7): fc = POINT(x + 8, y - 7): fd = POINT(x - 8, y - 7): fe = POINT(x - 8, y + 7)
CIRCLE (x, y), 7
50 CIRCLE (x - n, y - m), 7, 0
FOR za = 1 TO g
NEXT za
IF fb = 5 OR fc = 5 OR fd = 5 OR fe = 5 THEN SOUND 1750, .1: n = -n
IF g <= 25 THEN GOTO 500
g = g - .1
IF y >= 349 THEN GOTO 400
GOTO 450
400 FOR sou = -1000 TO -40 STEP 5
SOUND -sou, .1
NEXT sou
440 FOR r = 1 TO 75
sou = INT(300 * RND) + 400
SOUND sou, .1
CIRCLE ((xa + 3) * 640 / 80, 315), r, 4
CIRCLE ((xa + 3) * 640 / 80, 315), r / 2, 14
NEXT r
FOR r = -75 TO 0
CIRCLE ((xa + 3) * 640 / 80, 315), -r, 0
NEXT r
CLS : fa = 15: LINE (1, 1)-(639, 349), , B: a = 0
445 LOCATE 10, 35.5: COLOR fa: PRINT "Game Over"
LOCATE 14, 33: COLOR 7: PRINT "Nochmal? [j;n]"
IF fa = 0 THEN fa = 15: GOTO 447
IF fa = 15 THEN fa = 0
447 FOR za = 1 TO 10000
B$ = INKEY$
IF B$ = "j" THEN GOTO 11
IF B$ = "n" THEN END
NEXT za
448 GOTO 445
450 IF fb = 15 OR fc = 15 OR fd = 15 OR fe = 15 THEN m = m * (-1): SOUND 1750, .1
a$ = INKEY$
IF a$ = "5" AND be = 3 THEN be = 8: f = 0: GOTO 455
IF a$ = "5" AND be = 8 THEN be = 3: f = 15
455 IF a$ = "6" THEN xa = xa + be: LOCATE 23, xa - be: PRINT "         "
IF a$ = "4" THEN xa = xa - be: LOCATE 23, xa + be: PRINT "         "

'*** Curser Begrenzung ***
IF a$ = "6" AND xa >= 71 THEN xa = 71
IF a$ = "4" AND xa <= 3 THEN xa = 2

LOCATE 23, xa: COLOR 5: PRINT CHR$(219); : COLOR f: PRINT CHR$(219); CHR$(219); CHR$(219); CHR$(219); CHR$(219); CHR$(219); CHR$(219); : COLOR 5: PRINT CHR$(219): COLOR 15
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
IF level = 3 THEN GOTO 650
IF level = 2 THEN level = 3
IF level = 1 THEN level = 2
GOTO 11
650 IF fa = 7 OR fa = 8 THEN fa = 14
LOCATE 8, 29: COLOR fa: PRINT "Herzlichen Glckwunsch!"
LOCATE 11, 14: COLOR 15: PRINT "Du hast es geschaft. Du hast das Spiel durch gespielt."
IF INKEY$ = " " THEN CLS : GOTO 700
GOTO 650
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
1000 LOCATE 8, 23.5: COLOR 7: PRINT "Die Idee zu diesem Spiel stammt von"
LOCATE 12, 33: COLOR 5: PRINT "Stefan Ruhnke": COLOR 7
LOCATE 14, 38.5: COLOR 7: PRINT "und"
LOCATE 16, 33.5: COLOR 14: PRINT "Ingo Ruhnke"
IF INKEY$ = " " THEN CLS : fa = 0: GOTO 1100
GOTO 1000
1100 LOCATE 8, 29: COLOR 14: PRINT "Thank you for playing!"
LOCATE 11, 34: COLOR 2: PRINT "presented by": COLOR 7
LOCATE 15, 31: COLOR fa: PRINT "GG - Grumbel Games": COLOR 7
IF INKEY$ = " " THEN CLS : fa = 0: GOTO 1200
IF fa = 0 THEN fa = 15: GOTO 1150
IF fa = 15 THEN fa = 0
1150 FOR za = 1 TO 15000
NEXT za
GOTO 1100
1200 LOCATE 10, 19: COLOR fa: PRINT "Das wars. Du kannst das Spiel nun beenden."
IF fa = 0 THEN fa = 14: GOTO 1250
IF fa = 14 THEN fa = 0
1250 IF INKEY$ = " " THEN CLS : fa = 0: GOTO 1300
FOR za = 1 TO 20000
NEXT za
GOTO 1200
1300 END












