
Arduino programs for controlling a Lego Mindstorms robot. See [http://ianrenton.com/hardware/lego-turtle](http://ianrenton.com/hardware/lego-turtle) for videos, schematics and build photos!

legoturtle-flippers
-------------------

Simple navigation program based on two drive motors and two "flippers" to sense collisions.

legoturtle-logo
---------------

Control program with a Logo interpreter, so that the robot can be programmed with simple Logo commands that are written at compile time. Kind of redundant really as Logo is no easier than writing the Arduino code itself, but this is a stepping stone to the version that will receive the Logo program over UART.

Only the very basic Logo movement commands are supported: "fd x" (forward x centimetres), "bk x" (backwards x centimetres), "lt x" (left turn x degrees) and "rt x" (right turn x degrees). The distances and angles are all timed rather than measured, so will not be exact.

legoturtle-logo-uart
--------------------

Control program with a Logo interpreter that accepts a logo program via UART on startup, then will run it when a flipper is pushed. Text prompts are provided to guide the user through programming.

An issue exists with using the Arduino's USB port as the UART, because when first connected to a PC this way (or when RESET is pushed while connected), the PC treats it as an Arduino to program rather than a serial device. This means that when connected this way, you will have to flash the Arduino with its code immediately before sending it a Logo program. This can probably be avoided by connecting to the Arduino via its "proper" UART on DIO pins 0 and 1.
