10 SCREEN 12
CLS
fa = 4
20 x = 20: xx = 20
25 vx = 10 * RND: vw = 10 * RND
30 x = x + vx
t = t + 10
35 vy = vy - vw
40 y = (.5 * .01 * (t - 20) ^ 2) + vy
50 LINE (x, y + 150)-(xx, yy + 150), fa
55 IF y > 480 - 150 THEN y = 0: x = 20: vy = 0: t = 0: fa = INT(15 * RND) + 1: xx = 20: yy = 0: GOTO 25
xx = x: yy = y
60 GOTO 30

