`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2024 06:31:28 PM
// Design Name: 
// Module Name: uartRx
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


module uartRx(
    input clk, // baudClk
    input bitIn,
    output reg received,
    output reg [7:0] dataOut
);
    reg lastBit;
    reg receiving = 0;
//    reg [7:0] count;
    integer count = 0;
    
    always @(posedge clk) begin
        if(~receiving & lastBit & ~bitIn) begin
            receiving <= 1;
            received <= 0;
            count <= 0;
        end
        
        lastBit <= bitIn;
        count <= receiving ? count + 1 : 0;
        
        case(count)
            // first 16 counts = start bit (idle high -> low)
            // each bit spans 16 cycles, so best to sample from middle of span (least chance of getting wrong value)
            8'd24:  dataOut[0] <= bitIn;
            8'd40:  dataOut[1] <= bitIn;
            8'd56:  dataOut[2] <= bitIn;
            8'd72:  dataOut[3] <= bitIn;
            8'd88:  dataOut[4] <= bitIn;
            8'd104: dataOut[5] <= bitIn;
            8'd120: dataOut[6] <= bitIn;
            8'd136: dataOut[7] <= bitIn;
            8'd152: begin received <= 1; receiving <= 0; end
        endcase
    end
endmodule
