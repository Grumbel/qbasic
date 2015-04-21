SCREEN 12
CLS
pi = 3.1415927#
WINDOW (-8, -5)-(8, 7)
a = .51
b = -.49
c = .9996
x = 4
y = 1
d = a * x

FOR i = 0 TO 9000
   PSET (y, x)
   e = x
   x = c * y + d
   IF x > 0 THEN d = a * x ELSE d = b * x
   y = d - e
NEXT i

BEEP
'SHELL "pause >nul:"
END

