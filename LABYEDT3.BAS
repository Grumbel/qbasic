'Laby-Generator

SCREEN 9
Start:
CLS
Zoom% = 10

INPUT "Laby X:"; LabyX%
INPUT "Laby Y:"; LabyY%

IF LabyX% = 1 THEN GOTO LoadLaby
IF LabyX% < 3 THEN LabyX% = 3
IF LabyY% < 3 THEN LabyY% = 3

DIM SHARED Laby%(LabyX%, LabyY%)

CLS

FOR X% = 1 TO LabyX%
   Laby%(X%, LabyY%) = 255
   Laby%(X%, 1) = 255
NEXT X%

FOR Y% = 1 TO LabyY%
   Laby%(LabyX%, Y%) = 255
   Laby%(1, Y%) = 255
NEXT Y%

LabyPosX% = 2
LabyPosY% = 2
LabyDim% = 256

GOTO 99
Tastaturabfrage:
LINE (LabyPosX% * Zoom%, LabyPosY% * Zoom%)-STEP(Zoom% - 1, Zoom% - 1), 3, BF

TastaturAbfrage3:
a$ = INKEY$
IF a$ <> "" THEN GOTO TastaturAbfrage2

GOTO TastaturAbfrage3

TastaturAbfrage2:

LINE (LabyPosX% * Zoom%, LabyPosY% * Zoom%)-STEP(Zoom% - 1, Zoom% - 1), LabyDim% + 5, BF

IF a$ = "s" THEN LabyDim% = 1 'Wand
IF a$ = "a" THEN LabyDim% = 0 'Frei
IF a$ = "w" THEN GOTO LabySave

IF a$ = "7" THEN LabyPosY% = LabyPosY% - 1: LabyPosX% = LabyPosX% - 1
IF a$ = "9" THEN LabyPosY% = LabyPosY% - 1: LabyPosX% = LabyPosX% + 1
IF a$ = "1" THEN LabyPosY% = LabyPosY% + 1: LabyPosX% = LabyPosX% - 1
IF a$ = "3" THEN LabyPosY% = LabyPosY% + 1: LabyPosX% = LabyPosX% + 1
IF a$ = "8" THEN LabyPosY% = LabyPosY% - 1
IF a$ = "2" THEN LabyPosY% = LabyPosY% + 1
IF a$ = "4" THEN LabyPosX% = LabyPosX% - 1
IF a$ = "6" THEN LabyPosX% = LabyPosX% + 1
IF a$ = "+" THEN Zoom% = Zoom% + 1: CLS
IF a$ = "-" THEN Zoom% = Zoom% - 1: CLS
IF a$ = "y" THEN LabyDim% = 256

IF a$ = "r" THEN
        LOCATE 1, 1
        INPUT "Labyrint neu beginnen [j/n]?", Frage$
        ERASE Laby%
        IF Frage$ = "j" THEN GOTO Start
END IF

IF a$ = "l" THEN
        LOCATE 1, 1
        INPUT "Labyrint laden [j/n]?", Frage$
        IF Frage$ = "j" THEN GOTO LoadLaby
END IF

IF a$ = "p" THEN
        LOCATE 1, 1
        INPUT "Start Position X:"; MyPosX%
        INPUT "Start Position Y:"; MyPosY%
        CLS
END IF

IF a$ = "5" THEN
   LOCATE 1, 1
   INPUT "Wert eingeben:"; number
   Laby%(LabyPosX%, LabyPosY%) = number
   CLS
END IF

IF LabyPosX% = 1 THEN LabyPosX% = 2
IF LabyPosX% = LabyX% THEN LabyPosX% = LabyX% - 1
IF LabyPosY% = 1 THEN LabyPosY% = 2
IF LabyPosY% = LabyY% THEN LabyPosY% = LabyY% - 1

'LINE (LabyPosX% * Zoom%, LabyPosY% * Zoom%)-STEP(Zoom% - 1, Zoom% - 1), LabyDim% + 5, BF

IF LabyDim% = 256 THEN GOTO 99
Laby%(LabyPosX%, LabyPosY%) = LabyDim%

GOTO 99

GOTO Tastaturabfrage


