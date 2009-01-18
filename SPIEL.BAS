OPEN "c:\basic\high.scr" FOR INPUT AS #1

CLOSE
ry = 1
RANDOMIZE TIMER
level = 1: Leben = 5
10 SCREEN 9
11 LOCATE 7, 35: PRINT "Willkommen"
FOR sou = 100 TO 1500 STEP 10
SOUND sou, .1
NEXT sou
FOR za = 1 TO 75000
NEXT za
LOCATE 9, 39: PRINT "zu"
FOR sou = 100 TO 1500 STEP 10
SOUND sou, .1
NEXT sou
FOR za = 1 TO 75000
NEXT za

12 ' *** Titelbild / MenÅ ***
fa = 14
CLS
ky = 100
FOR kx = 150 TO 300 STEP 15
ky = ky + 20
LINE (320 - kx / 2, 159 - ky / 4)-STEP(kx, ky / 2 - 25), , B
NEXT kx
LOCATE 11, 36: COLOR 14: PRINT "Lava  Ball": COLOR 15
REM IF mus = 0 THEN PLAY "faegfcab"
LOCATE 20, 23: COLOR 14: PRINT "[S]"; : COLOR 15: PRINT "tart": LOCATE 20, 48: COLOR 14: PRINT "[H]"; : COLOR 15: PRINT "ighscores"
LOCATE 20, 34: COLOR 14: PRINT "[A]"; : COLOR 15: PRINT "nleitung"
13 bb$ = INKEY$
IF bb$ = "s" THEN GOTO 14
IF bb$ = "h" THEN GOTO 2600
IF bb$ = "a" THEN GOTO 3000
GOTO 13

