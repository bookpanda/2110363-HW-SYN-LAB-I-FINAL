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
    input btnC, btnR, btnU,btnL,
    output wire Hsync, Vsync,
    output wire [11:0] rgb, 
    input clk
);
    wire baudClk;
    baudRate baudRateInst(baudClk, clk);
    
    reg [7:0] lastInput;
    reg updateFromUART = 1; // Flag to allow UART update by default
    reg last_rec,last_btnC,en;
    // keyboard input
    wire [7:0] keyboardInput;
    wire sent,received;
    reg [7:0] data_in;
    
    uartRx rx(baudClk, RsRx, received, keyboardInput);
    uartTx tx(baudClk, data_in, en, sent, RsTx);
    
    always @(posedge baudClk) begin
        if (en) en = 0;
        if (~last_rec & received) begin
            data_in = keyboardInput;
            if (data_in <= 8'h7A && data_in >= 8'h41) en = 1;
        end
        if (~last_btnC & btnC)begin
            data_in = lastInput;
            if (data_in <= 8'h7A && data_in >= 8'h41) en = 1;
        end
        last_rec = received;
        last_btnC = btnC;
    end
    
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
    
    ascii_test(clk, btnR, Hsync,Vsync,rgb);

    

endmodule
