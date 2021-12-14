`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/03 07:47:43
// Design Name: 
// Module Name: CACcoder_9
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
module CACcoder_9(
    input wire [(`BLEN_09 - 1) : 0] datain,
    input wire clock,
    output reg [8:0] codeout,   //[x-1 : 0]
    
    input wire [`FNSLEN_02-1 : 0] FNS02,
    input wire [`FNSLEN_03-1 : 0] FNS03,
    input wire [`FNSLEN_04-1 : 0] FNS04,
    input wire [`FNSLEN_05-1 : 0] FNS05,
    input wire [`FNSLEN_06-1 : 0] FNS06,
    input wire [`FNSLEN_07-1 : 0] FNS07,
    input wire [`FNSLEN_08-1 : 0] FNS08,
    input wire [`FNSLEN_09-1 : 0] FNS09
    );
    
    //define r
    wire [`FNSLEN_10-1 : 0] r_09;
    wire [`FNSLEN_09-1 : 0] r_08;
    wire [`FNSLEN_08-1 : 0] r_07;
    wire [`FNSLEN_07-1 : 0] r_06;
    wire [`FNSLEN_06-1 : 0] r_05;
    wire [`FNSLEN_05-1 : 0] r_04;
    wire [`FNSLEN_04-1 : 0] r_03;
    
    //define output wire
    wire [8:0] codeout_wire;    //[x-1 : 0]
    
    //calc r
    assign r_09 = (codeout_wire[8] == 0) ? (datain) : (datain - FNS09);
    assign r_08 = (codeout_wire[7] == 0) ? (r_09) : (r_09 - FNS08);
    assign r_07 = (codeout_wire[6] == 0) ? (r_08) : (r_08 - FNS07);
    assign r_06 = (codeout_wire[5] == 0) ? (r_07) : (r_07 - FNS06);
    assign r_05 = (codeout_wire[4] == 0) ? (r_06) : (r_06 - FNS05);
    assign r_04 = (codeout_wire[3] == 0) ? (r_05) : (r_05 - FNS04);
    assign r_03 = (codeout_wire[2] == 0) ? (r_04) : (r_04 - FNS03);
    assign codeout_wire[0] = (codeout_wire[1] == 0) ? (r_03) : (r_03 - FNS02);
    
    //coding
    assign codeout_wire[8] = (datain < FNS09) ? 0 : 1;
    assign codeout_wire[7] = (r_09 < FNS09) ? 0 : 1;
    assign codeout_wire[6] = (r_08 < FNS07) ? 0 : 1;
    assign codeout_wire[5] = (r_07 < FNS07) ? 0 : 1;
    assign codeout_wire[4] = (r_06 < FNS05) ? 0 : 1;
    assign codeout_wire[3] = (r_05 < FNS05) ? 0 : 1;
    assign codeout_wire[2] = (r_04 < FNS03) ? 0 : 1;
    assign codeout_wire[1] = (r_03 < FNS03) ? 0 : 1; 
    
    //sync
    always @(posedge clock) begin
      codeout <= codeout_wire;
    end
endmodule
