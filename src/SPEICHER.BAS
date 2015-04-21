10 ' Speicherumrechner
15 CLS
20 INPUT ; "Speicher: ", a
30 INPUT a$
PRINT ""
40 IF a$ = "bit" THEN b = 1: a$ = "Bit"
50 IF a$ = "byte" OR a$ = "b" THEN b = 8: a$ = "Byte"
60 IF a$ = "kb" THEN b = 1024 * 8: a$ = "KByte"
70 IF a$ = "mb" THEN b = 1024 ^ 2 * 8: a$ = "MByte"
80 IF a$ = "gb" THEN b = 1024 ^ 3 * 8: a$ = "GByte"

90 PRINT a; a$; " entspricht:"
PRINT "=============================="
100 PRINT a * b; " Bit"
110 PRINT a * b / 8; " Byte"
120 PRINT a * b / 8 / 1024; "KByte"
130 PRINT a * b / 8 / 1024 ^ 2; "MByte"
140 PRINT a * b / 8 / 1024 ^ 3; "GByte"
PRINT ""
PRINT ""
GOTO 20



