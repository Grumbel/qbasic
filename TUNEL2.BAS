10 SCREEN 12
r = 4: rr = 4: ra = 3: rb = 3: rc = 1.5: rd = 1.5: re = 1: rf = 1: rg = 1.2: rh = 1.2: ri = 1.01: rj = 1.01
20 r = r ^ 1.01: ra = ra ^ 1.01: rc = rc ^ 1.01: re = re ^ 1.01: rg = rg ^ 1.01: ri = ri ^ 1.01
30 CIRCLE (320, 240), r
CIRCLE (320, 240), ra
CIRCLE (320, 240), rc
CIRCLE (320, 240), re
CIRCLE (320, 240), rg, 4
CIRCLE (320, 240), ri, 14
FOR za = 1 TO 500
NEXT za
CIRCLE (320, 240), rr, 0
CIRCLE (320, 240), rb, 0
CIRCLE (320, 240), rd, 0
CIRCLE (320, 240), rf, 0
CIRCLE (320, 240), rh, 0
CIRCLE (320, 240), rj, 0
rb = rb ^ 1.01
rd = rd ^ 1.01
rr = rr ^ 1.01
rf = rf ^ 1.01
rh = rh ^ 1.01
rj = rj ^ 1.01
IF r > 200 OR rr > 200 THEN r = 4: rr = 4
IF ra > 200 OR rb > 200 THEN ra = 4: rb = 4
IF rc > 200 OR rd > 200 THEN rc = 4: rd = 4
IF re > 200 OR rf > 200 THEN re = 4: rf = 4
IF rg > 200 OR rh > 200 THEN rg = 4: rh = 4
IF ri > 200 OR rj > 200 THEN rj = 4: ri = 4

GOTO 20

