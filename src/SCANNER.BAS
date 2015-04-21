10 CLS
20 y = 12: x = 10: a = 1: ge = 1
30 COLOR 4: LOCATE y, x: PRINT CHR$(219); CHR$(219)
FOR za = 1 TO ge
NEXT
ge = ge + 1
CLS
40 x = x + a
50 IF x = 70 THEN a = -1
60 IF x = 10 THEN a = 1
IF a = -1 THEN LOCATE y, x + 2: PRINT CHR$(178); CHR$(177); CHR$(176): LOCATE y, x - 2: PRINT CHR$(176); CHR$(177)
IF a = 1 THEN LOCATE y, x - 3: PRINT CHR$(176); CHR$(177); CHR$(178): LOCATE y, x + 2: PRINT CHR$(177); CHR$(176)
70 GOTO 30

