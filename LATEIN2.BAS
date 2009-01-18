10 SCREEN 9
20 CLS
30 RANDOMIZE TIMER
35 num = INT(2 * RND) + 1
40 gen = INT(4 * RND) + 1
50 cas = INT(5 * RND) + 1
60 IF num = 1 THEN num$ = "singular, "
70 IF num = 2 THEN num$ = "plural, "
80 IF gen = 1 THEN gen$ = "mask."
90 IF gen = 2 THEN gen$ = "fem."
95 IF gen = 4 THEN gen$ = "kons."
100 IF gen = 3 THEN gen$ = "neu."
120 IF cas = 1 THEN cas$ = "Nominativ, "
130 IF cas = 2 THEN cas$ = "Genetiv, "
140 IF cas = 3 THEN cas$ = "Dativ, "
150 IF cas = 4 THEN cas$ = "Akkusativ, "
160 IF cas = 5 THEN cas$ = "Ablativ, "
170 PRINT "Wie heiát die Endung bei einem Nomen ("; gen$; num$; cas$; ")?"
180 INPUT ant$
190 IF num = 1 AND gen = 1 AND cas = 1 AND ant$ = "us" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
200 IF num = 1 AND gen = 2 AND cas = 1 AND ant$ = "a" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
210 IF num = 1 AND gen = 3 AND cas = 1 AND ant$ = "um" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
220 IF num = 1 AND gen = 1 AND cas = 2 AND ant$ = "i" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
230 IF num = 1 AND gen = 2 AND cas = 2 AND ant$ = "ae" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
240 IF num = 1 AND gen = 3 AND cas = 2 AND ant$ = "i" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
250 IF num = 1 AND gen = 1 AND cas = 3 AND ant$ = "o" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
260 IF num = 1 AND gen = 2 AND cas = 3 AND ant$ = "ae" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
270 IF num = 1 AND gen = 3 AND cas = 3 AND ant$ = "o" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
280 IF num = 1 AND gen = 1 AND cas = 4 AND ant$ = "um" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
290 IF num = 1 AND gen = 2 AND cas = 4 AND ant$ = "am" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
300 IF num = 1 AND gen = 3 AND cas = 4 AND ant$ = "um" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
310 IF num = 1 AND gen = 1 AND cas = 5 AND ant$ = "o" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
320 IF num = 1 AND gen = 2 AND cas = 5 AND ant$ = "a" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
340 IF num = 1 AND gen = 3 AND cas = 5 AND ant$ = "o" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
350 IF num = 2 AND gen = 1 AND cas = 1 AND ant$ = "i" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
360 IF num = 2 AND gen = 2 AND cas = 1 AND ant$ = "ae" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
370 IF num = 2 AND gen = 3 AND cas = 1 AND ant$ = "a" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
380 IF num = 2 AND gen = 1 AND cas = 2 AND ant$ = "orum" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
390 IF num = 2 AND gen = 2 AND cas = 2 AND ant$ = "arum" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
400 IF num = 2 AND gen = 3 AND cas = 2 AND ant$ = "orum" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
410 IF num = 2 AND gen = 1 AND cas = 3 AND ant$ = "is" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
420 IF num = 2 AND gen = 2 AND cas = 3 AND ant$ = "is" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
430 IF num = 2 AND gen = 3 AND cas = 3 AND ant$ = "is" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
440 IF num = 2 AND gen = 1 AND cas = 4 AND ant$ = "os" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
450 IF num = 2 AND gen = 2 AND cas = 4 AND ant$ = "as" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
460 IF num = 2 AND gen = 3 AND cas = 4 AND ant$ = "a" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
461 IF num = 2 AND gen = 1 AND cas = 5 AND ant$ = "is" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
462 IF num = 2 AND gen = 2 AND cas = 5 AND ant$ = "is" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
463 IF num = 2 AND gen = 3 AND cas = 5 AND ant$ = "is" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
464 IF num = 1 AND gen = 4 AND cas = 1 AND ant$ = "-" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
465 IF num = 1 AND gen = 4 AND cas = 2 AND ant$ = "is" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
466 IF num = 1 AND gen = 4 AND cas = 3 AND ant$ = "i" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
467 IF num = 1 AND gen = 4 AND cas = 4 AND ant$ = "em" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
468 IF num = 1 AND gen = 4 AND cas = 5 AND ant$ = "e" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
469 IF num = 2 AND gen = 4 AND cas = 1 AND ant$ = "es" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
470 IF num = 2 AND gen = 4 AND cas = 2 AND ant$ = "um" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
471 IF num = 2 AND gen = 4 AND cas = 3 AND ant$ = "ibus" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
472 IF num = 2 AND gen = 4 AND cas = 4 AND ant$ = "es" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
480 IF num = 2 AND gen = 4 AND cas = 5 AND ant$ = "ibus" THEN PRINT "Richtig!": punkt = punkt + 1: GOTO 510
500 PRINT "Falsch!"
510 IF vers = 9 THEN GOTO 530
520 vers = vers + 1: GOTO 30
530 CLS : PRINT "Von 10 adjektivischen Interrogativproneomen hast du"; punkt; "richtig!"
540 IF punkt = 10 THEN PRINT "Super, du kannst alle."
550 IF punkt >= 7 AND punkt < 10 THEN PRINT "Gut, lerne lieber noch etwas!"
560 IF punkt >= 4 AND punkt < 7 THEN PRINT "Naja, du muát noch kr„ftig lernen!"
570 IF punkt >= 1 AND punkt <= 3 THEN PRINT "Das war woll nichts, lern erst mal."
580 IF punkt = 0 THEN PRINT "Du Dummkopf, warum hast du den berhaubt Latein gew„hlt?"
590 INPUT "Nochmal (j/n)?", noch$
600 IF noch$ = "j" THEN : vers = 0: GOTO 10
605 PRINT ""
606 PRINT ""
610 PRINT "                 singular"
620 PRINT "                m.    f.   n.   kons.          "
630 PRINT "     Nom.      -us   -a   -um     -            "
640 PRINT "     Gen.      -i    -ae  -i     -is          "
650 PRINT "     Dat.      -o    -ae  -o     -i           "
660 PRINT "     Akk.      -um   -am  -um    -em          "
670 PRINT "     Abl.      -o    -a   -o     -e           "
671 PRINT ""
675 PRINT "                   plural"
680 PRINT "     Nom.      -i    -ae   -a    -es          "
690 PRINT "     Gen.      -orum -arum -orum -um; "; ""
700 PRINT "     Dat.      -is   -is   -is   -ibus        "
710 PRINT "     Akk.      -os   -as   -a    -es          "
720 PRINT "     Abl.      -is   -is   -is   -ibus        "
730 END

