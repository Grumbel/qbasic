10 SCREEN 12
fa = 8: a = 750
20 x = INT(640 * RND)
y = INT(480 * RND)
PSET (x, y), fa
z = z + 1
IF z = a THEN fa = 7
IF z = 2 * a THEN fa = 15
IF z = 3 * a THEN GOTO 30
'LOCATE 1, 1: PRINT a; z
GOTO 20
30 a$ = INKEY$
'lOCATE 2, 1: PRINT a; z
IF a$ = CHR$(0) + "H" THEN a = a + 100: CLS : fa = 8: z = 0: GOTO 20
IF a$ = CHR$(0) + "P" THEN a = a - 100: CLS : fa = 8: z = 0: GOTO 20
GOTO 30

