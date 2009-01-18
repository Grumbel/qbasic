10 SCREEN 9
20 RANDOMIZE TIMER
30 x% = x% + 1
40 IF x% = 640 THEN x% = 1: y% = y% + 1: f% = 0
45 f% = f% + 1
46 IF f% = 15 THEN f% = 1
50 PSET (x%, y%), f%
IF y% = 330 THEN GOTO 100
60 GOTO 30
100 ax% = 200
110 ay% = 100
115 h = h + 1
120 ax% = ax% + 2
130 PSET (ax%, ay%), h
135 PSET (ax% + 1, ay%), h
140 IF ax% = 400 THEN ax% = 200: h = 1: ay% = ay% + 1
160 IF h = 15 THEN h = 1
170 GOTO 115

