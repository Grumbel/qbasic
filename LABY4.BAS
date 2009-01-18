'Formeln fÅr 3D-Objekte
DECLARE FUNCTION DDX! (Abstnd!, aaaax!)
DECLARE FUNCTION DDY! (Abstnnd!, aaaax!)

'3D Formel fÅr Rutine
DECLARE FUNCTION Zoom% (x!)

'Sprung
DECLARE SUB Sprung ()

'Zeichnet Karte
DECLARE SUB CompLabyDraw ()

'3D Rutine fÅr Grafik
DECLARE SUB LabyDraw3D ()

'zeichnet Karte
DECLARE SUB LabyDraw ()

'legt erforschte Bereiche fest
DECLARE SUB SearchDim ()

'scanned Labyrint
DECLARE SUB LabyScan ()   'geradeaus
DECLARE SUB LabyScan3 ()          'rechts
DECLARE SUB LabyScan2 ()  'links

COMMON SHARED Abstnd!, aaax!, xPos%, yPos%, Richtung%, LZoom%
COMMON SHARED za%, LabyX%, LabyY%, aaaax!
COMMON SHARED Zustand AS INTEGER
COMMON SHARED B1 AS INTEGER, B2 AS INTEGER
COMMON SHARED Etage AS INTEGER
COMMON FirstLoad AS INTEGER

B1 = 1
B2 = 0
Richtung% = 5

LZoom% = 10
CONST XtoY! = .546875
SCREEN 9, , B1, B2

CLS
yPos% = 3
DIM SHARED Wand2%(255)
DIM SHARED Wand3%(255)
DIM SHARED Wand%(255)

Etage:
DimY% = 1
'IF Etage = 1 THEN ERASE Laby%()
IF Etage = 0 THEN Datei$ = "et1.lby"
IF Etage = 1 THEN Datei$ = "et2.lby"

OPEN Datei$ FOR RANDOM AS #1 LEN = 1
FIELD #1, 1 AS DateiA$

GET #1, 1: LabyX% = ASC(DateiA$)
GET #1, 2: LabyY% = ASC(DateiA$)

IF FirstLoad = 1 THEN GOTO LabyDim
FirstLoad = 1
GET #1, 3: xPos% = ASC(DateiA$)
GET #1, 4: yPos% = ASC(DateiA$)

LabyDim:

REDIM SHARED Laby%(LabyX%, LabyY%)

FOR a% = 5 TO LabyX% * LabyY% + 4

   GET #1, a%
   DimX% = DimX% + 1
   Laby%(DimX%, DimY%) = ASC(DateiA$)
   IF DimX% = LabyX% THEN DimX% = 0: DimY% = DimY% + 1
   IF DimY% = LabyY% + 1 THEN GOTO DateiSchliessen

NEXT a%

DateiSchliessen:

CLOSE

REDIM SHARED Search%(LabyX%, LabyY%)



GOTO PastKey

10
ERASE Wand%
ERASE Wand2%
ERASE Wand3%
TempYPos% = yPos%
TempXpos% = xPos%

TastaturSchleife:
a$ = INKEY$
IF a$ <> "" THEN GOTO 2
GOTO TastaturSchleife

2
IF a$ = CHR$(0) + "M" OR a$ = "6" THEN Richtung% = Richtung% + 1: GOTO PastKey'rechts
IF a$ = CHR$(0) + "K" OR a$ = "4" THEN Richtung% = Richtung% - 1: GOTO PastKey'links

IF a$ = CHR$(0) + "H" AND Richtung% = 5 THEN yPos% = yPos% - 1: GOTO PastKey 'oben
IF a$ = CHR$(0) + "P" AND Richtung% = 5 THEN yPos% = yPos% + 1: GOTO PastKey 'unten

IF a$ = CHR$(0) + "H" AND Richtung% = 2 THEN xPos% = xPos% + 1: GOTO PastKey
IF a$ = CHR$(0) + "P" AND Richtung% = 2 THEN xPos% = xPos% - 1: GOTO PastKey

IF a$ = CHR$(0) + "H" AND Richtung% = 3 THEN yPos% = yPos% + 1: GOTO PastKey
IF a$ = CHR$(0) + "P" AND Richtung% = 3 THEN yPos% = yPos% - 1: GOTO PastKey

IF a$ = CHR$(0) + "H" AND Richtung% = 4 THEN xPos% = xPos% - 1: GOTO PastKey
IF a$ = CHR$(0) + "P" AND Richtung% = 4 THEN xPos% = xPos% + 1: GOTO PastKey

