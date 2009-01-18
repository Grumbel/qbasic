CLS
10 INPUT "Betrag:"; Betrag
20 INPUT "Bezahlt:"; Geld
30 IF Geld - Betrag < 0 THEN PRINT "ungÅltig!!": GOTO 10
40 Rest = Geld - Betrag
PRINT "Rest:"; Rest

50 DATA 1000,500,200,100,50,20,10,5,2,1,.5,.1,.05,.02,.01,0!
READ wert
'PRINT "GeldstÅck:"; Wert
IF wert = 0! THEN END
IF Rest = wert THEN GOTO 60
IF Rest < wert THEN GOTO 50
60
DO UNTIL Gesamt > Rest
   'PRINT "LOOP-Schleife:"; Anzahl
   Anzahl = Anzahl + 1
   Gesamt = wert * Anzahl
LOOP
'PRINT "Nach Schleife:"; Anzahl
Anzahl = Anzahl - 1

PRINT "Anzahl der"; wert; "DM StÅcke/Scheine"; Anzahl
ges = Anzahl * wert + ges
IF ges = re THEN END

Rest = Rest - (wert * Anzahl)
IF wert = .01 THEN END
Anzahl = 0: Gesamt = 0
GOTO 50

