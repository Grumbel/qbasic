documentation:
REM*****QBASIC-FILE-EDITOR*****
IF d$ = "" THEN
CLS
PRINT "Bsp. heiát Ihr Pilot "; : COLOR 15, 0: PRINT "Luke";
COLOR 7, 0: PRINT " und die Datei somit "; : COLOR 15, 0
PRINT "luke.plt"; : COLOR 7, 0: PRINT ", die": PRINT "sich in";
COLOR 15, 0: PRINT " C:\XWING\ "; : COLOR 7, 0: PRINT " befindet, ";
PRINT " so geben Sie als Dateinamen ein:";
COLOR 15, 0: LOCATE 4, 20: PRINT "C:\XWING\LUKE.PLT": COLOR 7, 0
END IF
programm:
INPUT "Dateiname : ", d$
OPEN d$ FOR RANDOM AS #1 LEN = 1
FIELD #1, 1 AS b$
DO
INPUT "Welches Byte? ", a
GET #1, a
PRINT "Alter Wert : "; ASC(b$); ". Neuer Wert : ";
INPUT n$
IF (VAL(n$) < 255) AND (VAL(n$) > 0) OR INSTR(n$, "0") > 0 THEN
LSET b$ = CHR$(VAL(n$))
PUT #1, a
END IF
PRINT "Noch eins „ndern? (q) = ENDE"
t$ = "": WHILE t$ = "": t$ = INKEY$: WEND
t$ = UCASE$(t$)
LOOP UNTIL t$ = "Q"
CLOSE #1


