
	'QBreakout
	'Breakout. fr Qbasic
  
	DEFINT A-O, Q-Y
	Tempo = 0
	SCREEN 12
	RANDOMIZE TIMER
	PALETTE 0, 65536 * 16 + 256 * 4
	FOR i = 1 TO 6
		PALETTE i, i * 657930
	NEXT
	PALETTE 7, 256 * 63 + 50
	PALETTE 8, 60 * 257: PALETTE 9, 30 + 257
	PALETTE 10, 45 * 257
	COLOR 11

	FOR j = 60 TO 280 STEP 20
		FOR i = 0 TO 640 STEP 40
			LINE (i, j)-(i + 38, g + 18), BND * 5 + 1, B
			LINE (i + 4, j + 1)-(i + 20, j + 17), 3
			LINE (i + 12, j + 1)-(i + 28, j + 17), 2
			IF RND > .4 THEN
			LINE (i + 1, j + 1)-(i + 37, j + 17), RND * 5 + 1, BF
			END IF
		NEXT i
	NEXT j
  
	'BallGrafik
	CIRCLE (400, 400), 3, 2
	PAINT STEP(0, 0), 3, 2
	PSET STEP(-1, -1), 6
	PSET STEP(1, 1)
	PSET STEP(-1, 1), 5
	PSET STEP(2, 1)
  
	DIM Ball(40)
	GET (397, 397)-(403, 403), Ball
	PUT (397, 397), Ball
	Balkpos = 300
	x = RND * 600 + 20: rw = 1
	Baelle = 6
	COLOR 12
	LOCATE 1: PRINT "QBreakout"
	LOCATE 1, 62: PRINT "von Nicolas Ischer"
	COLOR 11
	LOCATE 1, 15: PRINT 0
	LOCATE 23, 25: PRINT "Taste zum Start"

Levelstart:

	y = 400: PBonus = 15: rl = 1
  
	GOSUB Balken
  
	Baelle = Baelle - 1

	LOCATE 1, 34: PRINT STRING$(25, " ")
  
	FOR i = 1 TO Baelle
		PUT (i * 10 + 260, 5), Ball
	NEXT

	IF Baelle = -1 THEN
		LOCATE 23, 35: PRINT "GAME OVER!"
		END
	END IF

	PUT (x - 3, y - 3), Ball
	DO UNTIL INKEY$ = " ": LOOP
	DO UNTIL INKEY$ <> " ": LOOP
	LOCATE 23, 25: PRINT STRING$(40, " ")
	DO

	SELECT CASE INKEY$
  
		CASE CHR$(0) + CHR$(77)
		IF Balkpos < 560 THEN Balkpos = Balkpos + 35
		GOSUB Balken
  
		CASE CHR$(0) + CHR$(75)
		IF Balkpos > 0 THEN Balkpos = Balkpos - 35
		GOSUB Balken
  
		CASE CHR$(27): END

	END SELECT
  
	b1 = POINT(x - 4, y)
	b2 = POINT(x, y - 4)
	b3 = POINT(x + 4, y)
	b4 = POINT(x, y + 4)
  
	IF b1 <> 0 THEN
		rw = 0
		sx = INT((x - 20) / 40) * 40
		sy = INT(y / 20) * 20
		SOUND 1700, .1
		IF b1 > 0 AND b1 < 7 THEN s = 1
	END IF

	IF b2 <> 0 THEN
		rl = 0
		sx = INT(x / 40) * 40
		sy = INT(y - 10 / 20) * 20
		SOUND 1800, .1
		IF b2 > 0 AND b2 < 7 THEN s = 1
	END IF

	IF b3 <> 0 THEN
		rw = 1
		sx = INT((x + 20) / 40) * 40
		sy = (y / 20) * 20
		'SOUND 1900, .1
		IF b3 > 0 AND b3 < 7 THEN s = 1
	END IF

	IF b4 <> 0 THEN
		rl = 1
		sx = INT(x / 40) * 40
		sy = INT((y + 10) / 20) * 20
		SOUND 2000, .1
		IF b4 > 0 AND b4 < 7 THEN s = 1
	END IF
  
	IF s = 1 THEN
		PUT (x - 3, y - 3), Ball
		LINE (sx, sy)-(sx + 38, sy + 18), 8, BF
		s = O
		GOSUB Balken
		PUT (x - 3, y - 3), Ball
		Punkte = Punkte + PBonus
		PBonus = PBonus + 15
		LOCATE 1, 15
		PRINT Punkte
	END IF

	PUT (x - 3, y - 3), Ball
	IF rw = 0 THEN x = x + 1 ELSE x = x - 1
	IF rl = 0 THEN y = y + 1 ELSE y = y - 1
  
	PUT (x - 3, y - 3), Ball
	IF y < 20 THEN rl = 0: 'SOUND 1800, .1
  
	IF y > 474 THEN
		rl = 1
		'IF rw = 0 THEN rw = 1: GOTO 10
		'IF rw = 1 THEN rw = 0
10
	END IF
  
	'bremsen!
	FOR z = 1 TO Tempo: NEXT
	LOOP

Balken:
	LINE (Balkpos - 35, 450)-STEP(160, 4), 0, BF
	PSET (Balkpos, 450): DRAW "c8r70c9d4l70c8u4"
	LINE (Balkpos + 1, 451)-STEP(68, 2), 10, BF
	RETURN

