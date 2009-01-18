echo off
cls
if "%1" == "" GOTO Syntax
CHKDSK /v | find "\" | find /v "Verzeichn" | find /i "%1" >Alldat.dat
GOTO Ende
:syntax
echo Gibt entsprechende Dateien auf dem Lauwerk in Datei aus
echo Aufruf: Dateiname (Teilnahmen erlaubt)
:ende
echo on

