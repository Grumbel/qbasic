COMMON x         AS INTEGER
COMMON y         AS INTEGER
COMMON d         AS INTEGER
COMMON SterneNum AS INTEGER
COMMON MaxSterne AS INTEGER
COMMON e         AS INTEGER

SCREEN 9
RANDOMIZE TIMER
MaxSterne = 50

DIM Sterne(MaxSterne + 1, 3)

CLS
b1 = 1
SterneNum = 1
Sterne(1, 2) = CINT(350 * RND)
Sterne(SterneNum, 3) = CINT(10 * RND) + 1
10

e = e + 4

IF e = 100 THEN
   
   SterneNum = SterneNum + 1
   IF SterneNum > MaxSterne THEN SterneNum = MaxSterne
   Sterne(SterneNum, 2) = CINT(350 * RND)
   Sterne(SterneNum, 3) = CINT(10 * RND) + 1
   e = 0
   
END IF

FOR d = 1 TO SterneNum

   x = Sterne(d, 1)
   x = x + Sterne(d, 3)
   Sterne(d, 1) = x
   IF x > 640 THEN Sterne(d, 1) = 0: Sterne(d, 2) = CINT(350 * RND)

NEXT d

FOR d = 1 TO SterneNum
  
   x = Sterne(d, 1)
   y = Sterne(d, 2)
  
   SELECT CASE Sterne(d, 3)
      CASE 0 TO 3
      'IF SterneNum = 50 THEN
      PSET (x, y), 1

      CASE 4 TO 7
      'IF SterneNum = 50 THEN
      PSET (x, y), 9

      CASE 7 TO 10
      'IF SterneNum = 50 THEN
      PSET (x, y), 15

   END SELECT

NEXT d

SWAP b1, b2

'FOR za = 1 TO 1000
'NEXT za

SCREEN 9, , b1, b2
CLS

GOTO 10

