10 CLS
20 SCREEN 12

' Hier das Intervall eingeben [a,e]
30 a = -100
40 e = 100
50 cx = a

'Hier die Schrittwerte eingeben
60 cx = cx + 5: x = cx
70 IF x > e THEN END

'Hier die Anzahl der Durchg„nge eingeben
80 FOR z = 1 TO 100

'Hier die Funktionen eingeben
90 y = x ^ 3 - x - .5'= f (x)
IF p = 1 THEN GOTO 155
100 yy = 3 * x ^ 2 - 1  '= f'(x)

110 IF yy = 0 THEN yy = .000000001#: BEEP
120 n = x - (y / yy)
140 x = n
150 NEXT z
p = 1: GOTO 90
155 IF y > .0001 OR y < -.0001 THEN p = 0: GOTO 200' Tolleranzgrenze
p = 0
160
IF Ergebnis <> n AND er = 0 THEN
PRINT "Eine Nullstelle liegt bei X ="; n: er = er + 1
GOTO 170
END IF
IF Ergebnis <> n AND er >= 1 THEN
PRINT "Eine weitere Nullstelle liegt bei X ="; n: er = er + 1
END IF
170 Ergebnis = n

'Die folgenden Zeilen zeigen eine graphische Darstellung der Nullstellen
'Sie sind jedoch deaktiviert
'180 PSET (xx, n * 10 + 240)
'190 xx = xx + 1
200 GOTO 60

