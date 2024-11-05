`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2024 06:40:38 PM
// Design Name: 
// Module Name: quadSevenSeg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module system(
    output wire RsTx,
    input wire RsRx,
    output [6:0] seg,
    output dp,
    output [3:0] an,
    input [7:0] sw,
    input btnC,
    input btnR,
    input clk
);
    wire baudClk;
    baudRate baudRateInst(baudClk, clk);
    
    reg [7:0] lastInput;
    reg updateFromUART = 1; // Flag to allow UART update by default
    
    // keyboard input
    wire [7:0] keyboardInput;
    wire received;
    uartRx rx(baudClk, RsRx, received, keyboardInput);
    
    always @(posedge clk) begin
        // reset button
        if(btnR) begin
            lastInput <= 0;
            updateFromUART <= 1;
            // reset VGA screen
        end
        // sw button
        else if(btnC) begin
            lastInput <= sw;
            updateFromUART <= 0;
        end
        else if(received && updateFromUART) begin
            lastInput <= keyboardInput;
        end
    end
    
    wire [7:0] receivedLog;
    wire [7:0] transmittedLog;
    assign receivedLog = lastInput;
    
    quadSevenSeg sevenSegment(seg, dp, an[0], an[1], an[2], an[3], 
        transmittedLog[3:0], // right
        transmittedLog[7:4], 
        receivedLog[3:0],
        receivedLog[7:4],    // left
        baudClk);
    
    
endmodule
