10 z = 4: s = 4
20 DIM a(z, s)
30 FOR i = 1 TO z
40 PRINT "FÅr Zeile:"; i
50 PRINT "================": PRINT
60 FOR j = 1 TO s
70 PRINT "Wert fÅr spalte"; j;
INPUT a(i, j)
NEXT j
CLS
NEXT i
FOR i = 1 TO z
130 FOR j = 1 TO s
PRINT a(i, j),
NEXT j
NEXT i

