CLS
RANDOMIZE TIMER
start = TIMER
10 a = INT(99999 * RND) + 1
20 b = INT(99999 * RND) + 1
PRINT (a / b) * b - a;
IF start + 10 <= TIMER THEN CLS : LOCATE 1, 1: PRINT c: END
IF (a / b) * b - a <> 0 THEN c = c + 1
REM IF INKEY$ = "a" THEN CLS : LOCATE 1, 1: PRINT c: END
GOTO 10

