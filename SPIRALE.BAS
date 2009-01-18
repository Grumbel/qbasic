SCREEN 9
CLS
y% = 0: d! = .05: u! = .5

FOR r! = u! * 360 TO 1 STEP -d!
   boga! = 3.1415927# / 180 * y%
   boge! = 3.1415927# / 180 * (y% + 1)
   CIRCLE (320, 175), r!, 1, boga!, boge!
   y% = y% + 1
   IF y% > 359 THEN y% = 0
NEXT r!