IF a$ = "8" AND Richtung% = 5 THEN yPos% = yPos% - 1: GOTO PastKey 'oben
IF a$ = "2" AND Richtung% = 5 THEN yPos% = yPos% + 1: GOTO PastKey 'unten
       
IF a$ = "8" AND Richtung% = 2 THEN xPos% = xPos% + 1: GOTO PastKey
IF a$ = "2" AND Richtung% = 2 THEN xPos% = xPos% - 1: GOTO PastKey
       
IF a$ = "8" AND Richtung% = 3 THEN yPos% = yPos% + 1: GOTO PastKey
IF a$ = "2" AND Richtung% = 3 THEN yPos% = yPos% - 1: GOTO PastKey

IF a$ = "8" AND Richtung% = 4 THEN xPos% = xPos% - 1: GOTO PastKey
IF a$ = "2" AND Richtung% = 4 THEN xPos% = xPos% + 1: GOTO PastKey

IF a$ = "1" AND Richtung% = 5 THEN xPos% = xPos% - 1: GOTO PastKey
IF a$ = "3" AND Richtung% = 5 THEN xPos% = xPos% + 1: GOTO PastKey
        
IF a$ = "1" AND Richtung% = 2 THEN yPos% = yPos% - 1: GOTO PastKey
IF a$ = "3" AND Richtung% = 2 THEN yPos% = yPos% + 1: GOTO PastKey

IF a$ = "1" AND Richtung% = 3 THEN xPos% = xPos% + 1: GOTO PastKey
IF a$ = "3" AND Richtung% = 3 THEN xPos% = xPos% - 1: GOTO PastKey

IF a$ = "1" AND Richtung% = 4 THEN yPos% = yPos% + 1: GOTO PastKey
IF a$ = "3" AND Richtung% = 4 THEN yPos% = yPos% - 1: GOTO PastKey

IF a$ = "m" THEN
  
   CALL CompLabyDraw
  
   LOCATE 1, 1
   PRINT "Enter drÅcken"

SWAP B1, B2
Bildschirmwechsel2:
   SCREEN 9, , B1, B2
  
   DO
     a$ = INKEY$
   LOOP WHILE a$ = ""
   LZoom% = 10
   GOTO PastKey

END IF

IF a$ = "s" THEN
CALL Sprung
   zaaa% = 1
   IF za% < 4 THEN zaaa% = 0
   FOR zaa% = 0 + zaaa% TO 1

      Temp2xPos% = xPos%
      Temp2yPos% = yPos%
     
      SELECT CASE Richtung%
     
      CASE 5
      yPos% = yPos% - 1
     
      CASE 2
      xPos% = xPos% + 1
     
      CASE 3
      yPos% = yPos% + 1
     
      CASE 4
      xPos% = xPos% - 1

      END SELECT

   IF Laby%(xPos%, yPos%) = 1 OR Laby%(xPos%, yPos%) = 255 THEN
     
      xPos% = Temp2xPos%
      yPos% = Temp2yPos%
      KolSnd% = 1
      GOTO SprungSound
  
   END IF

   NEXT zaa%
  
   GOTO SprungSound

END IF

GOTO TastaturSchleife

SprungSound:
FOR Snd% = 600 TO 2000 STEP 200
   SOUND Snd%, 1
NEXT Snd%

IF KolSnd% = 1 THEN SOUND 1000, .5
KolSnd% = 0

'verhindert aus dem Labyrint herausspringen
IF xPos% = 0 OR yPos% = 0 THEN xPos% = TempXpos%: yPos% = TempYPos%: SOUND 1000, .5
IF xPos% > LabyX% OR yPos% > LabyY% THEN xPos% = TempXpos%: yPos% = TempYPos%: SOUND 1000, .5

PastKey:

'Wandkolision
IF Laby%(xPos%, yPos%) = 1 OR Laby%(xPos%, yPos%) = 255 THEN
   xPos% = TempXpos%
   yPos% = TempYPos%
   SOUND 1000, .5
END IF

'dreht Richtung
IF Richtung% < 2 THEN Richtung% = 5
IF Richtung% > 5 THEN Richtung% = 2

CLS

CALL SearchDim

CALL LabyScan
CALL LabyScan2
CALL LabyScan3

CALL LabyDraw3D

