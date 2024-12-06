`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2024 03:11:15 PM
// Design Name: 
// Module Name: char_container
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

module char_container(input clk, input reset,
                     input [6:0] ascii_In,
                     input [9:0] x_desired, y_desired,
                     input [9:0] x,y,
                     output [6:0] asciiData,
                     output displayContents);
    wire horizontalOn, verticalOn;
    
    assign asciiData = ascii_In;
    
    //check if in current x y is in this bounding box
    assign horizontalOn = (x >= x_desired && x < x_desired + 10'd8) ? 1 : 0;
    assign verticalOn = (y >= y_desired && y < y_desired + 10'd16) ? 1 : 0; 
    assign displayContents = horizontalOn && verticalOn; 
endmodule
