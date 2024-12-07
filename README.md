# 2110363-HW-SYN-LAB-I-FINAL

## Modular Design
### ascii_rom
- stores pixel patterns for A-Z, a-z, special character
### baudRate
- converts clk to baudClk (9600 bits/second)
### hexTo7Segment, quadSevenSeg
- displays keyboard input to 7-segment display
### char_container
- 16x8 pixel space for each character
### uartRx
- UART receiver unit for inputs from keyboard/the other board
### uartTx
- UART transmitter unit to the other board
### vga_sync
- initializes + syncs a 640x480 display on the monitor
### vga 
- receives keyboard inputs from system 
- updates each char_container accordingly
- logic for newline, backspace, current position
### system
- does UART reception/transmission at baudRate
- wires received/transmitted UART bits to quadSevenSeg
- wires UART inputs to vga 

