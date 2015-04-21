SCREEN 12
aTimer = TIMER
fa = 1
10
 x = x + .02

PSET (x, (TIMER - aTimer) * 35), INT(15 * RND)

IF x > 640 THEN

   aTimer = TIMER
   x = 0
END IF

GOTO 10

