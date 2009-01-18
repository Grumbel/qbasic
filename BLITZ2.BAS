COMMON x AS SINGLE
COMMON y AS SINGLE
DIM TempX(1 TO 100) AS INTEGER
DIM TempY(1 TO 100) AS INTEGER
RANDOMIZE TIMER
 MaxPush = 5
 FlashWide = 3
Start:
y = 0
x = 320
push = 1
SCREEN 12

PSET (320, 0)

10
y = y + push
x = x + (INT((FlashWide * 2 + 1 + c) * RND) - FlashWide) * push

LINE -(x, y)

IF y >= 480 THEN CLS : GOTO Start

sp = INT(5 * RND)
'LOCATE 1, 1: PRINT push

IF sp = 0 THEN
   IF push >= MaxPush THEN push = MaxPush
   TempX(push) = x
   TempY(push) = y
   push = push + 1
   c = INT(3 * RND) - 1
   'SOUND 1000, .1
END IF

IF sp = 3 OR sp = 4 THEN
   IF push <= 1 THEN c = 0: push = 1: GOTO Ende
   x = TempX(push - 1)
   y = TempY(push - 1)
   PSET (x, y)
   c = INT(3 * RND) - 1
   push = push - 1
Ende:
END IF

'FOR za = 1 TO 1000: NEXT za
a$ = INKEY$
IF a$ <> "" THEN
   IF a$ = "4" THEN MaxPush = MaxPush + 1
   IF a$ = "1" THEN MaxPush = MaxPush - 1
   IF a$ = "5" THEN FlashWide = FlashWide + 1
   IF a$ = "2" THEN FlashWide = FlashWide - 1
END IF
GOTO 10