14 ' *** Spielbeginn ***
CLS : rx = 1: ry = 1: Lava = 4: ne = 0: na = 0: xt = 0: nb = 0: xa = 5: xs = 0: zeit = 4750: ne = 0: be = 3: g = 500: fa = 0: COLOR 15: f = 15
LOCATE 1, 2: PRINT "Punkte:"; punkte: LOCATE 1, 36: PRINT "Leben:"; Leben: LOCATE 1, 72: PRINT "Zeit:"; CINT(zeit / 47.97979797979#)

' *** Levelgrafik ***

IF level = 2 THEN LINE (265, 50)-(360, 110), , B: LINE (265, 51)-(265, 109), 7: LINE (360, 51)-(360, 109), 7
IF level = 3 THEN LINE (100, 50)-STEP(100, 75), , B: LINE (100, 51)-(100, 124), 7: LINE (200, 51)-(200, 124), 7: LINE (540, 51)-STEP(-100, 74), , B: LINE (540, 51)-(540, 124), 7: LINE (440, 51)-(440, 124), 7
IF level = 4 THEN LINE (100, 50)-STEP(100, 75), , B: LINE (100, 51)-(100, 124), 7: LINE (200, 51)-(200, 124), 7: LINE (540, 51)-STEP(-100, 74), , B: LINE (540, 51)-(540, 124), 7: LINE (440, 51)-(440, 124), 7
IF level = 4 THEN LINE (265, 81)-(360, 110), , B: LINE (265, 81)-(265, 109), 7: LINE (360, 81)-(360, 109), 7
IF level = 5 THEN LINE (250, 130)-(390, 160), , B: LINE (250, 131)-(250, 159), 7: LINE (390, 131)-(390, 159), 7
IF level = 6 THEN LINE (120, 50)-(70, 200), , B: LINE (570, 50)-(520, 200), , B: LINE (120, 50)-(120, 200), 7: LINE (70, 50)-(70, 200), 7: LINE (570, 50)-(570, 200), 7: LINE (520, 50)-(520, 200), 7
IF level = 7 THEN LINE (200, 100)-(440, 190), , B: LINE (200, 101)-(200, 189), 7: LINE (440, 101)-(440, 189), 7
IF level = 8 THEN LINE (270, 100)-(370, 150), , B: LINE (90, 150)-(190, 100), , B: LINE (450, 150)-(550, 100), , B
IF level = 8 THEN LINE (270, 101)-(270, 149), 7: LINE (370, 101)-(370, 149), 7: LINE (90, 149)-(90, 101), 7: LINE (190, 101)-(190, 149), 7: LINE (450, 101)-(450, 149), 7: LINE (550, 101)-(550, 149), 7
IF level = 9 THEN LINE (265, 100)-STEP(100, 70), , B: LINE (265, 101)-(265, 169), 7: LINE (365, 101)-(365, 169), 7
IF level = 10 THEN LINE (70, 180)-(250, 130), , B: LINE (570, 180)-(390, 130), , B: LINE (70, 179)-(70, 131), 7: LINE (250, 179)-(250, 131), 7: LINE (570, 131)-(570, 179), 7: LINE (390, 131)-(390, 179), 7
IF level = 10 THEN LINE (300, 15)-(340, 40), , B: PAINT (320, 30): LINE (300, 15)-(300, 40), 7: LINE (340, 15)-(340, 40), 7

' *** Randgrafik ***
LINE (1, 15)-(639, 15)
LINE (1, 325)-(1, 15), 7: LINE (639, 325)-(639, 15), 7
LINE (1, 325)-(640, 350), 4, BF

' *** Startpunkt des Balles ***
x = INT(600 * RND) + 20
y = 35
IF level = 10 THEN y = 70

15 n = 1: m = 1
CIRCLE (x, y), 7
LOCATE 23, xa: COLOR 7: PRINT CHR$(219); : COLOR 15: PRINT CHR$(219); CHR$(219); CHR$(219); CHR$(219); CHR$(219); CHR$(219); CHR$(219); : COLOR 7: PRINT CHR$(219): COLOR 15
LOCATE 10, 37: PRINT "Level"; level
FOR za = 1 TO 100000
NEXT za
SOUND 1000, 5
LOCATE 12, 38: COLOR 4: PRINT "Ready"
FOR za = 1 TO 100000
NEXT za
SOUND 1000, 5
LOCATE 12, 38: COLOR 14: PRINT " Set "
FOR za = 1 TO 100000
NEXT za
SOUND 2000, 10
LOCATE 12, 38: COLOR 2: PRINT " Go! ": COLOR 15
FOR za = 1 TO 100000
NEXT za
LOCATE 10, 37: PRINT "        "
LOCATE 12, 38: PRINT "      "
IF level = 2 THEN LINE (265, 50)-(360, 110), , B: LINE (265, 50)-(265, 110), 7: LINE (360, 50)-(360, 110), 7
IF level = 5 THEN LINE (250, 130)-(390, 160), , B: LINE (250, 131)-(250, 159), 7: LINE (390, 131)-(390, 159), 7
CIRCLE (x, y), 7, 0
20 x = x + n: y = y + m
30 fb = POINT(x + 8, y + 7): fc = POINT(x + 8, y - 7): fd = POINT(x - 8, y - 7): fe = POINT(x - 8, y + 7)
LOCATE 1, 2: PRINT "Punkte:"; punkte: LOCATE 1, 36: PRINT "Leben:"; Leben: LOCATE 1, 72: PRINT "Zeit:"; CINT(zeit / 47.97979797979#)
CIRCLE (x, y), 7
50 CIRCLE (x - n, y - m), 7, 0
FOR za = 1 TO g
NEXT za
IF fb = 7 OR fc = 7 OR fd = 7 OR fe = 7 THEN SOUND 1750, .1: n = -n
IF fb = 15 OR fc = 15 OR fd = 15 OR fe = 15 THEN m = -m: SOUND 1750, .1
60 IF g <= 25 THEN GOTO 500
punkte = punkte + 5
zeit = zeit - 1
g = g - .1
IF y >= 349 THEN GOTO 400
GOTO 450

' *** Explosions Sequenz ***
400 CIRCLE (x, y), 7, 0
LINE (1, 325)-(640, 350), 4, BF
FOR sou = -1000 TO -40 STEP 5
SOUND -sou, .1
NEXT sou
440 FOR kreise = 1 TO 20
y = INT(20 * RND) - 10
x = INT(70 * RND) - 35
FOR r = 1 TO 25
sou = INT(300 * RND) + 400
SOUND sou, .1
CIRCLE ((xa + 3) * 640 / 80 + x, 315 + y), r, 4
CIRCLE ((xa + 3) * 640 / 80 + x, 315 + y), r / 2, 14
NEXT r
FOR r = -25 TO 0
CIRCLE ((xa + 3) * 640 / 80 + x, 315 + y), -r, 0
NEXT r
NEXT kreise
IF Leben > 0 THEN Leben = Leben - 1:  GOTO 14

' *** Game Over Screen ***
fa = 15: LINE (240, 110)-STEP(160, 90), 4, B: LINE (230, 100)-STEP(180, 110), 4, B: PAINT (245, 105), 4: a = 0
445 LOCATE 10, 37: COLOR fa: PRINT "Game Over"
LOCATE 13, 34: COLOR 15: PRINT "Nochmal? [j;n]"
IF fa = 4 THEN fa = 15: GOTO 447
IF fa = 15 THEN fa = 4
447 FOR za = 1 TO 10000
aB$ = INKEY$
IF aB$ = "j" THEN punkte = 0: Leben = 5: level = 1: GOTO 14
IF aB$ = "n" THEN END
NEXT za
448 GOTO 445
450
aa$ = INKEY$
IF y > 302 THEN GOTO 460
IF aa$ = "5" AND be = 3 THEN be = 8: f = 0: GOTO 455
IF aa$ = "5" AND be = 8 THEN be = 3: f = 15
IF aa$ = "p" THEN GOTO 2700
455 IF aa$ = "6" THEN xa = xa + be: LOCATE 23, xa - be: PRINT "         "
IF aa$ = "4" THEN xa = xa - be: LOCATE 23, xa + be: PRINT "         "
460

'*** Curser Begrenzung ***
IF aa$ = "6" AND xa >= 71 THEN xa = 71
IF aa$ = "4" AND xa <= 3 THEN xa = 2

' *** Curser ***
LOCATE 23, xa: COLOR 7: PRINT CHR$(219); : COLOR f: PRINT CHR$(219); CHR$(219); CHR$(219); CHR$(219); CHR$(219); CHR$(219); CHR$(219); : COLOR 7: PRINT CHR$(219): COLOR 15

ne = ne + 1: nb = nb + 1: na = na + 1
IF ne >= 75 AND level = 9 THEN ne = 0: GOTO 480
IF na >= 25 AND level = 10 THEN GOTO 490
IF nb >= 10 THEN GOTO 475
GOTO 20
470


475 lav = INT(2 * RND)
IF lav = 0 THEN Lava = 4
IF lav = 2 THEN Lava = 14
IF lav = 1 THEN Lava = 12
LINE (1, 325)-(640, 350), Lava, BF
nb = 0
GOTO 20

' *** Level 9 ***
480 xs = xs + 1
IF level = 9 THEN LINE (265 - xs, 100 - xs)-(365 + xs, 170 + xs), , B
IF level = 9 THEN LINE (265 - xs, 101 - xs)-(265 - xs, 169 + xs), 7
IF level = 9 THEN LINE (365 + xs, 101 - xs)-(365 + xs, 169 + xs), 7
ne = 0
GOTO 20

' *** Level 10 ***
490 xt = xt + 1
IF level = 10 THEN LINE (300, 15 + xt)-(340, 40 + xt), , B: LINE (300, 15 + xt)-(300, 40 + xt), 7: LINE (340, 15 + xt)-(340, 40 + xt), 7
na = 0
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

' *** Levelfortschritt***

IF level = 1 THEN Leben = Leben + 1: level = 2: GOTO 14
IF level = 2 THEN Leben = Leben + 1: level = 3: GOTO 14
IF level = 3 THEN Leben = Leben + 1: level = 4: GOTO 14
IF level = 4 THEN Leben = Leben + 1: level = 5: GOTO 14
IF level = 5 THEN Leben = Leben + 1: level = 6: GOTO 14
IF level = 6 THEN Leben = Leben + 1: level = 7: GOTO 14
IF level = 7 THEN Leben = Leben + 1: level = 8: GOTO 14
IF level = 8 THEN Leben = Leben + 1: level = 9: GOTO 14
IF level = 9 THEN Leben = Leben + 1: level = 10: GOTO 14
IF level = 10 THEN Leben = Leben + 1: GOTO 650
                 
' *** Abspann ***

650
655 rx = rx + 1
IF rx = 81 THEN rx = 1: ry = ry + 1
IF ry = 24 THEN CLS : COLOR 15: ry = 1: rx = 0: GOTO 656
LOCATE ry, rx: COLOR 4: PRINT CHR$(219)
GOTO 655
656 LOCATE 8, 29: COLOR 4: PRINT "Herzlichen GlÅckwunsch!"
LOCATE 11, 14: COLOR 15: PRINT "Du hast es geschaft. Du hast das Spiel durch gespielt."
FOR za = 1 TO 150000
NEXT za
660 rx = rx + 1
IF rx = 81 THEN rx = 1: ry = ry + 1
IF ry = 24 THEN CLS : COLOR 15: ry = 1: rx = 0: GOTO 700
LOCATE ry, rx: COLOR 14: PRINT CHR$(219)
GOTO 660
700 LOCATE 8, 22.5: COLOR 15: PRINT "Dieses Spiel wurde programmiert von"
LOCATE 12, 34.5: COLOR 14: PRINT "INGO RUHNKE": COLOR 15
FOR za = 1 TO 150000
NEXT za
760 rx = rx + 1
IF rx = 81 THEN rx = 1: ry = ry + 1
IF ry = 24 THEN CLS : COLOR 15: ry = 1: rx = 0: GOTO 800
LOCATE ry, rx: COLOR 2: PRINT CHR$(219)
GOTO 760
800 LOCATE 8, 35: PRINT "Grafik von"
LOCATE 12, 34: COLOR 2: PRINT "INGO RUHNKE": COLOR 15
FOR za = 1 TO 150000
NEXT za
860 rx = rx + 1
IF rx = 81 THEN rx = 1: ry = ry + 1
IF ry = 24 THEN CLS : COLOR 15: ry = 1: rx = 0: GOTO 900
LOCATE ry, rx: COLOR 5: PRINT CHR$(219)
GOTO 860
900 LOCATE 8, 35: PRINT "Sound von"
LOCATE 12, 33.5: COLOR 5: PRINT "INGO RUHNKE": COLOR 15
IF INKEY$ = " " THEN CLS : GOTO 1000
FOR za = 1 TO 150000
NEXT za
960 rx = rx + 1
IF rx = 81 THEN rx = 1: ry = ry + 1
IF ry = 24 THEN CLS : COLOR 15: ry = 1: rx = 0: GOTO 1000
LOCATE ry, rx: COLOR 12: PRINT CHR$(219)
GOTO 960
1000 LOCATE 8, 23.5: COLOR 15: PRINT "Die Idee zu diesem Spiel stammt von"
LOCATE 16, 33: COLOR 5: PRINT "Stefan Ruhnke": COLOR 15
LOCATE 14, 38.5: COLOR 15: PRINT "und"
LOCATE 12, 33.5: COLOR 12: PRINT "Ingo Ruhnke"
FOR za = 1 TO 150000
NEXT za
1060 rx = rx + 1
IF rx = 81 THEN rx = 1: ry = ry + 1
IF ry = 24 THEN CLS : COLOR 15: ry = 1: rx = 0: GOTO 1100
LOCATE ry, rx: COLOR 11: PRINT CHR$(219)
GOTO 1060

1100 fa = 0
FOR zb = 1 TO 10
LOCATE 8, 29: COLOR 14: PRINT "Thank you for playing!"
LOCATE 11, 34: COLOR 2: PRINT "presented by": COLOR 15
LOCATE 15, 31: COLOR fa: PRINT "GG - Grumbel Games": COLOR 15
IF fa = 0 THEN fa = 15: GOTO 1150
IF fa = 15 THEN fa = 0
1150 FOR za = 1 TO 15000
NEXT za
NEXT zb
1200 rx = rx + 1
IF rx = 81 THEN rx = 1: ry = ry + 1
IF ry = 24 THEN CLS : COLOR 15: ry = 1: rx = 0: GOTO 1240
LOCATE ry, rx: COLOR 14: PRINT CHR$(219)
GOTO 1200
1240 punkte = punkte + (25000 * Leben)
LOCATE 6, 34: COLOR 14: PRINT "Schlu·bericht": COLOR 15
LOCATE 8, 24: PRINT "Du hast"; punkte; "Punkte erspielt und"
LOCATE 10, 24: PRINT "noch"; Leben; "Leben in Reserve gehabt"
IF punkte > c - 1 THEN LOCATE 12, 24: PRINT "Prima, du kannst dich sogar in die": LOCATE 14, 24: PRINT "Highscore-Liste eintragen." ELSE LOCATE 12, 24: PRINT "Leider hast du zu wenig Punkte": LOCATE 14, 24: PRINT "fÅr die Highscoreliste."
IF punkte < c THEN GOTO 1250
IF punkte > c - 1 THEN GOTO 1300
1245 GOTO 1360
1250 LOCATE 23, 1: PRINT "drÅcke Space fÅr weiter"
IF INKEY$ = " " THEN fa = 0: GOTO 1300
GOTO 1250
1300 COLOR 15
IF punkte < c THEN GOTO 2600
LOCATE 16, 24
INPUT "Gebe deinen Namen ein: ", name$
IF name$ = "" THEN name$ = "NO NAME"
CLS
1360 OPEN "c:\dos\basic\high.scr" FOR OUTPUT AS #1
IF punkte > a - 1 THEN PRINT #1, name$: PRINT #1, punkte
PRINT #1, a$
PRINT #1, a
IF punkte > B - 1 AND punkte < a THEN PRINT #1, name$: PRINT #1, punkte
PRINT #1, B$
PRINT #1, B
IF punkte > c - 1 AND punkte < B THEN PRINT #1, name$: PRINT #1, punkte: CLOSE : GOTO 2600
PRINT #1, c$
PRINT #1, c
CLOSE
2600 OPEN "c:\basic\high.scr" FOR INPUT AS #1
INPUT #1, a$, a, B$, B, c$, c
CLOSE
CLS : COLOR 15
LOCATE 6, 36: PRINT "Highscores"
2610 LINE (274, 68)-(365, 85), 14, B
2620 LOCATE 8, 30: PRINT a$
2630 LOCATE 8, 45: PRINT a
2640 LOCATE 10, 30: PRINT B$
2650 LOCATE 10, 45: PRINT B
2660 LOCATE 12, 30: PRINT c$
2670 LOCATE 12, 45: PRINT c
LOCATE 15, 28: COLOR 14: PRINT "[S]"; : COLOR 15: PRINT "tart"
LOCATE 15, 48: COLOR 14: PRINT "[M]"; : COLOR 15: PRINT "enÅ"
Leben = 5: level = 1
2680 cc$ = INKEY$
IF cc$ = "s" THEN GOTO 14
IF cc$ = "m" THEN GOTO 12
GOTO 2680
2700 aa$ = INKEY$
LOCATE 1, 22: COLOR far: PRINT "Pause": LOCATE 1, 56: PRINT "Pause"
IF far = 14 THEN far = 0: GOTO 2750
far = 14
2750 FOR za = 1 TO 10000
IF aa$ = "p" THEN far = 0: LOCATE 1, 22: COLOR far: PRINT "Pause": LOCATE 1, 56: PRINT "Pause": COLOR 15: GOTO 455
NEXT za
GOTO 2700
3000 ' *** Anleitung ***
CLS
LOCATE 2, 31: COLOR 14: PRINT "**** Anleitung ****": COLOR 15
LOCATE 4, 1: PRINT "Willkommen zu Lava Ball. Dieses Spiel basiert auf dem Klassiker Break Out,";
PRINT "jedoch mu· hier der Ball 'nur' im Spiel gehalten werden bis die Zeitanzeige";
PRINT "(oben rechts) auf null steht und der Ball explodiert. Diese erreicht man indem"
PRINT "man mit der Zahlentastatur den Curser steuert an dem der Ball abprallt. Mit  "
PRINT "'4' kann man den Curser nach links steuern, mit der '6' nach rechts und mit"
PRINT "der '5' lÑ·t sich der Curser in einen Turbo Modus versetzen, wobei er jedoch"
PRINT "fÅr den Ball durchlÑ·ig ist. Mit 'P' kann man das Spiel pausieren und durch"
PRINT "erneutes DrÅcken von 'P' beginnt das Spiel wieder. Durch drÅcken von 'Q' im"
PRINT "Pause Modus kommt man wieder ins HauptmenÅ. Kommt der Ball jedoch vor Ende des"
PRINT "Zeitlimmits in die Lava explodiert der Curser und ein Leben ist verloren. Am"
PRINT "besten probierst du das Spiel gleich mal aus."
PRINT ""
COLOR 14: PRINT "Nun kommen noch ein paar Tips zum Spiel:": COLOR 15
PRINT "1. nach jedem Level gibt es ein Bonus-Leben, also nicht in Panik geraten"
PRINT "2. mit dem Curser die Bahn des Balles immer verfolgen"
PRINT "3. die Bahn des Balles immer versuchen voraus zu ahnen"
PRINT "4. nie aufgeben, Training ist der beste Weg zum Erfolg"
LOCATE 23, 1: PRINT "drÅcke Space fÅr RÅckkehr ins MenÅ"
3100 ing$ = INKEY$
IF ing$ = " " THEN GOTO 12
GOTO 3100

