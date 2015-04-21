y = 1: r = -1
CLS


10 a$ = INKEY$
IF a$ = CHR$(0) + "P" THEN y = y + 1: r = 1
IF a$ = CHR$(0) + "H" THEN y = y - 1: r = -1
IF y = 0 THEN y = 1
IF y >= 7 THEN y = 6

IF y = 1 AND r = 1 THEN a$ = "eins": b$ = "-----"
IF y = 2 AND r = 1 THEN a$ = "zwei": b$ = "-----"
IF y = 3 AND r = 1 THEN a$ = "drei": b$ = "-----"
IF y = 4 AND r = 1 THEN a$ = "vier": b$ = "-----"
IF y = 5 AND r = 1 THEN a$ = "fÅnf": b$ = "-----"
IF y = 6 AND r = 1 THEN a$ = "sechs": b$ = "-----"
     
IF y = 1 AND r = -1 THEN a$ = "eins": b$ = "-----"
IF y = 2 AND r = -1 THEN a$ = "zwei": b$ = "-----"
IF y = 3 AND r = -1 THEN a$ = "drei": b$ = "-----"
IF y = 4 AND r = -1 THEN a$ = "vier": b$ = "-----"
IF y = 5 AND r = -1 THEN a$ = "fÅnf": b$ = "-----"
IF y = 6 AND r = -1 THEN a$ = "sechs": b$ = "-----"

LOCATE y - r, 1: PRINT b$
LOCATE y, 1: COLOR 15: PRINT a$: COLOR 7
GOTO 10


