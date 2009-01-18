z! = .3
zz! = 1
fa = 15
y% = 1
10 SCREEN 13

20 x% = x% + 1 / zz

30 IF x% * zz! > 320 THEN x% = 0: y% = y% + 1

a! = SIN((x% * z!) * (y% * z!))

IF a! > 0 THEN fa% = CINT(128 * RND) ELSE fa% = CINT(128 * RND) + 128

PSET (x% * zz!, y%), fa%

GOTO 20

'Interessante Einstellungen fÅr z:
'150,.1

