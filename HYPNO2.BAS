10 SCREEN 9
20 r = r + 5
IF r >= 100 THEN r = 1
fa = fa + 2
faa = faa + 1
IF fa >= 15 THEN fa = 1
IF faa >= 15 THEN faa = 1
CIRCLE (220, 150), r, fa
CIRCLE (420, 150), r, faa - 1
GOTO 20

