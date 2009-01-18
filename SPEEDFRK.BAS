COMMON z AS SINGLE
z = .1

10 SCREEN 13

20
x% = x% + 1
IF SIN((x% * z) * (y% * z)) > 0 THEN GOTO 20
PSET (x%, y%)

IF x% > 160 THEN
   x% = 0
   y% = y% + 1
   IF y% > 100 THEN y% = 0: z = z + .1: CLS
END IF

GOTO 20

'Interessante Einstellungen fÅr z:
'150,.1

