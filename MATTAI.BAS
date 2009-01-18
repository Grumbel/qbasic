RANDOMIZE TIMER
CLS
Anfang:
PRINT "Grumbel Trainer 1.0"
PRINT "-------Mathe-------"
start = TIMER
10 PRINT "Enter fÅr start"
12 a$ = INKEY$
IF a$ = CHR$(13) THEN GOTO 20
GOTO 12
20
FOR Durchgang = 1 TO 20
   a = INT(10 * RND) + 1
   b = INT(10 * RND) + 1
   PRINT ""
   PRINT a; "*"; b;
   INPUT ac
   IF ac = a * b THEN
      PRINT "richtig"
      r = r + 1
   ELSE
      PRINT "falsch"
      f = f + 1
   END IF
NEXT Durchgang
CLS
PRINT r; "Richtige"
PRINT f; "Falsche"
PRINT "Zeit:"; TIMER - start; "sec."
Punkte = CINT(160 - 2 * (TIMER - start + 4 * f))
IF Punkte < 0 THEN Punkte = 0
PRINT Punkte; "Punkte"

INPUT "Nochmal [j/n]", f$
IF f$ = "j" THEN f = 0: r = 0: CLS : GOTO Anfang
PRINT ""
PRINT "Und TschÅs!"



