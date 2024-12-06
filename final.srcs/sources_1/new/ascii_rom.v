`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2024 03:08:23 PM
// Design Name: 
// Module Name: ascii_rom
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


module ascii_rom(clk, rom_addr, data);
        input clk;
        input wire [10:0] rom_addr;
        output reg [7:0] data;
        reg [10:0] rom_addr_next;
        //Since there is going to be a lot of data stored here
        //Infer a block ram
        (* rom_style = "block" *)
        
        //Buffer  of rom_addr coming in from vga_test
        always @ (posedge clk)
            rom_addr_next <= rom_addr;
        
        //Topmost 7 bits of rom_addr is the ascii value, bottom 4 bits is counting the 16 rows
        always @*
        case(rom_addr_next)
        // code x00 ( )
			11'h000: data = 8'b00000000;	//
			11'h001: data = 8'b00000000;	//
			11'h002: data = 8'b00000000;	//   
			11'h003: data = 8'b00000000;	//  
			11'h004: data = 8'b00000000;	//   
			11'h005: data = 8'b00000000;	//
			11'h006: data = 8'b01101100;	//
			11'h007: data = 8'b10010010;	//
			11'h008: data = 8'b10000010;	//
			11'h009: data = 8'b01000100;	//
			11'h00a: data = 8'b00101000;	//  
			11'h00b: data = 8'b00010000;	//  
			11'h00c: data = 8'b00000000;	//
			11'h00d: data = 8'b00000000;	//
			11'h00e: data = 8'b00000000;	//
			11'h00f: data = 8'b00000000;	//
         // code x7F ( )
			11'h7F0: data = 8'b00000000;	//
			11'h7F1: data = 8'b00000000;	//
			11'h7F2: data = 8'b00000000;	//   
			11'h7F3: data = 8'b00000000;	//  
			11'h7F4: data = 8'b00000000;	//   
			11'h7F5: data = 8'b00000000;	//
			11'h7F6: data = 8'b00000000;	//
			11'h7F7: data = 8'b00000000;	//
			11'h7F8: data = 8'b00000000;	//
			11'h7F9: data = 8'b00000000;	//
			11'h7Fa: data = 8'b00000000;	//  
			11'h7Fb: data = 8'b00000000;	//  
			11'h7Fc: data = 8'b00000000;	//
			11'h7Fd: data = 8'b00000000;	//
			11'h7Fe: data = 8'b00000000;	//
			11'h7Ff: data = 8'b00000000;	//
            // code x30 (0)
			11'h300: data = 8'b00000000;	//
			11'h301: data = 8'b00000000;	//
			11'h302: data = 8'b00111000;	//  ***  
			11'h303: data = 8'b01101100;	// ** **
			11'h304: data = 8'b11000110;	//**   **
			11'h305: data = 8'b11000110;	//**   **
			11'h306: data = 8'b11000110;	//**   **
			11'h307: data = 8'b11000110;	//**   **
			11'h308: data = 8'b11000110;	//**   **
			11'h309: data = 8'b11000110;	//**   **
			11'h30a: data = 8'b01101100;	// ** **
			11'h30b: data = 8'b00111000;	//  ***
			11'h30c: data = 8'b00000000;	//
			11'h30d: data = 8'b00000000;	//
			11'h30e: data = 8'b00000000;	//
			11'h30f: data = 8'b00000000;	//
			// code x31 (1)
			11'h310: data = 8'b00000000;	//
			11'h311: data = 8'b00000000;	//
			11'h312: data = 8'b00011000;	//   **  
			11'h313: data = 8'b00111000;	//  ***
			11'h314: data = 8'b01111000;	// ****
			11'h315: data = 8'b00011000;	//   **
			11'h316: data = 8'b00011000;	//   **
			11'h317: data = 8'b00011000;	//   **
			11'h318: data = 8'b00011000;	//   **
			11'h319: data = 8'b00011000;	//   **
			11'h31a: data = 8'b01111110;	// ******
			11'h31b: data = 8'b01111110;	// ******
			11'h31c: data = 8'b00000000;	//
			11'h31d: data = 8'b00000000;	//
			11'h31e: data = 8'b00000000;	//
			11'h31f: data = 8'b00000000;	//
			// code x32 (2)
			11'h320: data = 8'b00000000;	//
			11'h321: data = 8'b00000000;	//
			11'h322: data = 8'b11111110;	//*******  
			11'h323: data = 8'b11111110;	//*******
			11'h324: data = 8'b00000110;	//     **
			11'h325: data = 8'b00000110;	//     **
			11'h326: data = 8'b11111110;	//*******
			11'h327: data = 8'b11111110;	//*******
			11'h328: data = 8'b11000000;	//**
			11'h329: data = 8'b11000000;	//**
			11'h32a: data = 8'b11111110;	//*******
			11'h32b: data = 8'b11111110;	//*******
			11'h32c: data = 8'b00000000;	//
			11'h32d: data = 8'b00000000;	//
			11'h32e: data = 8'b00000000;	//
			11'h32f: data = 8'b00000000;	//
			// code x33 (3)
			11'h330: data = 8'b00000000;	//
			11'h331: data = 8'b00000000;	//
			11'h332: data = 8'b11111110;	//*******  
			11'h333: data = 8'b11111110;	//*******
			11'h334: data = 8'b00000110;	//     **
			11'h335: data = 8'b00000110;	//     **
			11'h336: data = 8'b00111110;	//  *****
			11'h337: data = 8'b00111110;	//  *****
			11'h338: data = 8'b00000110;	//     **
			11'h339: data = 8'b00000110;	//     **
			11'h33a: data = 8'b11111110;	//*******
			11'h33b: data = 8'b11111110;	//*******
			11'h33c: data = 8'b00000000;	//
			11'h33d: data = 8'b00000000;	//
			11'h33e: data = 8'b00000000;	//
			11'h33f: data = 8'b00000000;	//
			// code x34 (4)
			11'h340: data = 8'b00000000;	//
			11'h341: data = 8'b00000000;	//
			11'h342: data = 8'b11000110;	//**   **  
			11'h343: data = 8'b11000110;	//**   **
			11'h344: data = 8'b11000110;	//**   **
			11'h345: data = 8'b11000110;	//**   **
			11'h346: data = 8'b11111110;	//*******
			11'h347: data = 8'b11111110;	//*******
			11'h348: data = 8'b00000110;	//     **
			11'h349: data = 8'b00000110;	//     **
			11'h34a: data = 8'b00000110;	//     **
			11'h34b: data = 8'b00000110;	//     **
			11'h34c: data = 8'b00000000;	//
			11'h34d: data = 8'b00000000;	//
			11'h34e: data = 8'b00000000;	//
			11'h34f: data = 8'b00000000;	//
			// code x35 (5)
			11'h350: data = 8'b00000000;	//
			11'h351: data = 8'b00000000;	//
			11'h352: data = 8'b11111110;	//*******  
			11'h353: data = 8'b11111110;	//*******
			11'h354: data = 8'b11000000;	//**
			11'h355: data = 8'b11000000;	//**
			11'h356: data = 8'b11111110;	//*******
			11'h357: data = 8'b11111110;	//*******
			11'h358: data = 8'b00000110;	//     **
			11'h359: data = 8'b00000110;	//     **
			11'h35a: data = 8'b11111110;	//*******
			11'h35b: data = 8'b11111110;	//*******
			11'h35c: data = 8'b00000000;	//
			11'h35d: data = 8'b00000000;	//
			11'h35e: data = 8'b00000000;	//
			11'h35f: data = 8'b00000000;	//
			// code x36 (6)
			11'h360: data = 8'b00000000;	//
			11'h361: data = 8'b00000000;	//
			11'h362: data = 8'b11111110;	//*******  
			11'h363: data = 8'b11111110;	//*******
			11'h364: data = 8'b11000000;	//**
			11'h365: data = 8'b11000000;	//**
			11'h366: data = 8'b11111110;	//*******
			11'h367: data = 8'b11111110;	//*******
			11'h368: data = 8'b11000110;	//**   **
			11'h369: data = 8'b11000110;	//**   **
			11'h36a: data = 8'b11111110;	//*******
			11'h36b: data = 8'b11111110;	//*******
			11'h36c: data = 8'b00000000;	//
			11'h36d: data = 8'b00000000;	//
			11'h36e: data = 8'b00000000;	//
			11'h36f: data = 8'b00000000;	//
			// code x37 (7)
			11'h370: data = 8'b00000000;	//
			11'h371: data = 8'b00000000;	//
			11'h372: data = 8'b11111110;	//*******  
			11'h373: data = 8'b11111110;	//*******
			11'h374: data = 8'b00000110;	//     **
			11'h375: data = 8'b00000110;	//     **
			11'h376: data = 8'b00000110;	//     **
			11'h377: data = 8'b00000110;	//     **
			11'h378: data = 8'b00000110;	//     **
			11'h379: data = 8'b00000110;	//     **
			11'h37a: data = 8'b00000110;	//     **
			11'h37b: data = 8'b00000110;	//     **
			11'h37c: data = 8'b00000000;	//
			11'h37d: data = 8'b00000000;	//
			11'h37e: data = 8'b00000000;	//
			11'h37f: data = 8'b00000000;	//
			// code x38 (8)
			11'h380: data = 8'b00000000;	//
			11'h381: data = 8'b00000000;	//
			11'h382: data = 8'b11111110;	//*******  
			11'h383: data = 8'b11111110;	//*******
			11'h384: data = 8'b11000110;	//**   **
			11'h385: data = 8'b11000110;	//**   **
			11'h386: data = 8'b11111110;	//*******
			11'h387: data = 8'b11111110;	//*******
			11'h388: data = 8'b11000110;	//**   **
			11'h389: data = 8'b11000110;	//**   **
			11'h38a: data = 8'b11111110;	//*******
			11'h38b: data = 8'b11111110;	//*******
			11'h38c: data = 8'b00000000;	//
			11'h38d: data = 8'b00000000;	//
			11'h38e: data = 8'b00000000;	//
			11'h38f: data = 8'b00000000;	//
			// code x39 (9)
			11'h390: data = 8'b00000000;	//
			11'h391: data = 8'b00000000;	//
			11'h392: data = 8'b11111110;	//*******  
			11'h393: data = 8'b11111110;	//*******
			11'h394: data = 8'b11000110;	//**   **
			11'h395: data = 8'b11000110;	//**   **
			11'h396: data = 8'b11111110;	//*******
			11'h397: data = 8'b11111110;	//*******
			11'h398: data = 8'b00000110;	//     **
			11'h399: data = 8'b00000110;	//     **
			11'h39a: data = 8'b11111110;	//*******
			11'h39b: data = 8'b11111110;	//*******
			11'h39c: data = 8'b00000000;	//
			11'h39d: data = 8'b00000000;	//
			11'h39e: data = 8'b00000000;	//
			11'h39f: data = 8'b00000000;	//
			// code x41 (A)
			11'h410: data = 8'b00000000;	//
			11'h411: data = 8'b00000000;	//
			11'h412: data = 8'b00010000;	//   *
			11'h413: data = 8'b00111000;	//  ***
			11'h414: data = 8'b01101100;	// ** **   
			11'h415: data = 8'b11000110;	//**   **   
			11'h416: data = 8'b11000110;	//**   **
			11'h417: data = 8'b11111110;	//*******
			11'h418: data = 8'b11111110;	//*******
			11'h419: data = 8'b11000110;	//**   **
			11'h41a: data = 8'b11000110;	//**   **
			11'h41b: data = 8'b11000110;	//**   **
			11'h41c: data = 8'b00000000;	//
			11'h41d: data = 8'b00000000;	//
			11'h41e: data = 8'b00000000;	//
			11'h41f: data = 8'b00000000;	//
			// code x42 (B)
			11'h420: data = 8'b00000000;	//
			11'h421: data = 8'b00000000;	//
			11'h422: data = 8'b11111100;	//******
			11'h423: data = 8'b11111110;	//*******
			11'h424: data = 8'b11000110;	//**   **
			11'h425: data = 8'b11000110;	//**   **   
			11'h426: data = 8'b11111100;	//******
			11'h427: data = 8'b11111100;	//******
			11'h428: data = 8'b11000110;	//**   **
			11'h429: data = 8'b11000110;	//**   **
			11'h42a: data = 8'b11111110;	//*******
			11'h42b: data = 8'b11111100;	//******
			11'h42c: data = 8'b00000000;	//
			11'h42d: data = 8'b00000000;	//
			11'h42e: data = 8'b00000000;	//
			11'h42f: data = 8'b00000000;	//
			// code x43 (C)
			11'h430: data = 8'b00000000;	//
			11'h431: data = 8'b00000000;	//
			11'h432: data = 8'b01111100;	// *****
			11'h433: data = 8'b11111110;	//*******
			11'h434: data = 8'b11000000;	//**
			11'h435: data = 8'b11000000;	//**   
			11'h436: data = 8'b11000000;	//**
			11'h437: data = 8'b11000000;	//**
			11'h438: data = 8'b11000000;	//** 
			11'h439: data = 8'b11000000;	//** 
			11'h43a: data = 8'b11111110;	//*******
			11'h43b: data = 8'b01111100;	// *****
			11'h43c: data = 8'b00000000;	//
			11'h43d: data = 8'b00000000;	//
			11'h43e: data = 8'b00000000;	//
			11'h43f: data = 8'b00000000;	//
			// code x44 (D)
			11'h440: data = 8'b00000000;	//
			11'h441: data = 8'b00000000;	//
			11'h442: data = 8'b11111100;	//******
			11'h443: data = 8'b11111110;	//*******
			11'h444: data = 8'b11000110;	//**   **
			11'h445: data = 8'b11000110;	//**   **   
			11'h446: data = 8'b11000110;	//**   **
			11'h447: data = 8'b11000110;	//**   **
			11'h448: data = 8'b11000110;	//**   ** 
			11'h449: data = 8'b11000110;	//**   ** 
			11'h44a: data = 8'b11111110;	//*******
			11'h44b: data = 8'b11111100;	//******
			11'h44c: data = 8'b00000000;	//
			11'h44d: data = 8'b00000000;	//
			11'h44e: data = 8'b00000000;	//
			11'h44f: data = 8'b00000000;	//
			// code x45 (E)
			11'h450: data = 8'b00000000;	//
			11'h451: data = 8'b00000000;	//
			11'h452: data = 8'b11111110;	//*******
			11'h453: data = 8'b11111110;	//*******
			11'h454: data = 8'b11000000;	//**
			11'h455: data = 8'b11000000;	//**   
			11'h456: data = 8'b11111100;	//******
			11'h457: data = 8'b11111100;	//******
			11'h458: data = 8'b11000000;	//** 
			11'h459: data = 8'b11000000;	//** 
			11'h45a: data = 8'b11111110;	//*******
			11'h45b: data = 8'b11111110;	//*******
			11'h45c: data = 8'b00000000;	//
			11'h45d: data = 8'b00000000;	//
			11'h45e: data = 8'b00000000;	//
			11'h45f: data = 8'b00000000;	//
			// code x46 (F)
			11'h460: data = 8'b00000000;	//
			11'h461: data = 8'b00000000;	//
			11'h462: data = 8'b11111110;	//*******
			11'h463: data = 8'b11111110;	//*******
			11'h464: data = 8'b11000000;	//**
			11'h465: data = 8'b11000000;	//**   
			11'h466: data = 8'b11111100;	//******
			11'h467: data = 8'b11111100;	//******
			11'h468: data = 8'b11000000;	//** 
			11'h469: data = 8'b11000000;	//** 
			11'h46a: data = 8'b11000000;	//**
			11'h46b: data = 8'b11000000;	//**
			11'h46c: data = 8'b00000000;	//
			11'h46d: data = 8'b00000000;	//
			11'h46e: data = 8'b00000000;	//
			11'h46f: data = 8'b00000000;	//
			// code x47 (G)
			11'h470: data = 8'b00000000;	//
			11'h471: data = 8'b00000000;	//
			11'h472: data = 8'b01111100;	// *****
			11'h473: data = 8'b11111110;	//*******
			11'h474: data = 8'b11000000;	//**
			11'h475: data = 8'b11000000;	//**   
			11'h476: data = 8'b11111110;	//*******
			11'h477: data = 8'b11111110;	//*******
			11'h478: data = 8'b11000110;	//**   **
			11'h479: data = 8'b11000110;	//**   **
			11'h47a: data = 8'b11111110;	//*******
			11'h47b: data = 8'b01110110;	// *** **
			11'h47c: data = 8'b00000000;	//
			11'h47d: data = 8'b00000000;	//
			11'h47e: data = 8'b00000000;	//
			11'h47f: data = 8'b00000000;	//
			// code x48 (H)
			11'h480: data = 8'b00000000;	//
			11'h481: data = 8'b00000000;	//
			11'h482: data = 8'b11000110;	//**   **
			11'h483: data = 8'b11000110;	//**   **
			11'h484: data = 8'b11000110;	//**   **
			11'h485: data = 8'b11000110;	//**   **
			11'h486: data = 8'b11111110;	//*******
			11'h487: data = 8'b11111110;	//*******
			11'h488: data = 8'b11000110;	//**   **
			11'h489: data = 8'b11000110;	//**   **
			11'h48a: data = 8'b11000110;	//**   **
			11'h48b: data = 8'b11000110;	//**   **
			11'h48c: data = 8'b00000000;	//
			11'h48d: data = 8'b00000000;	//
			11'h48e: data = 8'b00000000;	//
			11'h48f: data = 8'b00000000;	//
			// code x49 (I)
			11'h490: data = 8'b00000000;	//
			11'h491: data = 8'b00000000;	//
			11'h492: data = 8'b11111110;	//*******
			11'h493: data = 8'b11111110;	//*******
			11'h494: data = 8'b00110000;	//  **
			11'h495: data = 8'b00110000;	//  **
			11'h496: data = 8'b00110000;	//  **
			11'h497: data = 8'b00110000;	//  **
			11'h498: data = 8'b00110000;	//  **
			11'h499: data = 8'b00110000;	//  **
			11'h49a: data = 8'b11111110;	//*******
			11'h49b: data = 8'b11111110;	//*******
			11'h49c: data = 8'b00000000;	//
			11'h49d: data = 8'b00000000;	//
			11'h49e: data = 8'b00000000;	//
			11'h49f: data = 8'b00000000;	//
			// code x4a (J)
			11'h4a0: data = 8'b00000000;	//
			11'h4a1: data = 8'b00000000;	//
			11'h4a2: data = 8'b11111110;	//*******
			11'h4a3: data = 8'b11111110;	//*******
			11'h4a4: data = 8'b00011000;	//   **
			11'h4a5: data = 8'b00011000;	//   **
			11'h4a6: data = 8'b00011000;	//   **
			11'h4a7: data = 8'b00011000;	//   **
			11'h4a8: data = 8'b00011000;	//   **
			11'h4a9: data = 8'b00011000;	//   **
			11'h4aa: data = 8'b11111000;	//*****
			11'h4ab: data = 8'b01111000;	// ****
			11'h4ac: data = 8'b00000000;	//
			11'h4ad: data = 8'b00000000;	//
			11'h4ae: data = 8'b00000000;	//
			11'h4af: data = 8'b00000000;	//
			// code x4b (K)
			11'h4b0: data = 8'b00000000;	//
			11'h4b1: data = 8'b00000000;	//
			11'h4b2: data = 8'b11000110;	//**   **
			11'h4b3: data = 8'b11001100;	//**  **
			11'h4b4: data = 8'b11011000;	//** **
			11'h4b5: data = 8'b11110000;	//****
			11'h4b6: data = 8'b11100000;	//***
			11'h4b7: data = 8'b11100000;	//***
			11'h4b8: data = 8'b11110000;	//****
			11'h4b9: data = 8'b11011000;	//** **
			11'h4ba: data = 8'b11001100;	//**  **
			11'h4bb: data = 8'b11000110;	//**   **
			11'h4bc: data = 8'b00000000;	//
			11'h4bd: data = 8'b00000000;	//
			11'h4be: data = 8'b00000000;	//
			11'h4bf: data = 8'b00000000;	//
			// code x4c (L)
			11'h4c0: data = 8'b00000000;	//
			11'h4c1: data = 8'b00000000;	//
			11'h4c2: data = 8'b11000000;	//**
			11'h4c3: data = 8'b11000000;	//**
			11'h4c4: data = 8'b11000000;	//**
			11'h4c5: data = 8'b11000000;	//**
			11'h4c6: data = 8'b11000000;	//**
			11'h4c7: data = 8'b11000000;	//**
			11'h4c8: data = 8'b11000000;	//**
			11'h4c9: data = 8'b11000000;	//**
			11'h4ca: data = 8'b11111110;	//*******
			11'h4cb: data = 8'b11111110;	//*******
			11'h4cc: data = 8'b00000000;	//
			11'h4cd: data = 8'b00000000;	//
			11'h4ce: data = 8'b00000000;	//
			11'h4cf: data = 8'b00000000;	//
			// code x4d (M)
			11'h4d0: data = 8'b00000000;	//
			11'h4d1: data = 8'b00000000;	//
			11'h4d2: data = 8'b11000110;	//**   **
			11'h4d3: data = 8'b11000110;	//**   **
			11'h4d4: data = 8'b11101110;	//*** ***
			11'h4d5: data = 8'b11111110;	//*******
			11'h4d6: data = 8'b11010110;	//** * **
			11'h4d7: data = 8'b11000110;	//**   **
			11'h4d8: data = 8'b11000110;	//**   **
			11'h4d9: data = 8'b11000110;	//**   **
			11'h4da: data = 8'b11000110;	//**   **
			11'h4db: data = 8'b11000110;	//**   **
			11'h4dc: data = 8'b00000000;	//
			11'h4dd: data = 8'b00000000;	//
			11'h4de: data = 8'b00000000;	//
			11'h4df: data = 8'b00000000;	//
			// code x4e (N)
			11'h4e0: data = 8'b00000000;	//
			11'h4e1: data = 8'b00000000;	//
			11'h4e2: data = 8'b11000110;	//**   **
			11'h4e3: data = 8'b11000110;	//**   **
			11'h4e4: data = 8'b11100110;	//***  **
			11'h4e5: data = 8'b11110110;	//**** **
			11'h4e6: data = 8'b11111110;	//*******
			11'h4e7: data = 8'b11011110;	//** ****
			11'h4e8: data = 8'b11001110;	//**  ***
			11'h4e9: data = 8'b11000110;	//**   **
			11'h4ea: data = 8'b11000110;	//**   **
			11'h4eb: data = 8'b11000110;	//**   **
			11'h4ec: data = 8'b00000000;	//
			11'h4ed: data = 8'b00000000;	//
			11'h4ee: data = 8'b00000000;	//
			11'h4ef: data = 8'b00000000;	//
			// code x4f (O)
			11'h4f0: data = 8'b00000000;	//
			11'h4f1: data = 8'b00000000;	//
			11'h4f2: data = 8'b01111100;	// *****
			11'h4f3: data = 8'b11111110;	//*******
			11'h4f4: data = 8'b11000110;	//**   **
			11'h4f5: data = 8'b11000110;	//**   **
			11'h4f6: data = 8'b11000110;	//**   **
			11'h4f7: data = 8'b11000110;	//**   **
			11'h4f8: data = 8'b11000110;	//**   **
			11'h4f9: data = 8'b11000110;	//**   **
			11'h4fa: data = 8'b11111110;	//*******
			11'h4fb: data = 8'b01111100;	// *****
			11'h4fc: data = 8'b00000000;	//
			11'h4fd: data = 8'b00000000;	//
			11'h4fe: data = 8'b00000000;	//
			11'h4ff: data = 8'b00000000;	//
			// code x50 (P)
			11'h500: data = 8'b00000000;	//
			11'h501: data = 8'b00000000;	//
			11'h502: data = 8'b11111100;	//******
			11'h503: data = 8'b11111110;	//*******
			11'h504: data = 8'b11000110;	//**   **
			11'h505: data = 8'b11000110;	//**   **
			11'h506: data = 8'b11111110;	//*******
			11'h507: data = 8'b11111100;	//******   
			11'h508: data = 8'b11000000;	//**   
			11'h509: data = 8'b11000000;	//**   
			11'h50a: data = 8'b11000000;	//**
			11'h50b: data = 8'b11000000;	//**
			11'h50c: data = 8'b00000000;	//
			11'h50d: data = 8'b00000000;	//
			11'h50e: data = 8'b00000000;	//
			11'h50f: data = 8'b00000000;	//
			// code x51 (Q)
			11'h510: data = 8'b00000000;	//
			11'h511: data = 8'b00000000;	//
			11'h512: data = 8'b11111100;	// *****
			11'h513: data = 8'b11111110;	//*******
			11'h514: data = 8'b11000110;	//**   **
			11'h515: data = 8'b11000110;	//**   **
			11'h516: data = 8'b11000110;	//**   **
			11'h517: data = 8'b11000110;	//**   **  
			11'h518: data = 8'b11010110;	//** * **
			11'h519: data = 8'b11111110;	//*******
			11'h51a: data = 8'b01101100;	// ** ** 
			11'h51b: data = 8'b00000110;	//     **
			11'h51c: data = 8'b00000000;	//
			11'h51d: data = 8'b00000000;	//
			11'h51e: data = 8'b00000000;	//
			11'h51f: data = 8'b00000000;	//
			// code x52 (R)
			11'h520: data = 8'b00000000;	//
			11'h521: data = 8'b00000000;	//
			11'h522: data = 8'b11111100;	//******
			11'h523: data = 8'b11111110;	//*******
			11'h524: data = 8'b11000110;	//**   **
			11'h525: data = 8'b11000110;	//**   **
			11'h526: data = 8'b11111110;	//*******
			11'h527: data = 8'b11111100;	//******   
			11'h528: data = 8'b11011000;	//** **  
			11'h529: data = 8'b11001100;	//**  ** 
			11'h52a: data = 8'b11000110;	//**   **
			11'h52b: data = 8'b11000110;	//**   **
			11'h52c: data = 8'b00000000;	//
			11'h52d: data = 8'b00000000;	//
			11'h52e: data = 8'b00000000;	//
			11'h52f: data = 8'b00000000;	//
			// code x53 (S)
			11'h530: data = 8'b00000000;	//
			11'h531: data = 8'b00000000;	//
			11'h532: data = 8'b01111100;	// *****
			11'h533: data = 8'b11111110;	//*******
			11'h534: data = 8'b11000000;	//**   
			11'h535: data = 8'b11000000;	//**   
			11'h536: data = 8'b11111100;	//******
			11'h537: data = 8'b01111110;	// ******   
			11'h538: data = 8'b00000110;	//     **  
			11'h539: data = 8'b00000110;	//     **
			11'h53a: data = 8'b11111110;	//*******  
			11'h53b: data = 8'b01111100;	// ***** 
			11'h53c: data = 8'b00000000;	//
			11'h53d: data = 8'b00000000;	//
			11'h53e: data = 8'b00000000;	//
			11'h53f: data = 8'b00000000;	//
			// code x54 (T)
			11'h540: data = 8'b00000000;	//
			11'h541: data = 8'b00000000;	//
			11'h542: data = 8'b11111110;	//*******
			11'h543: data = 8'b11111110;	//*******
			11'h544: data = 8'b00110000;	//  **
			11'h545: data = 8'b00110000;	//  **
			11'h546: data = 8'b00110000;	//  **
			11'h547: data = 8'b00110000;	//  **   
			11'h548: data = 8'b00110000;	//  **  
			11'h549: data = 8'b00110000;	//  **
			11'h54a: data = 8'b00110000;	//  **  
			11'h54b: data = 8'b00110000;	//  **
			11'h54c: data = 8'b00000000;	//
			11'h54d: data = 8'b00000000;	//
			11'h54e: data = 8'b00000000;	//
			11'h54f: data = 8'b00000000;	//
			// code x55 (U)
			11'h550: data = 8'b00000000;	//
			11'h551: data = 8'b00000000;	//
			11'h552: data = 8'b11000110;	//**   **
			11'h553: data = 8'b11000110;	//**   **
			11'h554: data = 8'b11000110;	//**   **
			11'h555: data = 8'b11000110;	//**   **
			11'h556: data = 8'b11000110;	//**   **
			11'h557: data = 8'b11000110;	//**   **
			11'h558: data = 8'b11000110;	//**   **
			11'h559: data = 8'b11000110;	//**   **
			11'h55a: data = 8'b11111110;	//*******
			11'h55b: data = 8'b01111100;	// *****
			11'h55c: data = 8'b00000000;	//
			11'h55d: data = 8'b00000000;	//
			11'h55e: data = 8'b00000000;	//
			11'h55f: data = 8'b00000000;	//
			// code x56 (V)
			11'h560: data = 8'b00000000;	//
			11'h561: data = 8'b00000000;	//
			11'h562: data = 8'b11000110;	//**   **
			11'h563: data = 8'b11000110;	//**   **
			11'h564: data = 8'b11000110;	//**   **
			11'h565: data = 8'b11000110;	//**   **
			11'h566: data = 8'b11000110;	//**   **
			11'h567: data = 8'b11000110;	//**   **
			11'h568: data = 8'b11000110;	//**   **
			11'h569: data = 8'b01101100;	// ** **
			11'h56a: data = 8'b00111000;	//  ***  
			11'h56b: data = 8'b00010000;	//   * 
			11'h56c: data = 8'b00000000;	//
			11'h56d: data = 8'b00000000;	//
			11'h56e: data = 8'b00000000;	//
			11'h56f: data = 8'b00000000;	//
			// code x57 (W)
			11'h570: data = 8'b00000000;	//
			11'h571: data = 8'b00000000;	//
			11'h572: data = 8'b11000110;	//**   **
			11'h573: data = 8'b11000110;	//**   **
			11'h574: data = 8'b11000110;	//**   **
			11'h575: data = 8'b11000110;	//**   **
			11'h576: data = 8'b11000110;	//**   **
			11'h577: data = 8'b11000110;	//**   **
			11'h578: data = 8'b11010110;	//** * **
			11'h579: data = 8'b11111110;	//*******
			11'h57a: data = 8'b11101110;	//*** ***  
			11'h57b: data = 8'b11000110;	//**   **
			11'h57c: data = 8'b00000000;	//
			11'h57d: data = 8'b00000000;	//
			11'h57e: data = 8'b00000000;	//
			11'h57f: data = 8'b00000000;	//
			// code x58 (X)
			11'h580: data = 8'b00000000;	//
			11'h581: data = 8'b00000000;	//
			11'h582: data = 8'b11000110;	//**   **
			11'h583: data = 8'b11000110;	//**   **
			11'h584: data = 8'b01101100;	// ** ** 
			11'h585: data = 8'b00111000;	//  ***
			11'h586: data = 8'b00111000;	//  *** 
			11'h587: data = 8'b00111000;	//  ***
			11'h588: data = 8'b00111000;	//  ***
			11'h589: data = 8'b01101100;	// ** **
			11'h58a: data = 8'b11000110;	//**   **  
			11'h58b: data = 8'b11000110;	//**   **
			11'h58c: data = 8'b00000000;	//
			11'h58d: data = 8'b00000000;	//
			11'h58e: data = 8'b00000000;	//
			11'h58f: data = 8'b00000000;	//
			// code x59 (Y)
			11'h590: data = 8'b00000000;	//
			11'h591: data = 8'b00000000;	//
			11'h592: data = 8'b11000110;	//**   **
			11'h593: data = 8'b11000110;	//**   **
			11'h594: data = 8'b01101100;	// ** ** 
			11'h595: data = 8'b00111000;	//  ***
			11'h596: data = 8'b00011000;	//   ** 
			11'h597: data = 8'b00011000;	//   **
			11'h598: data = 8'b00011000;	//   **
			11'h599: data = 8'b00011000;	//   **
			11'h59a: data = 8'b00011000;	//   **  
			11'h59b: data = 8'b00011000;	//   **
			11'h59c: data = 8'b00000000;	//
			11'h59d: data = 8'b00000000;	//
			11'h59e: data = 8'b00000000;	//
			11'h59f: data = 8'b00000000;	//
			// code x5a (Z)
			11'h5a0: data = 8'b00000000;	//
			11'h5a1: data = 8'b00000000;	//
			11'h5a2: data = 8'b11111110;	//*******
			11'h5a3: data = 8'b11111110;	//*******
			11'h5a4: data = 8'b00000110;	//     **  
			11'h5a5: data = 8'b00001100;	//    **
			11'h5a6: data = 8'b00011000;	//   ** 
			11'h5a7: data = 8'b00110000;	//  **
			11'h5a8: data = 8'b01100000;	// **
			11'h5a9: data = 8'b11000000;	//**
			11'h5aa: data = 8'b11111110;	//*******  
			11'h5ab: data = 8'b11111110;	//*******
			11'h5ac: data = 8'b00000000;	//
			11'h5ad: data = 8'b00000000;	//
			11'h5ae: data = 8'b00000000;	//
			11'h5af: data = 8'b00000000;	//
			
11'h610: data = 8'b00000000;
11'h611: data = 8'b00000000;
11'h612: data = 8'b00000000;
11'h613: data = 8'b00000000;
11'h614: data = 8'b00000000;
11'h615: data = 8'b00000000;
11'h616: data = 8'b01111000;
11'h617: data = 8'b00001100;
11'h618: data = 8'b00111100;
11'h619: data = 8'b01100100;
11'h61A: data = 8'b01001100;
11'h61B: data = 8'b01110100;
11'h61C: data = 8'b00000000;
11'h61D: data = 8'b00000000;
11'h61E: data = 8'b00000000;
11'h61F: data = 8'b00000000;

11'h620: data = 8'b00000000;
11'h621: data = 8'b00000000;
11'h622: data = 8'b00000000;
11'h623: data = 8'b00000000;
11'h624: data = 8'b01000000;
11'h625: data = 8'b01000000;
11'h626: data = 8'b01111000;
11'h627: data = 8'b01000100;
11'h628: data = 8'b01000100;
11'h629: data = 8'b01000100;
11'h62A: data = 8'b01000100;
11'h62B: data = 8'b01111000;
11'h62C: data = 8'b00000000;
11'h62D: data = 8'b00000000;
11'h62E: data = 8'b00000000;
11'h62F: data = 8'b00000000;

11'h630: data = 8'b00000000;
11'h631: data = 8'b00000000;
11'h632: data = 8'b00000000;
11'h633: data = 8'b00000000;
11'h634: data = 8'b00000000;
11'h635: data = 8'b00000000;
11'h636: data = 8'b00111100;
11'h637: data = 8'b01100000;
11'h638: data = 8'b01000000;
11'h639: data = 8'b01000000;
11'h63A: data = 8'b01100000;
11'h63B: data = 8'b00111100;
11'h63C: data = 8'b00000000;
11'h63D: data = 8'b00000000;
11'h63E: data = 8'b00000000;
11'h63F: data = 8'b00000000;
            
11'h640: data = 8'b00000000;
11'h641: data = 8'b00000000;
11'h642: data = 8'b00000000;
11'h643: data = 8'b00000000;
11'h644: data = 8'b00000100;
11'h645: data = 8'b00000100;
11'h646: data = 8'b00111100;
11'h647: data = 8'b01100100;
11'h648: data = 8'b01000100;
11'h649: data = 8'b01000100;
11'h64A: data = 8'b01000100;
11'h64B: data = 8'b01111100;
11'h64C: data = 8'b00000000;
11'h64D: data = 8'b00000000;
11'h64E: data = 8'b00000000;
11'h64F: data = 8'b00000000;

11'h650: data = 8'b00000000;
11'h651: data = 8'b00000000;
11'h652: data = 8'b00000000;
11'h653: data = 8'b00000000;
11'h654: data = 8'b00000000;
11'h655: data = 8'b00000000;
11'h656: data = 8'b00111000;
11'h657: data = 8'b01000100;
11'h658: data = 8'b01111100;
11'h659: data = 8'b01000000;
11'h65A: data = 8'b01000100;
11'h65B: data = 8'b00111000;
11'h65C: data = 8'b00000000;
11'h65D: data = 8'b00000000;
11'h65E: data = 8'b00000000;
11'h65F: data = 8'b00000000;

11'h660: data = 8'b00000000;
11'h661: data = 8'b00000000;
11'h662: data = 8'b00000000;
11'h663: data = 8'b00000000;
11'h664: data = 8'b00011000;
11'h665: data = 8'b00110000;
11'h666: data = 8'b01111000;
11'h667: data = 8'b00100000;
11'h668: data = 8'b00100000;
11'h669: data = 8'b00100000;
11'h66A: data = 8'b00100000;
11'h66B: data = 8'b00100000;
11'h66C: data = 8'b00000000;
11'h66D: data = 8'b00000000;
11'h66E: data = 8'b00000000;
11'h66F: data = 8'b00000000;

11'h670: data = 8'b00000000;
11'h671: data = 8'b00000000;
11'h672: data = 8'b00000000;
11'h673: data = 8'b00000000;
11'h674: data = 8'b00000000;
11'h675: data = 8'b00000000;
11'h676: data = 8'b00111100;
11'h677: data = 8'b01000100;
11'h678: data = 8'b01000100;
11'h679: data = 8'b00111100;
11'h67A: data = 8'b00000100;
11'h67B: data = 8'b00000100;
11'h67C: data = 8'b01001100;
11'h67D: data = 8'b00111000;
11'h67E: data = 8'b00000000;
11'h67F: data = 8'b00000000;

11'h680: data = 8'b00000000;
11'h681: data = 8'b00000000;
11'h682: data = 8'b00000000;
11'h683: data = 8'b00000000;
11'h684: data = 8'b01000000;
11'h685: data = 8'b01000000;
11'h686: data = 8'b01111100;
11'h687: data = 8'b01100100;
11'h688: data = 8'b01000100;
11'h689: data = 8'b01000100;
11'h68A: data = 8'b01000100;
11'h68B: data = 8'b01000100;
11'h68C: data = 8'b00000000;
11'h68D: data = 8'b00000000;
11'h68E: data = 8'b00000000;
11'h68F: data = 8'b00000000;

11'h690: data = 8'b00000000;
11'h691: data = 8'b00000000;
11'h692: data = 8'b00000000;
11'h693: data = 8'b00000000;
11'h694: data = 8'b00110000;
11'h695: data = 8'b00000000;
11'h696: data = 8'b00110000;
11'h697: data = 8'b00110000;
11'h698: data = 8'b00110000;
11'h699: data = 8'b00110000;
11'h69A: data = 8'b00110000;
11'h69B: data = 8'b00110000;
11'h69C: data = 8'b00000000;
11'h69D: data = 8'b00000000;
11'h69E: data = 8'b00000000;
11'h69F: data = 8'b00000000;

11'h6A0: data = 8'b00000000;
11'h6A1: data = 8'b00000000;
11'h6A2: data = 8'b00000000;
11'h6A3: data = 8'b00000000;
11'h6A4: data = 8'b00001000;
11'h6A5: data = 8'b00000000;
11'h6A6: data = 8'b00011000;
11'h6A7: data = 8'b00001000;
11'h6A8: data = 8'b00001000;
11'h6A9: data = 8'b00001000;
11'h6AA: data = 8'b00001000;
11'h6AB: data = 8'b00001000;
11'h6AC: data = 8'b01001000;
11'h6AD: data = 8'b00110000;
11'h6AE: data = 8'b00000000;
11'h6AF: data = 8'b00000000;

11'h6B0: data = 8'b00000000;
11'h6B1: data = 8'b00000000;
11'h6B2: data = 8'b00000000;
11'h6B3: data = 8'b00000000;
11'h6B4: data = 8'b01000000;
11'h6B5: data = 8'b01000000;
11'h6B6: data = 8'b01001000;
11'h6B7: data = 8'b01011000;
11'h6B8: data = 8'b01110000;
11'h6B9: data = 8'b01110000;
11'h6BA: data = 8'b01001000;
11'h6BB: data = 8'b01001100;
11'h6BC: data = 8'b00000000;
11'h6BD: data = 8'b00000000;
11'h6BE: data = 8'b00000000;
11'h6BF: data = 8'b00000000;

11'h6C0: data = 8'b00000000;
11'h6C1: data = 8'b00000000;
11'h6C2: data = 8'b00000000;
11'h6C3: data = 8'b00000000;
11'h6C4: data = 8'b00010000;
11'h6C5: data = 8'b00010000;
11'h6C6: data = 8'b00010000;
11'h6C7: data = 8'b00010000;
11'h6C8: data = 8'b00010000;
11'h6C9: data = 8'b00010000;
11'h6CA: data = 8'b00010000;
11'h6CB: data = 8'b00011000;
11'h6CC: data = 8'b00000000;
11'h6CD: data = 8'b00000000;
11'h6CE: data = 8'b00000000;
11'h6CF: data = 8'b00000000;

11'h6D0: data = 8'b00000000;
11'h6D1: data = 8'b00000000;
11'h6D2: data = 8'b00000000;
11'h6D3: data = 8'b00000000;
11'h6D4: data = 8'b00000000;
11'h6D5: data = 8'b00000000;
11'h6D6: data = 8'b10111100;
11'h6D7: data = 8'b11011010;
11'h6D8: data = 8'b10010010;
11'h6D9: data = 8'b10010010;
11'h6DA: data = 8'b10010010;
11'h6DB: data = 8'b10010010;
11'h6DC: data = 8'b00000000;
11'h6DD: data = 8'b00000000;
11'h6DE: data = 8'b00000000;
11'h6DF: data = 8'b00000000;

11'h6E0: data = 8'b00000000;
11'h6E1: data = 8'b00000000;
11'h6E2: data = 8'b00000000;
11'h6E3: data = 8'b00000000;
11'h6E4: data = 8'b00000000;
11'h6E5: data = 8'b00000000;
11'h6E6: data = 8'b01111100;
11'h6E7: data = 8'b01100100;
11'h6E8: data = 8'b01000100;
11'h6E9: data = 8'b01000100;
11'h6EA: data = 8'b01000100;
11'h6EB: data = 8'b01000100;
11'h6EC: data = 8'b00000000;
11'h6ED: data = 8'b00000000;
11'h6EE: data = 8'b00000000;
11'h6EF: data = 8'b00000000;

11'h6F0: data = 8'b00000000;
11'h6F1: data = 8'b00000000;
11'h6F2: data = 8'b00000000;
11'h6F3: data = 8'b00000000;
11'h6F4: data = 8'b00000000;
11'h6F5: data = 8'b00000000;
11'h6F6: data = 8'b00111000;
11'h6F7: data = 8'b01000100;
11'h6F8: data = 8'b01000100;
11'h6F9: data = 8'b01000100;
11'h6FA: data = 8'b01000100;
11'h6FB: data = 8'b00111000;
11'h6FC: data = 8'b00000000;
11'h6FD: data = 8'b00000000;
11'h6FE: data = 8'b00000000;
11'h6FF: data = 8'b00000000;

11'h700: data = 8'b00000000;
11'h701: data = 8'b00000000;
11'h702: data = 8'b00000000;
11'h703: data = 8'b00000000;
11'h704: data = 8'b00000000;
11'h705: data = 8'b00000000;
11'h706: data = 8'b01111000;
11'h707: data = 8'b01000100;
11'h708: data = 8'b01000100;
11'h709: data = 8'b01000100;
11'h70A: data = 8'b01001100;
11'h70B: data = 8'b01111000;
11'h70C: data = 8'b01000000;
11'h70D: data = 8'b01000000;
11'h70E: data = 8'b00000000;
11'h70F: data = 8'b00000000;

11'h710: data = 8'b00000000;
11'h711: data = 8'b00000000;
11'h712: data = 8'b00000000;
11'h713: data = 8'b00000000;
11'h714: data = 8'b00000000;
11'h715: data = 8'b00111100;
11'h716: data = 8'b01000100;
11'h717: data = 8'b01000100;
11'h718: data = 8'b01000100;
11'h719: data = 8'b01000100;
11'h71A: data = 8'b00111100;
11'h71B: data = 8'b00000100;
11'h71C: data = 8'b00000100;
11'h71D: data = 8'b00000110;
11'h71E: data = 8'b00000000;
11'h71F: data = 8'b00000000;

11'h720: data = 8'b00000000;
11'h721: data = 8'b00000000;
11'h722: data = 8'b00000000;
11'h723: data = 8'b00000000;
11'h724: data = 8'b00000000;
11'h725: data = 8'b00000000;
11'h726: data = 8'b01011000;
11'h727: data = 8'b01100100;
11'h728: data = 8'b01000000;
11'h729: data = 8'b01000000;
11'h72A: data = 8'b01000000;
11'h72B: data = 8'b01000000;
11'h72C: data = 8'b00000000;
11'h72D: data = 8'b00000000;
11'h72E: data = 8'b00000000;
11'h72F: data = 8'b00000000;

11'h730: data = 8'b00000000;
11'h731: data = 8'b00000000;
11'h732: data = 8'b00000000;
11'h733: data = 8'b00000000;
11'h734: data = 8'b00000000;
11'h735: data = 8'b00000000;
11'h736: data = 8'b00111100;
11'h737: data = 8'b01100000;
11'h738: data = 8'b00011000;
11'h739: data = 8'b00001100;
11'h73A: data = 8'b01101100;
11'h73B: data = 8'b00111000;
11'h73C: data = 8'b00000000;
11'h73D: data = 8'b00000000;
11'h73E: data = 8'b00000000;
11'h73F: data = 8'b00000000;


11'h740: data = 8'b00000000;
11'h741: data = 8'b00000000;
11'h742: data = 8'b00000000;
11'h743: data = 8'b00000000;
11'h744: data = 8'b00000000;
11'h745: data = 8'b00100000;
11'h746: data = 8'b01111000;
11'h747: data = 8'b00100000;
11'h748: data = 8'b00100000;
11'h749: data = 8'b00100000;
11'h74A: data = 8'b00110000;
11'h74B: data = 8'b00011000;
11'h74C: data = 8'b00000000;
11'h74D: data = 8'b00000000;
11'h74E: data = 8'b00000000;
11'h74F: data = 8'b00000000;

11'h750: data = 8'b00000000;
11'h751: data = 8'b00000000;
11'h752: data = 8'b00000000;
11'h753: data = 8'b00000000;
11'h754: data = 8'b00000000;
11'h755: data = 8'b00000000;
11'h756: data = 8'b01000100;
11'h757: data = 8'b01000100;
11'h758: data = 8'b01000100;
11'h759: data = 8'b01000100;
11'h75A: data = 8'b01000100;
11'h75B: data = 8'b01111100;
11'h75C: data = 8'b00000000;
11'h75D: data = 8'b00000000;
11'h75E: data = 8'b00000000;
11'h75F: data = 8'b00000000;

11'h760: data = 8'b00000000;
11'h761: data = 8'b00000000;
11'h762: data = 8'b00000000;
11'h763: data = 8'b00000000;
11'h764: data = 8'b00000000;
11'h765: data = 8'b00000000;
11'h766: data = 8'b01000100;
11'h767: data = 8'b01000100;
11'h768: data = 8'b01101000;
11'h769: data = 8'b00101000;
11'h76A: data = 8'b00111000;
11'h76B: data = 8'b00010000;
11'h76C: data = 8'b00000000;
11'h76D: data = 8'b00000000;
11'h76E: data = 8'b00000000;
11'h76F: data = 8'b00000000;

11'h770: data = 8'b00000000;
11'h771: data = 8'b00000000;
11'h772: data = 8'b00000000;
11'h773: data = 8'b00000000;
11'h774: data = 8'b00000000;
11'h775: data = 8'b00000000;
11'h776: data = 8'b10010010;
11'h777: data = 8'b10010010;
11'h778: data = 8'b10111010;
11'h779: data = 8'b11101110;
11'h77A: data = 8'b01101100;
11'h77B: data = 8'b01000100;
11'h77C: data = 8'b00000000;
11'h77D: data = 8'b00000000;
11'h77E: data = 8'b00000000;
11'h77F: data = 8'b00000000;

11'h780: data = 8'b00000000;
11'h781: data = 8'b00000000;
11'h782: data = 8'b00000000;
11'h783: data = 8'b00000000;
11'h784: data = 8'b00000000;
11'h785: data = 8'b00000000;
11'h786: data = 8'b01000110;
11'h787: data = 8'b00101100;
11'h788: data = 8'b00011000;
11'h789: data = 8'b00011000;
11'h78A: data = 8'b00101100;
11'h78B: data = 8'b01000110;
11'h78C: data = 8'b00000000;
11'h78D: data = 8'b00000000;
11'h78E: data = 8'b00000000;
11'h78F: data = 8'b00000000;

11'h790: data = 8'b00000000;
11'h791: data = 8'b00000000;
11'h792: data = 8'b00000000;
11'h793: data = 8'b00000000;
11'h794: data = 8'b00000000;
11'h795: data = 8'b00000000;
11'h796: data = 8'b01000100;
11'h797: data = 8'b01000100;
11'h798: data = 8'b01000100;
11'h799: data = 8'b01000100;
11'h79A: data = 8'b01101100;
11'h79B: data = 8'b00110100;
11'h79C: data = 8'b00000100;
11'h79D: data = 8'b01111000;
11'h79E: data = 8'b00000000;
11'h79F: data = 8'b00000000;

11'h7A0: data = 8'b00000000;
11'h7A1: data = 8'b00000000;
11'h7A2: data = 8'b00000000;
11'h7A3: data = 8'b00000000;
11'h7A4: data = 8'b00000000;
11'h7A5: data = 8'b00000000;
11'h7A6: data = 8'b01111100;
11'h7A7: data = 8'b00001100;
11'h7A8: data = 8'b00001000;
11'h7A9: data = 8'b00010000;
11'h7AA: data = 8'b00110000;
11'h7AB: data = 8'b01111100;
11'h7AC: data = 8'b00000000;
11'h7AD: data = 8'b00000000;
11'h7AE: data = 8'b00000000;
11'h7AF: data = 8'b00000000;
        endcase
         
endmodule