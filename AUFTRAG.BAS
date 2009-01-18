RANDOMIZE TIMER
CLS
SCREEN 9
LINE (40, 130)-(180, 260), 1, BF: LINE (40, 130)-(110, 180), , BF: ' FÅhrerhaus
LINE (180, 260)-(570, 220), 7, BF: ' AnhÑnger
CIRCLE (100, 250), 40, 8: PAINT (100, 251), 8: PAINT (100, 260), 8: CIRCLE (100, 250), 20, 7: PAINT (100, 250), 7: ' Reifen links"
CIRCLE (460, 250), 40, 8: PAINT (460, 250), 8: PAINT (460, 240), 8: PAINT (460, 260), 8: CIRCLE (460, 250), 20, 7: PAINT (460, 250), 7: 'Reifen rechts
LINE (580, 219)-(180, 75), 8, BF: LINE (70, 75)-(180, 75), 8: LINE (70, 75)-(20, 115), 8: LINE (20, 115)-(20, 120), 8: LINE (20, 120)-(30, 128), 8: LINE (30, 128)-(180, 128), 8: PAINT (50, 100), 8: LINE (500, 50)-(600, 100), 0: PAINT (570, 80), 0
LINE (200, 165)-(300, 125), , BF: LINE (370, 165)-(470, 125), , BF: LINE (75, 90)-(165, 110), , BF: 'Fenster
LINE (30, 150)-(50, 130), 0: PAINT (45, 133), 0
FOR za = 1 TO 100000
NEXT
LOCATE 1, 1: PRINT "Feuer!"
FOR za = 1 TO 35000
NEXT
LOCATE 1, 1: PRINT "                              "
FOR z = 1 TO 150
x = INT(530 * RND) + 40
y = INT(200 * RND) + 75
SOUND 1000, .5
za = 0
CIRCLE (x, y), 3, 0
PAINT (x, y), 0
10 za = za + 1
IF za = 1000 THEN za = 0: GOTO 20
GOTO 10
20 NEXT
LOCATE 1, 1: PRINT "Der Tank ist getroffen!"
30 FOR za = 1 TO 5
FOR sou = 100 TO 350
SOUND sou, .1
NEXT sou
NEXT za
LOCATE 1, 1: PRINT "                               "
FOR za = 1 TO 15
x = INT(140 * RND) + 180
y = INT(40 * RND) + 220
FOR r = 1 TO 35
CIRCLE (x, y), r, 4
sou = INT(100 * RND) + 100
SOUND sou, .1
CIRCLE (x, y), r / 2, 14
NEXT r
FOR ra = -35 TO -1
CIRCLE (x, y), -ra, 0
NEXT ra
NEXT za
FOR r = 1 TO 450
CIRCLE (200, 240), r, 4
sou = INT(500 * RND) + 200
SOUND sou, .05
CIRCLE (200, 240), r / 2, 14
NEXT
FOR r = 1 TO 450 STEP .5
CIRCLE (200, 240), r, 0
NEXT
CLS
LOCATE 1, 1: PRINT "Ziel vernichtet."

