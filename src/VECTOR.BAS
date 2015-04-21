5 a = 0
7 b = b - 45
10 SCREEN 9
20 CLS
30 LINE (0, a)-(b, 340), 4
40 a = a + 12.125 / 3
50 b = b + 24.5 / 3
FOR za = 1 TO 1000
NEXT za
55 IF b > 640 THEN GOTO 65
60 GOTO 30
65 d = d + 673
70 LINE (638, c)-(d, 340), 1
80 c = c + 12.125 / 3
90 d = d - 24.5 / 3
FOR za = 1 TO 1000
NEXT za

100 IF d < 0 THEN GOTO 115
110 GOTO 70
115 E = E + 340: f = f + 673
120 LINE (638, E)-(f, 1), 14
130 E = E - 12.125 / 3
140 f = f - 24.5 / 3
FOR za = 1 TO 1000
NEXT za

150 IF f < 0 THEN GOTO 170
160 GOTO 120
170 g = g + 340: H = H - 45
180 LINE (0, g)-(H, 1), 13
190 g = g - 12.125 / 3
200 H = H + 24.5 / 3
FOR za = 1 TO 1000
NEXT za

210 IF H > 638 THEN END
220 GOTO 180