'setzt Verhalten von Fallgrube
IF Laby%(xPos%, yPos%) = 7 THEN
   CLS
  
   zx% = Zoom%(1.5 + .546875)
   zy% = Zoom%(1.5 + .546875) * XtoY!
  
   zxx% = Zoom%(.546875)
   zyy% = Zoom%(.546875) * XtoY!

   LINE (Zoom%(1.5 + .546875), zy%)-(Zoom%(1.5 + .546875), 350)
   LINE (640 - Zoom%(1.5 + .546875), zy%)-(640 - Zoom%(1.5 + .546875), 350)
   LINE (zx%, zy%)-(zxx%, zyy%)
   LINE (640 - zx%, zy%)-(640 - zxx%, zyy%)
   LINE (640 - zx%, zy%)-(zx%, zy%)

   LOCATE 3, 1

   IF Zustand% = 0 THEN
    
      FOR Snd% = 3000 TO 300 STEP -20
         SOUND Snd%, .1
      NEXT Snd%

      FOR za% = 1 TO 10
         SOUND RND * 100 + 500, .5
      NEXT za%
    
      PRINT "Du bist in eine Fallgrube gefallen..."
   END IF

END IF

'Display
LINE (500, 350)-(500, 0)
LINE (500, 0)-(640, 0)

LINE (639, 350)-(639, 0), 7
LINE (500, 349)-(640, 349), 7

CALL LabyDraw

LOCATE 10, 70
PRINT "X:"; xPos%

LOCATE 12, 70
PRINT "Y:"; yPos%

LOCATE 14, 70
PRINT "Etage:"; Etage
Labygrenz% = 0

Zustand = Laby%(xPos%, yPos%)
LOCATE 1, 33
PRINT "∫           ∫"
LOCATE 2, 33
PRINT "»ÕÕÕÕÕÕÕÕÕÕÕº"
SELECT CASE Richtung%
   CASE 2
   LOCATE 1, 35
   PRINT "----O----"

   CASE 3
   LOCATE 1, 35
   PRINT "----S----"

   CASE 4
   LOCATE 1, 35
   PRINT "----W----"

   CASE 5
   LOCATE 1, 35
   PRINT "----N----"
END SELECT

'ProgrammSchleifen Ende und nach Bildschirmwechsel neuer Beginn

Bildschirmwechsel:
SWAP B1, B2
SCREEN 9, , B1, B2

'Setzt Verhalten fÅr Treppe
IF Zustand = 9 THEN
   Etage = Etage + 1

   SELECT CASE Richtung%
      CASE 2
      Richtung% = 4

      CASE 3
      Richtung% = 5

      CASE 4
      Richtung% = 2

      CASE 5
      Richtung% = 3
   END SELECT

   GOTO Etage
END IF

GOTO 10

SUB CompLabyDraw
                 
CONST VX% = 10
CONST VY% = 10
LZoom% = 7

CLS
LINE (0, 0)-(640, 350), 1, BF

FOR aax% = 1 TO LabyX%
   FOR aay% = 1 TO LabyY%

      SELECT CASE Laby%(aax%, aay%)
     
         CASE 0
         IF Search%(aax%, aay%) = 1 THEN
            LINE (aax% * LZoom% + VX%, aay% * LZoom% + VY%)-STEP(LZoom%, LZoom%), 0, BF
         END IF

         CASE 255 AND Search%(aax%, aay%) = 1
         LINE (aax% * LZoom% + VX%, aay% * LZoom% + VY%)-STEP(LZoom%, LZoom%), 7, BF
        
         CASE 1 AND Search%(aax%, aay%) = 1
         LINE (aax% * LZoom% + VX%, aay% * LZoom% + VY%)-STEP(LZoom%, LZoom%), 7, BF
           
         CASE 2 AND Search%(aax%, aay%) = 1
         LINE (aax% * LZoom% + VX%, aay% * LZoom% + VY%)-STEP(LZoom%, LZoom%), 15, BF
          
         CASE 3 AND Search%(aax%, aay%) = 1
         LINE (aax% * LZoom% + VX%, aay% * LZoom% + VY%)-STEP(LZoom%, LZoom%), 15, BF
          
         CASE 4 AND Search%(aax%, aay%) = 1
         LINE (aax% * LZoom% + VX%, aay% * LZoom% + VY%)-STEP(LZoom%, LZoom%), 15, BF
          
         CASE 5 AND Search%(aax%, aay%) = 1
         LINE (aax% * LZoom% + VX%, aay% * LZoom% + VY%)-STEP(LZoom%, LZoom%), 15, BF
          
         CASE ELSE
         IF Search%(aax%, aay%) = 1 THEN
                LINE (aax% * LZoom% + VX%, aay% * LZoom% + VY%)-STEP(LZoom%, LZoom%), 4, BF
         END IF

      END SELECT

   NEXT aay%
