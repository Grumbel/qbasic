SCREEN 12
CONST pi = 3.141593
40 WINDOW (-3.5, -2)-(3.5, 3.5)

p = 12: DIM x1(p), y1(p), x2(p), y2(p), u1(p), v1(p), u2(p), v2(p)
' Winkel F
f = pi / 5: C = COS(f): s = SIN(f)
a1 = -C * s: a2 = C ^ 2: b1 = a1 + a2: b2 = -a1 + a2
c1 = b2: c2 = 1 - b1: d1 = 1 - a1: d2 = 1 - a2

x1(0) = 0: y1(0) = 0: u1(0) = 1: v1(0) = 0
LINE (0, 0)-(0, -1): LINE -(1, -1): LINE -(1, 0)
s = 1: GOSUB 180
FOR m = 1 TO 2 ^ (p - 1) - 1: s = p: n = m
140 IF n MOD 2 = 0 THEN n = n / 2: s = s - 1: GOTO 140
GOSUB 160: NEXT m: BEEP: a$ = INPUT$(1): END
160 x1(s - 1) = x2(s - 1): y1(s - 1) = y2(s - 1)
u1(s - 1) = u2(s - 1): v1(s - 1) = v2(s - 1)
180 FOR j = s TO p
x = x1(j - 1): y = y1(j - 1): u = u1(j - 1): v = v1(j - 1)
x3 = u - x: y3 = v - y

x1(j) = x + a1 * x3 - a2 * y3: y1(j) = y + a2 * x3 + a1 * y3
u1(j) = x + b1 * x3 - b2 * y3: v1(j) = y + b2 * x3 + b1 * y3
x2(j) = x + c1 * x3 - c2 * y3: y2(j) = y + c2 * x3 + c1 * y3
u2(j) = x + d1 * x3 - d2 * y3: v2(j) = y + d2 * x3 + d1 * y3

LINE (x, y)-(x1(j), y1(j)): LINE -(u1(j), v1(j)): LINE -(u, v)
LINE -(x, y): LINE -(x2(j), y2(j)): LINE -(u2(j), v2(j)): LINE -(u, v)
NEXT j: RETURN: END


