CLS
10 INPUT "Anfangs- Zeit eingeben:"; a
20 INPUT "End-Zeit eingeben     :"; b
30 s = FIX(a / 100)
40 m = a - (s * 100)
50 ss = FIX(b / 100)
60 mm = b - (ss * 100)
sss = s
c = ss - sss: d = mm - m
70 IF d >= 0 THEN PRINT c; d: END
IF d < 0 THEN e = FIX(((c * 60) + d) / 60)
IF d < 0 THEN g = (60 + d)
PRINT "Vergangene Zeit: "; e; g
GOTO 10

