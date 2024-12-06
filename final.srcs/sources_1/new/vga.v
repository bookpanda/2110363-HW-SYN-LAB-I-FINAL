`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2024 02:16:19 PM
// Design Name: 
// Module Name: vga
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


module vga(
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
                if(!(currentpos==7 &&currentline == 2)&& !(data_in==7'h0D))
                begin
                    if ((data_in <= 8'h39 && data_in >= 8'h30)||(data_in <= 8'h5A && data_in >= 8'h41)||(data_in <= 8'h7A && data_in >= 8'h61)|| data_in == 8'h7F || data_in == 8'h0D)
                        readAscii[currentpos+8*currentline] = data_in[6:0];
                    else readAscii[currentpos+8*currentline] = 7'h00;
                end
                if(data_in == 7'h7F)begin
                    if(currentpos > 0) begin
                        currentpos = currentpos - 1;
                        readAscii[currentpos+8*currentline] = data_in[6:0];
                    end
                    else if(currentline > 0) begin
                        currentline = currentline - 1;
                        currentpos = 7; 
                        readAscii[currentpos+8*currentline] = data_in[6:0];
                    end
                end
                else if(data_in == 7'h0D)begin
                    if(currentline != 2)begin
                        currentpos = 0;
                        currentline = currentline +1;
                    end
                end
                else begin
                    if(currentpos == 7)begin
                        if(currentline < 2)begin 
                            currentline = currentline+1;
                            currentpos = (currentpos + 1)%8;
                        end
                     end
                     else currentpos = currentpos +1;
                end
                readAscii[24] = 7'h30+currentpos;
                readAscii[25] = 7'h30+currentline;
        end
        
        last_ena <= ena;
     
    end

	wire video_on;
    wire [9:0] x,y; 

    vga_sync vga_sync_unit (.clk(clk), .reset(reset), .hsync(hsync), .vsync(vsync),
                            .video_on(video_on), .x(x), .y(y));

    wire [6:0] ascii;                   
    wire [6:0] a[25:0]; 
    wire d[25:0]; 
    wire displayContents; 

    initial begin: rov
        integer i;
        for (i = 0; i < 26; i = i + 1) begin
            readAscii[i] = 7'h7F;  
        end
        currentpos = 0;
        currentline = 0;
    end


    genvar i,j,k;
    generate
        for (i = 0; i < 8; i = i + 1) begin : gen_line_1
            char_container char (
                .clk(clk),
                .reset(reset),
                .asciiData(a[i]),        
                .ascii_In(readAscii[i]), 
                .x(x),              
                .y(y),                
                .displayContents(d[i]), 
                .x_desired(10'd288 + i*8), 
                .y_desired(10'd208)        
            );
        end
    endgenerate
    generate
        for (j = 0; j < 8; j = j + 1) begin : gen_line_2
            char_container char (
                .clk(clk),
                .reset(reset),
                .asciiData(a[j+8]),       
                .ascii_In(readAscii[j+8]),
                .x(x),                
                .y(y),                
                .displayContents(d[j+8]),  
                .x_desired(10'd288 + j*8), 
                .y_desired(10'd224)        
            );
        end
    endgenerate
    generate
        for (k = 0; k < 8; k = k + 1) begin : gen_line_3
            char_container char (
                .clk(clk),
                .reset(reset),
                .asciiData(a[k+16]),        
                .ascii_In(readAscii[k+16]), 
                .x(x),                
                .y(y),                
                .displayContents(d[k+16]),
                .x_desired(10'd288 + k*8),
                .y_desired(10'd240)       
            );
        end
    endgenerate
    char_container cp ( //showing current position
                .clk(clk),
                .reset(reset),
                .asciiData(a[24]),        
                .ascii_In(readAscii[24]), 
                .x(x),                
                .y(y),                
                .displayContents(d[24]),
                .x_desired(10'd80), 
                .y_desired(10'd320) 
    );
    char_container cl ( //showing current line
        .clk(clk),
        .reset(reset),
        .asciiData(a[25]),        
        .ascii_In(readAscii[25]), 
        .x(x),                
        .y(y),                
        .displayContents(d[25]),
        .x_desired(10'd96), 
        .y_desired(10'd320)  
    );

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
               d[25] ? a[25] : 7'h7F; 

    wire [10:0] rom_addr;
    wire [3:0] rom_row;
    wire [2:0] rom_col;
    wire [7:0] rom_data;
    wire rom_bit;
    ascii_rom rom.clk(clk), .rom_addr(rom_addr), .data(rom_data));

    assign rom_row = y[3:0];
    assign rom_addr = {ascii, rom_row};
    assign rom_col = x[2:0];
    assign rom_bit = rom_data[~rom_col]; 
    
    assign rgb = video_on ? (rom_bit ? ((displayContents) ? 12'hCCC: 12'h333): 12'h333) : 12'b0; 
endmodule

