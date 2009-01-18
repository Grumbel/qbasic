DECLARE SUB ScreenWechsel ()
DECLARE SUB GetSprite (x AS INTEGER, y AS INTEGER)
DECLARE SUB PutSprite (x AS INTEGER, y AS INTEGER)
COMMON SHARED Farbe AS INTEGER
COMMON SHARED xPos AS INTEGER
COMMON SHARED yPos AS INTEGER
COMMON SHARED xP AS INTEGER
COMMON SHARED yP AS INTEGER
COMMON SHARED scr1 AS INTEGER
COMMON SHARED scr2 AS INTEGER
scr1 = 1
DIM SHARED feld(0 TO 100, 0 TO 100) AS INTEGER

ScreenWechsel
SCREEN 9
FOR Farbe = 1 TO 320 STEP 5
   LINE (Farbe, 0)-(Farbe, 200), Farbe
NEXT Farbe

FOR Farbe = 1 TO 200 STEP 5
   LINE (0, Farbe)-(320, Farbe), Farbe
NEXT Farbe

ScreenWechsel

FOR Farbe = 1 TO 320 STEP 5
   LINE (Farbe, 0)-(Farbe, 200), Farbe
NEXT Farbe

FOR Farbe = 1 TO 200 STEP 5
   LINE (0, Farbe)-(320, Farbe), Farbe
NEXT Farbe

CALL GetSprite(xP, yP + 5)

FOR yP = 1 TO 200 STEP 5
   FOR xP = 1 TO 320 STEP 5
      
       CALL PutSprite(xP - 10, yP)
      
       CALL GetSprite(xP, yP)
       LINE (xP, yP)-STEP(45, 45), , BF
      
       ScreenWechsel
   NEXT xP
NEXT yP



SUB GetSprite (x AS INTEGER, y AS INTEGER)
  
   FOR yPos = 0 TO 50
      FOR xPos = 0 TO 50
         feld(xPos, yPos) = POINT(xPos + x, yPos + y)
      NEXT xPos
   NEXT yPos
  
END SUB

SUB PutSprite (x AS INTEGER, y AS INTEGER)
 
   FOR yPos = 0 TO 50
      FOR xPos = 0 TO 50
         PSET (xPos + x, yPos + y), feld(xPos, yPos)
      NEXT xPos
   NEXT yPos

END SUB

SUB ScreenWechsel

   SWAP scr1, scr2
   SCREEN 9, , scr1, 1
   FOR za = 1 TO 200: NEXT za

END SUB