NEXT aax%

SELECT CASE Richtung%
                  
CASE 5
LINE (xPos% * LZoom% + VX% + LZoom% / 2, yPos% * LZoom% + VY%)-STEP(LZoom% / 2, LZoom%), 15
LINE (xPos% * LZoom% + VX% + LZoom% / 2, yPos% * LZoom% + VY%)-STEP(-LZoom% / 2, LZoom%), 15

CASE 2
LINE (xPos% * LZoom% + VX%, yPos% * LZoom% + VY%)-STEP(LZoom%, LZoom% / 2), 15
LINE (xPos% * LZoom% + VX%, yPos% * LZoom% + VY% + LZoom%)-STEP(LZoom%, -LZoom% / 2), 15

CASE 3
LINE (xPos% * LZoom% + VX% + LZoom% / 2, yPos% * LZoom% + VY% + LZoom%)-STEP(LZoom% / 2, -LZoom%), 15
LINE (xPos% * LZoom% + VX% + LZoom% / 2, yPos% * LZoom% + VY% + LZoom%)-STEP(-LZoom% / 2, -LZoom%), 15

CASE 4
LINE (xPos% * LZoom% + VX% + LZoom%, yPos% * LZoom% + VY%)-STEP(-LZoom%, LZoom% / 2), 15
LINE (xPos% * LZoom% + VX% + LZoom%, yPos% * LZoom% + VY% + LZoom%)-STEP(-LZoom%, -LZoom% / 2), 15


END SELECT

END SUB

FUNCTION DDX (Abstnd, aaaax!)
aaaax! = aaaax! / 640
xxxx = ((Abstnd - 320) / 175) * (Zoom%(aaax! + aaaax!) * XtoY!) + 640 - Abstnd
DDX = xxxx

END FUNCTION

FUNCTION DDY (Abstnnd, aaaax!)

aaaax! = aaaax! / 640

yyyy = ((Abstnnd - 175) / 320) * (Zoom%(aaax! + aaaax!)) + 350 - Abstnnd
DD = yyyy
DDY = yyyy

END FUNCTION

SUB LabyDraw

CONST VX% = 563
CONST VY% = 60

xxPos% = xPos%
xxxPos% = xPos%

yyPos% = yPos%
yyyPos% = yPos%

IF xxPos% < 6 THEN xxPos% = 6

IF yyPos% < 6 THEN yyPos% = 6

IF xxxPos% > LabyX% - 5 THEN xxxPos% = LabyX% - 5

IF yyyPos% > LabyX% - 5 THEN yyyPos% = LabyY% - 5

LINE (513, 10)-(623, 120), 1, BF

FOR aax% = xxPos% - 5 TO xxxPos% + 5
   FOR aay% = yyPos% - 5 TO yyyPos% + 5

      SELECT CASE Laby%(aax%, aay%)
      
         CASE 0
         IF Search%(aax%, aay%) = 1 THEN
         LINE ((aax% - xPos%) * LZoom% + VX%, (aay% - yPos%) * LZoom% + VY%)-STEP(LZoom%, LZoom%), 8, BF
         END IF

         CASE 255 AND Search%(aax%, aay%) = 1
         LINE ((aax% - xPos%) * LZoom% + VX%, (aay% - yPos%) * LZoom% + VY%)-STEP(LZoom%, LZoom%), 7, BF
         
         CASE 1 AND Search%(aax%, aay%) = 1
         LINE ((aax% - xPos%) * LZoom% + VX%, (aay% - yPos%) * LZoom% + VY%)-STEP(LZoom%, LZoom%), 7, BF
            
         CASE 2 AND Search%(aax%, aay%) = 1
         LINE ((aax% - xPos%) * LZoom% + VX%, (aay% - yPos%) * LZoom% + VY%)-STEP(LZoom%, LZoom%), 15, BF
           
         CASE 3 AND Search%(aax%, aay%) = 1
         LINE ((aax% - xPos%) * LZoom% + VX%, (aay% - yPos%) * LZoom% + VY%)-STEP(LZoom%, LZoom%), 15, BF
           
         CASE 4 AND Search%(aax%, aay%) = 1
         LINE ((aax% - xPos%) * LZoom% + VX%, (aay% - yPos%) * LZoom% + VY%)-STEP(LZoom%, LZoom%), 15, BF
           
         CASE 5 AND Search%(aax%, aay%) = 1
         LINE ((aax% - xPos%) * LZoom% + VX%, (aay% - yPos%) * LZoom% + VY%)-STEP(LZoom%, LZoom%), 15, BF
           
         CASE ELSE
         IF Search%(aax%, aay%) = 1 THEN
            LINE ((aax% - xPos%) * LZoom% + VX%, (aay% - yPos%) * LZoom% + VY%)-STEP(LZoom%, LZoom%), 15, BF
         END IF

      END SELECT

   NEXT aay%
