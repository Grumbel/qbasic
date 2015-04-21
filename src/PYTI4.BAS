40 SCREEN 2: CLS : CONST Pi = 3.141593
50 WINDOW (-2.5, -2)-(5.5, 4)

60 p = 32: DIM X2(p), Y2(p), U2(p), V2(p), s(p)

70 F = Pi / 3: REM winkel f

80 EPS = .004: C = COS(F): s = SIN(F)

90 A1 = -C * s: A2 = C ^ 2: B1 = A1 + A2: B2 = -A1 + A2
100 C1 = B2: C2 = 1 - B1: D1 = 1 - A1: D2 = 1 - A2
110 X1 = 0: Y1 = 0: U1 = 1: V1 = 0: Q = 0: J = 1: s(0) = 1

120 LINE (0, 0)-(1, 0): LINE -(1, -1): LINE -(0, -1): LINE -(0, 0)

130 m = Q + J: X = U1 - X1: Y = V1 - Y1
140 XA = X1 + A1 * X - A2 * Y: YA = Y1 + A2 * X + A1 * Y
150 XB = X1 + B1 * X - B2 * Y: YB = Y1 + B2 * X + B1 * Y
160 X2(m) = X1 + C1 * X - C2 * Y: Y2(m) = Y1 + C2 * X + C1 * Y
170 U2(m) = X1 + D1 * X - D2 * Y: V2(m) = Y1 + D2 * X + D1 * Y
180 s = X * X + Y * Y: s(m) = 1

190 LINE (X1, Y1)-(XA, YA): LINE -(XB, YB)
200 LINE -(U1, V1): LINE -(U2(m), V2(m))
210 LINE -(X2(m), Y2(m)): LINE -(X1, Y1)

220 X1 = XA: Y1 = YA: U1 = XB: V1 = VB

LOCATE 1, 1: PRINT m; p

230 IF m = p OR s < EPS THEN GOSUB 250

SLEEP

240 J = J + 1: GOTO 130

250 k = 1
260 IF s(m - k) = 0 THEN k = k + 1
PRINT k
GOTO 260

270 IF m = k THEN a$ = INPUT$(1): END
280 Q = m - k: X1 = X2(Q): Y1 = Y2(Q): U1 = U2(Q): V1 = V2(Q)
290 s(Q) = s(Q) - 1: J = 0: RETURN: END


