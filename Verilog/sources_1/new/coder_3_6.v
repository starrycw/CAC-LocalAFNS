`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/25 15:28:01
// Design Name: 
// Module Name: coder_3_6
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

`include "Fibo.vh"
module coder_3_6(
    input wire [(`BLEN_03-1) : 0] datain,
    input wire clock,
    output reg [8:0] codeout,   // [(x+y-1) : 0]
    input wire [8:0] en_flag,   // [(x+y-1) : 0]
    
    input wire FNS02,
    input wire [(`FNSLEN_03-1) : 0] FNS03,
    
    input wire [(`FNSLEN_04-1) : 0] FNS04,  
    input wire [(`FNSLEN_04-1) : 0] FNS05, 
    input wire [(`FNSLEN_04-1) : 0] FNS06,  
    input wire [(`FNSLEN_04-1) : 0] FNS07,
    input wire [(`FNSLEN_04-1) : 0] FNS08,
    input wire [(`FNSLEN_04-1) : 0] FNS09

    );
    
    //Define Remaining Values. 
    //eg: For non-redundant TSV5, r_05 = r_06 or (r_06-FNS05)
    //r_05 <= FNS04 + FNS03 +...+FNS01 < FNS06, so bitwidth of r_05 is [(`FNSLEN_06-1) : 0] 
    wire [(`FNSLEN_04-1) : 0] r_09;
    wire [(`FNSLEN_04-1) : 0] r_08;
    wire [(`FNSLEN_04-1) : 0] r_07;
    wire [(`FNSLEN_04-1) : 0] r_06;
    wire [(`FNSLEN_04-1) : 0] r_05; 
    wire [(`FNSLEN_04-1) : 0] r_04;
    
    wire [(`FNSLEN_04-1) : 0] r_03;
    
    //Define Outputs ([(x+y-1) : 0])
    wire [8:0] codeout_en;  // codeout_en = codeout_temp AND en_flag 
    wire [8:0] codeout_temp;
    and getcode[8:0] (codeout_en, codeout_temp, en_flag);
    
    //update r
    assign r_09 = (codeout_en[8] == 0) ? (datain) : (datain - FNS09);
    assign r_08 = (codeout_en[7] == 0) ? (r_09) : (r_09 - FNS08);
    assign r_07 = (codeout_en[6] == 0) ? (r_08) : (r_08 - FNS07);
    assign r_06 = (codeout_en[5] == 0) ? (r_07) : (r_07 - FNS06);
    assign r_05 = (codeout_en[4] == 0) ? (r_06) : (r_06 - FNS05);
    assign r_04 = (codeout_en[3] == 0) ? (r_05) : (r_05 - FNS04);
    assign r_03 = (codeout_en[2] == 0) ? (r_04) : (r_04 - FNS03);
    
    //coding
    assign codeout_temp[8] = (datain < FNS09) ? 0 : 1;
    assign codeout_temp[7] = (r_09 < FNS09) ? 0 : 1;
    assign codeout_temp[6] = (r_08 < FNS07) ? 0 : 1;
    assign codeout_temp[5] = (r_07 < FNS07) ? 0 : 1;
    assign codeout_temp[4] = (r_06 < FNS05) ? 0 : 1;
    assign codeout_temp[3] = (r_05 < FNS05) ? 0 : 1;
    assign codeout_temp[2] = (r_04 < FNS03) ? 0 : 1;
    assign codeout_temp[1] = (r_03 < FNS03) ? 0 : 1; 
    assign codeout_temp[0] = (codeout_en[1] == 0) ? (r_03) : (r_03 - FNS02);
    
    //sync
    always @(posedge clock) begin
      codeout <= codeout_en;
    end
endmodule
