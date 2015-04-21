1 SCREEN 9
x = 50
3
aa = RND * 5
ba = RND * 5
ca = RND * 5
da = RND * 5
5 RANDOMIZE TIMER
10 IF g = 0 THEN x = x + aa
20 IF h = 0 THEN y = y + ba
25 IF g = 1 THEN x = x - ca
27 IF h = 1 THEN y = y - da
za = za + 1: zr = zr + 1
IF zr = 100 THEN zr = 0
IF za = 10 THEN za = 0: GOTO 5
IF y > 320 THEN h = 1: GOTO 3
IF x > 640 THEN g = 1: GOTO 3
IF y < 1 THEN h = o: GOTO 3
IF x < 1 THEN g = 0: GOTO 3
90 LINE (x, y)-(x, y)
LINE (x, y)-(x, y)
100 GOTO 10

