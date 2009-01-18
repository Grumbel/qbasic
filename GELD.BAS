10 CLS
20 INPUT "Preis?", p
30 INPUT "Geld?", g
40 r = g - p
50 a = a + 200
60 IF a > r THEN a = a - 200: GOTO 80
70 GOTO 50
80 b = b + 100
90 IF b + a > r THEN b = b - 100: GOTO 110
100 GOTO 80
110 c = c + 50
120 IF a + b + c > r THEN c = c - 50: GOTO 140
130 GOTO 110
140 d = d + 20
150 IF a + b + c + d > r THEN d = d - 20: GOTO 170
160 GOTO 140
170 e = e + 10
180 IF a + b + c + d + e > r THEN e = e - 10: GOTO 200
190 GOTO 170
200 f = f + 5
210 IF a + b + c + d + e + f > r THEN f = f - 5: GOTO 230
220 GOTO 200
230 h = h + 2
240 IF a + b + c + d + e + f + h > r THEN h = h - 2: GOTO 260
250 GOTO 230
260 i = i + 1
270 IF a + b + c + d + e + f + h + i > r THEN i = i - 1: GOTO 290
280 GOTO 260
290 j = j + .5
300 IF a + b + c + d + e + f + h + i + j > r THEN j = j - .5: GOTO 320
310 GOTO 290
320 k = k + .1
IF a + b + c + d + e + f + h + i + j + k + l + m + n = r THEN GOTO 440
330 IF a + b + c + d + e + f + h + i + j + k > r THEN k = k - .1: GOTO 350
340 GOTO 320
350 l = l + .05
IF a + b + c + d + e + f + h + i + j + k + l + m + n = r THEN GOTO 440
360 IF a + b + c + d + e + f + h + i + j + k + l > r THEN l = l - .05: GOTO 380
370 GOTO 350
380 m = m + .02
IF a + b + c + d + e + f + h + i + j + k + l + m + n = r THEN GOTO 440
390 IF a + b + c + d + e + f + h + i + j + k + l + m > r THEN m = m - .02: GOTO 410
400 GOTO 380
410 n = n + .01
420 IF a + b + c + d + e + f + h + i + j + k + l + m + n > r THEN n = n - .01: GOTO 440
430 GOTO 410
440 IF a + b + c + d + e + f + h + i + j + k + l + m + n < r THEN BEEP: n = n + .01
r = a + b + c + d + e + f + h + i + j + k + l + m + n: GOTO 444
441 IF a + b + c + d + e + f + h + i + j + k + l + m + n > r THEN BEEP: n = n - .01
443 IF a + b + c + d + e + f + h + i + j + k + l + m + n = r THEN GOTO 444 ELSE GOTO 440
444 PRINT "RÅckgeld: "; a; b; c; d; e; f; h; i; j; k; l; m; n; r
IF a + b + c + d + e + f + h + i + j + k + l + m + n < r THEN BEEP
445 a = 0: b = 0: c = 0: d = 0: e = 0: f = 0: h = 0: i = 0: j = 0: k = 0: l = 0: m = 0: n = 0
450 GOTO 20
IF a + b + c + d + e + f + h + i + j + k + l + m + n = r THEN GOTO 440









