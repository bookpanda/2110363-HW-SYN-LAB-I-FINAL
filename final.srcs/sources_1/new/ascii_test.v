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
    reg [2:0] currentpos;
    reg [1:0] currentline;
     reg [6:0] readAscii [25:0];
    always@(posedge clk) begin
        if ( ~last_ena & ena) begin
                if((!(currentpos==7 &&currentline == 2)||data_in==7'h7F)&& !(data_in==7'h0D))
                begin
                    readAscii[currentpos+8*currentline] = data_in[6:0];
                end
                if(data_in == 7'h7F)begin
                    currentpos <=  (currentpos+7)%8;
                    if(currentpos == 0)begin
                        if(currentline != 0)
                            currentline <= currentline -1;      
                    end
                end
                else if(data_in == 7'h0D)begin
                    if(currentline != 2)begin
                        currentpos <= 1;
                        currentline <= currentline +1;
                    end
                end
                else begin
                    if(currentpos == 7)begin
                        if(currentline < 2)begin 
                            currentline <= currentline+1;
                            currentpos <= (currentpos + 1)%8;
                        end
                     end
                     else currentpos <= currentpos +1;
                end
                readAscii[24] = 7'h30+currentpos;
                readAscii[25] = 7'h30+currentline;
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
    wire [6:0] a[25:0]; //Each index of this array holds a 7-bit ASCII value
    wire d[25:0]; //Each index of this array holds a signal that says whether the i-th item in array a above should display
    wire displayContents; //Control signal to determine whether a character should be displayed on the screen
    
    //Read memory file for ascii inputs
   
    initial begin: rov
        integer i;
        for (i = 0; i < 26; i = i + 1) begin
            readAscii[i] = 7'h7F;  // Initialize all entries to 0 (7'h00)
        end
        currentpos = 0;
        currentline = 0;
    end
    ///////////////////////////////////////////////////////////////////////////////////
    
    //INSTANTIATE TEXT GENERATION MODULES/////////////////////////////////////////////////////////
        //Manually feed in data to ascii_in or use another module to get live data, such as a counter
        //In this case readAscii is an array that had data imported from a hex memory file
    genvar i,j,k;
    generate
        for (i = 0; i < 8; i = i + 1) begin : gen_text_gen_1
            // Instantiate the textGeneration modules with dynamic connections
            textGeneration c (
                .clk(clk),
                .reset(reset),
                .asciiData(a[i]),        // ASCII data for character i
                .ascii_In(readAscii[i]), // ASCII input for character i
                .x(x),                // X coordinate for character i
                .y(y),                // Y coordinate for character i
                .displayContents(d[i]),  // Display content for character i
                .x_desired(10'd80 + i*8), // Set the desired X coordinate for each text instance
                .y_desired(10'd80)        // Set the desired Y coordinate for each text instance
            );
        end
    endgenerate
    generate
        for (j = 0; j < 8; j = j + 1) begin : gen_text_gen_2
            // Instantiate the textGeneration modules with dynamic connections
            textGeneration c (
                .clk(clk),
                .reset(reset),
                .asciiData(a[j+8]),        // ASCII data for character i
                .ascii_In(readAscii[j+8]), // ASCII input for character i
                .x(x),                // X coordinate for character i
                .y(y),                // Y coordinate for character i
                .displayContents(d[j+8]),  // Display content for character i
                .x_desired(10'd80 + j*8), // Set the desired X coordinate for each text instance
                .y_desired(10'd96)        // Set the desired Y coordinate for each text instance
            );
        end
    endgenerate
    generate
        for (k = 0; k < 8; k = k + 1) begin : gen_text_gen_3
            // Instantiate the textGeneration modules with dynamic connections
            textGeneration c (
                .clk(clk),
                .reset(reset),
                .asciiData(a[k+16]),        // ASCII data for character i
                .ascii_In(readAscii[k+16]), // ASCII input for character i
                .x(x),                // X coordinate for character i
                .y(y),                // Y coordinate for character i
                .displayContents(d[k+16]),  // Display content for character i
                .x_desired(10'd80 + k*8), // Set the desired X coordinate for each text instance
                .y_desired(10'd112)        // Set the desired Y coordinate for each text instance
            );
        end
    endgenerate
    textGeneration cp (
                .clk(clk),
                .reset(reset),
                .asciiData(a[24]),        // ASCII data for character i
                .ascii_In(readAscii[24]), // ASCII input for character i
                .x(x),                // X coordinate for character i
                .y(y),                // Y coordinate for character i
                .displayContents(d[24]),  // Display content for character i
                .x_desired(10'd80), // Set the desired X coordinate for each text instance
                .y_desired(10'd280)        // Set the desired Y coordinate for each text instance
            );
            textGeneration cl (
                .clk(clk),
                .reset(reset),
                .asciiData(a[25]),        // ASCII data for character i
                .ascii_In(readAscii[25]), // ASCII input for character i
                .x(x),                // X coordinate for character i
                .y(y),                // Y coordinate for character i
                .displayContents(d[25]),  // Display content for character i
                .x_desired(10'd38), // Set the desired X coordinate for each text instance
                .y_desired(10'd280)        // Set the desired Y coordinate for each text instance
            );
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
                         d[8] ? d[8] :
                         d[9] ? d[9] :
                         d[10] ? d[10] :
                         d[11] ? d[11] :
                         d[12] ? d[12] :
                         d[13] ? d[13] :
                         d[14] ? d[14] :
                         d[15] ? d[15] :
                         d[16] ? d[16] :
                         d[17] ? d[17] :
                         d[18] ? d[18] :
                         d[19] ? d[19] :
                         d[20] ? d[20] :
                         d[21] ? d[21] :
                         d[22] ? d[22] :
                         d[23] ? d[23] :
                         d[24] ? d[24] :
                         d[25] ? d[25] :0;
//Decoder to assign correct ASCII value depending on which displayContents signal is used                        
    assign ascii = d[0] ? a[0] :
               d[1] ? a[1] :
               d[2] ? a[2] :
               d[3] ? a[3] :
               d[4] ? a[4] :
               d[5] ? a[5] :
               d[6] ? a[6] :
               d[7] ? a[7] :
               d[8] ? a[8] :
               d[9] ? a[9] :
               d[10] ? a[10] :
               d[11] ? a[11] :
               d[12] ? a[12] :
               d[13] ? a[13] :
               d[14] ? a[14] :
               d[15] ? a[15] :
               d[16] ? a[16] :
               d[17] ? a[17] :
               d[18] ? a[18] :
               d[19] ? a[19] :
               d[20] ? a[20] :
               d[21] ? a[21] :
               d[22] ? a[22] :
               d[23] ? a[23] :
               d[24] ? a[24] :
               d[24] ? a[25] : 7'h7F; // default to ' '
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

