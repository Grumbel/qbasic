QBasic
======

This is QBasic code written from 1993 to 1997 by Ingo Ruhnke
<grumbel@gmail.com>.

Note: This is a raw directory dump and hasn't been cleaned up much, so
it may still contain code by third parties.


Running on Linux
----------------

A copy of QBasic can be found at:

* http://www.qbasic.net/en/qbasic-downloads/compiler/qbasic-interpreter.htm

Download and unzip that into the `c:/` directory.

[DOSBox](http://www.dosbox.com/) is required as well.

Once both of those are installed, the QBasic programs can be launched with
the `run.py` script, e.g.:

    ./run.py src/LABY4.BAS

Or just:

    ./run.py

which will display a list with all the programs.

Keybindings
-----------

* F5: start a QBasic program
* Ctrl-ScrollLock: Interrupt a running QBasic program
* Ctrl-F10: escape DOSBox's mouse-grab
* Ctrl-F11: lower emulation speed
* Ctrl-F12: increase emulation speed

Some programs require a joystick.


'Notable' Programs
------------------

### LABY4.BAS, LABYEDT4.BAS

A first person dungeon crawler, doesn't feature enemies or a goal, but
it has automap, stairs, pits and some more.

### LAS.BAS

A two player light cycle game.

