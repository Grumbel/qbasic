10 CLS
PRINT "Dieses Proramm nicht mehr ausfhren!!!"
END
OPEN "high.scr" FOR INPUT AS #1
INPUT #1, a$, a, b$, b, c$, c
PRINT a$; a
PRINT b$; b
PRINT c$; c
CLOSE
OPEN "high.scr" FOR OUTPUT AS #1
INPUT "Name:"; d$
IF d$ = "" THEN d$ = "NO NAME"
INPUT "Punkte"; d
IF d > a - 1 THEN PRINT #1, d$: PRINT #1, d
PRINT #1, a$
PRINT #1, a
IF d > b - 1 AND d < a THEN PRINT #1, d$: PRINT #1, d
PRINT #1, b$
PRINT #1, b
IF d > c - 1 AND d < b THEN PRINT #1, d$: PRINT #1, d: GOTO 20
PRINT #1, c$
PRINT #1, c
20 CLOSE
GOTO 10

