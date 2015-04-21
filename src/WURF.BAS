pi = 3.141592654#
10 SCREEN 12
CLS
fa = 4
20 x = 20: xx = 20
25 LOCATE 1, 1: INPUT "Winkel:"; alf: INPUT "Power(1-25):"; p
vx = COS(alf * pi / 180) * p
vw = SIN(alf * pi / 180) * p
PRINT vw; vx
FOR za = 1 TO 25000
NEXT za
30 x = x + vx
t = t + 10
35 vy = vy - vw
40 y = (.5 * .01 * (t) ^ 2) + vy
50 LINE (x, y + 150)-(xx, yy + 150), fa
55 IF y > 480 - 150 THEN y = 0: x = 20: vy = 0: t = 0: LOCATE 1, 1: PRINT "                   ": PRINT "                     ": fa = INT(15 * RND) + 1: xx = 20: yy = 0: GOTO 25
LOCATE 3, 1: PRINT x, y
xx = x: yy = y
60 GOTO 30

