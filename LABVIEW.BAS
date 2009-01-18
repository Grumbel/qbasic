DimY% = 1
Datei$ = "Postest.lby"

DateiOpen:
OPEN Datei$ FOR RANDOM AS #1 LEN = 1
FIELD #1, 1 AS DateiA$

GET #1, 1: LabyX% = ASC(DateiA$)
GET #1, 2: LabyY% = ASC(DateiA$)
GET #1, 3: MyPosX% = ASC(DateiA$)
GET #1, 4: MyPosY% = ASC(DateiA$)


DIM Laby%(LabyX%, LabyY%)

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

LabyrintDraw:
FOR DrawX% = 1 TO LabyX%
   FOR DrawY% = 1 TO LabyY%
      LOCATE DrawY%, DrawX%
   
         SELECT CASE Laby%(DrawX%, DrawY%)
      
            CASE 0
            PRINT CHR$(176)
    
            CASE 255
            PRINT "X"

            CASE 1
            PRINT CHR$(219)
         
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
LOCATE MyPosY%, MyPosX%: PRINT "P"

