CLS
RANDOMIZE TIMER

10 FOR z = 1 TO 17

DATA ""
DATA " "
DATA "Dies ist ein Programm zum erzeugen von Scroll-Effekten."
DATA " "
DATA "Es mÅssen dazu nur die entsprechenden DATA - Zeilen geÑndert werden."
DATA "Zeile 10 mu· entsprechend geÑndert werden (Nummer Ñndern)"
DATA " "
DATA "Dies ist ein Test -------- tseT nie tsi seiD"
DATA " "
DATA "Die Nummern hinter den Zeilen geben die Anzahl der Buchstaben an,"
DATA "dies ist wichtig damit der Text in der Mitte plaziert werden kann."
DATA " "
DATA " "
DATA " "
DATA " "
DATA " "
DATA " "


FOR za = 1 TO 5000
NEXT za


READ a$
a = LEN(a$)
LOCATE 24, 40 - a / 2
fa = INT(15 * RND) + 1
COLOR fa: PRINT a$
NEXT z

'erzeugt Endlosschleife
RESTORE
GOTO 10

