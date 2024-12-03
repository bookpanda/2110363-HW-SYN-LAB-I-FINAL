`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2024 03:11:15 PM
// Design Name: 
// Module Name: text_Generation
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

module textGeneration(input clk, input reset,
                     input [6:0] ascii_In,
                     input [9:0] x_desired, y_desired,
                     input [9:0] x,y,
                     output [6:0] asciiData,
                     output displayContents);
    wire horizontalOn, verticalOn;
    //Module receives x and y coordinates for a 640 x 480 display resolution and sends out ASCII data
    //Output
    
    assign asciiData = ascii_In; //Buffer the input to the output
    assign horizontalOn = (x >= x_desired && x < x_desired + 10'd8) ? 1 : 0; //Assert horizontalOn for 7 more pixels from desired X
    assign verticalOn = (y >= y_desired && y < y_desired + 10'd16) ? 1 : 0; //Assert verticalOn for 15 more pixels from desired Y
    assign displayContents = horizontalOn && verticalOn; //content of ROM should be displayed at these desired X,Y range
endmodule
