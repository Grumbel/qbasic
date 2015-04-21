'Formeln fÅr 3D-Objekte
DECLARE FUNCTION DDX! (Abstnd!, aaaax!)
DECLARE FUNCTION DDY! (Abstnnd!, aaaax!)

'3D Formel fÅr Rutine
DECLARE FUNCTION Zoom% (x!)

'Die Functionen DDX und DDY mÅssen wiefolgt eingesetzt werden:
'DDX!(x,z) und DDY!(y,z)
'so kînnen sie z.B. in Line Befehlen verwendet werden
'Line (DDX!(x,z),DDY!(y,z))-(DDX!(x+5,z+5),DDY!(y+5,z+5)
'DDX und DDY rechen dabei die Koordinaten x,y,z in 2D KO um

SCREEN 9

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

FUNCTION Zoom% (x!)
Y! = 320 - (640 / (x!))  '+ .546875
Zoom% = Y!
END FUNCTION

