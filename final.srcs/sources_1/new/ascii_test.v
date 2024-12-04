`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2024 02:16:19 PM
// Design Name: 
// Module Name: ascii_test
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


module ascii_test(
		input wire clk, reset,
		output wire hsync, vsync,
		output wire [11:0] rgb,
		input ena,
		input [7:0] data_in
	);
	reg last_ena;
    reg sending = 0;
    reg [7:0] count;
    reg [7:0] temp;
    
    always@(posedge clk) begin
        if ( ~last_ena & ena) begin
                readAscii[0] = data_in[6:0];
        end
        
        last_ena <= ena;
     
    end
	//VGA/////////////////////////////////////////////////////////////////////////////
	// video status output from vga_sync to tell when to route out rgb signal to DAC
	wire video_on;
    wire [9:0] x,y; //Pixel location
        // instantiate vga_sync for the monitor sync and x,y pixel tracing
    vga_sync vga_sync_unit (.clk(clk), .reset(reset), .hsync(hsync), .vsync(vsync),
                            .video_on(video_on), .x(x), .y(y));
    //////////////////////////////////////////////////////////////////////////////////
    
    //COUNTER FOR LIVE DATA //////////////////////////////////////////////////////////
    //Instantiate a counter with counterValue representing the 0-9 count in ASCII
    wire [6:0] counterValue; 
    //////////////////////////////////////////////////////////////////////////////////
    
    //READ MEMORY FILE FOR INPUT ASCII ARRAY, CREATE SIGNAL ARRAY                       
    wire [6:0] ascii;  //Signal is concatenated with X coordinate to get a value for the ROM address                 
    wire [6:0] a[8:0]; //Each index of this array holds a 7-bit ASCII value
    wire d[8:0]; //Each index of this array holds a signal that says whether the i-th item in array a above should display
    wire displayContents; //Control signal to determine whether a character should be displayed on the screen
    
    //Read memory file for ascii inputs
    reg [6:0] readAscii [7:0];
    initial begin
        readAscii[0] = 7'h48;
        readAscii[1] = 7'h45;
        readAscii[2] = 7'h4c;
        readAscii[3] = 7'h4c;
        readAscii[4] = 7'h4f;
        readAscii[5] = 7'h4f;
        readAscii[6] = 7'h4f;
        readAscii[7] = 7'h4f;
    end
    ///////////////////////////////////////////////////////////////////////////////////
    
    //INSTANTIATE TEXT GENERATION MODULES/////////////////////////////////////////////////////////
        //Manually feed in data to ascii_in or use another module to get live data, such as a counter
        //In this case readAscii is an array that had data imported from a hex memory file
        textGeneration c0 (.clk(clk),.reset(reset),.asciiData(a[0]), .ascii_In(readAscii[0]), //readAscii[0] holds 7'h46 or Char 'F'
        .x(x),.y(y), .displayContents(d[0]), .x_desired(10'd80), .y_desired(10'd80)); //Desired X and Y coordinate to display F is X:80, Y:80
                                                                                        // (top-left most of monitor is (0,0))
        textGeneration c1 (.clk(clk),.reset(reset),.asciiData(a[1]), .ascii_In(readAscii[1]), //Char 'P'
        .x(x),.y(y), .displayContents(d[1]), .x_desired(10'd88), .y_desired(10'd80));
        
        textGeneration c2 (.clk(clk),.reset(reset),.asciiData(a[2]), .ascii_In(readAscii[2]),//Char 'G'
        .x(x),.y(y), .displayContents(d[2]), .x_desired(10'd96), .y_desired(10'd80));
        
        textGeneration c3 (.clk(clk),.reset(reset),.asciiData(a[3]), .ascii_In(readAscii[3]),//Char 'A'
        .x(x),.y(y), .displayContents(d[3]), .x_desired(10'd104), .y_desired(10'd80));
        
        textGeneration c4 (.clk(clk),.reset(reset),.asciiData(a[4]), .ascii_In(readAscii[4]), //Char 'J'
        .x(x),.y(y), .displayContents(d[4]), .x_desired(10'd112), .y_desired(10'd80));
        
        textGeneration c5 (.clk(clk),.reset(reset),.asciiData(a[5]), .ascii_In(readAscii[5]),//Char 'E'
        .x(x),.y(y), .displayContents(d[5]), .x_desired(10'd120), .y_desired(10'd80));
        
        textGeneration c6 (.clk(clk),.reset(reset),.asciiData(a[6]), .ascii_In(readAscii[6]),//Char 'F'
        .x(x),.y(y), .displayContents(d[6]), .x_desired(10'd128), .y_desired(10'd80));
        
         textGeneration c7 (.clk(clk),.reset(reset),.asciiData(a[7]), .ascii_In(readAscii[7]),//Char 'F'
        .x(x),.y(y), .displayContents(d[7]), .x_desired(10'd136), .y_desired(10'd80));
        
//         textGeneration c8 (.clk(clk),.reset(reset),.asciiData(a[8]), .ascii_In(counterValue),//Counter outputs ASCII 7'h30 -> 7'39
//        .x(x),.y(y), .displayContents(d[8]), .x_desired(10'd152), .y_desired(10'd80));          //which is then fed into ascii_In

//Decoder to trigger displayContents signal high or low depending on which ASCII char is reached
    assign displayContents = d[0] ? d[0] :
                             d[1] ? d[1] :
                             d[2] ? d[2] :
                             d[3] ? d[3] :
                             d[4] ? d[4] :
                             d[5] ? d[5] :
                             d[6] ? d[6] :
                             d[7] ? d[7] :
                             d[8] ? d[8] : 0;
//Decoder to assign correct ASCII value depending on which displayContents signal is used                        
    assign ascii = d[0] ? a[0] :
                   d[1] ? a[1] :
                   d[2] ? a[2] :
                   d[3] ? a[3] :
                   d[4] ? a[4] :
                   d[5] ? a[5] :
                   d[6] ? a[6] :
                   d[7] ? a[7] :
                   d[8] ? a[8] : 7'h30; //defaulted to 0
 
 //ASCII_ROM////////////////////////////////////////////////////////////       
    //Connections to ascii_rom
    wire [10:0] rom_addr;
    //Handle the row of the rom
    wire [3:0] rom_row;
    //Handle the column of the rom data
    wire [2:0] rom_col;
    //Wire to connect to rom_data of ascii_rom
    wire [7:0] rom_data;
    //Bit to signal display of data
    wire rom_bit;
    ascii_rom rom1(.clk(clk), .rom_addr(rom_addr), .data(rom_data));

    //Concatenate to get 11 bit rom_addr
    assign rom_row = y[3:0];
    assign rom_addr = {ascii, rom_row};
    assign rom_col = x[2:0];
    assign rom_bit = rom_data[~rom_col]; //need to negate since it initially displays mirrored
///////////////////////////////////////////////////////////////////////////////////////////////
    
    //If video on then check
        //If rom_bit is on
            //If x and y are in the origin/end range
                //Set RGB to display whatever is in the ROM within the origin/end range
            //Else we are out of range so we should not modify anything, RGB set to blue
        //rom_bit is off display blue
    //Video_off display black
            
    assign rgb = video_on ? (rom_bit ? ((displayContents) ? 12'hFFF: 12'h8): 12'h8) : 12'b0; //blue background white text
endmodule
