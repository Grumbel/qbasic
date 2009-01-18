z! = .3
zz! = 1
fa = 15
y% = 1
10 SCREEN 12

20 x% = x% + 1 / zz

30 IF x% * zz! > 640 THEN x% = 0: y% = y% + 1

a! = SIN((x% * z!) * (y% * z!))

IF a! > 0 THEN fa% = 15 ELSE fa% = 4

PSET (x% * zz!, y%), fa%

GOTO 20

'Interessante Einstellungen fÅr z:
'150,.1

