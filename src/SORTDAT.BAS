REM Programm zum sortieren aller Dateien eines Laufwerkes mit Angsbe des Pfads
CLS : PRINT : PRINT
INPUT "Soll die Ausgabe auf den Bildschirm oder in eine Datei (B/D)?"; Aus$
IF Aus$ = "B" OR Aus$ = "b" THEN Aus$ = " | MORE"
IF Aus$ = "D" OR Aus$ = "d" THEN Aus$ = " >SORTDAT.DAT"
SHELL "c:\dos\basic\FINDALL.BAT" + "\"
OPEN "ALLDAT.DAT" FOR INPUT AS #1
  OPEN "alldat.srt" FOR OUTPUT AS #2
  WHILE NOT EOF(1)
  PRINT ".";
  INPUT #1, Eingabe$
  L = LEN(Eingabe$)
  FOR i = L TO 1 STEP -1
    IF MID$(Eingabe$, i, 1) = "\" THEN Dateiname$ = MID$(Eingabe$, i + 1, L - i): i = 1
NEXT i
WHILE LEN(Dateiname$) < 15
Dateiname$ = Dateiname$ + " "
WEND
PRINT #2, Dateiname$ + Eingabe$
WEND
CLOSE #2
CLOSE #1
Befehl$ = "sort < Alldat.srt " + Aus$
SHELL Befehl$
IF Aus$ = ">SORTDAT.DAT" THEN PRINT "Sortierte Dateiliste: SORTDAT.DAT"
END




 