LabySave:
LOCATE 1, 1
INPUT "Speichern?[j/n]", Speichern$
IF Speichern$ <> "j" THEN CLS : GOTO 99

frei = 0
WandBeg = 25
Wand = 1


INPUT "Dateinamen eingeben:"; Datei$

OPEN Datei$ FOR RANDOM AS #1 LEN = 1

   FIELD #1, 1 AS DateiA$
  
   LSET DateiA$ = CHR$(LabyX%)
   PUT #1, 1

   LSET DateiA$ = CHR$(LabyY%)
   PUT #1, 2

   LSET DateiA$ = CHR$(MyPosX%)
   PUT #1, 3

   LSET DateiA$ = CHR$(MyPosY%)
   PUT #1, 4

   Bit% = 4

FOR DrawY% = 1 TO LabyY%
   FOR DrawX% = 1 TO LabyX%
         Bit% = Bit% + 1
        
         LSET DateiA$ = CHR$(Laby%(DrawX%, DrawY%))
         PUT #1, Bit%

   NEXT DrawX%
NEXT DrawY%

CLOSE

END

99
FOR DrawX% = 1 TO LabyX%
   FOR DrawY% = 1 TO LabyY%
     
      SELECT CASE Laby%(DrawX%, DrawY%)
        
         CASE 0
         LINE (DrawX% * Zoom%, DrawY% * Zoom%)-STEP(Zoom% - 1, Zoom% - 1), 0, BF
        
         CASE 255
         LINE (DrawX% * Zoom%, DrawY% * Zoom%)-STEP(Zoom% - 1, Zoom% - 1), 15, BF
        
         CASE 1
         LINE (DrawX% * Zoom%, DrawY% * Zoom%)-STEP(Zoom% - 1, Zoom% - 1), 15, BF
        
         CASE ELSE
         LINE (DrawX% * Zoom%, DrawY% * Zoom%)-STEP(Zoom% - 1, Zoom% - 1), 4, BF
        
     END SELECT
   NEXT DrawY%
NEXT DrawX%

LINE (MyPosX% * Zoom%, MyPosY% * Zoom%)-STEP(Zoom% - 1, Zoom% - 1), 1, BF

LOCATE 1, 40
PRINT "X:"; LabyPosX%; "Y:"; LabyPosY%
LOCATE 2, 40
SELECT CASE LabyDim%
   CASE 256
   PRINT "Curser  "

   CASE 1
   PRINT "Wand    "

   CASE 0
   PRINT "Frei    "
END SELECT

GOTO Tastaturabfrage


CLOSE



LoadLaby:

DimX% = 0
DimY% = 1
INPUT "Dateiname eingeben:", Datei$

DateiOpen:

OPEN Datei$ FOR RANDOM AS #1 LEN = 1
FIELD #1, 1 AS DateiA$

GET #1, 1: LabyX% = ASC(DateiA$)
GET #1, 2: LabyY% = ASC(DateiA$)
GET #1, 3: MyPosX% = ASC(DateiA$)
GET #1, 4: MyPosY% = ASC(DateiA$)

ERASE Laby%
DIM Laby%(LabyX%, LabyY%)

DIM Laby2%(LabyX%, LabyY%)

FOR a% = 5 TO LabyX% * LabyY% + 4

   GET #1, a%
   DimX% = DimX% + 1
   Laby%(DimX%, DimY%) = ASC(DateiA$)
   IF DimX% = LabyX% THEN DimX% = 0: DimY% = DimY% + 1
   IF DimY% = LabyY% + 1 THEN GOTO DateiSchliessen

NEXT a%

DateiSchliessen:

CLOSE
CLS

LabyPosX% = 2
LabyPosY% = 2
LabyDim% = 256


GOTO 99

'LabyDraw:
'FOR DrawX% = 1 TO LabyX%
'   FOR DrawY% = 1 TO LabyY%
'      DrawY%, DrawX%
'
'         SELECT CASE Laby2%(DrawX%, DrawY%)
'
'            CASE 0
'            PRINT CHR$(176)
'
'            CASE 255
'            PRINT CHR$(219)
'
'            CASE 1
'            PRINT CHR$(178)
'
'         END SELECT
'
'   NEXT DrawY%
'NEXT DrawX%
'GOTO 1
'
'
'

