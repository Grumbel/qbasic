10 SCREEN 9
20 CLS
30 PRINT "Joystick calibrieren"
40 PRINT "Joystick nach oben und links halten und Knopf drÅcken!"
50 oben = STICK(1): links = STICK(0)
60 IF STRIG(1) = -1 THEN GOTO 80
70 GOTO 50
80 FOR a = 1 TO 10000
90 NEXT
100 PRINT "Joystick nach unten und rechts halten und Knopf drÅcken!"
110 unten = STICK(1): rechts = STICK(0)
120 IF STRIG(1) = -1 THEN GOTO 140
130 GOTO 110
140 FOR a = 1 TO 10000
150 NEXT
160 PRINT "Joystick zentrieren und Knopf drÅcken!"
170 zent = STICK(1)
180 IF STRIG(1) = -1 THEN CLS : GOTO 200
x = 320: y = 175
190 GOTO 170
200 PSET (x, y), fa
fa = INT(15 * RND) + 1
IF  < STICK(1) THEN y = y + 10
IF unten < STICK(1) THEN y = y - 10
220 GOTO 200