NEXT aax%

SELECT CASE Richtung%
                   
CASE 5
LINE (VX% + LZoom% / 2, VY%)-STEP(LZoom% / 2, LZoom%), 15
LINE (VX% + LZoom% / 2, VY%)-STEP(-LZoom% / 2, LZoom%), 15

CASE 2
LINE (VX% + LZoom%, VY% + LZoom% / 2)-STEP(-LZoom%, LZoom% / 2), 15
LINE (VX% + LZoom%, VY% + LZoom% / 2)-STEP(-LZoom%, -LZoom% / 2), 15

CASE 3
LINE (VX% + LZoom% / 2, VY% + LZoom%)-STEP(LZoom% / 2, -LZoom%), 15
LINE (VX% + LZoom% / 2, VY% + LZoom%)-STEP(-LZoom% / 2, -LZoom%), 15

CASE 4
LINE (VX%, VY% + LZoom% / 2)-STEP(LZoom%, LZoom% / 2), 15
LINE (VX%, VY% + LZoom% / 2)-STEP(LZoom%, -LZoom% / 2), 15


END SELECT

END SUB

SUB LabyDraw3D

FOR aaax! = 17 TO 1 STEP -1
  
   IF Wand3%(aaax!) = 1 THEN
      zx% = 640 - Zoom%(aaax!)
      zxx% = 640 - Zoom%(aaax! + 1)
      LINE (zx%, zx% * XtoY!)-(zxx%, zxx% * XtoY!)
      LINE (zx%, 350 - zx% * XtoY!)-(zxx%, 350 - zxx% * XtoY!)
   END IF

   IF Wand3%(aaax!) = 255 THEN
      IF Labygrenz% = 1 THEN Labygrenz% = 0: GOTO NxtWand
      Labygrenz% = 1
      zx% = 640 - Zoom%(aaax!)
      zxx% = 640 - Zoom%(aaax! + 1)
      LINE (zx%, zx% * XtoY!)-(zxx%, zxx% * XtoY!)
      LINE (zx%, 350 - zx% * XtoY!)-(zxx%, 350 - zxx% * XtoY!)
   END IF


   IF Wand3%(aaax!) = 0 OR Wand3%(aaax!) = 7 THEN
      zx% = 640 - Zoom%(aaax!)
      zxx% = 640 - Zoom%(aaax! + 1)
      zy% = Zoom%(aaax! + 1) * XtoY!
      LINE (zx%, zx% * XtoY!)-(zx%, 350 - zx% * XtoY!)
      LINE (zx%, zy%)-(zxx%, zy%)
      LINE (zx%, 350 - zy%)-(zxx%, 350 - zy%)
      LINE (zxx%, 350 - zy%)-(zxx%, zy%)
   END IF

   IF Wand3%(aaax!) = 6 THEN
      zx% = 640 - Zoom%(aaax!)
      zxx% = 640 - Zoom%(aaax! + 1)
      LINE (zx%, zx% * XtoY!)-(zxx%, 350 - zxx% * XtoY!), 4
      LINE (zxx%, zxx% * XtoY!)-(zx%, 350 - zx% * XtoY!), 4
   END IF
 
NEXT aaax!

