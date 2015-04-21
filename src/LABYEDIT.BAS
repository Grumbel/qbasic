'Laby-Generator
'CLS
GOTO LabyView
1
INPUT "Laby X:"; LabyX%
INPUT "Laby Y:"; LabyY%
DIM Laby%(LabyX%, LabyY%)
'CLS

'FOR x% = 1 TO LabyX%
'   FOR y% = 1 TO LabyY%
'      LOCATE y%, x%
'         PRINT CHR$(219)
'   NEXT y%
'NEXT x%

LabyPosX% = 1
LabyPosY% = 1
50
a$ = INKEY$
IF a$ <> "" THEN GOTO 60
GOTO 50
60
IF TempPaint% = 1 THEN LOCATE LabyPosY%, LabyPosX%: PRINT TempPaint$
TempPaint$ = CHR$(SCREEN(LabyPosX%, LabyPosY%))
IF a$ = "y" THEN LabyPaint$ = CHR$(219): TempPaint% = 0
IF a$ = "s" THEN LabyPaint$ = CHR$(178): TempPaint% = 0
IF a$ = "a" THEN LabyPaint$ = CHR$(176): TempPaint% = 0
IF a$ = "w" THEN GOTO LabySave
IF a$ = "8" THEN LabyPosY% = LabyPosY% - 1
IF a$ = "2" THEN LabyPosY% = LabyPosY% + 1
IF a$ = "4" THEN LabyPosX% = LabyPosX% - 1
IF a$ = "6" THEN LabyPosX% = LabyPosX% + 1

'IF a$ = "x" THEN LabyPaint$ = "X": TempPaint% = 1
'IF a$ = "5" THEN
'   INPUT "Zahleingeben:"; number
'   PRINT LabyPosX%; LabyPosY%
'   SLEEP
'   Laby%(LabyPosX%, LabyPosY%) = number
'   GOTO LabyDraw
'END IF

IF LabyPosX% = 0 THEN LabyPosX% = 1
IF LabyPosX% = LabyX% + 1 THEN LabyPosX% = LabyX%
IF LabyPosY% = 0 THEN LabyPosY% = 1
IF LabyPosY% = LabyY% + 1 THEN LabyPosY% = LabyY%

LOCATE LabyPosY%, LabyPosX%: PRINT LabyPaint$

GOTO 50


LabySave:
frei = 0
WandBeg = 25
Wand = 1

Datei$ = "c:\ingo.lby"
OPEN Datei$ FOR RANDOM AS #1 LEN = 1

FIELD #1, 1 AS DateiA$
LSET DateiA$ = CHR$(LabyX%)
PUT #1, 1
LSET DateiA$ = CHR$(LabyY%)
PUT #1, 2

Bit% = 2

FOR DrawX% = 1 TO LabyX%

   FOR DrawY% = 1 TO LabyY%
         Bit% = Bit% + 1
         LOCATE DrawY%, DrawX%
  
         SELECT CASE SCREEN(DrawX%, DrawY%)

            CASE 176
            Laby%(DrawX%, DrawY%) = 0
            LSET DateiA$ = CHR$(0)
            PUT #1, Bit%

            CASE 219
            Laby%(DrawX%, DrawY%) = 255
            LSET DateiA$ = CHR$(255)
            PUT #1, Bit%

            CASE 178
            Laby%(DrawX%, DrawY%) = 1
            LSET DateiA$ = CHR$(1)
            PUT #1, Bit%

            CASE ELSE
            SOUND 1000, .1
           
            'PRINT DrawX% * DrawY% + 2

         END SELECT

   NEXT DrawY%
NEXT DrawX%

'CLS
'SLEEP

FOR DrawX% = 1 TO LabyX%
   FOR DrawY% = 1 TO LabyY%
      LOCATE DrawY%, DrawX%
   
         SELECT CASE Laby%(DrawX%, DrawY%)
      
            CASE 0
            PRINT CHR$(176)
    
            CASE 255
            PRINT CHR$(219)

            CASE 1
            PRINT CHR$(178)
         
     END SELECT

   NEXT DrawY%
NEXT DrawX%

CLOSE

LabyView:
'SLEEP
DimY% = 1
Datei$ = "c:\ingo.lby"

DateiOpen:
OPEN Datei$ FOR RANDOM AS #1 LEN = 1
FIELD #1, 1 AS DateiA$

GET #1, 1: LabyX% = ASC(DateiA$)
GET #1, 2: LabyY% = ASC(DateiA$)

DIM Laby2%(LabyX%, LabyY%)

FOR a% = 3 TO LabyX% * LabyY% + 2

   GET #1, a%
   DimX% = DimX% + 1
   Laby2%(DimX%, DimY%) = ASC(DateiA$)
   IF DimX% = LabyX% THEN DimX% = 0: DimY% = DimY% + 1
   IF DimY% = LabyY% + 1 THEN GOTO DateiSchliessen

NEXT a%

DateiSchliessen:
CLOSE

'CLS

LabyDraw:
FOR DrawX% = 1 TO LabyX%
   FOR DrawY% = 1 TO LabyY%
      LOCATE DrawY%, DrawX%
  
         SELECT CASE Laby2%(DrawX%, DrawY%)
     
            CASE 0
            PRINT CHR$(176)
   
            CASE 255
            PRINT CHR$(219)

            CASE 1
            PRINT CHR$(178)
        
            CASE 2
            PRINT CHR$(16)

            CASE 3
            PRINT CHR$(25)

            CASE 4
            PRINT CHR$(17)

            CASE 5
            PRINT CHR$(24)

         END SELECT

   NEXT DrawY%
NEXT DrawX%
GOTO 1


