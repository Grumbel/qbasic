1 SCREEN 9
5 RANDOMIZE TIMER
aa = RND * 3
ba = RND * 3
ca = RND * 3
da = RND * 3
10 IF g = 0 THEN x = x + aa
20 IF h = 0 THEN y = y + ba
25 IF g = 1 THEN x = x - ca
27 IF h = 1 THEN y = y - da
za = za + 1: zr = zr + 1
IF zr = 100 THEN zr = 0
IF za = 10 THEN za = 0: GOTO 5
IF y > 320 THEN h = 1
IF x > 640 THEN g = 1
IF y < 1 THEN h = o
IF x < 1 THEN g = 0
fa = INT(15 * RND)
90 LINE (x, y)-(x, y), fa
LINE (x, y)-(x, y), fa
100 GOTO 10

