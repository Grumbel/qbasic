CLS
10 a$ = INKEY$
IF a$ = CHR$(0) + "P" THEN PRINT "unten"
IF a$ = CHR$(0) + "M" THEN PRINT "rechts"
IF a$ = CHR$(0) + "K" THEN PRINT "links"
IF a$ = CHR$(0) + "H" THEN PRINT "oben"
GOTO 10

