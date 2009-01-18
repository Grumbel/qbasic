10 SCREEN 9
11 INPUT "Geben sie die Genauigkeit ein (je kleiner desto genauer, nur Werte unter 1      sinnvoll)", g: CLS
15 PRINT "Geben sie dei Hochzahl ein!": PRINT "Drcken sie p um von Vorne zu beginnen.": INPUT e: CLS
20 x = x + g
30 y = x ^ e
40 LINE (320 + .1 * x, 340 - y)-(320 + .1 * a, 340 - b)
50 a = x: b = y
LOCATE 1, 1: PRINT a; b
IF y >= 350 OR .1 * x >= 640 OR .1 * x <= 0 THEN GOTO 70
60 GOTO 20
70 IF INKEY$ = CHR$(112) THEN CLS x = 0: y = 0: a = 0: b = 0: e = 0: GOTO 15
GOTO 70