NxtWand:
Labygrenz% = 0
FOR aaax! = 17 TO 1 STEP -1
  
   IF Wand2%(aaax!) = 1 THEN
      zx% = Zoom%(aaax!)
      zxx% = Zoom%(aaax! + 1)
      LINE (zx%, zx% * XtoY!)-(zxx%, zxx% * XtoY!)
      LINE (zx%, 350 - zx% * XtoY!)-(zxx%, 350 - zxx% * XtoY!)
   END IF

   IF Wand2%(aaax!) = 255 THEN
      IF Labygrenz% = 1 THEN Labygrenz% = 0: GOTO NxtWand2
      Labygrenz% = 1
      zx% = Zoom%(aaax!)
      zxx% = Zoom%(aaax! + 1)
      LINE (zx%, zx% * XtoY!)-(zxx%, zxx% * XtoY!)
      LINE (zx%, 350 - zx% * XtoY!)-(zxx%, 350 - zxx% * XtoY!)
   END IF


   IF Wand2%(aaax!) = 0 OR Wand2%(aaax!) = 7 THEN
      zx% = Zoom%(aaax!)
      zxx% = Zoom%(aaax! + 1)
      zy% = Zoom%(aaax! + 1) * XtoY!
      LINE (zx%, zx% * XtoY!)-(zx%, 350 - zx% * XtoY!)
      LINE (zx%, zy%)-(zxx%, zy%)
      LINE (zx%, 350 - zy%)-(zxx%, 350 - zy%)
      LINE (zxx%, 350 - zy%)-(zxx%, zy%)
   END IF

   IF Wand2%(aaax!) = 6 THEN
      zx% = Zoom%(aaax!)
      zxx% = Zoom%(aaax! + 1)
      LINE (zx%, zx% * XtoY!)-(zxx%, 350 - zxx% * XtoY!), 4
      LINE (zxx%, zxx% * XtoY!)-(zx%, 350 - zx% * XtoY!), 4
   END IF

  
NEXT aaax!

