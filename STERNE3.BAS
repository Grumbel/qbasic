DECLARE SUB Pause (PauseLenght!)
COMMON SHARED x           AS INTEGER
COMMON SHARED y           AS INTEGER
COMMON SHARED d           AS INTEGER
COMMON SHARED SterneNum   AS INTEGER
COMMON SHARED MaxSterne   AS INTEGER
COMMON SHARED e           AS INTEGER
COMMON SHARED PauseLenght AS INTEGER

CONST MaxSpeed = 10

SCREEN 9
RANDOMIZE TIMER
MaxSterne = 50

DIM SHARED Sterne%(MaxSterne + 1, 3)

CLS
b1 = 1
SterneNum = 1
Sterne%(1, 2) = CINT(350 * RND)
Sterne%(SterneNum, 3) = CINT(MaxSpeed% * RND) + 1

FOR za = 1 TO 50
   Sterne%(za, 1) = CINT(640 * RND)
   Sterne%(za, 2) = CINT(350 * RND)
   Sterne%(za, 3) = CINT(MaxSpeed * RND) + 1
NEXT za

SterneNum = 50

10


'FOR d = 1 TO SterneNum
   'x = Sterne%(d, 1)
   'x = x + Sterne%(d, 3)
   'Sterne%(d, 1) = x
   'IF x > 640 + MaxSpeed THEN Sterne%(d, 1) = 0: Sterne%(d, 2) = CINT(350 * RND)


'NEXT d

FOR d = 1 TO SterneNum
    
   x = Sterne%(d, 1)
   x = x + Sterne%(d, 3)
   Sterne%(d, 1) = x
   IF x > 640 + MaxSpeed THEN Sterne%(d, 1) = 0: Sterne%(d, 2) = CINT(350 * RND)



   x = Sterne%(d, 1)
   y = Sterne%(d, 2)
  
   SELECT CASE Sterne%(d, 3)
      CASE 0 TO 3
      'IF SterneNum = 50 THEN
      PSET (x - Sterne%(d, 3), y), 0
      PSET (x, y), 1

      CASE 4 TO 7
      'IF SterneNum = 50 THEN
      PSET (x - Sterne%(d, 3), y), 0
      PSET (x, y), 9

      CASE 8 TO 10
      'IF SterneNum = 50 THEN
      PSET (x - Sterne%(d, 3), y), 0
      PSET (x, y), 15

   END SELECT

NEXT d

SWAP b1, b2

Pause (200)

GOTO 10

SUB Pause (PauseLenght)

FOR za = 1 TO PauseLenght
NEXT za

END SUB

