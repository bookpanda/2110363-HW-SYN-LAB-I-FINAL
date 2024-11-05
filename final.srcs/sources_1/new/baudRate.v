`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2024 06:11:37 PM
// Design Name: 
// Module Name: baudRate
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


module baudRate(
    output reg baudClk,
    input clk
);
    integer counter;
    always @(posedge clk) begin
        counter = counter + 1;
        
        if(counter == 325) begin
            counter = 0;
            baudClk = ~baudClk;
        end
        // Basys3 clk = 10 ns = 100MHz
        // desired Baud rate = 9600 bits per second
        // each Baud rate has 16 equal parts aka each bit can be sampled 16 times
        // baudClk changes every 100MHz/(9600*16) = 651 Basys3 clk
        // 1 bit has 16 baudClk, it is best to sample at middle of the bit
    end
endmodule