NxtWand2:
FOR aaax! = 17 TO 1 STEP -1

   'TestObjekt
   IF Wand%(aaax!) = 6 THEN
    
      'LINE (DDX(140, 640), DDY(0, 640))-(DDX(500, 640), DDY(100, 640)), 3, BF
      'LINE (DDX(140, 0), DDY(0, 0))-(DDX(500, 0), DDY(100, 0)), 3, BF
     
      LINE (DDX(140, 640), DDY(100, 640))-(DDX(500, 640), DDY(100, 640))
      LINE (DDX(140, 0), DDY(100, 0))-(DDX(500, 0), DDY(100, 0))
      LINE (DDX(140, 0), DDY(100, 0))-(DDX(140, 640), DDY(100, 640))
      LINE (DDX(500, 640), DDY(100, 640))-(DDX(500, 0), DDY(100, 0))

      'zx% = Zoom%(aaax!)
      'zy% = zx% * XtoY!
                             
      'LINE (zy% * (320 / 350) + 160, zy%)-(640 - (zy% * (320 / 350) + 160), zx% * (150 / 640) + 100), 4, BF
    
      'r% = 640 - 2 * zx%
      'CIRCLE (320, 350 - (zx% * XtoY! + (r% / 2))), r% / 2
      'LINE (zy% * (320 / 350) + 160, zy%)-(640 - (zy% * (320 / 350) + 160), 350 - zy%), 4, BF
      'LINE (zx%, 350 - zx% * XtoY!)-(640 - zx%, zx% * (150 / 640) + 100), , BF

   END IF

   'Treppe aufwÑrts
   IF Wand%(aaax!) = 9 THEN
      'LINE (DDX(0, 0), DDY(350, 0))-(DDX(640, 0), DDY(0, 0)), 0, BF
     
      LINE (DDX(0, 640), DDY(350, 640))-(DDX(640, 640), DDY(350, 640))

      LINE (DDX(0, 480), DDY(280, 480))-(DDX(640, 480), DDY(280, 480))
      LINE (DDX(0, 480), DDY(210, 480))-(DDX(0, 480), DDY(280, 480))
      LINE (DDX(640, 480), DDY(210, 480))-(DDX(640, 480), DDY(280, 480))
     
      'LINE (DDX(0, 480), DDY(210, 480))-(DDX(640, 480), DDY(210, 480)), 14
      LINE (DDX(0, 320), DDY(210, 320))-(DDX(640, 320), DDY(210, 320))

      LINE (DDX(0, 160), DDY(140, 160))-(DDX(640, 160), DDY(140, 160))
      LINE (DDX(0, 320), DDY(140, 320))-(DDX(640, 320), DDY(140, 320))
      LINE (DDX(0, 320), DDY(140, 320))-(DDX(0, 320), DDY(210, 320))
      LINE (DDX(640, 320), DDY(140, 320))-(DDX(640, 320), DDY(210, 320))
     
      LINE (DDX(0, 0), DDY(70, 0))-(DDX(640, 0), DDY(70, 0))
      LINE (DDX(0, 160), DDY(70, 160))-(DDX(640, 160), DDY(70, 160))
      LINE (DDX(0, 160), DDY(70, 160))-(DDX(0, 160), DDY(140, 160))
      LINE (DDX(640, 160), DDY(70, 160))-(DDX(640, 160), DDY(140, 160))
     
      LINE (DDX(0, 160), DDY(140, 160))-(DDX(0, 320), DDY(140, 320))
      LINE (DDX(640, 160), DDY(140, 160))-(DDX(640, 320), DDY(140, 320))

      LINE (DDX(0, 0), DDY(70, 0))-(DDX(0, 160), DDY(70, 160))
      LINE (DDX(640, 0), DDY(70, 0))-(DDX(640, 160), DDY(70, 160))
     
      LINE (DDX(640, 0), DDY(70, 0))-(DDX(640, 0), DDY(0, 0))
      LINE (DDX(0, 0), DDY(70, 0))-(DDX(0, 0), DDY(0, 0))

      LINE (DDX(0, 0), DDY(0, 0))-(DDX(640, 0), DDY(0, 0))
      LINE (DDX(0, 0), DDY(350, 0))-(DDX(640, 0), DDY(350, 0))
   END IF


   'FalltÅr
   IF Wand%(aaax!) = 7 THEN
      
      LINE (DDX(100, 100), DDY(0, 100))-(DDX(540, 100), DDY(0, 100))
      LINE (DDX(100, 540), DDY(0, 540))-(DDX(540, 540), DDY(0, 540))
      LINE (DDX(100, 100), DDY(0, 100))-(DDX(100, 540), DDY(0, 540))
      LINE (DDX(540, 100), DDY(0, 100))-(DDX(540, 540), DDY(0, 540))
      LINE (DDX(100, 540), DDY(0, 540))-(DDX(100, 540), DDY(0, 100))
      LINE (DDX(540, 540), DDY(0, 540))-(DDX(540, 540), DDY(0, 100))
    
   END IF

   'Kugel
   IF Wand%(aaax!) = 8 THEN
      CIRCLE (DDX(320, 320), DDY(330, 320)), ABS(320 - DDX(320 - 20, 320))
      LINE (DDX(320, 320), DDY(330, 320))-(DDX(300, 320), DDY(320, 320))
      LINE (DDX(320, 320), DDY(330, 320))-(DDX(340, 320), DDY(320, 320))
   END IF
  
   IF Wand%(aaax!) = 1 OR Wand%(aaax!) = 255 THEN
      zx% = Zoom%(aaax!)
      LINE (zx%, 350 - zx% * XtoY!)-(640 - zx%, zx% * XtoY!), 0, BF
      LINE (zx%, 350 - zx% * XtoY!)-(640 - zx%, 350 - zx% * XtoY!)
      LINE (zx%, zx% * XtoY!)-(640 - zx%, zx% * XtoY!)
     
    
      IF Wand2%(aaax! - 1) = 1 OR Wand2%(aaax! - 1) = 255 THEN
         LINE (zx%, 350 - zx% * XtoY!)-(zx%, zx% * XtoY!)
      END IF

      IF Wand3%(aaax! - 1) = 1 OR Wand3%(aaax! - 1) = 255 THEN
         LINE (640 - zx%, 350 - zx% * XtoY!)-(640 - zx%, zx% * XtoY!)
      END IF

   END IF

NEXT aaax!

END SUB

SUB LabyScan
xScann% = xPos%
yScann% = yPos%

ScannStart:
  
   ScanD% = ScanD% + 1
   Wand%(ScanD%) = Laby%(xScann%, yScann%)
   IF Laby%(xScann%, yScann%) = 255 OR Laby%(xScann%, yScann%) = 1 THEN GOTO Ende
  
   IF Richtung% = 5 THEN yScann% = yScann% - 1
   IF Richtung% = 2 THEN xScann% = xScann% + 1
   IF Richtung% = 3 THEN yScann% = yScann% + 1
   IF Richtung% = 4 THEN xScann% = xScann% - 1
   
GOTO ScannStart

Ende:

END SUB

SUB LabyScan2

   xScann% = xPos%
   yScann% = yPos%

'WandAbstand2 = 0

SELECT CASE Richtung%
   CASE 2
   ry% = -1: rx% = 0
   CASE 3
   rx% = 1: ry% = 0
   CASE 4
   ry% = 1: rx% = 0
   CASE 5
   rx% = -1: ry% = 0
