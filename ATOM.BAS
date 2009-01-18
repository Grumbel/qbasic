DECLARE SUB PutPixel (x AS INTEGER, y AS INTEGER)
COMMON x AS INTEGER
COMMON y AS INTEGER
COMMON SHARED xPos AS INTEGER
COMMON SHARED yPos AS INTEGER
COMMON SHARED za AS INTEGER

RANDOMIZE TIMER

SCREEN 13

FOR za = 1 TO 2500
   PSET (320 * RND, 200 * RND), 15
NEXT za

DO

x = INT(320 * RND)
y = INT(200 * RND)

CALL PutPixel(x, y)

LOOP

SUB PutPixel (x AS INTEGER, y AS INTEGER)

   IF POINT(x, y) = 15 THEN

      FOR za = 1 TO 10
         xPos = x + INT(3 * RND) - 1
         yPos = y + INT(3 * RND) - 1
        
         IF POINT(xPos, yPos) = 0 THEN
            PSET (x, y), 0
            PSET (xPos, yPos), 15
            EXIT FOR
         END IF

      NEXT

   END IF

END SUB

