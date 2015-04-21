SCREEN 12
WINDOW SCREEN (-100, 0)-(640, 480)
RANDOMIZE TIMER
x = 320
y = 0
Push = 1
DIM XY(1 TO 500)
Beginn:
y = y + 1
FOR Durchgang = 1 TO Push
XY(1) = 320

IF Durchgang / 2 = CINT(Durchgang / 2) THEN Gerade = 1 ELSE Gerade = 2


IF Gerade = 1 AND Push > 1 THEN Richtung = -1: x = XY(Durchgang + Push)
IF Gerade = 2 AND Push > 1 THEN Richtung = 1: x = XY(Durchgang + Push)
IF Push = 1 THEN Richtung = 0


x = x + INT(3 * RND) - 1 + Richtung
PSET (x, y)

Gabelung = CINT(200 * RND)

IF Gabelung = 1 THEN
   Push = Push + 1
   XY(Durchgang + Push + 1) = XY(Durchgang + Push - 1)
END IF

 XY(Durchgang + Push) = x
  
   
NEXT Durchgang
IF y > 480 THEN CLS : y = 0: x = 320: Push = 1


GOTO Beginn

