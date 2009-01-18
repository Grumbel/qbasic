DECLARE SUB SetSterne ()
DECLARE SUB DefSterne ()
DECLARE SUB Pause (PauseLenght!)
COMMON SHARED x           AS INTEGER
COMMON SHARED y           AS INTEGER
COMMON SHARED d           AS INTEGER
COMMON SHARED e           AS INTEGER
COMMON SHARED PauseLenght AS INTEGER

SCREEN 9
CLS
RANDOMIZE TIMER

CONST MaxSpeed% = 10
CONST MaxSterne% = 500
CONST SternNum% = 50
DIM SHARED Sterne%(MaxSterne% + 1, 3)

CALL DefSterne

10

CALL SetSterne

GOTO 10

SUB DefSterne

FOR za = 1 TO SternNum%
   Sterne%(za, 1) = CINT(640 * RND)
   Sterne%(za, 2) = CINT(350 * RND)
   Sterne%(za, 3) = CINT(MaxSpeed% * RND) + 1
NEXT za

END SUB

SUB Pause (PauseLenght)

FOR za = 1 TO PauseLenght
NEXT za

END SUB

SUB SetSterne

FOR d = 1 TO SternNum%
   
   x = Sterne%(d, 1)
   x = x + Sterne%(d, 3)
   Sterne%(d, 1) = x
 
   IF x > 640 + MaxSpeed% THEN Sterne%(d, 1) = 0: Sterne%(d, 2) = CINT(350 * RND)
 
   x = Sterne%(d, 1)
   y = Sterne%(d, 2)
 
   SELECT CASE Sterne%(d, 3)
    
      CASE 0 TO 3
      PSET (x - Sterne%(d, 3), y), 0
      PSET (x, y), 1

      CASE 4 TO 7
      PSET (x - Sterne%(d, 3), y), 0
      PSET (x, y), 9

      CASE 8 TO 10
      PSET (x - Sterne%(d, 3), y), 0
      PSET (x, y), 15

   END SELECT

NEXT d

Pause (200)

END SUB

