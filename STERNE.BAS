RANDOMIZE TIMER
10 SCREEN 12
15 y = INT(480 * RND)
 ay = INT(480 * RND)
 by = INT(480 * RND)
 cy = INT(480 * RND)
 dy = INT(480 * RND)
 ey = INT(480 * RND)
  fy = INT(480 * RND)
 gy = INT(480 * RND)
 hy = INT(480 * RND)
 iy = INT(480 * RND)
 jy = INT(480 * RND)
 ky = INT(480 * RND)
20 x = x + 1
ax = ax + 1
bx = bx + 1
cx = cx + 1
dx = dx + 1
ex = ex + 1
fx = fx + 1
gx = gx + 1
hx = hx + 1
ix = ix + 1
jx = jx + 1
kx = kx + 1


FOR za = 1 TO 10
NEXT za
30 PSET (x, y)
40 PSET (xx, yy), 0
50 xx = x: yy = y
60 IF x > 640 THEN x = 0: y = INT(480 * RND)

 ax = ax + .9
 PSET (ax, ay)
 PSET (axx, ayy), 0
 axx = ax: ayy = ay
 IF ax > 640 THEN ax = 0: ay = INT(480 * RND)

 bx = bx + 2
 PSET (bx, by)
 PSET (bxx, byy), 0
 bxx = bx: byy = by
 IF bx > 640 THEN bx = 0: by = INT(480 * RND)

cx = cx + .5
 PSET (cx, cy)
 PSET (cxx, cyy), 0
 cxx = cx: cyy = cy
 IF cx > 640 THEN cx = 0: cy = INT(480 * RND)

 dx = dx + 3
 PSET (dx, dy)
 PSET (dxx, dyy), 0
 dxx = dx: dyy = dy
 IF dx > 640 THEN dx = 0: dy = INT(480 * RND)

 ex = ex + 4
 PSET (ex, ey)
 PSET (exx, eyy), 0
 exx = ex: eyy = ey
 IF ex > 640 THEN ex = 0: ey = INT(480 * RND)

 fx = fx + .8
 PSET (fx, fy)
 PSET (fxx, fyy), 0
 fxx = fx: fyy = fy
 IF fx > 640 THEN fx = 0: fy = INT(480 * RND)

 gx = gx + 2
 PSET (gx, gy)
 PSET (gxx, gyy), 0
 gxx = gx: gyy = gy
 IF gx > 640 THEN gx = 0: gy = INT(480 * RND)

 hx = hx + .7
PSET (hx, hy)
 PSET (hxx, hyy), 0
 hxx = hx: hyy = hy
 IF hx > 640 THEN hx = 0: hy = INT(480 * RND)

 ix = ix + .6
 PSET (ix, iy)
 PSET (ixx, iyy), 0
 ixx = ix: iyy = iy
 IF ix > 640 THEN ix = 0: iy = INT(480 * RND)

 jx = jx + 2.5
 PSET (jx, jy)
 PSET (jxx, jyy), 0
jxx = jx: jyy = jy
  IF jx > 640 THEN jx = 0: jy = INT(480 * RND)

 kx = kx + 1.5
 PSET (kx, ky)
 PSET (kxx, kyy), 0
kxx = kx: kyy = ky
IF kx > 640 THEN kx = 0: ky = INT(480 * RND)
70 GOTO 20

 x = x + 1
 PSET (x, y)
 PSET (xx, yy), 0
 xx = x: yy = y
 IF x > 640 THEN x = 0: GOTO 15


