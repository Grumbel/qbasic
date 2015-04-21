SCREEN 12

'WINDOW SCREEN (0, 0)-(5000, 5000)
DIM SHARED Q%(0 TO 10000)
DIM SHARED M%(0 TO 10000)
Q%(1) = 1
Q%(2) = 1

FOR n = 3 TO 640

Q%(n) = Q%(n - Q%(n - 1)) + Q%(n - Q%(n - 2))


'SLEEP
LOCATE 1, 1
PRINT n; Q%(n)

'PSET (n, n / 2), 14

PSET (n, Q%(n))

NEXT n

'GOTO 10
'Q(n) = Q(n - Q(n - 1)) + Q(n - Q(n - 2))

