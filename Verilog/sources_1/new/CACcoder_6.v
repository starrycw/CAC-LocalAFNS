`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/03 07:47:43
// Design Name: 
// Module Name: CACcoder_6
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
module CACcoder_6(
    input wire [(`BLEN_06 - 1) : 0] datain,
    input wire clock,
    output reg [5:0] codeout,   //[x-1 : 0]
    
    input wire [`FNSLEN_02-1 : 0] FNS02,
    input wire [`FNSLEN_03-1 : 0] FNS03,
    input wire [`FNSLEN_04-1 : 0] FNS04,
    input wire [`FNSLEN_05-1 : 0] FNS05,
    input wire [`FNSLEN_06-1 : 0] FNS06
    );
    
    //define r
    wire [`FNSLEN_07-1 : 0] r_06;
    wire [`FNSLEN_06-1 : 0] r_05;
    wire [`FNSLEN_05-1 : 0] r_04;
    wire [`FNSLEN_04-1 : 0] r_03;
    
    //define output wire
    wire [5:0] codeout_wire;    //[x-1 : 0]
    
    //calc r
    assign r_06 = (codeout_wire[5] == 0) ? (datain) : (datain - FNS06);
    assign r_05 = (codeout_wire[4] == 0) ? (r_06) : (r_06 - FNS05);
    assign r_04 = (codeout_wire[3] == 0) ? (r_05) : (r_05 - FNS04);
    assign r_03 = (codeout_wire[2] == 0) ? (r_04) : (r_04 - FNS03);
    assign codeout_wire[0] = (codeout_wire[1] == 0) ? (r_03) : (r_03 - FNS02);
    
    //coding
    assign codeout_wire[5] = (datain < FNS06) ? 0 : 1;
    assign codeout_wire[4] = (r_06 < FNS06) ? 0 : 1;
    assign codeout_wire[3] = (r_05 < FNS04) ? 0 : 1;
    assign codeout_wire[2] = (r_04 < FNS04) ? 0 : 1;
    assign codeout_wire[1] = (r_03 < FNS02) ? 0 : 1; 
    
    //sync
    always @(posedge clock) begin
      codeout <= codeout_wire;
    end
endmodule