END SELECT

ScannStart2:
   ScanD% = ScanD% + 1

   Wand2%(ScanD%) = Laby%(xScann% + rx%, yScann% + ry%)
   IF Laby%(xScann% + rx%, yScann% + ry%) = 255 THEN GOTO Ende2
   
   IF Richtung% = 5 THEN yScann% = yScann% - 1
   IF Richtung% = 2 THEN xScann% = xScann% + 1
   IF Richtung% = 3 THEN yScann% = yScann% + 1
   IF Richtung% = 4 THEN xScann% = xScann% - 1

GOTO ScannStart2

Ende2:

Endfunc:

IF ScanD% = 1 THEN
  
   FOR xd% = ScanD% TO 18
      Wand2%(xd%) = 1
   NEXT xd%

END IF

ScanD% = 0


END SUB

SUB LabyScan3

xScann% = xPos%
yScann% = yPos%

SELECT CASE Richtung%
   CASE 2
   ry% = 1: rx% = 0
   CASE 3
   rx% = -1: ry% = 0
   CASE 4
   ry% = -1: rx% = 0
   CASE 5
   rx% = 1: ry% = 0
END SELECT

ScannStart3:
   ScanD% = ScanD% + 1
   Wand3%(ScanD%) = Laby%(xScann% + rx%, yScann% + ry%)
  
   IF Laby%(xScann% + rx%, yScann% + ry%) = 255 THEN GOTO Ende3
   IF Richtung% = 5 THEN yScann% = yScann% - 1
   IF Richtung% = 2 THEN xScann% = xScann% + 1
   IF Richtung% = 3 THEN yScann% = yScann% + 1
   IF Richtung% = 4 THEN xScann% = xScann% - 1
  
  

GOTO ScannStart3
Ende3:

IF ScanD% = 1 THEN
   FOR xd% = ScanD% TO 18
      Wand3%(xd%) = 1
   NEXT xd%
END IF

END SUB

SUB SearchDim

SearchX% = xPos%
SearchY% = yPos%
Search%(SearchX%, SearchY%) = 1

DO
   SearchX% = SearchX% + 1
   Search%(SearchX%, SearchY%) = 1
   Search%(SearchX%, SearchY% - 1) = 1
   Search%(SearchX%, SearchY% + 1) = 1
LOOP UNTIL Laby%(SearchX%, SearchY%) = 1 OR Laby%(SearchX%, SearchY%) = 255

SearchX% = xPos%
SearchY% = yPos%

DO
   SearchX% = SearchX% - 1
   Search%(SearchX%, SearchY%) = 1
   Search%(SearchX%, SearchY% - 1) = 1
   Search%(SearchX%, SearchY% + 1) = 1
   
LOOP UNTIL Laby%(SearchX%, SearchY%) = 1 OR Laby%(SearchX%, SearchY%) = 255

SearchX% = xPos%
SearchY% = yPos%

DO
   SearchY% = SearchY% + 1
   Search%(SearchX%, SearchY%) = 1
   Search%(SearchX% - 1, SearchY%) = 1
   Search%(SearchX% + 1, SearchY%) = 1
   
LOOP UNTIL Laby%(SearchX%, SearchY%) = 1 OR Laby%(SearchX%, SearchY%) = 255

SearchX% = xPos%
SearchY% = yPos%

DO
   SearchY% = SearchY% - 1
   Search%(SearchX%, SearchY%) = 1
   Search%(SearchX% - 1, SearchY%) = 1
   Search%(SearchX% + 1, SearchY%) = 1
   

LOOP UNTIL Laby%(SearchX%, SearchY%) = 1 OR Laby%(SearchX%, SearchY%) = 255

END SUB

SUB Sprung
Stp% = 1
za% = 0

SCREEN 9, , B2, B2

DO
   a$ = INKEY$
   za% = za% + Stp%
   IF za% > 100 THEN Stp% = -1
   IF za% < 0 THEN Stp% = 1
   LINE (510, 200 + za%)-(530, 300), 14, BF
  
   FOR zaa = 1 TO 100
   NEXT zaa
  
   LINE (510, 199)-(530, 301), 1, BF

LOOP UNTIL a$ = "s"

SCREEN 9, , B1, B2

a$ = ""

END SUB

FUNCTION Zoom% (x!)
Y! = 320 - (600 / (x!))
Zoom% = Y!
END FUNCTION

